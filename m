From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: tx53: add simple-panel support
Date: Tue, 25 Mar 2014 14:14:07 +0100
Message-ID: <20140325141407.75b0750e@ipc1.ka-ro>
References: <1395235721-13847-1-git-send-email-LW@KARO-electronics.de>
 <1395235721-13847-4-git-send-email-LW@KARO-electronics.de>
 <20140322064653.GC5938@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140322064653.GC5938@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Shawn Guo wrote:
> On Wed, Mar 19, 2014 at 02:28:40PM +0100, Lothar Wa=C3=9Fmann wrote:
> >=20
> > Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx53-tx53-x13x.dts |   12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/=
dts/imx53-tx53-x13x.dts
> > index 26b918e..86a964d 100644
> > --- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
> > +++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
> > @@ -63,6 +63,18 @@
> >  		default-brightness-level =3D <50>;
> >  	};
> > =20
> > +	panel0 {
> > +		compatible =3D "simple-panel";
>=20
> From what I can see, "simple-panel" is not a documented compatible.
>=20
There is Documentation/devicetree/bindings/panel/simple-panel.txt
which describes the bindings for drivers/gpu/drm/panel/panel-simple.c.
"simple-panel" is the common compatible for all panels that the driver
supports. If no compatible for a specific panel is given, the
driver supports a generic panel with an ENABLE GPIO, an attached
backlight and a regulator. This is what's being used here.=20


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
