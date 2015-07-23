From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: Use stdout-path in STM32F429 Discovery board
Date: Thu, 23 Jul 2015 07:09:33 +0200
Message-ID: <1437628173-9447-1-git-send-email-mcoquelin.stm32@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, afaerber-l3A5Bk7waGM@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch replaces use of linux,stdout-path by stdout-path as per
"chosen" DT bindings documentation.

Doing that, the "console" argument is no more needed in kernel command
line.

Reported-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 8bd3de5..f0b731d 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -53,8 +53,8 @@
 	compatible = "st,stm32f429i-disco", "st,stm32f429";
 
 	chosen {
-		bootargs = "console=ttyS0,115200 root=/dev/ram rdinit=/linuxrc";
-		linux,stdout-path = &usart1;
+		bootargs = "root=/dev/ram rdinit=/linuxrc";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
