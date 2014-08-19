From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/23] fdt: Add functions to query a node's
 #address- and #size-cells
Date: Tue, 19 Aug 2014 15:06:23 +0200
Message-ID: <20140819130620.GA1586@ulmo>
References: <1408346196-30419-1-git-send-email-thierry.reding@gmail.com>
	<1408346196-30419-2-git-send-email-thierry.reding@gmail.com>
	<CAPnjgZ2OjqZNDp8F6rXKDHBNaiBywTN1V4JP0ZoHfESF4Y9p=w@mail.gmail.com>
	<20140819105955.GA19515@ulmo>
	<CAPnjgZ09_ADtfzowAzirdwfCG9xF1fEX8Ak8j0VWoyhACJdzKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0824477441=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ09_ADtfzowAzirdwfCG9xF1fEX8Ak8j0VWoyhACJdzKQ@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Stephen Warren <swarren@nvidia.com>, devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org


--===============0824477441==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 06:52:22AM -0600, Simon Glass wrote:
> Hi Theirry,
>=20
>=20
> On 19 August 2014 04:59, Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > On Mon, Aug 18, 2014 at 11:52:36AM -0600, Simon Glass wrote:
> > > Hi Thierry,
> > >
> > > On 18 August 2014 01:16, Thierry Reding <thierry.reding@gmail.com>
> > wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Given a device tree node, the fdt_n_addr_cells() function will walk=
 up
> > > > the device tree and search for an #address-cells property. It retur=
ns
> > > > the number of cells required by the device tree node to represent an
> > > > address.
> > > >
> > > > Similarly the fdt_n_size_cells() function returns the number of cel=
ls
> > > > required by the given device tree node to represent a size. It achi=
eves
> > > > that by walking up the device tree in seach for a #size-cells prope=
rty.
> > > >
> > > > If no #address-cells or #size-cells property can be found, both of =
the
> > > > functions return 1.
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  include/libfdt.h    | 28 ++++++++++++++++++++++++++++
> > > >  lib/libfdt/fdt_ro.c | 36 ++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 64 insertions(+)
> > > >
> > > > diff --git a/include/libfdt.h b/include/libfdt.h
> > > > index a1ef1e15df3d..e7f991b388cf 100644
> > > > --- a/include/libfdt.h
> > > > +++ b/include/libfdt.h
> > > > @@ -1638,4 +1638,32 @@ int fdt_find_regions(const void *fdt, char *
> > const inc[], int inc_count,
> > > >                      struct fdt_region region[], int max_regions,
> > > >                      char *path, int path_len, int add_string_tab);
> > > >
> > > > +/**
> > > > + * fdt_n_addr_cells() - find the number of address cells required =
by
> > a node
> > > > + *
> > > > + * Looks up the #address-cells property of the node to examine. If
> > that has
> > > > + * no such property, walks up the device tree until it finds one in
> > one of
> > > > + * the device's parents. If no #address-cells property is found, i=
t is
> > > > + * assumed to be 1.
> > > > + *
> > > > + * @param fdt          FDT blob
> > > > + * @param node         node to examine
> > > > + * @return number of address cells
> > > > + */
> > > > +int fdt_n_addr_cells(const void *fdt, int node);
> > >
> > > There is a new fdt_address_cells() recently that looks suitable.
> > >
> > > > +
> > > > +/**
> > > > + * fdt_n_size_cells() - find the number of size cells required by a
> > node
> > >
> > > Also fdt_size_cells().
> >
> > Neither of those seem to walk up the tree, so inheriting #address-cells
> > or #size-cells from a parent will not work.
> >
> > According to the comments in the code they're also supposed to return
> > the number of cells represented by a bus, not a device (which might
> > explain why it doesn't walk up the tree).
> >
> > I also can't reuse them to implement these fdt_n_addr_cells() and
> > fdt_n_size_cells() functions because they don't return an accurate error
> > if the #address-cells and #size-cells are not found, therefore it's
> > impossible to decide when to climb further up the tree.
> >
>=20
> OK but I have one more question. I thought that dtc gave a warning when y=
ou
> don't explicitly specify these values in the parent node?

It doesn't explicitly warn about the properties being absent. Rather it
will fallback to the default (#address-cells =3D <2>, #size-cells =3D <1> in
the version that I have) and warn if those don't match what's expected.

Interestingly as opposed to what the Linux kernel does, DTC doesn't seem
to climb further up the tree if it can't find the properties in a device
tree node. Instead, it seems to always use the default values instead.

Adding the devicetree@vger.kernel.org mailing list. Maybe somebody there
can help iron out this inconsistency. ePAPR explicitly says that both
"... #address-cells and #size-cells properties are not inherited from
ancestors in the device tree. They shall be explicitly defined." (see
2.3.5 "#address-cells and #size-cells").

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT80vMAAoJEN0jrNd/PrOhjlcP/jKSvqfjnqBAHXQbDwXAhulZ
nm84rGBOjLSQuWsg9cGjls3komruOJgMRFHP+rRtV9ZPlt/mEI8Dsq50dAqUe1aJ
4breRJ+U9inEZx+sK/FTIzYIR38IEHKhyd6HuKqCWl2QHwNMwlMlAL23XVMTqdgj
G6C4N/BAsXVHqjYhbS4Ac1DeeYz7o8gqccdStLKyHIz4dQudnZ1w7uNHFFVmkT1w
LX6jv8PQjHGiBlpDyJ9exNXUHGdzvdyj4yyYIoTi6DVA5q07qsB3klvFSRBCIixC
rj8qEEhRbSk+p53vVnuvFRyDowXWvWt29WBD7wOYwHuDbJbo6peNMTlC3M/vI83X
WzOXaUltXOE7Yf92lEq3FLmHQM1lRlkiGWYP9pVVpR+bQ4SqnR//l31ON2sPB9Z6
3z0UV21y1qaB2grdmCRYH1LW38GI/MEEQ6zsEkyHB4oA5dSaIWPEszIQ6W21Tdnh
wvXW0dzhJazAA0oHD5/8DeHUoG4HdnFSkgo4j4nwDKlqCumoDgVOyhErfVmegacD
waW1xluLnECuDZoou3R4GQ9qc73UWj4BAeIynTdB/KjOxDLAywOe0XphUA8wu6HU
PXiqdDiZHAFhO7TCMfDPMPPnZvAN2oJXxR5OWxh6psRTgOm/qdGLzeRHSdtrm/R3
et05Jn7PdCBvHykrpEkM
=IOk0
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--

--===============0824477441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0824477441==--
