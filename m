From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 09/12] ARM: dts: socfpga: fpga manager data is 32 bits
Date: Wed,  4 Jan 2017 18:21:31 -0600
Message-ID: <1483575694-29599-10-git-send-email-dinguyen@kernel.org>
References: <1483575694-29599-1-git-send-email-dinguyen@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483575694-29599-1-git-send-email-dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dalon Westergreen <dwesterg-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adjust regs property for the FPGA manager data register to
properly reflect that it is a single 32 bit register.

Signed-off-by: Dalon Westergreen <dwesterg-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index da68965..de29172 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -516,7 +516,7 @@
 		fpgamgr0: fpgamgr@ff706000 {
 			compatible = "altr,socfpga-fpga-mgr";
 			reg = <0xff706000 0x1000
-			       0xffb90000 0x1000>;
+			       0xffb90000 0x4>;
 			interrupts = <0 175 4>;
 		};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
