From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] CHROMIUM: clk: rockchip: add clock IDs for the PVTM clocks
Date: Sun, 21 Dec 2014 15:14:53 +0100
Message-ID: <2752828.P8uvZNT2Jv@phil>
References: <1418948026-3463-1-git-send-email-dtor@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418948026-3463-1-git-send-email-dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dmitry,

This looks ok and also like it's meant to go upstream, because it still has 
the CHROMIUM-prefix?

No need to resend, I remove them myself, just want to make sure here :-)


Heiko

Am Donnerstag, 18. Dezember 2014, 16:13:45 schrieb Dmitry Torokhov:
> From: Huang Lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Process-Voltage-Temperature Monitor has two clocks, PVTM_CORE and
> PVTM_GPU.
> 
> Signed-off-by: Huang Lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> 
> Note that I left a hole at 122 for SCLK_USBPHY480M_SRC which is floating
> around.
> 
>  include/dt-bindings/clock/rk3288-cru.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/rk3288-cru.h
> b/include/dt-bindings/clock/rk3288-cru.h index f60ce72..ba4c194 100644
> --- a/include/dt-bindings/clock/rk3288-cru.h
> +++ b/include/dt-bindings/clock/rk3288-cru.h
> @@ -81,6 +81,9 @@
>  #define SCLK_SDIO1_SAMPLE	120
>  #define SCLK_EMMC_SAMPLE	121
> 
> +#define SCLK_PVTM_CORE		123
> +#define SCLK_PVTM_GPU		124
> +
>  #define DCLK_VOP0		190
>  #define DCLK_VOP1		191

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
