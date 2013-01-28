From: Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] mtd: physmap_of: fix cmdline partition method w/o
 linux,mtd-name
Date: Mon, 28 Jan 2013 18:02:21 +0200
Message-ID: <1359388941.7570.17.camel@sauron.fi.intel.com>
References: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
 <20130124090547.GB7697@sapphire.tkos.co.il>
Reply-To: artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4311655905865861055=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130124090547.GB7697-MwjkAAnuF3khR1HGirfZ1z4kX+cae0hd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============4311655905865861055==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-aFszTwIW50rirgRBsoQK"


--=-aFszTwIW50rirgRBsoQK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I pinged dwmw2 about this already. This is his call to merge the driver.
I will ping him again.

On Thu, 2013-01-24 at 11:05 +0200, Baruch Siach wrote:
> Hi linux-mtd, Artem, David,
>=20
> Ping?
>=20
> It's been a month, and this is a simple uninitialized pointer dereference=
 bug=20
> fix.
>=20
> baruch
>=20
> On Sun, Dec 23, 2012 at 01:10:50PM +0200, Baruch Siach wrote:
> > Commit d68cbdd4fb (mtd: physmap_of: allow to specify the mtd name for r=
etro
> > compatiblity) broke cmdline partitioning using dev_name() in the kernel=
 command
> > line.  of_property_read_string() does not touch mtd_name when linux,mtd=
-name is
> > not present in the device tree, which causes map.name to be set to a ra=
ndom
> > value.  Fix this by initializing mtd_name to NULL.
> >=20
> > Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> > ---
> >  drivers/mtd/maps/physmap_of.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_o=
f.c
> > index 37cdc20..6fb2bd8 100644
> > --- a/drivers/mtd/maps/physmap_of.c
> > +++ b/drivers/mtd/maps/physmap_of.c
> > @@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *d=
ev)
> >  	resource_size_t res_size;
> >  	struct mtd_part_parser_data ppdata;
> >  	bool map_indirect;
> > -	const char *mtd_name;
> > +	const char *mtd_name =3D NULL;
> > =20
> >  	match =3D of_match_device(of_flash_match, &dev->dev);
> >  	if (!match)
>=20

--=20
Best Regards,
Artem Bityutskiy

--=-aFszTwIW50rirgRBsoQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRBqENAAoJECmIfjd9wqK06OQQAIxVuIcs20xcVDq3kqC67Hpp
cLMD7miC/3UE5FiGaJfLgMjfPc+Z12xFzFaldcPaLSnnAi+IP1+b3wXkBjpe5Wpu
hDDC1leYNx8aR5vJmLgF1edVHK6H4p/uAzUnOdR9yTJ8as8UtwaeWnhrZBJGBTOZ
wQBl1iVIMl1wqS9VqVr7rGp1GnVH0MRtnMnRknbTYXgpck32OND9VDnl13qwhbBP
Dek7FDTpyTZKL1L45zXEfYONNux+/1kmL49lIaoPRyVbIfUCkJ8jjf/ZcIwO+l+X
RJU0rjHw1cdLRTzPQhIdjy33zv8YdFQtWGeUAGMBbGkHBJNDyCvqag1lu9aKk89r
TQ6t8ULRxNwZCJH33lGKljyIgcNNwh+AZohPc1CpZB9sW1r2Lc2aZdb8/jalFNhZ
c5PDn3TAacma+SjFlRbsDTH7ZLrUemYyuLC8qbVc8CPFsKJho+BH2Dbb5285rfxM
N6DUZlqbrYAZOKdJgx5w3quL8hjRDWPofjemC2ZpxGh7IMZHyYQJno6GKlWiFKpG
926L1lMn8UYlnoTQ9+6Zjt6YKH44Njfnk1tn8HJqcArxaupB9n5cZ7lceAe2XwaP
cGk4Z9WVsE8vUaDltsCnroace/qmWJij6iILxndrLItvLFgfwXv5ashKbkYQCDIV
nTzmHlNDqdofEb8WUCUc
=3Zgq
-----END PGP SIGNATURE-----

--=-aFszTwIW50rirgRBsoQK--


--===============4311655905865861055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4311655905865861055==--
