From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: rk3399: rock960: Add missing
 GPIO for vcc5v0_host
Date: Mon, 11 Mar 2019 23:40:57 +0530
Message-ID: <CAMty3ZCS8G+dT4bHihovrug-2CCncA+BMg=Q2YYcsyjonSQPiQ@mail.gmail.com>
References: <20190311150332.19492-1-jagan@amarulasolutions.com> <20190311150332.19492-3-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311150332.19492-3-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula@amarulasolutions.com, Akash Gajjar <akash@openedev.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 8:33 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> vcc5v0_host on rock960 is bound to have GPIO4_PD1.
>
> Add support for it.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Akash Gajjar <akash@openedev.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> index 68ca3bf9ea2f..c3d3343d6dde 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> @@ -68,6 +68,7 @@
>         vcc5v0_host: vcc5v0-host-regulator {
>                 compatible = "regulator-fixed";
>                 enable-active-high;
> +               gpio = <&gpio4 RK_PD1 GPIO_ACTIVE_HIGH>;

This is already present in dts file, sorry for the noise. please ignore.
