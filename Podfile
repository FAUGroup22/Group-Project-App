# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'


target 'ubidv2' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
       
    # Your packages goes here
    pod 'Parse'
    pod 'AlamofireImage'
end
 
# Disable signing for pods
post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
         end
    end
  end
end