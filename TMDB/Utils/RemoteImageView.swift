//
//  RemoteImageView.swift
//  TMDB
//
//  Created by roohulk on 01/05/21.
//

import UIKit

class RemoteImageView: UIImageView {
    
    var urlString: String = ""
    /**
     Downloads the image from the remote url and sets it to the image view. Make sure that the urlString is valid to avoid unnecessary call API call.
     */
    func setImage(urlString: String?, placeholder: UIImage?) {
        
        self.image = placeholder
        
        guard let urlString = urlString else {return}
        self.urlString = urlString
        
        DownloadManager.sharedInstance.downloadImage(urlString: urlString) { (image, url, error) in
            if let url = url, url == self.urlString {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

