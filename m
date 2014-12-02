From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add USB to device tree
Date: Tue, 02 Dec 2014 10:13:30 +0100
Message-ID: <2598972.HWjIWPLUn8@wuerfel>
References: <1417459352-23401-1-git-send-email-soren.brinkmann@xilinx.com> <7088901.UGmPabvHQ0@wuerfel> <71b9e172438946a5ba74efb430d1418c@BN1AFFO11FD060.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <71b9e172438946a5ba74efb430d1418c-reflc3kr++P92Ir52M7neOhlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 13:51:26 S=F6ren Brinkmann wrote:
> Hi Arnd,
>=20
> On Mon, 2014-12-01 at 10:26PM +0100, Arnd Bergmann wrote:
> > On Monday 01 December 2014 10:42:32 Soren Brinkmann wrote:
> > > +       usb_phy0: usb-phy@0 {
> > > +               compatible =3D "usb-nop-xceiv";
> > > +               #phy-cells =3D <0>;
> > > +       };
> > >  };
> >=20
> > As discussed in an unrelated thread today, please drop the "@0" in =
the
> > node name, since the device has no 'reg' property.
>=20
> What is the best practice for naming such nodes then? On these boards
> it's not the case, but Zynq has two USB cores. So, there may be DTs t=
hat
> will have two phys in there. Would we just do 'usb-phy-0'?
>=20
>=20

Grant recommended naming them "phy0" and "phy1" in this case.
The recommended node name for a phy is "phy", not "usb-phy" (I didn't
notice that earlier, but it makes sense to change both), and
I would not use a dash for the number there.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
