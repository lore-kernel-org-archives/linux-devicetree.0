Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57532 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727099AbfHNKUB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 06:20:01 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/3] ARM: dts: Add fck for cpsw mdio for omap variants
Date: Wed, 14 Aug 2019 03:19:47 -0700
Message-Id: <20190814101949.50006-2-tony@atomide.com>
In-Reply-To: <20190814101949.50006-1-tony@atomide.com>
References: <20190814101949.50006-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, Keerthy <j-keerthy@ti.com>
List-ID: <devicetree@vger.kernel.org>

In preparation for dropping legacy platform data and custom ti,hwmods
property, we need to make functional clock available for mdio for the
SoCs so the the mdio driver can find it.

The mdio hardware currently relies on a mdio_hwmod to manage the clock
for omap variants. This is wrong though as there are no separate
sysconfig registers for mdio. All the cpsw related components are just
children of the gmac module.

Note that since mdio is a child of cpsw, just doing pm_runtime_get()
in the mdio driver enables the clock. However, since mdio is also used
by davinci that does not implement runtime PM, let's just add the fck
for now.

Also note that am437x mdio already has a clock, let's update it to
not use the legacy clock naming to unify things further.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 ++
 arch/arm/boot/dts/am437x-l4.dtsi | 4 ++--
 arch/arm/boot/dts/dra7-l4.dtsi   | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -719,6 +719,8 @@
 
 				davinci_mdio: mdio@1000 {
 					compatible = "ti,cpsw-mdio","ti,davinci_mdio";
+					clocks = <&cpsw_125mhz_clkctrl AM3_CPSW_125MHZ_CPGMAC0_CLKCTRL 0>;
+					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
 					ti,hwmods = "davinci_mdio";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -559,10 +559,10 @@
 				davinci_mdio: mdio@1000 {
 					compatible = "ti,am4372-mdio","ti,cpsw-mdio","ti,davinci_mdio";
 					reg = <0x1000 0x100>;
+					clocks = <&cpsw_125mhz_clkctrl AM4_CPSW_125MHZ_CPGMAC0_CLKCTRL 0>;
+					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
-					clocks = <&cpsw_125mhz_gclk>;
-					clock-names = "fck";
 					ti,hwmods = "davinci_mdio";
 					bus_freq = <1000000>;
 					status = "disabled";
diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3103,6 +3103,8 @@
 
 				davinci_mdio: mdio@1000 {
 					compatible = "ti,cpsw-mdio","ti,davinci_mdio";
+					clocks = <&gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0>;
+					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
 					ti,hwmods = "davinci_mdio";
-- 
2.21.0
