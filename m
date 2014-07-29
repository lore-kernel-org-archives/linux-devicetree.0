From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: add rk3188 dma controllers
Date: Tue, 29 Jul 2014 23:55:08 +0400
Message-ID: <53D7FC1C.10607@cogentembedded.com>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de> <1406661128-7614-5-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406661128-7614-5-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 07/29/2014 11:12 PM, Heiko Stuebner wrote:

> Add both the cpu and peripheral pl330 dma controllers present in rk31=
88 socs.
> The first dma controller can change between secure and non-secure mod=
e and is
> left by the bootloader in secure mode, which gets added here.

> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/rk3xxx.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

> diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx=
=2Edtsi
> index c6f0561..a6c2860 100644
> --- a/arch/arm/boot/dts/rk3xxx.dtsi
> +++ b/arch/arm/boot/dts/rk3xxx.dtsi
> @@ -28,6 +28,33 @@
>   		i2c4 =3D &i2c4;
>   	};
>
> +	amba {
> +		compatible =3D "arm,amba-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		dmac1: dma@20018000 {

    The ePAPR standard [1] says:

The name of a node should be somewhat generic, reflecting the function =
of the=20
device and not its precise programming model. If appropriate, the name =
should=20
be one of the following choices:

[...]
    =95 dma-controller

> +			compatible =3D "arm,pl330", "arm,primecell";
> +			reg =3D <0x20018000 0x4000>;
> +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells =3D <1>;
> +			clocks =3D <&cru ACLK_DMA1>;
> +			clock-names =3D "apb_pclk";
> +		};
[...]

[1] http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.=
pdf

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
