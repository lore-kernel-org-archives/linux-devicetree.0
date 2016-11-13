From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 02/19] ARM: dts: armada-370-xp: move the cpurst node in the common file
Date: Sun, 13 Nov 2016 22:23:45 +0100
Message-ID: <20161113212402.3060-3-gregory.clement@free-electrons.com>
References: <20161113212402.3060-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161113212402.3060-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The cpurst nodes are identical in armada-370.dtsi and armada-xp.dtsi
files, so move it in the common armada-370-xp.dtsi file.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-370-xp.dtsi | 5 +++++
 arch/arm/boot/dts/armada-370.dtsi    | 5 -----
 arch/arm/boot/dts/armada-xp.dtsi     | 1 -
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/armada-370-xp.dtsi b/arch/arm/boot/dts/armada-370-xp.dtsi
index 3ccedc9dffb2..1d8171380fa0 100644
--- a/arch/arm/boot/dts/armada-370-xp.dtsi
+++ b/arch/arm/boot/dts/armada-370-xp.dtsi
@@ -228,6 +228,11 @@
 				reg = <0x20300 0x34>, <0x20704 0x4>;
 			};
 
+			cpurst@20800 {
+				compatible = "marvell,armada-370-cpu-reset";
+				reg = <0x20800 0x8>;
+			};
+
 			pmsu@22000 {
 				compatible = "marvell,armada-370-pmsu";
 				reg = <0x22000 0x1000>;
diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
index b4258105e91f..79b5463209aa 100644
--- a/arch/arm/boot/dts/armada-370.dtsi
+++ b/arch/arm/boot/dts/armada-370.dtsi
@@ -233,11 +233,6 @@
 				clocks = <&coreclk 2>;
 			};
 
-			cpurst@20800 {
-				compatible = "marvell,armada-370-cpu-reset";
-				reg = <0x20800 0x8>;
-			};
-
 			cpu-config@21000 {
 				compatible = "marvell,armada-370-cpu-config";
 				reg = <0x21000 0x8>;
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index 4a5f99e65b51..e141de2a4a1c 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -167,7 +167,6 @@
 			};
 
 			cpurst@20800 {
-				compatible = "marvell,armada-370-cpu-reset";
 				reg = <0x20800 0x20>;
 			};
 
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
