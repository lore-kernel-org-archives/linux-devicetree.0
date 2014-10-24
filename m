From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 8/8] ARM: mediatek: Fix description for mediatek SoCs
Date: Fri, 24 Oct 2014 13:37:06 +0800
Message-ID: <1414129026.14830.588.camel@mtksdaap41>
References: <1413973797-17619-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1413973797-17619-9-git-send-email-yingjoe.chen@mediatek.com>
	 <CABuKBe+Ew6R2Kb90-gDHBQ4HuydfFxJdYmr+v9-KNC-b0K4Tkw@mail.gmail.com>
	 <1413984696.19686.72.camel@mtksdaap41>
	 <CABuKBeLJuaDnCYuvvS6csNzvbTeEdgEUdZ4tBQeVPuw37JK11Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBeLJuaDnCYuvvS6csNzvbTeEdgEUdZ4tBQeVPuw37JK11Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hsien-Chun Yen <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yuhau Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

We support more MediaTek SoCs now, update the description.

Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-mediatek/Kconfig
b/arch/arm/mach-mediatek/Kconfig
index 2c043a2..f73f588 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -1,6 +1,6 @@
 config ARCH_MEDIATEK
-	bool "Mediatek MT6589 SoC" if ARCH_MULTI_V7
+	bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
 	select ARM_GIC
 	select MTK_TIMER
 	help
-	  Support for Mediatek Cortex-A7 Quad-Core-SoC MT6589.
+	  Support for Mediatek MT65xx & MT81xx SoCs
-- 
1.8.1.1.dirty



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
