From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 6/6] usb: chipidea: add work-around for Marvell HSIC
 PHY startup
Date: Fri, 22 May 2015 17:07:18 +0800
Message-ID: <20150522090717.GA12734@shlinux2>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
 <1432087805-16671-7-git-send-email-robh@kernel.org>
 <20150521031334.GA2897@shlinux2>
 <CAL_Jsq+0zaKZJwgAPea25a=TrChOJs0LdCRV-R824=qij3pnTw@mail.gmail.com>
 <BN3PR0301MB0849D35E915D701DE931EA9081C10@BN3PR0301MB0849.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BN3PR0301MB0849D35E915D701DE931EA9081C10-CEkquS/Gb83prP92dyGgc5wN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 09:54:20AM +0000, Peter Chen wrote:
> =20
> >=20
> > On Wed, May 20, 2015 at 10:13 PM, Peter Chen <peter.chen@freescale.=
com>
> > wrote:
> > > On Tue, May 19, 2015 at 09:10:05PM -0500, Rob Herring wrote:
> > >> The Marvell 28nm HSIC PHY requires the port to be forced to HS m=
ode
> > >> after the port power is applied. This is done using the test mod=
e in
> > >> the PORTSC register.
> > >>
> > >> As HSIC is always HS, this work-around should be safe to do with=
 all
> > >> HSIC PHYs. If not, a flag can also be added.
> > >
> > > I think a flag is needed, not sure all vendors can work well with=
 that.
> >=20
> > Only i.MX6Sx uses HSIC in mainline. Is that something you can test?=
 It would be
> > better to not add flags unless they are really needed.
> > Otherwise you end up with dozens of flags like SDHCI drivers have.
> >=20
>=20
> I will have a test for this, and show you the result later.
>=20

Since imx6sx HSIC support is not supported at mainline, I tested
this sequence at internal branch, it does not affect imx6's
hsic function, I am ok with this patch.

Tested-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

> Peter
> =13=EF=BF=BD=EF=BF=BD=EC=B9=BB=1C=EF=BF=BD&=EF=BF=BD~=EF=BF=BD&=EF=BF=
=BD=18=EF=BF=BD=EF=BF=BD+-=EF=BF=BD=EF=BF=BD=DD=B6=17=EF=BF=BD=EF=BF=BD=
w=EF=BF=BD=EF=BF=BD=CB=9B=EF=BF=BD=EF=BF=BD=EF=BF=BDm=EF=BF=BDb=EF=BF=BD=
=EF=BF=BDn=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=17=EF=BF=BD=EF=BF=BD=DC=A8=
}=EF=BF=BD=EF=BF=BD=EF=BF=BD=C6=A0z=EF=BF=BD&j:+v=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=07=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDzZ+=EF=BF=BD=EF=BF=BD+zf=EF=BF=
=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=EF=BF=BD=EF=BF=BD~=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BDi=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=1E=EF=BF=BDw=EF=BF=
=BD=EF=BF=BD=EF=BF=BD?=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD&=EF=BF=BD)=DF=
=A2=1Bf

--=20

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
