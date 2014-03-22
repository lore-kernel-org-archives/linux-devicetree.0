From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: tx53: Add IPU DI ports and endpoints
Date: Sat, 22 Mar 2014 14:50:40 +0800
Message-ID: <20140322065038.GE5938@dragon>
References: <1395235721-13847-1-git-send-email-LW@KARO-electronics.de>
 <1395235721-13847-5-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395235721-13847-5-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 19, 2014 at 02:28:41PM +0100, Lothar Wa=DFmann wrote:
>=20
> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx53-tx53-x03x.dts |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/imx53-tx53-x03x.dts b/arch/arm/boot/dt=
s/imx53-tx53-x03x.dts
> index 0217dde3..43b4b7b 100644
> --- a/arch/arm/boot/dts/imx53-tx53-x03x.dts
> +++ b/arch/arm/boot/dts/imx53-tx53-x03x.dts
> @@ -25,12 +25,17 @@
>  	soc {
>  		display: display@di0 {
>  			compatible =3D "fsl,imx-parallel-display";
> -			crtcs =3D <&ipu 0>;
>  			interface-pix-fmt =3D "rgb24";
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pinctrl_rgb24_vga1>;
>  			status =3D "okay";
> =20
> +			port {
> +				display0_in: endpoint {
> +					remote-endpoint =3D <&ipu_di0_disp0>;
> +				};
> +			};
> +

I shouldn't apply this until I rebase my branch on 3.15-rc1 where
Philipp's OF graph is to be seen, right?

Shawn

>  			display-timings {
>  				VGA {
>  					clock-frequency =3D <25200000>;
> --=20
> 1.7.10.4
>=20
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
