From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx6qdl: add support for Ka-Ro TX6
 modules
Date: Fri, 13 Dec 2013 13:45:33 +0100
Message-ID: <20131213134533.51c84319@ipc1.ka-ro>
References: <1386854880-21805-1-git-send-email-LW@KARO-electronics.de>
	<1386854880-21805-5-git-send-email-LW@KARO-electronics.de>
	<20131213121308.GT18380@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131213121308.GT18380-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Shawn Guo wrote:
> Lothar,
>=20
> Please check the patch against those comments that I put on the TX53
> patches.  A couple of comments embedded below.
>=20
> On Thu, Dec 12, 2013 at 02:28:00PM +0100, Lothar Wa=C3=9Fmann wrote:
> ...
> > @@ -0,0 +1,350 @@
> > +/*
> > + * Copyright 2013 Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > + *
> > + * The code contained herein is licensed under the GNU General Pub=
lic
> > + * License. You may obtain a copy of the GNU General Public Licens=
e
> > + * Version 2 at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx6dl.dtsi"
> > +#include "imx6qdl-tx6.dtsi"
> > +
> > +/ {
> > +	model =3D "Ka-Ro electronics TX6DL Module";
> > +	compatible =3D "fsl,imx6dl-tx6dl", "fsl,imx6dl";
>=20
> karo,imx6dl-tx6dl
>=20
Of course...

> <snip>
>=20
> > +&iomuxc {
> > +	display {
> > +		pinctrl_disp0_1: disp0grp-1 {
> > +			fsl,pins =3D <
> > +				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
> > +				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
> > +				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
> > +				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
> > +				/* PAD DISP0_DAT0 is used for the Flexcan transceiver control =
*/
>=20
> So how will this pingrp be used, without DATA00?
>=20
The HW design of a baseboard for this module is somewhat unfortunate in
that it uses the LCD0 pin as Enable pin for the flexcan transceiver.
In this configuration the LCD will be missing the LSB.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
