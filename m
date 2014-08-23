From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/23] fdt: Add functions to query a node's #address- and
 #size-cells
Date: Sat, 23 Aug 2014 13:26:57 +0200
Message-ID: <20140823112655.GA24658@mithrandir>
References: <1408346196-30419-1-git-send-email-thierry.reding@gmail.com>
 <1408346196-30419-2-git-send-email-thierry.reding@gmail.com>
 <CAPnjgZ2OjqZNDp8F6rXKDHBNaiBywTN1V4JP0ZoHfESF4Y9p=w@mail.gmail.com>
 <20140819105955.GA19515@ulmo>
 <CAPnjgZ09_ADtfzowAzirdwfCG9xF1fEX8Ak8j0VWoyhACJdzKQ@mail.gmail.com>
 <20140819130620.GA1586@ulmo>
 <CAPnjgZ06b3UeeXra5STLht15jU00yAKCwM+UYuqc=50Th9Jd_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ06b3UeeXra5STLht15jU00yAKCwM+UYuqc=50Th9Jd_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 09:03:49PM -0600, Simon Glass wrote:
> Hi Thierry,
>=20
> On 19 August 2014 07:06, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Tue, Aug 19, 2014 at 06:52:22AM -0600, Simon Glass wrote:
> >> Hi Theirry,
> >>
> >>
> >> On 19 August 2014 04:59, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> >>
> >> > On Mon, Aug 18, 2014 at 11:52:36AM -0600, Simon Glass wrote:
> >> > > Hi Thierry,
> >> > >
> >> > > On 18 August 2014 01:16, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> > wrote:
> >> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> > > >
> >> > > > Given a device tree node, the fdt_n_addr_cells() function will w=
alk up
> >> > > > the device tree and search for an #address-cells property. It re=
turns
> >> > > > the number of cells required by the device tree node to represen=
t an
> >> > > > address.
> >> > > >
> >> > > > Similarly the fdt_n_size_cells() function returns the number of =
cells
> >> > > > required by the given device tree node to represent a size. It a=
chieves
> >> > > > that by walking up the device tree in seach for a #size-cells pr=
operty.
> >> > > >
> >> > > > If no #address-cells or #size-cells property can be found, both =
of the
> >> > > > functions return 1.
> >> > > >
> >> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> > > > ---
> >> > > >  include/libfdt.h    | 28 ++++++++++++++++++++++++++++
> >> > > >  lib/libfdt/fdt_ro.c | 36 ++++++++++++++++++++++++++++++++++++
> >> > > >  2 files changed, 64 insertions(+)
> >> > > >
> >> > > > diff --git a/include/libfdt.h b/include/libfdt.h
> >> > > > index a1ef1e15df3d..e7f991b388cf 100644
> >> > > > --- a/include/libfdt.h
> >> > > > +++ b/include/libfdt.h
> >> > > > @@ -1638,4 +1638,32 @@ int fdt_find_regions(const void *fdt, cha=
r *
> >> > const inc[], int inc_count,
> >> > > >                      struct fdt_region region[], int max_regions,
> >> > > >                      char *path, int path_len, int add_string_ta=
b);
> >> > > >
> >> > > > +/**
> >> > > > + * fdt_n_addr_cells() - find the number of address cells requir=
ed by
> >> > a node
> >> > > > + *
> >> > > > + * Looks up the #address-cells property of the node to examine.=
 If
> >> > that has
> >> > > > + * no such property, walks up the device tree until it finds on=
e in
> >> > one of
> >> > > > + * the device's parents. If no #address-cells property is found=
, it is
> >> > > > + * assumed to be 1.
> >> > > > + *
> >> > > > + * @param fdt          FDT blob
> >> > > > + * @param node         node to examine
> >> > > > + * @return number of address cells
> >> > > > + */
> >> > > > +int fdt_n_addr_cells(const void *fdt, int node);
> >> > >
> >> > > There is a new fdt_address_cells() recently that looks suitable.
> >> > >
> >> > > > +
> >> > > > +/**
> >> > > > + * fdt_n_size_cells() - find the number of size cells required =
by a
> >> > node
> >> > >
> >> > > Also fdt_size_cells().
> >> >
> >> > Neither of those seem to walk up the tree, so inheriting #address-ce=
lls
> >> > or #size-cells from a parent will not work.
> >> >
> >> > According to the comments in the code they're also supposed to return
> >> > the number of cells represented by a bus, not a device (which might
> >> > explain why it doesn't walk up the tree).
> >> >
> >> > I also can't reuse them to implement these fdt_n_addr_cells() and
> >> > fdt_n_size_cells() functions because they don't return an accurate e=
rror
> >> > if the #address-cells and #size-cells are not found, therefore it's
> >> > impossible to decide when to climb further up the tree.
> >> >
> >>
> >> OK but I have one more question. I thought that dtc gave a warning whe=
n you
> >> don't explicitly specify these values in the parent node?
> >
> > It doesn't explicitly warn about the properties being absent. Rather it
> > will fallback to the default (#address-cells =3D <2>, #size-cells =3D <=
1> in
> > the version that I have) and warn if those don't match what's expected.
> >
> > Interestingly as opposed to what the Linux kernel does, DTC doesn't seem
> > to climb further up the tree if it can't find the properties in a device
> > tree node. Instead, it seems to always use the default values instead.
> >
> > Adding the devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org mailing list. Maybe somebody there
> > can help iron out this inconsistency. ePAPR explicitly says that both
> > "... #address-cells and #size-cells properties are not inherited from
> > ancestors in the device tree. They shall be explicitly defined." (see
> > 2.3.5 "#address-cells and #size-cells").
>=20
> That's my understanding too. So should we drop this patch?

Yes, in this particular case it works fine using the existing
fdt_address_cells() and fdt_size_cells() functions so I've dropped this
patch.

Thierry

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT+Hp/AAoJEN0jrNd/PrOhSOYQAIVI0XUtPewAk0toGH1Gpqgt
dru6LL4MB1l37FVy4n2Lky39Ym0vI2BEf7MOz4wIBuoHvUi+wiihFsmaaRalZscE
nP6NYbDNlYFZ0JcTUsKF3tuP6CPZBi7wzcQI7XBOoRrGoEdSjnfmpsCOfrK85Fqw
39MAVjaom6DvYnBuYc4XZk+XN12JKHEsySYSjez30s8XedLYkN2pn77QCIieOlP1
QKpthD9Pj2v7Mc7zEPlNoo2ZYG90j95Q3S1oYzwQ5KI6nitCpz2Al4mLpNFIQwE/
v6cq9m0fiyxfsfgUaXPzbkbPB7zAStktCgA+pgNAQxa7v7U4ZBoP/t9VIlrTOZPw
jU7KQimXafyKg1b52p6NkDUlTAMuHF3wJ7b+StTbaCK2EsLC8FbKieL3qk7JafdT
df0XdGaG0qyBUXLgTM2/8GdkA0wYeynpYkQuaQPr6oim0zy+d7NsYsPByl28JLk9
kLzxVGWhuMjGewax78UgKMqf5gsdRnhjvIaELevu/eSuX8XorKKuEKTbmmppJ6mO
Zb+8/d4dt8V4Rq0kD3e+SM9RG9qRAxuO34O+9ogT4wjd2ynoc+RDL0wJhZEiUcH1
J7lkoYgjvLnIopKfIdHQXjH1rZTf1Jp9nVkoV8grqx1hUYFTtnzRZz02BN4bW6Ai
K1lTjXiCr9w91uSCrvK5
=pYus
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
