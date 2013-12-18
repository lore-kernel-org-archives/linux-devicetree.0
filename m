From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 01/08] ARM: hi3xxx: add board support with device tree
Date: Tue, 17 Dec 2013 16:06:39 -0800
Message-ID: <87haa7nhtc.fsf@linaro.org>
References: <1386748497-11290-1-git-send-email-haojian.zhuang@gmail.com>
	<1386748497-11290-2-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386748497-11290-2-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Haojian Zhuang's message of "Wed, 11 Dec 2013 15:54:50 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> From: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Add board support with device tree for Hisilicon Hi3620 SoC platform.
>

This patch still has checkpatch problems:

ERROR: Use of const init definition must use __initconst
#166: FILE: arch/arm/mach-hi3xxx/hi3xxx.c:51:
+static const char *hi3xxx_compat[] __initdata = {

I know you're frustrated that it's taken a long time to get this stuff
merged, but these are the kinds of mistakes that make us have to take a
*very* close look at every detail, which greatly slows down the process.

I'll fix this up locally, but please be sure to run checkpatch on your
patches before submitting.

> Changelog:
> v11:
> 1. Add comments for iotable.
>
> v10:
> 1. Add .map_io() & debug_ll_io_init() back. Since debug_ll_io_init() is
> only called if .map_io() isn't assigned. Use .map_io() to setup static
> IO mapping that is used in clock driver.
>
> v3:
> 1. Remove .map_io() in DT machine descriptor. Since debug_ll_io_init()
> is called by default.
> 2. Remove .init_machine() in DT machine descriptor. Since
> of_platform_populate() is called by default in DT mode.
>
> v2:
> 1. Remove .init_irq() in DT machine descriptor. Since irqchip_init()
> is called by default in DT mode.

Also not a major deal, but typically the full changelog history goes
after the '---' since in most cases, it's not relevant to the permanent
git history.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
