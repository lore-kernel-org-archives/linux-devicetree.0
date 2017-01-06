From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v2 1/5] ARM: davinci_all_defconfig: enable DA8xx pinconf
Date: Thu,  5 Jan 2017 22:33:44 -0600
Message-ID: <1483677228-2325-2-git-send-email-david@lechnology.com>
References: <1483677228-2325-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483677228-2325-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This enables the DA8xx pinconf driver by default. It is needed by LEGO
MINDSTORMS EV3.
---
 arch/arm/configs/davinci_all_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index ddb586a..a12e4c2 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -114,6 +114,7 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_SPI=y
 CONFIG_SPI_DAVINCI=m
+CONFIG_PINCTRL_DA850_PUPD=m
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PCA953X=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
