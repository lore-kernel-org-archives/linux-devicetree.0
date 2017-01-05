From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 0/3] soc: rockchip: power-domain: support RK3328 SoC
Date: Thu, 05 Jan 2017 15:07:20 +0100
Message-ID: <4525049.9DCCQ7XhES@phil>
References: <1482464872-12954-1-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482464872-12954-1-git-send-email-zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: xf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 23. Dezember 2016, 11:47:49 CET schrieb Elaine Zhang:
> Elaine Zhang (3):
>   dt/bindings: power: add RK3328 SoCs header for idle-request
>   dt-bindings: add binding for rk3328 power domains
>   soc: rockchip: power-domain: Modify power domain driver for rk3328
> 
>  .../bindings/soc/rockchip/power_domain.txt         |  3 ++
>  drivers/soc/rockchip/pm_domains.c                  | 63
> +++++++++++++++++++--- include/dt-bindings/power/rk3328-power.h           |
> 18 +++++++
>  3 files changed, 78 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/power/rk3328-power.h

I've split patch 3 into two parts (hiword support and rk3328 addition) and 
applied all for 4.11


Thanks
Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
