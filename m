From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 4/4] ARM: dts: imx5: add gpu nodes
Date: Mon, 3 Dec 2018 20:16:07 -0200
Message-ID: <CAOMZO5B18DyZ0zvit6AgaueMifnMf2ctSo7pE_XndRpt7+bnLw@mail.gmail.com>
References: <20181203211816.5129-1-jonathan@marek.ca> <20181203211816.5129-4-jonathan@marek.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203211816.5129-4-jonathan@marek.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: jonathan@marek.ca
Cc: freedreno@lists.freedesktop.org, Chris Healy <Chris.Healy@zii.aero>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

Thanks for working on this. Really nice to see GPU support for mx51/mx53!

On Mon, Dec 3, 2018 at 7:21 PM Jonathan Marek <jonathan@marek.ca> wrote:

Please add a commit log.

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

> ---
>  arch/arm/boot/dts/imx51.dtsi | 17 +++++++++++++++++
>  arch/arm/boot/dts/imx53.dtsi | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
> index 67d462715..e9a7bbce9 100644
> --- a/arch/arm/boot/dts/imx51.dtsi
> +++ b/arch/arm/boot/dts/imx51.dtsi
> @@ -628,5 +628,22 @@
>                                 clock-names = "ipg", "ahb";
>                         };
>                 };
> +
> +               gpu: gpu@30000000 {

We put the peripheral nodes in address order, so this one should go
prior to the IPU node.

> +                       compatible = "amd,imageon-200.1", "amd,imageon";

I can't find the dt-bindings for these compatible entries. Have you
documented them?

> +                       reg = <0x30000000 0x20000>;
> +                       reg-names = "kgsl_3d0_reg_memory";
> +                       interrupts = <12>;
> +                       interrupt-names = "kgsl_3d0_irq";
> +                       clocks = <&clks IMX5_CLK_GPU3D_GATE>, <&clks IMX5_CLK_GARB_GATE>;
> +                       clock-names = "core_clk", "mem_iface_clk";
> +
> +                       qcom,gpu-pwrlevels {
> +                               compatible = "qcom,gpu-pwrlevels";
> +                               qcom,gpu-pwrlevel@0 {

You could drop this @0
