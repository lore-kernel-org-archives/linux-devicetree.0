From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/6] Armada 380 NAND support
Date: Thu, 13 Mar 2014 16:25:13 -0300
Message-ID: <20140313192513.GA25600@arch.cereza>
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140313191925.GE7811@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140313191925.GE7811-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 13, Jason Cooper wrote:
> Ezequiel,
>=20
> On Wed, Mar 12, 2014 at 12:16:38PM -0300, Ezequiel Garcia wrote:
> > This patchset adds support for the NAND on Armada 380/385 SoCs.
> >=20
> > The first patch adds a new "armada-380-corediv-clock" compatible
> > string, with its proper SoC-specific structure, adding the register
> > layout for this SoC family.
> >=20
> > The second and third patches add the devicetree changes to support
> > the Core Divider clock.
> >=20
> > After adding its clock source, the fourth and fifth patches add
> > the NAND devicetree changes. The NAND controller is compatible with
> > the Armada 370 controller, so we are currently support it using the
> > same compatible string.
> >=20
> > The last patch updates the binding documentation for the Core Divid=
er
> > clock, which is missing the information about the already supported
> > Armada 375 compatible string.
> >=20
> > This series is based on linux-next 20140307. I expect it will apply
> > cleanly on v3.15-rc1; if that's not the case, I'll send a rebased p=
atchset.
> >=20
> > The clock and devicetree changes are mostly independent so they
> > can be merged through the clock and mvebu tree respectively.
> >=20
> > Ezequiel Garcia (6):
> >   clk: mvebu: Support Armada 380 SoC on the core divider clock
> >   ARM: mvebu: Add a 2 GHz fixed-clock on Armada 38x SoCs
> >   ARM: mvebu: Add the Core Divider clock to Armada 38x SoCs
> >   ARM: mvebu: Add support for NAND controller in Armada 38x SoC
> >   ARM: mvebu: Enable NAND controller in Armada 385-DB
> >   clk: mvebu: Update binding documentation for the core divider clo=
ck
> >=20
> >  .../bindings/clock/mvebu-corediv-clock.txt         |  5 ++++-
> >  arch/arm/boot/dts/armada-385-db.dts                | 21 ++++++++++=
++++++++
> >  arch/arm/boot/dts/armada-38x.dtsi                  | 25 ++++++++++=
++++++++++++
> >  drivers/clk/mvebu/clk-corediv.c                    | 23 ++++++++++=
++++++++++
> >  4 files changed, 73 insertions(+), 1 deletion(-)
>=20
> This clock changes looks really clean and simple.  Mike says he has t=
ime
> for one more pull.  Can you fixup the s/nand/flash/ and resend?  I'd
> like to pull this and your fix in and possibly send a pull request fo=
r
> v3.15 tomorrow.
>=20

Right away.

--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
