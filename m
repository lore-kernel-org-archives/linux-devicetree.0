From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Tue, 16 Sep 2014 16:05:51 +0200
Message-ID: <20140916140551.GE4869@kwain>
References: <1410777378-12726-1-git-send-email-antoine.tenart@free-electrons.com>
 <1410777378-12726-8-git-send-email-antoine.tenart@free-electrons.com>
 <20140916005129.GC3379@peterchendt>
 <20140916133841.GA4869@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140916133841.GA4869@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 16, 2014 at 03:38:41PM +0200, Antoine Tenart wrote:
> On Tue, Sep 16, 2014 at 08:51:30AM +0800, Peter Chen wrote:
> > On Mon, Sep 15, 2014 at 12:36:13PM +0200, Antoine Tenart wrote:
> > > Add a USB2 ChipIdea driver for ci13xxx, with optional PHY, clock
> > > and DMA mask, to support USB2 ChipIdea controllers that don't nee=
d
> > > specific functions.
> > >=20
> > > Tested on the Marvell Berlin SoCs USB controllers.
> > >=20
> > > Signed-off-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >  drivers/usb/chipidea/Makefile       |   1 +
> > >  drivers/usb/chipidea/ci_hdrc_usb2.c | 137 ++++++++++++++++++++++=
++++++++++++++
> > >  2 files changed, 138 insertions(+)
> > >  create mode 100644 drivers/usb/chipidea/ci_hdrc_usb2.c
> > >=20
> >=20
> > compile error:
> >=20
> > /home/peter/work/projects/usb/drivers/usb/chipidea/ci_hdrc_usb2.c: =
In function 'ci_hdrc_usb2_dt_probe':
> > /home/peter/work/projects/usb/drivers/usb/chipidea/ci_hdrc_usb2.c:3=
0:2: error: implicit declaration of function 'of_phy_get' [-Werror=3Dim=
plicit-function-declaration]
> > /home/peter/work/projects/usb/drivers/usb/chipidea/ci_hdrc_usb2.c:3=
0:16: warning: assignment makes pointer from integer without a cast [en=
abled by default]
>=20
> Did you apply the series introducing the support for the generic PHY
> framework in the USB subsystem first? One of the patches includes
> 'linux/phy/phy.h' in 'linux/usb/otg.h'. That's why I did not encounte=
r
> this error.
>=20
> Anyway, you're right and 'linux/phy/phy.h' should be explicitly inclu=
ded
> here.

Let me know if you want me to quickly cook up a new version fixing this=
=2E

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
