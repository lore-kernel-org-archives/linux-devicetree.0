From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/12] ARM: dts: socfpga: enable CAN on Cyclone5 devkit
Date: Wed,  4 Jan 2017 18:21:26 -0600
Message-ID: <1483575694-29599-5-git-send-email-dinguyen@kernel.org>
References: <1483575694-29599-1-git-send-email-dinguyen@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483575694-29599-1-git-send-email-dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the CAN node on the Cyclone5 devkit.

Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
index c2884c9..7ea32c8 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
@@ -70,6 +70,10 @@
 	};
 };
 
+&can0 {
+	status = "okay";
+};
+
 &gmac1 {
 	status = "okay";
 	phy-mode = "rgmii";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
