From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 03/12] ARM: mvebu: a38x: Fix node names
Date: Thu,  8 Jan 2015 18:38:05 +0100
Message-ID: <1420738694-6163-4-git-send-email-gregory.clement@free-electrons.com>
References: <1420738694-6163-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420738694-6163-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Some nodes in the DTs have a reg property but no unit name in their node name.

This contradicts the way the ePAPR defines the node names. Fix this.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-380.dtsi   | 2 +-
 arch/arm/boot/dts/armada-385-db.dts | 2 +-
 arch/arm/boot/dts/armada-385-rd.dts | 2 +-
 arch/arm/boot/dts/armada-385.dtsi   | 2 +-
 arch/arm/boot/dts/armada-38x.dtsi   | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/armada-380.dtsi b/arch/arm/boot/dts/armada-380.dtsi
index 4173a8ab34e7..13400ce88c54 100644
--- a/arch/arm/boot/dts/armada-380.dtsi
+++ b/arch/arm/boot/dts/armada-380.dtsi
@@ -32,7 +32,7 @@
 
 	soc {
 		internal-regs {
-			pinctrl {
+			pinctrl@18000 {
 				compatible = "marvell,mv88f6810-pinctrl";
 				reg = <0x18000 0x20>;
 			};
diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts/armada-385-db.dts
index 2aaa9d2ac284..212605ccc7b6 100644
--- a/arch/arm/boot/dts/armada-385-db.dts
+++ b/arch/arm/boot/dts/armada-385-db.dts
@@ -74,7 +74,7 @@
 				phy-mode = "rgmii-id";
 			};
 
-			mdio {
+			mdio@72004 {
 				phy0: ethernet-phy@0 {
 					reg = <0>;
 				};
diff --git a/arch/arm/boot/dts/armada-385-rd.dts b/arch/arm/boot/dts/armada-385-rd.dts
index aaca2861dc87..74a3bfe6efd7 100644
--- a/arch/arm/boot/dts/armada-385-rd.dts
+++ b/arch/arm/boot/dts/armada-385-rd.dts
@@ -67,7 +67,7 @@
 			};
 
 
-			mdio {
+			mdio@72004 {
 				phy0: ethernet-phy@0 {
 					reg = <0>;
 				};
diff --git a/arch/arm/boot/dts/armada-385.dtsi b/arch/arm/boot/dts/armada-385.dtsi
index 6283d7912f71..5249a4d3c207 100644
--- a/arch/arm/boot/dts/armada-385.dtsi
+++ b/arch/arm/boot/dts/armada-385.dtsi
@@ -37,7 +37,7 @@
 
 	soc {
 		internal-regs {
-			pinctrl {
+			pinctrl@18000 {
 				compatible = "marvell,mv88f6820-pinctrl";
 				reg = <0x18000 0x20>;
 			};
diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 74391dace9e7..ada1f206028b 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -193,7 +193,7 @@
 				status = "disabled";
 			};
 
-			pinctrl {
+			pinctrl@18000 {
 				compatible = "marvell,mv88f6820-pinctrl";
 				reg = <0x18000 0x20>;
 			};
@@ -373,7 +373,7 @@
 				status = "disabled";
 			};
 
-			mdio {
+			mdio@72004 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "marvell,orion-mdio";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
