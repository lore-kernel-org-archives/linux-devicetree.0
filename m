From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Documentation: bindings: add dt doc for Rockchip
 PCIe controller
Date: Sun, 19 Jun 2016 09:53:13 -0500
Message-ID: <20160619145313.GA17388@rob-hp-laptop>
References: <1466041821-1649-1-git-send-email-shawn.lin@rock-chips.com>
 <5811436.gqkV56Lax5@wuerfel>
 <da207bdc-738f-f2b1-7026-e368355936e9@rock-chips.com>
 <5324957.LqZqpRHMK9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5324957.LqZqpRHMK9@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 11:22:02AM +0200, Arnd Bergmann wrote:
> On Thursday, June 16, 2016 4:01:12 PM CEST Wenrui Li wrote:
> > =E5=9C=A8 2016/6/16 15:00, Arnd Bergmann =E5=86=99=E9=81=93:
> > > On Thursday, June 16, 2016 9:50:21 AM CEST Shawn Lin wrote:
> > >
> > >> +    reset-names =3D "core", "mgmt", "mgmt-sticky", "pipe";
> > >> +    phys =3D <&pcie_phy>;
> > >> +    phy-names =3D "pcie-phy";
> > >> +    pinctrl-names =3D "default";
> > >> +    pinctrl-0 =3D <&pcie_clkreq>;
> > >> +    #interrupt-cells =3D <1>;
> > >> +    interrupt-controller;
> > >> +    interrupt-map-mask =3D <0 0 0 7>;
> > >> +    interrupt-map =3D <0 0 0 1 &pcie0 1>,
> > >> +                    <0 0 0 2 &pcie0 2>,
> > >> +                    <0 0 0 3 &pcie0 3>,
> > >> +                    <0 0 0 4 &pcie0 4>;
> > >> +};
> > >>
> > >
> > > One thing that came up in the review of the new Marvell PCIe driv=
er is that it's
> > > most likely invalid for a device node to have both "interrupt-con=
troller"
> > > and "interrupt-map" properties. I originally thought this was a n=
ice way to
> > > handle embedded irqchips within the PCIe host, but it only really=
 works
> > > by coincidence with the current kernel, and only as long as the h=
wirq number
> > > of the irqchip matches the integer representation of the irq line=
 in the root
> > > bridge (which it does in the example above).
> > >
> > > For that driver we concluded that it would be less of a hack to h=
ave the
> > > irqchip as a child node of the PCIe host after all (just not with
> > > device_type=3D"pci" of course), and that makes the translation wo=
rk as
> > > expected.
> > >
> > >       Arnd
> > >
> >=20
> > Original driver have an irqchip as child node. But Marc suggested d=
on't=20
> > need an intermediate node here.
> > Now the conclusion is to retain the child node?
>=20
> That is at least my view of the situation, sorry for the mixed messag=
es
> you have been getting. Marc, Rob, do you agree with my finding?

Yes, the OF interrupt mapping doc[1] parsing code treats things them as=
=20
mutually exclusive.

Rob

[1] http://www.unixag-kl.fh-kl.de/~jkunz/tmp/imap0_9d.pdf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
