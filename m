From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: sun4i: dt: Enable dram gate 5 (tve0 clock) for
 simplefb TV output
Date: Fri, 25 Mar 2016 11:03:49 +0800
Message-ID: <CAGb2v64sOvNn0Cwv+y7jKyMhyXmPYkwL9COQqhxAuDE6DLnRhQ@mail.gmail.com>
References: <1458842920-30854-1-git-send-email-Priit.Laes@icefire.ee> <1458842920-30854-2-git-send-email-Priit.Laes@icefire.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458842920-30854-2-git-send-email-Priit.Laes-FvMSrs6xSY+ptlylMvRsHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priit Laes <Priit.Laes-FvMSrs6xSY+ptlylMvRsHA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 25, 2016 at 2:08 AM, Priit Laes <Priit.Laes-FvMSrs6xSY+ptlylMvRsHA@public.gmane.org> wrote:
> From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
>
> Seems like dram_gate 5 was forgotten when DRAM gate driver was added.
>
> Enable it.
>
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>

Fixes: 82f8582feef4 ("ARM: dts: sun4i: Add DRAM gates")

Thanks!

> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
> index 2c8f5e6..bf70d0a 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -96,7 +96,7 @@
>                         allwinner,pipeline = "de_fe0-de_be0-lcd0-tve0";
>                         clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
>                                  <&ahb_gates 44>, <&ahb_gates 46>,
> -                                <&dram_gates 25>, <&dram_gates 26>;
> +                                <&dram_gates 5>, <&dram_gates 25>, <&dram_gates 26>;
>                         status = "disabled";
>                 };
>         };
> --
> 2.5.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
