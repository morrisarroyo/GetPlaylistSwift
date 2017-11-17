//
//  PlaylistViewController.swift
//  GetPlaylist
//
//  Created by Morris Arroyo on 2017-11-17.
//  Copyright © 2017 Morris Arroyo. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var playlistTableView: UITableView!
    var playlists: [MPMediaItemCollection]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistTableView.dataSource = self
        playlistTableView.delegate = self
        
        let myPlaylistQuery = MPMediaQuery.playlists()
        playlists = myPlaylistQuery.collections
        if (playlists == nil) {
            return;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = playlistTableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)  as? PlaylistTableViewCell else {
            fatalError("PlaylistViewController, couldn't dequeue a cell of type PlaylistTableViewCell")
        }
        guard let title = playlists[indexPath.row].value(forProperty: MPMediaPlaylistPropertyName) as? String else {
            print("Couldn't get playlist name")
            return cell
        }
        cell.playlistCell.text = title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = playlistTableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "ShowSongsSegue", sender: cell)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? SongsViewController {
            destinationViewController.playlist     = playlists[(playlistTableView.indexPath(for: sender as! PlaylistTableViewCell)?.row)!]
            
            
        }
    }
}
