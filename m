From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH v4 0/7] ARM: dts: sun8i: v40 Rewrite BPi M2 Berry DTS based on BPi M2 Ultra
Date: Thu, 18 Apr 2019 12:11:15 -0300
Message-ID: <1555600282-9405-1-git-send-email-pgreco@centosproject.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com
Cc: Pablo Greco <pgreco@centosproject.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

BPi M2 Berry is a trimmed down version of the BPi M2 Ultra, completely
software compatible.

Changes include:
- 2GiB -> 1GiB
- no eMMC
- no onboard microphone
- no IR
- no blue LED
- no charging (and power jack to USB)
- dropped USB2 and connect USB1 to a 4-port HUB.

Changes in v4:
- Went back to v2
- Added GPIO pin-bank regulators (both m2-ultra and m2-berry)

Changes in v3:
- Removed "Sort device node dereferences" (already applied)
- Added basic pio node
- Tied GMAC regulators to the pio (both m2-ultra and m2-berry)

Changes in v2:
- Split into smaller patches

Pablo Greco (7):
  ARM: dts: sun8i: v40: bananapi-m2-berry: Enable GMAC ethernet
    controller
  ARM: dts: sun8i: v40: bananapi-m2-berry: Enable HDMI output
  ARM: dts: sun8i: v40: bananapi-m2-berry: Enable AHCI
  ARM: dts: sun8i: v40: bananapi-m2-berry: Fix WiFi regulator
    definitions
  ARM: dts: sun8i: v40: bananapi-m2-berry: Add Bluetooth device node
  ARM: dts: sun8i: v40: bananapi-m2-berry: Add GPIO pin-bank regulator  
      supplies
  ARM: dts: sun8i: r40: bananapi-m2-ultra: Add GPIO pin-bank regulator  
      supplies

 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts |   6 ++
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 124 ++++++++++++++++++++++
 2 files changed, 130 insertions(+)

-- 
1.8.3.1
