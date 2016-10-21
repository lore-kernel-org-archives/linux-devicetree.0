From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH 3/5] ARM: davinci: enable gpio poweroff in default config
Date: Fri, 21 Oct 2016 13:36:55 -0500
Message-ID: <1477075018-20176-4-git-send-email-david@lechnology.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477075018-20176-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The gpio-poweroff driver is needed by LEGO MINDSTORMS EV3 (AM1808 based
board).

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---
 arch/arm/configs/davinci_all_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 9254609..9d7f0bc 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -117,6 +117,8 @@ CONFIG_SPI_DAVINCI=m
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PCA953X=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
 CONFIG_WATCHDOG=y
 CONFIG_DAVINCI_WATCHDOG=m
 CONFIG_MFD_DM355EVM_MSP=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
