From: Abhishek Shah <abhishek.shah-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/7] arm64: dts: Enable stats for CCN-502 interconnect on Stingray
Date: Sat, 29 Jul 2017 10:12:23 +0530
Message-ID: <1501303349-30007-2-git-send-email-abhishek.shah@broadcom.com>
References: <1501303349-30007-1-git-send-email-abhishek.shah@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501303349-30007-1-git-send-email-abhishek.shah-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

This patch enables stats for CCN-502 interconnect on Stingray.

Signed-off-by: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 49933cf..a63c465 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -152,6 +152,12 @@
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x61000000 0x05000000>;
 
+		ccn: ccn@00000000 {
+			compatible = "arm,ccn-502";
+			reg = <0x00000000 0x900000>;
+			interrupts = <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		gic: interrupt-controller@02c00000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
