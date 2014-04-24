From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: keystone: Update USB node for dma properties
Date: Thu, 24 Apr 2014 11:42:22 -0400
Message-ID: <1398354142-2767-5-git-send-email-santosh.shilimkar@ti.com>
References: <1398354142-2767-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398354142-2767-1-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Keystone supports dma-coherent on USB master and also needs
dma-ranges to specify the hardware alias memory range in which DMA
can be operational.

Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 404ff1f..5d16e4d 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -170,6 +170,8 @@
 			clock-names = "usb";
 			interrupts = <GIC_SPI 393 IRQ_TYPE_EDGE_RISING>;
 			ranges;
+			dma-coherent;
+			dma-ranges;
 			status = "disabled";
 
 			dwc3@2690000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
