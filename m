From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/7] ARM: dts: Broadcom: Fix W=1 DTC warnings
Date: Tue, 28 May 2019 16:01:27 -0700
Message-ID: <20190528230134.27007-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM IPROC ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series attempts to fix the most obvious W=1 DTC warnings for
Broadcom SoCs DTS files. Stefan, if you could do the same for all
bcm283* that would be fantastic.

Thank you!

Florian Fainelli (7):
  ARM: dts: Fix BCM7445 DTC warnings
  ARM: dts: Cygnus: Fix most DTC W=1 warnings
  ARM: dts: bcm-mobile: Fix most DTC W=1 warnings
  ARM: dts: BCM53573: Fix DTC W=1 warnings
  ARM: dts: BCM63xx: Fix DTC W=1 warnings
  ARM: dts: BCM5301X: Fix most DTC W=1 warnings
  ARM: dts: NSP: Fix the bulk of W=1 DTC warnings

 arch/arm/boot/dts/bcm-cygnus-clock.dtsi            | 12 ++++++------
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  6 +++---
 arch/arm/boot/dts/bcm-nsp.dtsi                     |  9 +++------
 arch/arm/boot/dts/bcm11351.dtsi                    | 12 ++++++------
 arch/arm/boot/dts/bcm21664-garnet.dts              |  2 +-
 arch/arm/boot/dts/bcm21664.dtsi                    | 10 +++++-----
 arch/arm/boot/dts/bcm23550-sparrow.dts             |  2 +-
 arch/arm/boot/dts/bcm23550.dtsi                    |  8 ++++----
 arch/arm/boot/dts/bcm28155-ap.dts                  |  2 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts        |  4 +---
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts        |  4 +---
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  4 +---
 arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dts    |  4 +---
 arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dts    |  4 +---
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts       |  4 +---
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts       |  4 +---
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts        |  4 +---
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts     |  4 +---
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts      |  4 +---
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts        |  4 +---
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |  4 +---
 arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |  4 +---
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts      |  4 +---
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts      |  4 +---
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts |  4 +---
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts      |  4 +---
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |  4 +---
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts      |  4 +---
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts      |  4 +---
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts      |  4 +---
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts      |  4 +---
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |  4 +---
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts       |  4 +---
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts          |  4 +---
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts      |  4 +---
 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts       |  4 +---
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts           |  4 +---
 arch/arm/boot/dts/bcm5301x.dtsi                    | 10 ++++------
 arch/arm/boot/dts/bcm53573.dtsi                    |  2 +-
 arch/arm/boot/dts/bcm63138.dtsi                    |  9 +++------
 arch/arm/boot/dts/bcm7445-bcm97445svmb.dts         |  2 +-
 arch/arm/boot/dts/bcm7445.dtsi                     |  8 ++++----
 arch/arm/boot/dts/bcm911360_entphn.dts             |  2 --
 arch/arm/boot/dts/bcm947189acdbmr.dts              |  4 +---
 arch/arm/boot/dts/bcm953012er.dts                  |  4 +---
 arch/arm/boot/dts/bcm953012k.dts                   |  2 +-
 arch/arm/boot/dts/bcm958522er.dts                  |  2 +-
 arch/arm/boot/dts/bcm958525er.dts                  |  2 +-
 arch/arm/boot/dts/bcm958525xmc.dts                 |  2 +-
 arch/arm/boot/dts/bcm958622hr.dts                  |  2 +-
 arch/arm/boot/dts/bcm958623hr.dts                  |  2 +-
 arch/arm/boot/dts/bcm958625hr.dts                  |  2 +-
 arch/arm/boot/dts/bcm958625k.dts                   |  2 +-
 arch/arm/boot/dts/bcm963138dvt.dts                 |  2 +-
 arch/arm/boot/dts/bcm988312hr.dts                  |  2 +-
 55 files changed, 83 insertions(+), 153 deletions(-)

-- 
2.17.1
