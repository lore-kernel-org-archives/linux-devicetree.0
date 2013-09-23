From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: dts: tx28: restructure and update DTS file
Date: Mon, 23 Sep 2013 11:37:53 +0200
Message-ID: <21056.3057.588078.866996@ipc1.ka-ro>
References: <1379573990-27556-1-git-send-email-LW@KARO-electronics.de>
	<1379573990-27556-5-git-send-email-LW@KARO-electronics.de>
	<20130922064124.GB31787@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130922064124.GB31787-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Shawn Guo writes:
> On Thu, Sep 19, 2013 at 08:59:50AM +0200, Lothar Wa=C3=9Fmann wrote:
> > Update the Ka-Ro TX28 DTS file.
> >=20
> > - add Copyright header
> > - use label references for better readability
> > - sort the entries alphabetically
> > - add some aliases used by U-Boot to modify the DT data
> >=20
> > This patch requires the patch "ARM: dts: mxs: add pinctrl header fi=
les"
> > to be applied.
>=20
> The dependency of applying should generally go below '---', so that i=
t
> does not appear in the final commit log.
>=20
OK.

> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx28-tx28.dts |  720 ++++++++++++++++++++++++++=
+++++++-----
> >  1 files changed, 637 insertions(+), 83 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/i=
mx28-tx28.dts
> > index 37be532..b7c79fb 100644
> > --- a/arch/arm/boot/dts/imx28-tx28.dts
> > +++ b/arch/arm/boot/dts/imx28-tx28.dts
> > @@ -1,106 +1,139 @@
> > +/*
> > + * Copyright 2012 Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
> >  /dts-v1/;
> > -/include/ "imx28.dtsi"
> > +#include "imx28.dtsi"
>=20
> The change should belong to patch "ARM: dts: mxs: modify mx23/mx28 dt=
s
> files to use pinctrl headers".  Otherwise, build of imx28-tx28.dtb wi=
ll
> break right there.
>=20
> I have fixed it when apply that patch.  You may want to rebase this
> patch on my imx/dt branch with this change dropped.
>=20
Thanks, I'll resend the patch soon.

> > +		/* sample keymap */
> > +		linux,keymap =3D <
> > +			0x00000074 /* row 0, col 0, KEY_POWER */
> > +			0x00010052 /* row 0, col 1, KEY_KP0 */
> > +			0x0002004f /* row 0, col 2, KEY_KP1 */
> > +			0x00030050 /* row 0, col 3, KEY_KP2 */
> > +			0x01000051 /* row 1, col 0, KEY_KP3 */
> > +			0x0101004b /* row 1, col 1, KEY_KP4 */
> > +			0x0102004c /* row 1, col 2, KEY_KP5 */
> > +			0x0103004d /* row 1, col 3, KEY_KP6 */
> > +			0x02000047 /* row 2, col 0, KEY_KP7 */
> > +			0x02010048 /* row 2, col 1, KEY_KP8 */
> > +			0x02020049 /* row 2, col 2, KEY_KP9 */
> > +		>;
>=20
> Can the macros in include/dt-bindings/input/input.h help here?
>=20
Not really. They only specify keycodes while I need the keycode OR'ed
with the row/col numbers here. All other DTS files using linux,keymap
also specify the hex codes directly.


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
