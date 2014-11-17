From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 08/13] usb: chipidea: add a usb2 driver for ci13xxx
Date: Mon, 17 Nov 2014 11:01:09 +0100
Message-ID: <20141117100109.GA20934@kwain>
References: <1415978763-27345-1-git-send-email-antoine.tenart@free-electrons.com>
 <1415978763-27345-9-git-send-email-antoine.tenart@free-electrons.com>
 <20141114210832.GE16388@saruman>
 <20141114211052.GA8105@kwain>
 <20141114211334.GF16388@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141114211334.GF16388@saruman>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=46elipe,

On Fri, Nov 14, 2014 at 03:13:34PM -0600, Felipe Balbi wrote:
> On Fri, Nov 14, 2014 at 10:10:52PM +0100, Antoine Tenart wrote:
> > On Fri, Nov 14, 2014 at 03:08:32PM -0600, Felipe Balbi wrote:
> > > On Fri, Nov 14, 2014 at 04:25:58PM +0100, Antoine Tenart wrote:
> > > > Add a USB2 ChipIdea driver for ci13xxx, with optional PHY, cloc=
k
> > > > and DMA mask, to support USB2 ChipIdea controllers that don't n=
eed
> > > > specific functions.
> > > >=20
> > > > Tested on the Marvell Berlin SoCs USB controllers.
> > > >=20
> > > > Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTGGXanvQGlWp@public.gmane.org=
m>
> > > > ---
> > > >  drivers/usb/chipidea/Makefile       |   1 +
> > > >  drivers/usb/chipidea/ci_hdrc_usb2.c | 117 ++++++++++++++++++++=
++++++++++++++++
> > > >  2 files changed, 118 insertions(+)
> > > >  create mode 100644 drivers/usb/chipidea/ci_hdrc_usb2.c
> > > >=20
> > > > diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipid=
ea/Makefile
> > > > index 2f099c7df7b5..1fc86a2ca22d 100644
> > > > --- a/drivers/usb/chipidea/Makefile
> > > > +++ b/drivers/usb/chipidea/Makefile
> > > > @@ -10,6 +10,7 @@ ci_hdrc-$(CONFIG_USB_OTG_FSM)		+=3D otg_fsm.o
> > > > =20
> > > >  # Glue/Bridge layers go here
> > > > =20
> > > > +obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci_hdrc_usb2.o
> > >=20
> > > usb2 is too generic, you should call it ci_hdcr_marvell, or somet=
hing
> > > like that.
> >=20
> > This driver is generic, and not only for Marvell Berlin SoCs. It is=
 part
> > of the Berlin USB series as it is the first SoC to use it but Xilin=
x can
> > also use it for example.
>=20
> then how about ci_hdrc_generic.c ?

We had this discussion during in the v2 thread of this series[1]. I ten=
d
to prefer not using the 'generic' keyword. I think using 'usb2' is
generic enough here.


Antoine

[1] https://lkml.org/lkml/2014/6/24/197

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
