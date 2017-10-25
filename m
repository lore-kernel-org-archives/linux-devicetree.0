From: Li Yang <leoyang.li-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: ls1021a: Add support for QSPI with
 ls1021a SoC
Date: Wed, 25 Oct 2017 16:00:36 -0500
Message-ID: <CADRPPNREzRzzW-VRpm6P3y8_sYwvm_c13n6vjgQZP24fxO9uKQ@mail.gmail.com>
References: <20170912064925.24571-1-sz.lin@moxa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170912064925.24571-1-sz.lin-D4fb9hXD9d4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>, Zhiqiang Hou <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, andy.tang-3arQi8VN3Tc@public.gmane.org, yi.sheng.lin-3arQi8VN3Tc@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 12, 2017 at 1:49 AM, SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org> wrote:
> Add QSPI node support, and this function is disabled by default
> This setting could be overwritten in board-level definitions

Adding Shawn Guo.

>
> Signed-off-by: SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org>

Acked-by: Li Yang <leoyang.li-3arQi8VN3Tc@public.gmane.org>

> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index 7bb9df2c1460..9da876e47810 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -154,6 +154,20 @@
>                         big-endian;
>                 };
>
> +               qspi: quadspi@1550000 {
> +                       compatible = "fsl,ls1021a-qspi";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0 0x1550000 0x0 0x10000>,
> +                             <0x0 0x40000000 0x0 0x40000000>;
> +                       reg-names = "QuadSPI", "QuadSPI-memory";
> +                       interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       clock-names = "qspi_en", "qspi";
> +                       clocks = <&clockgen 4 1>, <&clockgen 4 1>;
> +                       big-endian;
> +                       status = "disabled";
> +               };
> +
>                 esdhc: esdhc@1560000 {
>                         compatible = "fsl,esdhc";
>                         reg = <0x0 0x1560000 0x0 0x10000>;
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
