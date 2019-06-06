From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: Configure BT_HOST_WAKE as wake-up
 signal on veyron
Date: Thu, 6 Jun 2019 16:32:41 -0700
Message-ID: <CAD=FV=VnjRPokOp+DH5H04Ej=TSxKDeDWhbbJt46b6cVFnOosQ@mail.gmail.com>
References: <20190605204320.22343-1-mka@chromium.org> <20190605204320.22343-2-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605204320.22343-2-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jun 5, 2019 at 1:43 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> This enables wake up on Bluetooth activity when the device is
> suspended. The BT_HOST_WAKE signal is only connected on devices
> with BT module that are connected through UART.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm/boot/dts/rk3288-veyron.dtsi | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
> index cc4c3595f145..145cac7c0847 100644
> --- a/arch/arm/boot/dts/rk3288-veyron.dtsi
> +++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
> @@ -23,6 +23,31 @@
>                 reg = <0x0 0x0 0x0 0x80000000>;
>         };
>
> +       bt_activity: bt-activity {
> +               compatible = "gpio-keys";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&bt_host_wake>;
> +
> +               /*
> +                * HACK: until we have an LPM driver, we'll use an
> +                * ugly GPIO key to allow Bluetooth to wake from S3.
> +                * This is expected to only be used by BT modules that
> +                * use UART for comms.  For BT modules that talk over
> +                * SDIO we should use a wakeup mechanism related to SDIO.
> +                *
> +                * Use KEY_RESERVED here since that will work as a wakeup but
> +                * doesn't get reported to higher levels (so doesn't confuse
> +                * Chrome).
> +                */
> +               bt-wake {
> +                       label = "BT Wakeup";
> +                       gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
> +                       linux,code = <KEY_RESERVED>;
> +                       wakeup-source;
> +               };
> +
> +       };
> +
>         power_button: power-button {
>                 compatible = "gpio-keys";
>                 pinctrl-names = "default";
> @@ -555,6 +580,10 @@
>                         rockchip,pins = <4 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
>                 };
>
> +               bt_host_wake: bt-host-wake {
> +                       rockchip,pins = <4 31 RK_FUNC_GPIO &pcfg_pull_down>;

nit: s/31/RK_PD7

Other than that, feel free to add my Reviewed-by assuming that this
isn't too hacky for mainline to accept while we wait for someone to
come up with a better solution.

-Doug
