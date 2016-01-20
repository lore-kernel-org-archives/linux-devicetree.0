From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 0/3] SoC: rockchip: support power domain for RK3368
Date: Wed, 20 Jan 2016 09:26:45 +0100
Message-ID: <3061119.C8moAIEzLL@phil>
References: <1452508600-3512-1-git-send-email-zhangqing@rock-chips.com> <569F6135.1070902@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569F6135.1070902-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Elaine,

Am Mittwoch, 20. Januar 2016, 02:28:05 schrieb zhangqing:
> On 01/11/2016 02:36 AM, zhangqing wrote:
> > add pd id in rk3368-power.h
> > modify pm_domains.c to support RK3368 SoC
> > add RK3368 document for Rockchip power domains
> > 
> > zhangqing (3):
> >    dt-bindings: add power-domain header for RK3368 SoCs
> >    soc: rockchip: power-domain: Modify power domain driver for rk3368
> >    dt-bindings: modify document of Rockchip power domains
> 
> Are there any other questions about the three patches.Please review.

actually the patches look fine. I just need to wait for 4.5-rc1 to be 
released (probably sunday) before I can apply them.


Heiko

> 
> >   .../bindings/soc/rockchip/power_domain.txt         | 21 ++++++++++++++
> >   drivers/soc/rockchip/pm_domains.c                  | 33
> >   ++++++++++++++++++++++ include/dt-bindings/power/rk3368-power.h      
> >       | 28 ++++++++++++++++++ 3 files changed, 82 insertions(+)
> >   create mode 100644 include/dt-bindings/power/rk3368-power.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
