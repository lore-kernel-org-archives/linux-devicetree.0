From: Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm/dts: ls1021a: Add dma-coherent property to usb3 node
Date: Wed, 23 Nov 2016 13:49:02 +0800
Message-ID: <1479880142-27397-1-git-send-email-jerry.huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This sets dma ops as coherent for usb 3.0 platform device

Signed-off-by: Changming Huang <jerry.huang-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/ls1021a.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 368e219..81fb4d9 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -627,6 +627,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			dma-coherent;
 		};
 
 		pcie@3400000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
