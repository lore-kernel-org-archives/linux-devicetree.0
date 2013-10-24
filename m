From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv5][ 7/9] ARM: dts: i.MX25: Add ssi clocks and DMA events.
Date: Thu, 24 Oct 2013 14:44:54 +0800
Message-ID: <20131024064450.GD11466@S2101-09.ap.freescale.net>
References: <1382516974-13371-1-git-send-email-denis@eukrea.com>
 <1382516974-13371-7-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382516974-13371-7-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 10:29:32AM +0200, Denis Carikli wrote:
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>

Applied patches #7, #8 and #9.

Shawn

> ---
>  arch/arm/boot/dts/imx25.dtsi |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.d=
tsi
> index 6ac4c98..cce0669 100644
> --- a/arch/arm/boot/dts/imx25.dtsi
> +++ b/arch/arm/boot/dts/imx25.dtsi
> @@ -339,6 +339,11 @@
>  				compatible =3D "fsl,imx25-ssi", "fsl,imx21-ssi";
>  				reg =3D <0x50014000 0x4000>;
>  				interrupts =3D <11>;
> +				clocks =3D <&clks 118>;
> +				clock-names =3D "ipg";
> +				dmas =3D <&sdma 24 1 0>,
> +				       <&sdma 25 1 0>;
> +				dma-names =3D "rx", "tx";
>  				status =3D "disabled";
>  			};
> =20
> @@ -369,6 +374,11 @@
>  				compatible =3D "fsl,imx25-ssi", "fsl,imx21-ssi";
>  				reg =3D <0x50034000 0x4000>;
>  				interrupts =3D <12>;
> +				clocks =3D <&clks 117>;
> +				clock-names =3D "ipg";
> +				dmas =3D <&sdma 28 1 0>,
> +				       <&sdma 29 1 0>;
> +				dma-names =3D "rx", "tx";
>  				status =3D "disabled";
>  			};
> =20
> @@ -539,7 +549,7 @@
>  				#interrupt-cells =3D <2>;
>  			};
> =20
> -			sdma@53fd4000 {
> +			sdma: sdma@53fd4000 {
>  				compatible =3D "fsl,imx25-sdma", "fsl,imx35-sdma";
>  				reg =3D <0x53fd4000 0x4000>;
>  				clocks =3D <&clks 112>, <&clks 68>;
> --=20
> 1.7.9.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
