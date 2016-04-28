From: Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] arm: dts: fix use of bcm11351 enable method
Date: Thu, 28 Apr 2016 10:59:58 -0700
Message-ID: <1461866399-1725-3-git-send-email-chris.brand@broadcom.com>
References: <1461866399-1725-1-git-send-email-chris.brand@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461866399-1725-1-git-send-email-chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-1?Q?=20=22=08=08=22@lbrmn-lnxub?==?ISO-8859-1?Q?61.ric.broadcom.?=, =?ISO-8859-1?Q?com?=
List-Id: devicetree@vger.kernel.org

bindings/arm/cpus.txt states that "enable-method" should be a
property of the "cpu" node rather than the "cpus" node.

Signed-off-by: Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm11351.dtsi | 2 +-
 arch/arm/boot/dts/bcm21664.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 3dc7a8cc5812..18045c38bcf1 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -30,7 +30,6 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "brcm,bcm11351-cpu-method";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -41,6 +40,7 @@
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			enable-method = "brcm,bcm11351-cpu-method";
 			secondary-boot-reg = <0x3500417c>;
 			reg = <1>;
 		};
diff --git a/arch/arm/boot/dts/bcm21664.dtsi b/arch/arm/boot/dts/bcm21664.dtsi
index 3f525be28fd0..6dde95f21cef 100644
--- a/arch/arm/boot/dts/bcm21664.dtsi
+++ b/arch/arm/boot/dts/bcm21664.dtsi
@@ -30,7 +30,6 @@
        cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		enable-method = "brcm,bcm11351-cpu-method";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -41,6 +40,7 @@
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			enable-method = "brcm,bcm11351-cpu-method";
 			secondary-boot-reg = <0x35004178>;
 			reg = <1>;
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
