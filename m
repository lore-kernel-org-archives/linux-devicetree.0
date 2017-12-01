From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 01/10] arm64: dts: rockchip: Enable edp disaplay on kevin
Date: Fri, 1 Dec 2017 13:28:06 +0100
Message-ID: <CAFqH_52_Wkm5uY35Y+Ngh8+uVP03nDYaMgNq1rn2EDkNuaiXHg@mail.gmail.com>
References: <20171019034812.13768-1-jeffy.chen@rock-chips.com> <20171019034812.13768-2-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171019034812.13768-2-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

2017-10-19 5:48 GMT+02:00 Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>:
> Add edp panel and enable related nodes on kevin.
>
> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v6: None
> Changes in v5: None
>
>  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 29 +++++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi      | 16 +++++++++++++
>  2 files changed, 45 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> index a3d3cea7dc4f..bc67b19f0af5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> @@ -93,6 +93,18 @@
>                 pwm-delay-us = <10000>;
>         };
>
> +       edp_panel: edp-panel {
> +               compatible = "sharp,lq123p1jx31", "simple-panel";
> +               backlight = <&backlight>;
> +               power-supply = <&pp3300_disp>;
> +
> +               ports {
> +                       panel_in_edp: endpoint {
> +                               remote-endpoint = <&edp_out_panel>;
> +                       };
> +               };
> +       };
> +
>         thermistor_ppvar_bigcpu: thermistor-ppvar-bigcpu {
>                 compatible = "murata,ncp15wb473";
>                 pullup-uv = <1800000>;
> @@ -264,6 +276,23 @@ ap_i2c_dig: &i2c2 {
>         };
>  };
>
> +&edp {
> +       status = "okay";
> +
> +       ports {
> +               edp_out: port@1 {
> +                       reg = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       edp_out_panel: endpoint@0 {
> +                               reg = <0>;
> +                               remote-endpoint = <&panel_in_edp>;
> +                       };
> +               };
> +       };
> +};
> +
>  &ppvar_bigcpu_pwm {
>         regulator-min-microvolt = <798674>;
>         regulator-max-microvolt = <1302172>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> index 5772c52fbfd3..470105d651c2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
> @@ -927,6 +927,22 @@ ap_i2c_audio: &i2c8 {
>         dr_mode = "host";
>  };
>
> +&vopb {
> +       status = "okay";
> +};
> +
> +&vopb_mmu {
> +       status = "okay";
> +};
> +
> +&vopl {
> +       status = "okay";
> +};
> +
> +&vopl_mmu {
> +       status = "okay";
> +};
> +
>  #include <arm/cros-ec-keyboard.dtsi>
>  #include <arm/cros-ec-sbs.dtsi>
>
> --
> 2.11.0
>
>

I just tested this patch on top of current mainline (4.15-rc1+) and works so,

Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
