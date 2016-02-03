From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 01/11] MAINTAINERS: Add entry for X-Powers
 AXP family PMIC drivers
Date: Tue, 02 Feb 2016 17:28:30 -0800
Message-ID: <1454462910.7291.53.camel@perches.com>
References: <1454408864-24112-1-git-send-email-wens@csie.org>
	 <1454408864-24112-2-git-send-email-wens@csie.org>
	 <CAGRGNgVxan9RCsLFW9hHWcdW+Rd_SgVG95H-yQg213g-YeE6Ug@mail.gmail.com>
Reply-To: joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDY3NC743AGBBRFPYW2QKGQEGOCT7IA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGRGNgVxan9RCsLFW9hHWcdW+Rd_SgVG95H-yQg213g-YeE6Ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Todd Brandt <todd.e.brandt-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-03 at 11:19 +1100, Julian Calaby wrote:
> On Tue, Feb 2, 2016 at 9:27 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > Add an entry for X-Powers AXP family PMIC drivers and list myself
> > as maintainer.
[]
> > diff --git a/MAINTAINERS b/MAINTAINERS
[]
> > @@ -11941,6 +11941,12 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include/linux/=
workqueue.h
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kernel/workqueue.c
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/workqueue.txt
> >=20
> > +X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS
> > +M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > +L:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > +S:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Maintained
> > +N:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0axp[128]
>=20
> Should you list the files maintained and this list also?

This "N:" pattern is kind of a wildcard.

The difference between F: and N: is that git history
is also used by default for files that match.

There are no files in -next today that match "*axp8*"
Dunno if this patchset added any.

This matches:

    $ git ls-files | grep "axp[128]"
    Documentation/devicetree/bindings/mfd/axp20x.txt
    Documentation/devicetree/bindings/power_supply/axp20x_usb_power.txt
    arch/arm/boot/dts/axp152.dtsi
    arch/arm/boot/dts/axp209.dtsi
    arch/arm/boot/dts/axp22x.dtsi
    drivers/extcon/extcon-axp288.c
    drivers/iio/adc/axp288_adc.c
    drivers/input/misc/axp20x-pek.c
    drivers/mfd/axp20x.c
    drivers/power/axp20x_usb_power.c
    drivers/power/axp288_charger.c
    drivers/power/axp288_fuel_gauge.c
    drivers/regulator/axp20x-regulator.c
    include/linux/mfd/axp20x.h

Are all these files appropriate?

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
