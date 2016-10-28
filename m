From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: davinci: enable LEDs default-on trigger in
 default config
Date: Fri, 28 Oct 2016 14:33:32 +0530
Message-ID: <62bfb9e3-c752-99e3-78c2-944d95735847@ti.com>
References: <1477075018-20176-1-git-send-email-david@lechnology.com>
 <1477075018-20176-5-git-send-email-david@lechnology.com>
 <669b14c2-7f62-35bc-c8a3-6dde05a99fb1@ti.com>
 <be478f0a-bd10-7241-7e9d-20dfc1beaa30@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <be478f0a-bd10-7241-7e9d-20dfc1beaa30-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 27 October 2016 09:19 PM, David Lechner wrote:
> Yes, module is OK here.

Here is the patch I pushed to v4.10/defconfig.

Thanks,
Sekhar

---8<---
From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Date: Fri, 21 Oct 2016 13:36:56 -0500
Subject: [PATCH] ARM: davinci_all_defconfig: enable LED default-on trigger

The LEDs default-on trigger is nice to have. For example, it can be used
to configure a LED as a power indicator.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
[nsekhar-l0cyMroinI0@public.gmane.org: build as module, subject line fixes]
Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/configs/davinci_all_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 513978eaf03d..b5e978ff177f 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -180,6 +180,7 @@ CONFIG_LEDS_GPIO=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=m
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_OMAP=m
 CONFIG_DMADEVICES=y
-- 
2.9.0



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
