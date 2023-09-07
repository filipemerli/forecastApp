//
//  MapNavBarIcon.swift
//  ForecastApp
//
//  Created by Filipe Merli on 07/09/2023.
//

import UIKit

final class MapNavBarIcon: UIBarButtonItem {
    override init() {
        super.init()
        image = UIImage(systemName: "map")
        style = .plain
        tintColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Think of adding a protocol to wrap it later
    func toggleImage(showMap: Bool) {
        let newImage = showMap ? UIImage(systemName: "map") : UIImage(systemName: "list.bullet")
        DispatchQueue.main.async { [weak self] in
            self?.image = newImage
        }
    }
}
