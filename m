From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: rockchip: add I2S internal clock IDs for rk3288
Date: Wed, 07 Sep 2016 19:58:31 +0200
Message-ID: <2003903.QOgKKA6m1b@phil>
References: <20160907165330.14607-1-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160907165330.14607-1-john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi John,

Am Mittwoch, 7. September 2016, 17:53:29 CEST schrieb John Keeping:
> To minimize jitter on the I2S clocks, it is important that the
> denominator in the fractional divider is much greater than the
> numerator.  Add identifiers for these internal clocks so that the
> specific clock topology and rates can be specified in the device tree.

The TRM states that the denominator must be bigger than 20. Is this the one 
you found or did you find further constraints?

Did you try teaching the fractional divider to handle these constraints before 
going this way?

Exporting the internal clocks really would be sort of plan d or e, after 
handling this in the clock framework failed. Especially as i2s rates are 
probably dependant on the media being handled (frequencies and such), so 
setting fractional rates statically in the dts won't help you much in the 
general case, as any new playback could trigger a clk_set_rate call anyway?


Heiko

> Signed-off-by: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
> ---
>  include/dt-bindings/clock/rk3288-cru.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/rk3288-cru.h
> b/include/dt-bindings/clock/rk3288-cru.h index 9a586e2d9c91..9526653383d9
> 100644
> --- a/include/dt-bindings/clock/rk3288-cru.h
> +++ b/include/dt-bindings/clock/rk3288-cru.h
> @@ -88,6 +88,9 @@
>  #define SCLK_PVTM_GPU		124
>  #define SCLK_CRYPTO		125
>  #define SCLK_MIPIDSI_24M	126
> +#define SCLK_I2S_PRE		127
> +#define SCLK_I2S_SRC		128
> +#define SCLK_I2S_FRAC		129
> 
>  #define SCLK_MAC		151
>  #define SCLK_MACREF_OUT		152


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
