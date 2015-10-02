From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 4/6] arm64: dts: Add ARM PMUv3 DT node in NS2 DT
Date: Fri, 2 Oct 2015 23:24:21 +0530
Message-ID: <1443808463-21120-5-git-send-email-anup.patel@broadcom.com>
References: <1443808463-21120-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443808463-21120-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

The NS2 SoC has Cortex-A57 CPUs which support ARM PMUv3 so,
lets enable ARM PMUv3 in NS2 DT.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 5d2ac6b..bc31c0e 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -44,7 +44,7 @@
 		#address-cells = <2>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		A57_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 0>;
@@ -53,7 +53,7 @@
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
-		cpu@1 {
+		A57_1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 1>;
@@ -62,7 +62,7 @@
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
-		cpu@2 {
+		A57_2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 2>;
@@ -71,7 +71,7 @@
 			next-level-cache = <&CLUSTER0_L2>;
 		};
 
-		cpu@3 {
+		A57_3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a57", "arm,armv8";
 			reg = <0 3>;
@@ -97,6 +97,18 @@
 			      IRQ_TYPE_EDGE_RISING)>;
 	};
 
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&A57_0>,
+				     <&A57_1>,
+				     <&A57_2>,
+				     <&A57_3>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
