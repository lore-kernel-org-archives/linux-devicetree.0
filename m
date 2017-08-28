From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH v2 1/2]  ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for LAN8710
Date: Mon, 28 Aug 2017 09:32:42 +0300
Message-ID: <1503901963-9457-2-git-send-email-stefan@olimex.com>
References: <1503901963-9457-1-git-send-email-stefan@olimex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503901963-9457-1-git-send-email-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Stefan Mavrodiev <stefan@olimex.com>, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

>From revision J the board uses new phy chip LAN8710. Compared
with RTL8201, RA17 pin is TXERR. It has pullup which causes phy
not to work. To fix this PA17 is muxed with GMAC function. This
makes the pin output-low.

This patch is compatible with earlier board revisions, since this
pin wasn't connected to phy.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 0b7403e..cb1b081 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -102,7 +102,7 @@
 
 &gmac {
 	pinctrl-names = "default";
-	pinctrl-0 = <&gmac_pins_mii_a>;
+	pinctrl-0 = <&gmac_pins_mii_a>,<&gmac_txerr>;
 	phy = <&phy1>;
 	phy-mode = "mii";
 	status = "okay";
@@ -229,6 +229,11 @@
 };
 
 &pio {
+	gmac_txerr: gmac_txerr@0 {
+		pins = "PA17";
+		function = "gmac";
+	};
+
 	mmc3_cd_pin_olinuxinom: mmc3_cd_pin@0 {
 		pins = "PH11";
 		function = "gpio_in";
-- 
2.7.4
