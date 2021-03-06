//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Chloe Mack on 2/26/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
   
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsysLabel: UILabel!
    
    @IBAction func trailerTrigger(_ sender: UITapGestureRecognizer) {
        
    }
    
    
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsysLabel.text = movie["overview"] as? String
        synopsysLabel.sizeToFit()
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        posterView.af.setImage(withURL: posterURL!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        backdropView.af.setImage(withURL: backdropURL!)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.

        let id = movie["id"] as! String
        let trailer = "https://api.themoviedb.org/3/movie/"+id+"/videos?api_key=<<api_key>>&language=en-US"
        // Pass the selected object to the new view controller.
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.trailer = trailer
    }
    

}
