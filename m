From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: dts: keystone: Add aliases for SPI nodes
Date: Wed, 13 Apr 2016 16:22:03 +0530
Message-ID: <1460544723-32647-1-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add aliases for SPI nodes, this is required to probe the SPI devices in
U-Boot.

Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 3f272826f537..94d4e45138ce 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -20,6 +20,9 @@
 
 	aliases {
 		serial0	= &uart0;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi2 = &spi2;
 	};
 
 	memory {
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
