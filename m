From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: imx6sl: add keypad support for i.mx6sl-evk
 board.
Date: Tue, 14 Jan 2014 17:34:22 +0800
Message-ID: <20140114093422.GA29934@ubuntu>
References: <1389691411-25231-1-git-send-email-b20788@freescale.com>
 <1389691663.16566847@f126.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389691663.16566847-LtwSKx4KOc1sdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 14, 2014 at 01:27:43PM +0400, Alexander Shiyan wrote:
> =D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA, 14 =D1=8F=D0=BD=D0=B2=D0=B0=
=D1=80=D1=8F 2014, 17:23 +08:00 =D0=BE=D1=82 Anson Huang <b20788@freesc=
ale.com>:
> > i.MX6SL EVK board has a 3*3 keypad matrix to support 8 keypads,
> > enable them, the keymap is as below:
> >=20
> > SW6:  MATRIX_KEY(0x0, 0x0, 0x67)  /* ROW0, COL0, KEY_UP */
> > SW7:  MATRIX_KEY(0x0, 0x1, 0x6c)  /* ROW0, COL1, KEY_DOWN */
> > SW8:  MATRIX_KEY(0x0, 0x2, 0x1c)  /* ROW0, COL2, KEY_ENTER */
> > SW9:  MATRIX_KEY(0x1, 0x0, 0x66)  /* ROW1, COL0, KEY_HOME */
> > SW10: MATRIX_KEY(0x1, 0x1, 0x6a)  /* ROW1, COL1, KEY_RIGHT */
> > SW11: MATRIX_KEY(0x1, 0x2, 0x69)  /* ROW1, COL2, KEY_LEFT */
> > SW12: MATRIX_KEY(0x2, 0x0, 0x72)  /* ROW2, COL0, KEY_VOLUMEDOWN */
> > SW13: MATRIX_KEY(0x2, 0x1, 0x73)  /* ROW2, COL1, KEY_VOLUMEUP */
> >=20
> > Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6sl-evk.dts |   28 ++++++++++++++++++++++++++=
++
> >  arch/arm/boot/dts/imx6sl.dtsi    |    2 ++
> >  2 files changed, 30 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/i=
mx6sl-evk.dts
> > index f5e4513..a2a0399 100644
> > --- a/arch/arm/boot/dts/imx6sl-evk.dts
> > +++ b/arch/arm/boot/dts/imx6sl-evk.dts
> > @@ -8,6 +8,7 @@
> > =20
> >  /dts-v1/;
> > =20
> > +#include <dt-bindings/input/input.h>
> >  #include "imx6sl.dtsi"
> > =20
> >  / {
> > @@ -93,6 +94,17 @@
> >  			fsl,pins =3D <MX6SL_FEC_PINGRP1>;
> >  		};
> > =20
> > +		pinctrl_kpp: kppgrp {
> > +			fsl,pins =3D <
> > +				MX6SL_PAD_KEY_ROW0__KEY_ROW0    0x1b010
> > +				MX6SL_PAD_KEY_ROW1__KEY_ROW1    0x1b010
> > +				MX6SL_PAD_KEY_ROW2__KEY_ROW2    0x1b0b0
> > +				MX6SL_PAD_KEY_COL0__KEY_COL0    0x110b0
> > +				MX6SL_PAD_KEY_COL1__KEY_COL1    0x110b0
> > +				MX6SL_PAD_KEY_COL2__KEY_COL2    0x110b0
> > +			>;
> > +		};
> > +
> >  		pinctrl_uart1: uart1grp {
> >  			fsl,pins =3D <MX6SL_UART1_PINGRP1>;
> >  		};
> > @@ -139,6 +151,22 @@
> >  	};
> >  };
> > =20
> > +&kpp {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_kpp>;
> > +	linux,keymap =3D <
> > +			MATRIX_KEY(0x0, 0x0, 0x67)  /* ROW0, COL0, KEY_UP */
> > +			MATRIX_KEY(0x0, 0x1, 0x6c)  /* ROW0, COL1, KEY_DOWN */
> > +			MATRIX_KEY(0x0, 0x2, 0x1c)  /* ROW0, COL2, KEY_ENTER */
> > +			MATRIX_KEY(0x1, 0x0, 0x66)  /* ROW1, COL0, KEY_HOME */
> > +			MATRIX_KEY(0x1, 0x1, 0x6a)  /* ROW1, COL1, KEY_RIGHT */
> > +			MATRIX_KEY(0x1, 0x2, 0x69)  /* ROW1, COL2, KEY_LEFT */
> > +			MATRIX_KEY(0x2, 0x0, 0x72)  /* ROW2, COL0, KEY_VOLUMEDOWN */
> > +			MATRIX_KEY(0x2, 0x1, 0x73)  /* ROW2, COL1, KEY_VOLUMEUP */
> > +	>;
>=20
> So why you want to use hexadecimal values instead definitions for
> keys from dt-bindings/input/input.h ?

Sorry, I forget this after I send out the V2 patch, please check my V3 =
patch, sorry
for your time.

Anson.

>=20
> ---

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
