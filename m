From: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/2] am335x-boneblack: add eMMC DT entry
Date: Wed, 11 Sep 2013 08:12:26 +0200
Message-ID: <1378879946-13037-3-git-send-email-koen@dominion.thruhere.net>
References: <1378879946-13037-1-git-send-email-koen@dominion.thruhere.net>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1378879946-13037-1-git-send-email-koen@dominion.thruhere.net>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: bcousson@baylibre.com, tony@atomide.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Koen Kooi <koen@dominion.thruhere.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 arch/arm/boot/dts/am335x-bone-common.dtsi |  7 +++++++
 arch/arm/boot/dts/am335x-boneblack.dts    | 15 +++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index ced256c..9c61fef 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -241,6 +241,13 @@
 			regulator-always-on;
 		};
 	};
+
+	vmmcsd_fixed: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmcsd_fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &cpsw_emac0 {
diff --git a/arch/arm/boot/dts/am335x-boneblack.dts b/arch/arm/boot/dts/am335x-boneblack.dts
index 197cadf..c09947a 100644
--- a/arch/arm/boot/dts/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/am335x-boneblack.dts
@@ -15,3 +15,18 @@
 	regulator-max-microvolt = <1800000>;
 	regulator-always-on;
 };
+
+&mmc1 { 
+	vmmc-supply = <&vmmcsd_fixed>;
+};
+
+&mmc2 { 
+	vmmc-supply = <&vmmcsd_fixed>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>;
+	bus-width = <8>;
+	ti,non-removable;
+	status = "okay";
+	ti,vcc-aux-disable-is-sleep;
+};
+
-- 
1.8.2.1

