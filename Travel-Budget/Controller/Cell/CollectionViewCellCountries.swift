//
//  TableViewCellBookings.swift
//  Travel-Budget
//
//  Created by Mac on 08/12/2021.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
// cell for collection of countries
class CollectionViewCellCountries:UICollectionViewCell {
    
    var activeFav:Bool = false
    
    @IBOutlet weak var fav: UIButton!
    @IBOutlet weak var setFav: UIButton!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    
    var favrite : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
   // action for add to fav selected failled red

    @IBAction func addFavorite(_ sender: Any) {
        
        if activeFav {
            
            activeFav = false
            fav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            fav.tintColor = UIColor.white
            
        } else {
            activeFav = true
            fav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            fav.tintColor = UIColor.red
            
            let uid = Auth.auth().currentUser?.uid ?? ""
            UserApi.getUser(uid: uid) { user in
                
                FavoriteApi.addFavorite(uid: uid, favorite: self.favrite)
                
            }
        }
    }
}
