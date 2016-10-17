From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: Update Broadcom NS2 to generic IOMMU binding
Date: Mon, 17 Oct 2016 13:13:36 +0100
Message-ID: <f2de1b15adb2f57529734a4769ef04d9cde3cc5d.1476706244.git.robin.murphy@arm.com>
References: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <acf4f770eab43fec8c5b6e9cddb6dd0defc52138.1476706244.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With the "mmu-masters" property now deprecated and optional, the
generic binding offers a more efficient way to specify no masters.

CC: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
CC: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
CC: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index d95dc408629a..65530e193e8a 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -248,7 +248,7 @@
 				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
-			mmu-masters;
+			#iommu-cells = <1>;
 		};
 
 		pinctrl: pinctrl@6501d130 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
