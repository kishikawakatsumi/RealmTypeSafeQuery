Pod::Spec.new do |spec|
  spec.name = 'RealmTypeSafeQuery'
  spec.version = '0.7.0'
  spec.summary = 'A type-safe Realm query extensions using Swift 4 Smart KeyPaths'
  spec.description = <<-DESC
                       RealmTypeSafeQuery provides type safety, code completion and avoidance of typos against `NSPredicate` queries.

                       Examples:
                       ```swift
                       realm.objects(Person.self).filter(\Person.name == "Katsumi")
                       realm.objects(Person.self).filter(\Person.age > 20)

                       realm.objects(Person.self).filter(\Person.name > 20) // Compile error
                       realm.objects(Person.self).filter(\Dog.name == "John") // Compile error
                       ```
                    DESC
  spec.homepage = 'https://github.com/kishikawakatsumi/RealmTypeSafeQuery'
  spec.license = { :type => 'Apache 2.0', :file => 'LICENSE' }
  spec.author = { 'Kishikawa Katsumi' => 'kishikawakatsumi@mac.com' }
  spec.social_media_url = 'https://twitter.com/k_katsumi'

  spec.requires_arc = true
  spec.source = { git: 'https://github.com/kishikawakatsumi/RealmTypeSafeQuery.git', tag: "v#{spec.version}", submodules: true }
  spec.source_files = 'RealmTypeSafeQuery/*.{h,swift}'

  spec.dependency 'RealmSwift', '~> 3.0'

  spec.pod_target_xcconfig = { 'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
                               'APPLICATION_EXTENSION_API_ONLY' => 'YES' }

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
end
