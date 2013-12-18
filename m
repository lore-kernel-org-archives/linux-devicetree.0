From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 06/08] ARM: hi3xxx: add hotplug support
Date: Tue, 17 Dec 2013 16:40:12 -0800
Message-ID: <87sitrm1oz.fsf@linaro.org>
References: <1386748497-11290-1-git-send-email-haojian.zhuang@gmail.com>
	<1386748497-11290-7-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386748497-11290-7-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Haojian Zhuang's message of "Wed, 11 Dec 2013 15:54:55 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Enable hotplug support on hi3xxx platform
>
> How to test:
> cat proc/interrupts
> echo 0 > /sys/devices/system/cpu/cpuX/online
> cat proc/interrupts
> echo 1 > /sys/devices/system/cpu/cpuX/online
>
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Zhang Mingjun <zhang.mingjun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

ugh, more checkpatch errors:

ERROR: do not initialise statics to 0 or NULL
#120: FILE: arch/arm/mach-hi3xxx/hotplug.c:65:
+static void __iomem *ctrl_base = NULL;

Fixed this one too, but any more and the flames might start to appear.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
