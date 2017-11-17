//
//  SongsViewController.swift
//  GetPlaylist
//
//  Created by Morris Arroyo on 2017-11-17.
//  Copyright © 2017 Morris Arroyo. All rights reserved.
//

import UIKit
import MediaPlayer

class SongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var songsTableView: UITableView!
    
    var playlist: MPMediaItemCollection?
    var songs: [MPMediaItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        songsTableView.dataSource = self
        songsTableView.delegate   = self
        songs = playlist!.items
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = songsTableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)  as? SongTableViewCell else {
            fatalError("PlaylistViewController, couldn't dequeue a cell of type songsTableView")
        }
        cell.titleLabel.text = songs![indexPath.row].value(forProperty: MPMediaItemPropertyTitle) as? String
        cell.artistLabel.text = songs![indexPath.row].value(forProperty: MPMediaItemPropertyArtist) as? String
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
