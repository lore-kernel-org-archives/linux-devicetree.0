From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/4] ARM: bcm2835: DT improvements
Date: Fri, 16 Jan 2015 16:48:13 +0000
Message-ID: <1421426897-27225-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, lee@kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series contains DT improvements for the Raspberry Pi.

Patch 1,2: Add missing vendor prefix and root compatible properties
Patch 3,4: Use constants for pin function instead of error-prone numbers

Stefan Wahren (4):
  dt-bindings: Add vendor prefix for Raspberry Pi
  dt-bindings: Add root properties for Raspberry Pi B and B+
  ARM: bcm2835: Add header file for pinctrl constants
  ARM: bcm2835: Use pinctrl header

 Documentation/devicetree/bindings/arm/bcm2835.txt  |   10 ++++++--
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |    4 +--
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |    4 +--
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |    8 +++---
 arch/arm/boot/dts/bcm2835.dtsi                     |    3 ++-
 include/dt-bindings/pinctrl/bcm2835.h              |   27 ++++++++++++++++++++
 7 files changed, 46 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/bcm2835.h

-- 
1.7.9.5
