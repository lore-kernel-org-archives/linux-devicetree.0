From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 1/4] of/pci: Provide support for parsing PCI DT ranges
 property
Date: Tue, 12 Feb 2013 07:45:23 +0100
Message-ID: <20130212064523.GA28850@avionic-0098.mockup.avionic-design.de>
References: <1360570940-17086-1-git-send-email-thierry.reding@avionic-design.de>
 <1360570940-17086-2-git-send-email-thierry.reding@avionic-design.de>
 <511949C7.7070604@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <511949C7.7070604@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Andrew Murray <andrew.murray@arm.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 01:43:03PM -0600, Rob Herring wrote:
> On 02/11/2013 02:22 AM, Thierry Reding wrote:
> > From: Andrew Murray <andrew.murray@arm.com>
> >=20
> > DT bindings for PCI host bridges often use the ranges property to descr=
ibe
> > memory and IO ranges - this binding tends to be the same across archite=
ctures
> > yet several parsing implementations exist, e.g. arch/mips/pci/pci.c,
> > arch/powerpc/kernel/pci-common.c, arch/sparc/kernel/pci.c and
> > arch/microblaze/pci/pci-common.c (clone of PPC). Some of these duplicate
> > functionality provided by drivers/of/address.c.
> >=20
> > This patch provides a common iterator-based parser for the ranges prope=
rty, it
> > is hoped this will reduce DT representation differences between archite=
ctures
> > and that architectures will migrate in part to this new parser.
> >=20
> > It is also hoped (and the motativation for the patch) that this patch w=
ill
> > reduce duplication of code when writing host bridge drivers that are su=
pported
> > by multiple architectures.
> >=20
> > This patch provides struct resources from a device tree node, e.g.:
> >=20
> > 	u32 *last =3D NULL;
> > 	struct resource res;
> > 	while ((last =3D of_pci_process_ranges(np, res, last))) {
> > 		//do something with res
> > 	}
> >=20
> > Platforms with quirks can then do what they like with the resource or m=
igrate
> > common quirk handling to the parser. In an ideal world drivers can just=
 request
> > the obtained resources and pass them on (e.g. pci_add_resource_offset).
> >=20
> > Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
> > ---
> >  drivers/of/address.c       | 63 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  include/linux/of_address.h |  9 +++++++
> >  2 files changed, 72 insertions(+)
> >=20
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 04da786..f607008 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -13,6 +13,7 @@
> >  #define OF_CHECK_COUNTS(na, ns)	(OF_CHECK_ADDR_COUNT(na) && (ns) > 0)
> > =20
> >  static struct of_bus *of_match_bus(struct device_node *np);
> > +static struct of_bus *of_find_bus(const char *name);
>=20
> Can you move this function up to avoid the forward declaration.

It needs to be defined after the of_busses structure, which is defined
below the CONFIG_PCI block where of_pci_process_ranges() is defined. I'd
have to move that one as well and add another #ifdef CONFIG_PCI section.
If you prefer that I can do that.

> > +static struct of_bus *of_find_bus(const char *name)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(of_busses); i++)
> > +		if (strcmp(name, of_busses[i].name) =3D=3D 0)
>                                               ^
> space needed.

I don't understand. Do you want the space to go between '.' and "name"?

Thierry

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIbBAEBAgAGBQJRGeUDAAoJEN0jrNd/PrOhu1kP+JqVxpOVGiFcy/c9Q75qLy/p
q3asNUW9YcQ0qGN36L/8MBpPAsWDSebgpFQ8h6EUk20osc/EYGuhf5LuUtJIj3kO
IKG1TjzxP4muOx1o9QG0ufg22CizpexCFDBOh7pNj+KCBlriKnIxusnQTDJmeAvw
0hwJuUkpRyhKyrs/C5ZUDdy158ehHTRv1Evrks1UmjScxRqzq1qGo6wGg5gBWBr3
Vecq2mkle3VJomC7rg/Z/SUfpwPEnKTIFtQJb5z39H0ZQPzc/AD8tpOCnCGK9riS
+kZdMHYL+XDeY3VTlkZRfaqm5DTgclwyiIWLr6rPJHzJIuU33Tl+J3Ikr5K8kdYq
TqoXOrsyJb1Qzzu6bZvNAl5O1amZz6gHbiRWi8hu70igh4SBoEhCLK0BCYPq+XKK
OV5fH1UQmzSTZIP4mCwa+wI9OGn58OBZKfh7nsCLh4aXSNs09HQY/LyoAAZFF5zl
zeGMFmsvSvGhzzZCKmrpG+1tPEIhxZWqyzqdF1Y94AVlhPDwTJg+PMYUyuCVBU9Z
O+kUtnkrSVR4+HyNt0GbBivPhwEniczd/WOteWKMnuM9q2ITRJPRYTJv6214gBD0
0L6ibU2hBFa0oyVqrAYqaiQ3QBOlffjBsYc2EOtGlNKxdTZe70N8AMwSv0YRdSm6
zWOcbvO/E/2JYzBZIkE=
=CaJX
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
