From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 11/13] ARM: dts: armada-385-linksys: fixup button node names
Date: Sun, 21 May 2017 14:49:00 +0200
Message-ID: <20170521124903.11050-12-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>
List-Id: devicetree@vger.kernel.org

Buttons don't have a reg property; drop pseudo address and fixup names
of individual button nodes. Also drop #address-cells and #size-cells
properties.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 arch/arm/boot/dts/armada-385-linksys.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi b/arch/arm/boot/dts/armada-385-linksys.dtsi
index 1bb974a..e1f355f 100644
--- a/arch/arm/boot/dts/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
@@ -81,18 +81,16 @@
 
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		pinctrl-0 = <&gpio_keys_pins>;
 		pinctrl-names = "default";
 
-		button@1 {
+		wps {
 			label = "WPS";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&gpio0 24 GPIO_ACTIVE_LOW>;
 		};
 
-		button@2 {
+		reset {
 			label = "Factory Reset Button";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
-- 
2.10.2
