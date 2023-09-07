//
//  HomeViewController.swift
//  ForecastApp
//
//  Created by Filipe Merli on 07/09/2023.
//

import UIKit

final class HomeViewController: UIViewController {

    private lazy var tableView: HomeTableView = {
        let table = HomeTableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private lazy var tableViewRightItem: MapNavBarIcon = {
        let item = MapNavBarIcon()
        item.target = self
        item.action = #selector(rightBarButtonItemAction)
        return item
    }()

    private lazy var mapView: MapView = {
        let map = MapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    override func viewDidLoad() {
        title = "Weather"
        configureView()
    }

    @objc func rightBarButtonItemAction() {
        mapView.isHidden = !mapView.isHidden
        tableViewRightItem.toggleImage(showMap: mapView.isHidden)
    }
}

// MARK: TableView - DataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .default, reuseIdentifier: "identifier") // TODO: Dequeue reusable cell
    }
}

// MARK: TableView - Delegate

extension HomeViewController: UITableViewDelegate {

}

// MARK: Private

private extension HomeViewController {

    func configureView() {
        view.addSubview(tableView)
        configureConstraints()
        configureTableView()
        configureNavigationBar()
        view.addSubview(mapView)
        mapView.isHidden = true
        configureMapViewConstraints()
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // TODO: Register UITableViewCell
    }

    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = tableViewRightItem
    }

    func configureMapViewConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: tableView.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        ])
    }
}
