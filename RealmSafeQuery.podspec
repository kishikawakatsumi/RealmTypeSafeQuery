Pod::Spec.new do |spec|
  spec.name = 'RealmSafeQuery'
  spec.version = '0.5.0'
  spec.summary = 'A type-safe Realm query extensions using Swift 4 Smart KeyPaths'
  spec.description = <<-DESC
                       RealmSafeQuery provides type safety, code completion and avoidance of typos against `NSPredicate` queries.

                       Examples:
                       ```swift
                       realm.objects(Person.self).filter(\Person.name == "Katsumi")
                       realm.objects(Person.self).filter(\Person.age > 20)

                       realm.objects(Person.self).filter(\Person.name > 20) // Compile error
                       realm.objects(Person.self).filter(\Dog.name == "John") // Compile error
                       ```
                    DESC
  spec.homepage = 'https://realm.io'
  spec.license = { :type => 'Apache 2.0', :file => 'LICENSE' }
  spec.author = { 'Realm' => 'help@realm.io' }
  spec.social_media_url = 'https://twitter.com/realm'

  spec.requires_arc = true
  spec.source = { git: 'https://github.com/realm/RealmSafeQuery.git', tag: "v#{spec.version}", submodules: true }
  spec.source_files = 'RealmSafeQuery/*.{h,swift}'

  spec.dependency 'RealmSwift', '~> 2.10.0'

  spec.pod_target_xcconfig = { 'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
                               'APPLICATION_EXTENSION_API_ONLY' => 'YES' }

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
end
