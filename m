From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 05/11] ARM: dts: zynq: Add QSPI for Parallella
Date: Thu, 24 Jul 2014 16:18:29 -0700
Message-ID: <ddb38ce5-9e31-4c94-967c-7784c7fba75c@BN1BFFO11FD028.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-6-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406242820-20140-6-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
> Prepare SPI0 and SPI1 while at it.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v2: New
> =20
>  arch/arm/boot/dts/zynq-7000.dtsi      | 37 +++++++++++++++++++++++++=
++++++++++
>  arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index 8fd826a..eed3df0 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -122,6 +122,30 @@
>  			interrupts =3D <0 50 4>;
>  		};
> =20
> +		spi0: spi@e0006000 {
> +			compatible =3D "xlnx,zynq-spi-r1p6";
> +			reg =3D <0xe0006000 0x1000>;
> +			status =3D "disabled";
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 26 4>;
> +			clocks =3D <&clkc 25>, <&clkc 34>;
> +			clock-names =3D "ref_clk", "pclk";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		spi1: spi@e0007000 {
> +			compatible =3D "xlnx,zynq-spi-r1p6";
> +			reg =3D <0xe0007000 0x1000>;
> +			status =3D "disabled";
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 49 4>;
> +			clocks =3D <&clkc 26>, <&clkc 35>;
> +			clock-names =3D "ref_clk", "pclk";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
Until here things look good.

>  		gem0: ethernet@e000b000 {
>  			compatible =3D "cdns,gem";
>  			reg =3D <0xe000b000 0x4000>;
> @@ -140,6 +164,19 @@
>  			clock-names =3D "pclk", "hclk", "tx_clk";
>  		};
> =20
> +		qspi: qspi@e000d000 {
> +			compatible =3D "xlnx,zynq-spi-r1p6";
> +			reg =3D <0xe000d000 0x1000>;
> +			status =3D "disabled";
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 19 4>;
> +			clocks =3D <&clkc 10>, <&clkc 43>;
> +			clock-names =3D "ref_clk", "pclk";
> +			num-cs =3D <1>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
I'm not sure what the status of this driver is. I think QSPI is still
under review on the mailing lists and I don't think we should add this
yet.

	S=C3=B6ren

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
