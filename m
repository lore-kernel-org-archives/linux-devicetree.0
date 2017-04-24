From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 0/2] net: dsa: b53: BCM11360 support
Date: Mon, 24 Apr 2017 14:50:20 -0700
Message-ID: <20170424215022.30382-1-eric@anholt.net>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This little patch series follows on from Florian's fixes that he just
sent, and enables the ethernet on the 911360_EP board.

Without Florian's fixes, the controller comes up and forwarding
happens between eth1 and eth2, but the CPU's eth0 packets don't get
forwarded.

Eric Anholt (2):
  net: dsa: b53: Add compatible strings for the Cygnus-family BCM11360.
  ARM: dts: Add the ethernet and ethernet PHY to the cygnus core DT.

 Documentation/devicetree/bindings/net/dsa/b53.txt |  3 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                 | 60 +++++++++++++++++++++++
 arch/arm/boot/dts/bcm911360_entphn.dts            |  8 +++
 drivers/net/dsa/b53/b53_srab.c                    |  2 +
 4 files changed, 73 insertions(+)

-- 
2.11.0
