From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] arm64: dts: stratix10: fix up the gic register for the Stratix10 platform
Date: Fri,  8 Sep 2017 10:48:53 -0500
Message-ID: <1504885734-9618-1-git-send-email-dinguyen@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The register entries for the ARM GIC-400 should have a 2nd set of address.

Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index c2b9bcb..631e09a 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -75,10 +75,10 @@
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-		reg = <0x0 0xfffc1000 0x1000>,
-		      <0x0 0xfffc2000 0x2000>,
-		      <0x0 0xfffc4000 0x2000>,
-		      <0x0 0xfffc6000 0x2000>;
+		reg = <0x0 0xfffc1000 0x0 0x1000>,
+		      <0x0 0xfffc2000 0x0 0x2000>,
+		      <0x0 0xfffc4000 0x0 0x2000>,
+		      <0x0 0xfffc6000 0x0 0x2000>;
 	};
 
 	soc {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
