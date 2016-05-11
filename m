From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: NS2: Add CCI-400 PMU support
Date: Wed, 11 May 2016 18:56:09 -0400
Message-ID: <1463007369-13071-2-git-send-email-jonmason@broadcom.com>
References: <1463007369-13071-1-git-send-email-jonmason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463007369-13071-1-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support to the Northstar 2 Device tree file for the ARM CCI-400 PMU.

Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index c77a9e8..d1dc812 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -279,6 +279,26 @@
 				      IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		cci@65590000 {
+			compatible = "arm,cci-400";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x65590000 0x1000>;
+			ranges = <0 0x65590000 0x10000>;
+
+			pmu@9000 {
+				compatible = "arm,cci-400-pmu,r1",
+					     "arm,cci-400-pmu";
+				reg = <0x9000 0x4000>;
+				interrupts = <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		timer0: timer@66030000 {
 			compatible = "arm,sp804", "arm,primecell";
 			reg = <0x66030000 0x1000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
