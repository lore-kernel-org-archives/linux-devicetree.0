From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] Translate of PCI address without PCI enabled
Date: Thu, 20 Feb 2014 15:35:13 +0000
Message-ID: <20140220153513.747E5C4050F@trevor.secretlab.ca>
References: <1392848096-17838-1-git-send-email-gregory.clement@ free-electrons.com> <20140220005027.GA5721@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140220005027.GA5721@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 19 Feb 2014 21:50:28 -0300, Ezequiel Garcia <ezequiel.garcia@fr=
ee-electrons.com> wrote:
> On Wed, Feb 19, 2014 at 11:14:54PM +0100, Gregory CLEMENT wrote:
> > Hello,
> >=20
> > This patch set makes the use of the of PCI address translator less
> > restrictive. At the end it will allow to use the mvebu_get_soc_id
> > unconditionally.
> >=20
> > The mvebu SoC (such as Kirkwood, Dove or Armada XP for instance) co=
me
> > with an IP of a PCI controller. The ID and the revision of a SoC ar=
e
> > stored in the registers of this controller. Being able to get this
> > information allows to deals with errata more dynamically.
> >=20
> > To manage to read this information, we need to map the registers, a=
nd
> > for this we need to use the of PCI translator which depend of the P=
CI
> > support.
> >=20
> > However there are mvebu board without any PCI devices, and where
> > selecting the PCI support would be useless.
> >=20
> > Moreover translating an address from a PCI node of the device-tree
> > into a CPU physical address doesn't require the core PCI
> > support. Those translations are just related to the device tree
> > itself.
> >=20
> > The 1st patch introduces a new config symbol: OF_ADDRESS_PCI, which
> > will be selected as soon as PCI will be selected, so we remains in =
the
> > same situation the current code. It should go to the of tree.
> >=20
> > The 2nd patch selects OF_ADDRESS_PCI as soon as ARCH_MVEBU will be
> > selected. This will make mvebu_get_soc_id available even without th=
e
> > PCI support. It should go to the mvebu tree.
> >=20
> > Thanks,
> >=20
> > Gregory CLEMENT (2):
> >   of: Allows to use the PCI translator without the PCI core
> >   ARM: mvebu: Allows to get the SoC ID even without PCI enabled
> >=20
> >  arch/arm/mach-mvebu/Kconfig | 1 +
> >  drivers/of/Kconfig          | 4 ++++
> >  drivers/of/address.c        | 8 +++++---
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> >=20
> > --=20
> > 1.8.1.2
> >=20
>=20
> On XP GP and CONFIG_PCI=3Dn, without the patches I get this:
>=20
>   mvebu-soc-id: cannot map registers
>=20
> and after applying the patches I have:
>=20
>   mvebu-soc-id: MVEBU SoC ID=3D0x7846, Rev=3D0x2
>=20
> Tested-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied both, thanks.

g.

>=20
> Thanks for taking care of this.
> --=20
> Ezequiel Garc=C3=ADa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
