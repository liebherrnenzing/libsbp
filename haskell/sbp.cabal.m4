name:                  sbp
version:               2.3.4
synopsis:              SwiftNav's SBP Library
homepage:              https://github.com/swift-nav/libsbp
license:               LGPL-3
author:                Swift Navigation Inc.
maintainer:            Swift Navigation <dev@swiftnav.com>
copyright:             Copyright (C) 2015-2018 Swift Navigation, Inc.
category:              Network
build-type:            Simple
cabal-version:         >= 1.22
extra-source-files:    README.md
description:
  Haskell bindings for Swift Navigation Binary Protocol (SBP), a fast,
  simple, and minimal binary protocol for communicating with Swift
  devices. It is the native binary protocol used by the Piksi GPS
  receiver to transmit solutions, observations, status and debugging
  messages, as well as receive messages from the host operating
  system, such as differential corrections and the almanac.

source-repository head
  type:                git
  location:            git@github.com:swift-nav/libsbp.git

library
  exposed-modules:     SwiftNav.CRC16
                     , SwiftNav.SBP
  other-modules:       SwiftNav.SBP.Msg
                     , SwiftNav.SBP.TH
                     , SwiftNav.SBP.Types
                     , SwiftNav.SBP.Acquisition
                     , SwiftNav.SBP.Bootload
                     , SwiftNav.SBP.ExtEvents
                     , SwiftNav.SBP.FileIo
                     , SwiftNav.SBP.Flash
                     , SwiftNav.SBP.Gnss
                     , SwiftNav.SBP.Imu
                     , SwiftNav.SBP.Logging
                     , SwiftNav.SBP.Mag
                     , SwiftNav.SBP.Navigation
                     , SwiftNav.SBP.Ndb
                     , SwiftNav.SBP.Observation
                     , SwiftNav.SBP.Orientation
                     , SwiftNav.SBP.Piksi
                     , SwiftNav.SBP.Sbas
                     , SwiftNav.SBP.Settings
                     , SwiftNav.SBP.Ssr
                     , SwiftNav.SBP.System
                     , SwiftNav.SBP.Tracking
                     , SwiftNav.SBP.User
                     , SwiftNav.SBP.Vehicle
  default-language:    Haskell2010
  hs-source-dirs:      src
  ghc-options:         -Wall
  build-depends:       aeson
                     , array
                     , base >= 4.8 && < 5
                     , base64-bytestring
                     , basic-prelude
                     , binary
                     , bytestring
                     , data-binary-ieee754
                     , lens
                     , lens-aeson
                     , monad-loops
                     , template-haskell
                     , text

executable sbp2json
  hs-source-dirs:      main
  main-is:             SBP2JSON.hs
  ghc-options:         -threaded -rtsopts -with-rtsopts=-N -Wall
  build-depends:       aeson
                     , base
                     , basic-prelude
                     , binary-conduit
                     , bytestring
                     , conduit
                     , conduit-extra
                     , resourcet
                     , sbp
  default-language:    Haskell2010

executable json2sbp
  hs-source-dirs:      main
  main-is:             JSON2SBP.hs
  ghc-options:         -threaded -rtsopts -with-rtsopts=-N -Wall
  build-depends:       aeson
                     , base
                     , basic-prelude
                     , binary-conduit
                     , conduit
                     , conduit-extra
                     , resourcet
                     , sbp
  default-language:    Haskell2010

executable sbp2yaml
  hs-source-dirs:      main
  main-is:             SBP2YAML.hs
  ghc-options:         -threaded -rtsopts -with-rtsopts=-N -Wall
  build-depends:       base
                     , basic-prelude
                     , binary-conduit
                     , bytestring
                     , conduit
                     , conduit-extra
                     , resourcet
                     , sbp
                     , yaml
  default-language:    Haskell2010

test-suite test
  type:                exitcode-stdio-1.0
  hs-source-dirs:      test
  main-is:             Test.hs
  other-modules:       Test.SwiftNav.CRC16
  build-depends:       base
                     , basic-prelude
                     , sbp
                     , tasty
                     , tasty-hunit
  ghc-options:         -threaded -rtsopts -with-rtsopts=-N -Wall
  default-language:    Haskell2010