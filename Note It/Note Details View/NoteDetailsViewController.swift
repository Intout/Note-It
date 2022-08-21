//
//  NoteDetailsViewController.swift
//  Note It
//
//  Created by Mert Tecimen on 21.08.2022.
//

import UIKit

class NoteDetailsViewController: UIViewController {

    var viewModel = ViewModel()
    
    private lazy var scrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delaysContentTouches = true
        return scrollView
        
    }()
    
    private lazy var containterView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var textContainterView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.90)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleTextField: UITextField = {
        
        var textField = UITextField()
        
        let attributedPlaceHolderText = NSMutableAttributedString(string: "Title")
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 30), range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        
        textField.font = .boldSystemFont(ofSize: 30)
        
        textField.attributedPlaceholder = attributedPlaceHolderText
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addBottomBorder(with: UIColor.orange, andWidth: 1, offset: 10)
        return textField
        
    }()
    
    private lazy var subtitleTextField: UITextField = {
        
        var textField = UITextField()
        
        let attributedPlaceHolderText = NSMutableAttributedString(string: "Subtitle")
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        attributedPlaceHolderText.addAttribute(NSMutableAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 20), range: NSRange(location: 0, length: attributedPlaceHolderText.length))
        
        textField.font = .boldSystemFont(ofSize: 20)
        
        textField.attributedPlaceholder = attributedPlaceHolderText
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addBottomBorder(with: UIColor.orange, andWidth: 1, offset: 10)
        return textField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI(){
        
        view.backgroundColor = .orange
        
        view.addSubview(scrollView)
        scrollView.addSubview(containterView)
        
        containterView.addSubview(textContainterView)
        
        textContainterView.addSubview(titleTextField)
        textContainterView.addSubview(subtitleTextField)
        
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            containterView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containterView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containterView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textContainterView.topAnchor.constraint(equalTo: containterView.topAnchor),
            textContainterView.bottomAnchor.constraint(equalTo: containterView.bottomAnchor),
            textContainterView.widthAnchor.constraint(equalTo: containterView.widthAnchor),
            textContainterView.heightAnchor.constraint(equalTo: containterView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: textContainterView.topAnchor, constant: 50),
            titleTextField.leadingAnchor.constraint(equalTo: textContainterView.leadingAnchor, constant: 25),
            titleTextField.trailingAnchor.constraint(equalTo: textContainterView.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            subtitleTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 25),
            subtitleTextField.leadingAnchor.constraint(equalTo: textContainterView.leadingAnchor, constant: 25),
            subtitleTextField.trailingAnchor.constraint(equalTo: textContainterView.trailingAnchor, constant: 0),
        ])
        
        
        
    }

}

extension UIView{
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat, offset: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height + offset, width: frame.size.width, height: borderWidth)
        self.addSubview(border)
    }
}
