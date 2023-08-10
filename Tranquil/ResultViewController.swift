import UIKit

struct YouTubeResponse: Codable {
    struct Item: Codable {
        struct ID: Codable {
            let videoId: String
        }
        struct Snippet: Codable {
            let title: String
            let description: String
            let thumbnails: Thumbnail
        }
        
        struct Thumbnail: Codable {
            let medium: ThumbnailInfo
        }
        
        struct ThumbnailInfo: Codable {
            let url: URL
        }
        
        let snippet: Snippet
        let id: ID
    }
    
    let items: [Item]
}


class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var receivedData: String?
    @IBOutlet weak var YoutubeTableView: UITableView!
    var youtubeItems: [YouTubeResponse.Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YoutubeTableView.dataSource = self
        YoutubeTableView.delegate = self
        fetchYouTubeData()
    }
    

    func fetchYouTubeData() {
        let apiKey = "AIzaSyBDMYvNORJPdfDJt0u_yu5B8meitJ67gzE"
        let searchParameter = (receivedData ?? "") + "Meditation"
        let maxResults = 10
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(searchParameter)&maxResults=\(maxResults)&key=\(apiKey)"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(YouTubeResponse.self, from: data)
                        self.youtubeItems = response.items
                        DispatchQueue.main.async {
                            self.YoutubeTableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youtubeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YouTubeCell", for: indexPath) as! YouTubeCell
        let item = youtubeItems[indexPath.row]
        cell.titleLabel.text = item.snippet.title
        cell.DescriptionText.text = item.snippet.description
        if let thumbnailURL = URL(string: item.snippet.thumbnails.medium.url.absoluteString) {
            URLSession.shared.dataTask(with: thumbnailURL) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.thumbnails.image = image
                    }
                }
            }.resume()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = youtubeItems[indexPath.row]
        let appURL = URL(string: "youtube://\(item.id.videoId)")
        let webURL = URL(string: "https://www.youtube.com/watch?v=\(item.id.videoId)")
        
        if UIApplication.shared.canOpenURL(appURL!) {
            UIApplication.shared.open(appURL!, options: [:], completionHandler: nil)
        } else if let webURL = webURL {
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }

}

class YouTubeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DescriptionText: UITextView!
    @IBOutlet weak var thumbnails: UIImageView!
}
