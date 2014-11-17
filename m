From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] clk: rockchip: add bindings for the mmc clock phases
Date: Mon, 17 Nov 2014 11:39:02 -0800
Message-ID: <20141117193902.25314.97687@quantum>
References: <1416009604-31545-1-git-send-email-amstan@chromium.org>
 <1416009604-31545-2-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416009604-31545-2-git-send-email-amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, addy ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Alexandru M Stan (2014-11-14 16:00:03)
> This will be used in a later patch for clock phase tuning.
> 
> Suggested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2: None
> 
>  include/dt-bindings/clock/rk3288-cru.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
> index 100a08c..465d0f6 100644
> --- a/include/dt-bindings/clock/rk3288-cru.h
> +++ b/include/dt-bindings/clock/rk3288-cru.h
> @@ -72,6 +72,16 @@
>  #define SCLK_HEVC_CABAC                111
>  #define SCLK_HEVC_CORE         112
>  
> +#define SCLK_SDMMC_DRV_PHASE   113
> +#define SCLK_SDIO0_DRV_PHASE   114
> +#define SCLK_SDIO1_DRV_PHASE   115
> +#define SCLK_EMMC_DRV_PHASE    116
> +
> +#define SCLK_SDMMC_SAMPLE_PHASE        117
> +#define SCLK_SDIO0_SAMPLE_PHASE        118
> +#define SCLK_SDIO1_SAMPLE_PHASE        119
> +#define SCLK_EMMC_SAMPLE_PHASE 120

It looks like you are adding new clocks to handle the phase requirement.
Is that the right thing to do? Don't these clks already exist (e.g.
SCLK_SDMMC)?

Regards,
Mike

> +
>  #define DCLK_VOP0              190
>  #define DCLK_VOP1              191
>  
> -- 
> 2.1.0.rc2.206.gedb03e5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
