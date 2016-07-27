From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: add the saradc for rk3399
Date: Tue, 26 Jul 2016 21:07:59 -0700
Message-ID: <CAD=FV=W=rNP2h_8Z1TGK0A_KEhL19TKtWz-u0-_ZGH8jF5Zn9Q@mail.gmail.com>
References: <1469535195-5227-1-git-send-email-wxt@rock-chips.com> <1469535195-5227-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469535195-5227-2-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,


On Tue, Jul 26, 2016 at 5:13 AM, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> This patch adds saradc needed information on rk3399 SoCs.
>
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 4c84229..b81f84b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -299,6 +299,18 @@
>                 };
>         };
>
> +       saradc: saradc@ff100000 {
> +               compatible = "rockchip,rk3399-saradc";
> +               reg = <0x0 0xff100000 0x0 0x100>;
> +               interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +               #io-channel-cells = <1>;
> +               clocks = <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
> +               clock-names = "saradc", "apb_pclk";
> +               resets = <&cru SRST_P_SARADC>;
> +               reset-names = "saradc-apb";
> +               status = "disabled";
> +       };
> +

Seems reasonable to me.  I'll let Heiko comment if he cares about the
sort ordering.  I can never quite figure out what it should be so I've
sorta given up on it...  ;)

Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

-Doug
