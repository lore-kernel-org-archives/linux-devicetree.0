From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v10 3/3] regulator: RK808: Remove pdata from the regulator
Date: Tue, 9 Sep 2014 19:49:11 -0700
Message-ID: <CAD=FV=Xht=nBBffu==py5CDhTjGKgtzNJWuz=X7=Eb0j1W7jog@mail.gmail.com>
References: <1410311886-4579-1-git-send-email-zyw@rock-chips.com>
	<1410311886-4579-4-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410311886-4579-4-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao@ch>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Sep 9, 2014 at 6:18 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> Tested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>
> Changes in v10: None

Despite the "None" above, I see that there are indeed changes between
v9 and v10:

diff --git a/drivers/regulator/rk808-regulator.c
b/drivers/regulator/rk808-regulator.c
index 0d5afc4..d91f2b6 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -3,8 +3,8 @@
  *
  * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
  *
- * Author: Chris Zhong<zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
- * Author: Zhang Qing<zhanqging-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
+ * Author: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
+ * Author: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -348,6 +348,6 @@ module_platform_driver(rk808_regulator_driver);

 MODULE_DESCRIPTION("regulator driver for the rk808 series PMICs");
 MODULE_AUTHOR("Chris Zhong<zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
-MODULE_AUTHOR("Zhang Qing<zhanqging-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
+MODULE_AUTHOR("Zhang Qing<zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:rk808-regulator");

That looks like the change requested by Dmitry for v9 (don't remove
the space) plus a typo fix (flipping g/q).  Interestingly enough the
typo fix shows that "MODULE_AUTHOR" should probably also have had a
space before the "<".


Mark: I think you could just take this (possibly fixing the
MODULE_AUTHOR yourself) to fix the linux-next breakage.  You can also
add:

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
