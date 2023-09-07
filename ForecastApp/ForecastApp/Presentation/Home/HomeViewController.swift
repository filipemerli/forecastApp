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
        table.backgroundColor = .green
        return table
    }()

    override func viewDidLoad() {
        view.backgroundColor = .red
        title = "Weather"
        configureView()
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
}
