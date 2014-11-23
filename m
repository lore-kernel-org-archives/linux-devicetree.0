From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: meson: enable Ethernet controller
Date: Sun, 23 Nov 2014 20:02:57 +0100
Message-ID: <CAOQ7t2ZZn9J-b9Vw0rpq7GSSSXRPcpK8FA2nxj4S9U319cwm9w@mail.gmail.com>
References: <1416758928-12640-1-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416758928-12640-1-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 23, 2014 at 5:08 PM, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add a node for the Ethernet controller to Meson DTS file and
> enable it on the Geniatech ATV1200 board.
>
> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson.dtsi         | 11 +++++++++++
>  arch/arm/boot/dts/meson6-atv1200.dts |  4 ++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 03bcff8..4704b95 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -143,5 +143,16 @@
>                         #size-cells = <0>;
>                         status = "disabled";
>                 };
> +
> +               ethmac: ethernet@c9410000 {
> +                       compatible = "amlogic,meson6-dwmac", "snps,dwmac";
> +                       reg = <0xc9410000 0x10000
> +                              0xc1108108 0x4>;
> +                       interrupts = <0 8 1>;
> +                       interrupt-names = "macirq";
> +                       clocks = <&clk81>;
> +                       clock-names = "stmmaceth";
> +                       status = "disabled";
> +               };
>         };
>  }; /* end of / */
> diff --git a/arch/arm/boot/dts/meson6-atv1200.dts b/arch/arm/boot/dts/meson6-atv1200.dts
> index d7d351a..1237faa 100644
> --- a/arch/arm/boot/dts/meson6-atv1200.dts
> +++ b/arch/arm/boot/dts/meson6-atv1200.dts
> @@ -64,3 +64,7 @@
>  &uart_AO {
>         status = "okay";
>  };
> +
> +&ethmac {
> +       status = "okay";
> +};
> --
> 1.9.1
>

Tested-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

Thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
