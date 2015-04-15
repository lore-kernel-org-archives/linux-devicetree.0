From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Wed, 15 Apr 2015 17:54:30 +0300
Message-ID: <1429109670.30601.5.camel@linaro.org>
References: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
	 <552E7187.3030005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552E7187.3030005-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Robert,

On Wed, 2015-04-15 at 16:11 +0200, Robert Baldyga wrote:
> Hi Ivan,
>=20
> On 04/15/2015 03:35 PM, Ivan T. Ivanov wrote:
> > On recent Qualcomm platforms VBUS and ID lines are not routed to
> > USB PHY LINK controller. Use extcon framework to receive connect
> > and disconnect ID and VBUS notification.
> >=20
> > Signed-off-by: Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >=20
> > Changes since v0 [1], as per Peter Chen suggestions:
> >=20
> > * Moved external connector parsing code to ci_get_platdata()
> > * Moved external connector related variables to struct ci_hdrc_plat=
form_data
> > * Rename ci_host_notifier() to ci_id_notifier()
> > * Fixed device bindings description
> > * Use select EXTCON framework, instead of depends on.
> >=20
> > [1] https://lkml.org/lkml/2015/4/9/116
> >=20
> >  .../devicetree/bindings/usb/ci-hdrc-qcom.txt       |  9 +++
> >  drivers/usb/chipidea/Kconfig                       |  1 +
> >  drivers/usb/chipidea/core.c                        | 87 ++++++++++=
++++++++++++
> >  drivers/usb/chipidea/otg.c                         | 26 ++++++-
> >  include/linux/usb/chipidea.h                       | 17 +++++
> >  5 files changed, 139 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt=
=20
> > b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> > index f2899b5..c635aca 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> > @@ -7,6 +7,14 @@ Required properties:
> >  - usb-phy:      phandle for the PHY device
> >  - dr_mode:      Should be "peripheral"
> >=20
> > +Optional properties:
> > +- extcon:       phandles to external connector devices. First phan=
dle
> > +                should point to external connector, which provide =
"USB"
> > +                cable events, the second should point to external =
connector
> > +                device, which provide "USB-HOST" cable events. If =
one of
> > +                the external connector devices is not required, em=
pty <0>
> > +                phandle should be specified.
>=20
> Do you expect to have "USB" and "USB-HOST" notifiers supplied by two
> different extcon drivers? It looks strange. I don't think so that we
> ever will need to deal with such weird configuration.

Yes. That is what I have today on my desk.

>=20
> > +
> >  Examples:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gadget@f9a55000 {
> >                 compatible =3D "qcom,ci-hdrc";
> > @@ -14,4 +22,5 @@ Examples:
> >                 dr_mode =3D "peripheral";
> >                 interrupts =3D <0 134 0>;
> >                 usb-phy =3D <&usbphy0>;
> > +               extcon =3D <0>, <&usb_id>;
> >         };
> > diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kc=
onfig
> > index 5ce3f1d..5619b8c 100644
> > --- a/drivers/usb/chipidea/Kconfig
> > +++ b/drivers/usb/chipidea/Kconfig
> > @@ -1,6 +1,7 @@
> >  config USB_CHIPIDEA
> >         tristate "ChipIdea Highspeed Dual Role Controller"
> >         depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD &=
& !USB_GADGET) ||=20
> > (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
> > +       select EXTCON
> >         help
> >                         Say Y here if your system has a dual role h=
igh speed USB
> >                         controller based on ChipIdea silicon IP. Cu=
rrently, only the
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/cor=
e.c
> > index 74fea4f..e1d495d 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -47,6 +47,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/extcon.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/module.h>
> > @@ -557,9 +558,39 @@ static irqreturn_t ci_irq(int irq, void *data)
> >         return ret;
> >  }
> >=20
> > +static int ci_vbus_notifier(struct notifier_block *nb, unsigned lo=
ng event,
> > +                               void *ptr)
> > +{
> > +       struct ci_hdrc_cable *vbus =3D container_of(nb, struct ci_h=
drc_cable, nb);
> > +
> > +       if (event)
> > +               vbus->state =3D true;
> > +       else
> > +               vbus->state =3D false;
> > +
> > +       return NOTIFY_DONE;
> > +}
>=20
> Actually it's not true that "USB" cable state is equal to VBUS state.

But this is how it supposed to work right now, no?

I have to admit that the naming is really confusing.

> "USB" and "USB-HOST" are mutually exclusive, and when you have ID=3D0=
,
> which means "USB-HOST" is connected, "USB cable will be seen as
> disconnected even when VBUS=3D1.
>=20
> We are currently discussing how to pass VBUS state to USB OTG drivers=
=2E
> You can find discussion here:
> http://www.spinics.net/lists/linux-usb/msg123895.html

Sure, I am following this discussion. When it settles down, I can chang=
e
this as appropriate, until then this is what we will have in 4.1.

It will be messy refactoring, I think. All extcon providers and consume=
rs
are using strings to denote cable names. Not to mention that extcon-cla=
ss
is using "USB-Host", while all others are using "USB-HOST".

Regards,
Ivan

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
