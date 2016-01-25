From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sama5d4: cleanup - add blank lines between
 pinctrl nodes
Date: Mon, 25 Jan 2016 12:18:41 +0100
Message-ID: <20160125111841.GB4027@piout.net>
References: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
 <1453293337-16078-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453293337-16078-2-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 20/01/2016 at 13:35:35 +0100, Lothar Wa=DFmann wrote :

A commit message is mandatory even when small ;)

> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>

I'm not sure the added blank lines add any clarity to the fille but I
won't object. Maybe Nicolas as an opinion.

> ---
>  arch/arm/boot/dts/sama5d4.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index b8032bc..6c0dc89 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -1428,22 +1428,27 @@
>  						atmel,pins =3D
>  							<AT91_PIOE 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* conflicts =
with USBA_VBUS */
>  					};
> +
>  					pinctrl_adc0_ad0: adc0_ad0 {
>  						atmel,pins =3D
>  							<AT91_PIOC 27 AT91_PERIPH_A AT91_PINCTRL_NONE>;
>  					};
> +
>  					pinctrl_adc0_ad1: adc0_ad1 {
>  						atmel,pins =3D
>  							<AT91_PIOC 28 AT91_PERIPH_A AT91_PINCTRL_NONE>;
>  					};
> +
>  					pinctrl_adc0_ad2: adc0_ad2 {
>  						atmel,pins =3D
>  							<AT91_PIOC 29 AT91_PERIPH_A AT91_PINCTRL_NONE>;
>  					};
> +
>  					pinctrl_adc0_ad3: adc0_ad3 {
>  						atmel,pins =3D
>  							<AT91_PIOC 30 AT91_PERIPH_A AT91_PINCTRL_NONE>;
>  					};
> +
>  					pinctrl_adc0_ad4: adc0_ad4 {
>  						atmel,pins =3D
>  							<AT91_PIOC 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;
> @@ -1497,11 +1502,13 @@
>  							 AT91_PIOB  3 AT91_PERIPH_C AT91_PINCTRL_NONE	/* ISI_VSYNC */
>  							 AT91_PIOB  4 AT91_PERIPH_C AT91_PINCTRL_NONE>;	/* ISI_HSYNC =
*/
>  					};
> +
>  					pinctrl_isi_data_8_9: isi-0-data-8-9 {
>  						atmel,pins =3D
>  							<AT91_PIOC 0 AT91_PERIPH_C AT91_PINCTRL_NONE	/* ISI_D8, confl=
icts with SPI0_MISO, PWMH2 */
>  							 AT91_PIOC 1 AT91_PERIPH_C AT91_PINCTRL_NONE>;	/* ISI_D9, con=
flicts with SPI0_MOSI, PWML2 */
>  					};
> +
>  					pinctrl_isi_data_10_11: isi-0-data-10-11 {
>  						atmel,pins =3D
>  							<AT91_PIOC 2 AT91_PERIPH_C AT91_PINCTRL_NONE	/* ISI_D10, conf=
licts with SPI0_SPCK, PWMH3 */
> @@ -1517,9 +1524,11 @@
>  							 AT91_PIOA 29 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDDEN */
>  							 AT91_PIOA 28 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* LCDPCK */
>  					};
> +
>  					pinctrl_lcd_pwm: lcd-pwm-0 {
>  						atmel,pins =3D <AT91_PIOA 24 AT91_PERIPH_A AT91_PINCTRL_NONE>;=
	/* LCDPWM */
>  					};
> +
>  					pinctrl_lcd_rgb444: lcd-rgb-0 {
>  						atmel,pins =3D
>  							<AT91_PIOA 0 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD0 pin */
> @@ -1535,6 +1544,7 @@
>  							 AT91_PIOA 10 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD10 pin *=
/
>  							 AT91_PIOA 11 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* LCDD11 pin=
 */
>  					};
> +
>  					pinctrl_lcd_rgb565: lcd-rgb-1 {
>  						atmel,pins =3D
>  							<AT91_PIOA 0 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD0 pin */
> @@ -1554,6 +1564,7 @@
>  							 AT91_PIOA 14 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD14 pin *=
/
>  							 AT91_PIOA 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* LCDD15 pin=
 */
>  					};
> +
>  					pinctrl_lcd_rgb666: lcd-rgb-2 {
>  						atmel,pins =3D
>  							<AT91_PIOA 2 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD2 pin */
> @@ -1575,6 +1586,7 @@
>  							 AT91_PIOA 22 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD22 pin *=
/
>  							 AT91_PIOA 23 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* LCDD23 pin=
 */
>  					};
> +
>  					pinctrl_lcd_rgb777: lcd-rgb-3 {
>  						atmel,pins =3D
>  							 /* LCDDAT0 conflicts with TMS */
> @@ -1602,6 +1614,7 @@
>  							 AT91_PIOA 22 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD22 pin *=
/
>  							 AT91_PIOA 23 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* LCDD23 pin=
 */
>  					};
> +
>  					pinctrl_lcd_rgb888: lcd-rgb-4 {
>  						atmel,pins =3D
>  							<AT91_PIOA 0 AT91_PERIPH_A AT91_PINCTRL_NONE	/* LCDD0 pin */
> --=20
> 2.1.4
>=20

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
