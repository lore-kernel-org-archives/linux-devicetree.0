From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/11] ARM: dts: vf500: Fix interrupt-controller unit address
Date: Wed, 29 Nov 2017 16:46:19 -0200
Message-ID: <1511981179-12660-11-git-send-email-festevam@gmail.com>
References: <1511981179-12660-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981179-12660-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

The correct unit address for interrupt-controller is 0x40003000, so
change it accordingly in order to fix the following build warning
with W=1:

arch/arm/boot/dts/vf500-colibri-eval-v3.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@40000000/interrupt-controller@40002000 simple-bus unit address format error, expected "40003000"

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/vf500.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vf500.dtsi b/arch/arm/boot/dts/vf500.dtsi
index 3d98961..348bcd3 100644
--- a/arch/arm/boot/dts/vf500.dtsi
+++ b/arch/arm/boot/dts/vf500.dtsi
@@ -58,7 +58,7 @@
 	soc {
 		aips-bus@40000000 {
 
-			intc: interrupt-controller@40002000 {
+			intc: interrupt-controller@40003000 {
 				compatible = "arm,cortex-a9-gic";
 				#interrupt-cells = <3>;
 				interrupt-controller;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
