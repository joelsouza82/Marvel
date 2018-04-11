#Pods
project 'marvelapp.xcodeproj'

platform :ios, '11'
inhibit_all_warnings!
use_frameworks!

def shared_pods
    
    #Mapeamentos
    pod 'ObjectMapper'
    pod 'AlamofireObjectMapper'
    
    #Rede
    pod 'Kingfisher', '~> 4.0'
    pod 'Alamofire', '~> 4.5'
    
    #Cripitografia
    pod 'CryptoSwift'
end

target 'marvelapp' do
    
    use_frameworks!
    # Shared pods
    shared_pods
end
