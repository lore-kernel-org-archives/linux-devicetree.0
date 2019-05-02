From: Pablo Greco <pgreco@centosproject.org>
Subject: [PATCH v6 0/5] ARM: dts: sun8i: v40 Rewrite BPi M2 Berry DTS based on BPi M2 Ultra
Date: Thu,  2 May 2019 10:33:44 -0300
Message-ID: <1556804030-25291-1-git-send-email-pgreco@centosproject.org>
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

Changes in v6:
- Removed patch already queued for 5.3
- Reworked which nodes are added according to the new patch order
- Squashed bt and wifi patches

Changes in v5:
- Changed commit order
- Removed regulator-always-on from gpio regulators
- Copied commit log for the bluetooth node from the m2-ultra

Changes in v4:
- Went back to v2
- Added GPIO pin-bank regulators (both m2-ultra and m2-berry)

Changes in v3:
- Removed "Sort device node dereferences" (already applied)
- Added basic pio node
- Tied GMAC regulators to the pio (both m2-ultra and m2-berry)

Changes in v2:
- Split into smaller patches

Pablo Greco (5):
  ARM: dts: sun8i: v40: bananapi-m2-berry: Add GPIO pin-bank regulator  
      supplies
  ARM: dts: sun8i: v40: bananapi-m2-berry: Enable GMAC ethernet
    controller
  ARM: dts: sun8i: v40: bananapi-m2-berry: Enable HDMI output
  ARM: dts: sun8i: v40: bananapi-m2-berry: Enable AHCI
  ARM: dts: sun8i: v40: bananapi-m2-berry: Add Bluetooth device node

 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 123 ++++++++++++++++++++++
 1 file changed, 123 insertions(+)

-- 
1.8.3.1
