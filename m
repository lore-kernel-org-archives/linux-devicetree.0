From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: rockchip: add bindings for the mmc clock phases
Date: Tue, 18 Nov 2014 09:44:22 -0800
Message-ID: <CAD=FV=XL7hht32hu5zxXAJ+8BKbQp7aQOP68cCjKtrytGGs8iA@mail.gmail.com>
References: <1416005574-7756-1-git-send-email-amstan@chromium.org>
	<1416005574-7756-2-git-send-email-amstan@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416005574-7756-2-git-send-email-amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, addy ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Nov 14, 2014 at 2:52 PM, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This will be used in a later patch for clock phase tuning.
>
> Suggested-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Signed-off-by: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
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
> +

Thinking about Mike T's comment, we might want to actually rename
these defines and just remove the "_PHASE".  These clocks _are_ the
drive and sample clocks.  Sure, they happen to have phases as one of
the attributes, but they aren't "phase clocks".

FYI, the TRM shows these clocks as:

- Into "clkgen" you see cclkin (the *2 clock)
- Out of "clkgen" you see:
  --> "cclk_in" (the non *2 clock)
  --> "cclk_in_drv" (the drive clock, which might be shifted)
  --> "cclk_in_sample" (the sample clock, which might be shifted)

Right now we're not modeling the non-shifted, non *2 clock.  I think
that's OK (otherwise we've got a bunch of old device trees to change,
since the old DTS files passed in the *2 clock as the card clock).


-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
