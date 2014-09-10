From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH v10 1/3] RTC: RK808: add RTC driver for RK808
Date: Wed, 10 Sep 2014 13:44:11 -0700
Message-ID: <20140910134411.8128acce79f2423d4448e8f4@linux-foundation.org>
References: <1410311886-4579-1-git-send-email-zyw@rock-chips.com>
	<1410311886-4579-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410311886-4579-2-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 10 Sep 2014 09:18:04 +0800 Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:

> Adding RTC driver for supporting RTC device present inside RK808 PMIC.
> 
> ...
>
> +	ret = rtc_valid_tm(&tm);
> +	if (ret) {
> +		dev_warn(&pdev->dev, "invalid date/time and init time\n");
> +		rk808_rtc_set_time(&pdev->dev, &tm_def);
> +	}

This is somewhat unusual.  Most drivers will emit a warning and give up
when they find the time is wrong.  Why is this driver different and is
this desirable behaviour?


Also, I did this:

From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: rtc-rk808-add-rtc-driver-for-rk808-fix

make tm_def static

Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
---

 drivers/rtc/rtc-rk808.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff -puN drivers/rtc/Kconfig~rtc-rk808-add-rtc-driver-for-rk808-fix drivers/rtc/Kconfig
diff -puN drivers/rtc/Makefile~rtc-rk808-add-rtc-driver-for-rk808-fix drivers/rtc/Makefile
diff -puN drivers/rtc/rtc-rk808.c~rtc-rk808-add-rtc-driver-for-rk808-fix drivers/rtc/rtc-rk808.c
--- a/drivers/rtc/rtc-rk808.c~rtc-rk808-add-rtc-driver-for-rk808-fix
+++ a/drivers/rtc/rtc-rk808.c
@@ -326,14 +326,14 @@ static SIMPLE_DEV_PM_OPS(rk808_rtc_pm_op
 	rk808_rtc_suspend, rk808_rtc_resume);
 
 /* 2014.1.1 12:00:00 Saturday */
-struct rtc_time tm_def = {
-			.tm_wday = 6,
-			.tm_year = 114,
-			.tm_mon = 0,
-			.tm_mday = 1,
-			.tm_hour = 12,
-			.tm_min = 0,
-			.tm_sec = 0,
+static struct rtc_time tm_def = {
+	.tm_wday = 6,
+	.tm_year = 114,
+	.tm_mon = 0,
+	.tm_mday = 1,
+	.tm_hour = 12,
+	.tm_min = 0,
+	.tm_sec = 0,
 };
 
 static int rk808_rtc_probe(struct platform_device *pdev)
_


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
