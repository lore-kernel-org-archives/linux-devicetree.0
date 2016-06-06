From: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/3] arm: mach-keystone: Enable PINCTRL config
Date: Mon, 6 Jun 2016 10:15:05 +0530
Message-ID: <1465188306-32556-3-git-send-email-j-keerthy@ti.com>
References: <1465188306-32556-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465188306-32556-1-git-send-email-j-keerthy-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: j-keerthy-l0cyMroinI0@public.gmane.org, lokeshvutla-l0cyMroinI0@public.gmane.org, nm-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>

Some Keystone 2 devices utilize pinmuxing which requires PINCTRL
to be enabled. Therefore, enable PINCTRL for all Keystone 2 devices.

Signed-off-by: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Signed-off-by: Dave Gerlach <d-gerlach-l0cyMroinI0@public.gmane.org>
Signed-off-by: Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>
---
 arch/arm/mach-keystone/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-keystone/Kconfig b/arch/arm/mach-keystone/Kconfig
index ea955f6db..7a432ee 100644
--- a/arch/arm/mach-keystone/Kconfig
+++ b/arch/arm/mach-keystone/Kconfig
@@ -11,6 +11,7 @@ config ARCH_KEYSTONE
 	select ZONE_DMA if ARM_LPAE
 	select MIGHT_HAVE_PCI
 	select PCI_DOMAINS if PCI
+	select PINCTRL
 	help
 	  Support for boards based on the Texas Instruments Keystone family of
 	  SoCs.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
