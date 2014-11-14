From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 04/13] ARM: dts: berlin: add a required reset property in the chip controller node
Date: Fri, 14 Nov 2014 16:25:54 +0100
Message-ID: <1415978763-27345-5-git-send-email-antoine.tenart@free-electrons.com>
References: <1415978763-27345-1-git-send-email-antoine.tenart@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415978763-27345-1-git-send-email-antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The chip controller node now also describes the Marvell Berlin reset
controller. Add the required 'reset-cells' property.

Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/berlin2.dtsi   | 1 +
 arch/arm/boot/dts/berlin2cd.dtsi | 1 +
 arch/arm/boot/dts/berlin2q.dtsi  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2.dtsi
index 9d7c810ebd0b..d7e81e124de0 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -249,6 +249,7 @@
 		chip: chip-control@ea0000 {
 			compatible = "marvell,berlin2-chip-ctrl";
 			#clock-cells = <1>;
+			#reset-cells = <2>;
 			reg = <0xea0000 0x400>;
 			clocks = <&refclk>;
 			clock-names = "refclk";
diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berlin2cd.dtsi
index cc1df65da504..68f7032b4686 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -231,6 +231,7 @@
 		chip: chip-control@ea0000 {
 			compatible = "marvell,berlin2cd-chip-ctrl";
 			#clock-cells = <1>;
+			#reset-cells = <2>;
 			reg = <0xea0000 0x400>;
 			clocks = <&refclk>;
 			clock-names = "refclk";
diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 891d56b03922..2de8d6f8973c 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -349,6 +349,7 @@
 		chip: chip-control@ea0000 {
 			compatible = "marvell,berlin2q-chip-ctrl";
 			#clock-cells = <1>;
+			#reset-cells = <2>;
 			reg = <0xea0000 0x400>, <0xdd0170 0x10>;
 			clocks = <&refclk>;
 			clock-names = "refclk";
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
