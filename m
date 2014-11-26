From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: rockchip: add binding ID for DMC (memory controller) clocks on rk3288
Date: Wed, 26 Nov 2014 01:45:12 +0100
Message-ID: <1717801.sWHeWsmqUi@diego>
References: <1416960783-25119-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416960783-25119-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 25. November 2014, 16:13:02 schrieb Doug Anderson:
> From: Jeff Chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> The DMC clocks need to be turned off at runtime, so we should have IDs
> so we can export them.
> 
> Signed-off-by: Jeff Chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> [dianders: split into two patches; adjusted commit msg]
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

both patches look ok to me and I'll probably pick them up tomorrow.

Just as handling question, do you plan on sending dts changes using these 
clocks in time for 3.19 [i.e. in the next couple of days]?

We have currently three clock patches/series adding new clock ids [this one, 
the mmc phases and Sonny's i2s_clkout] and I'm trying to dertermine if I need 
a shared branch for those.

Currently it doesn't look like the others will provide dts patches using the 
clocks in time, so it looks like I can skip the shared branch and we can use 
the clock ids regularly after the merge-window. Some true for your clocks?


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
