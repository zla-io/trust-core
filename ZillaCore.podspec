Pod::Spec.new do |s|
  s.name         = 'ZillaCore'
  s.version      = '0.0.7'
  s.summary      = 'Core Ethereum data structures and algorithms.'
  s.homepage     = 'https://github.com/zla-io/zilla-core'
  s.license      = 'ZLA'
  s.authors      = { 'Jamal Mahfuz' => 'jamalmahfuz@outlook.com' }

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source       = { git: 'https://github.com/zla-io/zilla-core.git', tag: s.version }
  s.source_files = 'Sources/**/*.{swift,h,m}'
  s.public_header_files = 'Sources/ZillaCore.h', 'Sources/EthereumCrypto.h'

  s.dependency 'BigInt'
  s.dependency 'TrezorCrypto'

  s.pod_target_xcconfig = { 'SWIFT_OPTIMIZATION_LEVEL' => '-Owholemodule' }
end
