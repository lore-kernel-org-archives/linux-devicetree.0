From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v10 2/7] ARM: hi3xxx: add board support with device tree
Date: Tue, 15 Oct 2013 15:00:36 +0200
Message-ID: <201310151500.36959.arnd@arndb.de>
References: <1381828577-27998-1-git-send-email-haojian.zhuang@linaro.org> <1381828577-27998-3-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381828577-27998-3-git-send-email-haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, shaojie.sun-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 15 October 2013, Haojian Zhuang wrote:
> 
> Add board support with device tree for Hisilicon Hi3620 SoC platform.
> 
> Changelog:
> v10:
> 1. Add .map_io() & debug_ll_io_init() back. Since debug_ll_io_init() is
> only called if .map_io() isn't assigned. Use .map_io() to setup static
> IO mapping that is used in clock driver.
> 

This seems like a step in the wrong direction. Why would you want to use
a static I/O mapping in the clock driver?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
