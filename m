From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [v7,49/50] drivers/of: Export OF changeset functions
Date: Wed, 13 Jan 2016 22:20:08 +0100
Message-ID: <20160113212008.GC3881@katana>
References: <1446642770-4681-50-git-send-email-gwshan@linux.vnet.ibm.com>
 <20160113135426.GA29030@katana>
 <1452719886.8203.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452719886.8203.1.camel-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 08:18:06AM +1100, Michael Ellerman wrote:
> On Wed, 2016-01-13 at 14:54 +0100, Wolfram Sang wrote:
> > On Thu, Nov 05, 2015 at 12:12:49AM +1100, Gavin Shan wrote:
> > > The PowerNV PCI hotplug driver is going to use the OF changeset
> > > to manage the changed device sub-tree. This exports those OF
> > > changeset functions for that.
> > >=20
> > > Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >=20
> > I needed something like this, too [1] and rebased my series on top of
> > this patch. So:
> >=20
> > Acked-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> > Tested-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
>=20
> OK. This series is kind of in limbo, it might hit 4.6, but it might not. =
So if
> you need this patch before then you should probably pull it in to your se=
ries,
> or ask Rob to merge it pre-emptively.

Yup, this is what I had in mind, too.

Thanks,

   Wolfram


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWlr+IAAoJEBQN5MwUoCm2CuwP/0+rRmIuLdyefG6ryBWXzONA
/NEpjuUz+zugwMm+7K9Z6znKKqowMtYLZrLRbJhMlMta3bc5IZLgvz/sIIb/rRGS
JI9uD19Gpxga1obMDCTxmrzPzZD68iC03i1W85PQ7F6+bzsl3Y8gAfNYF1Mirjhm
Gy7aHfC5CkRqsCPDNHYp3c2bff7cFSyCpH8zHDytieSYU5q2wuekmpVbz4bb+D4E
TJT93/bNhjHfBoxZ/5F8O9+LYI4xb6d+wFzBY0mkdiGXWJh4UecwyeDgdWVrsivc
LpV25ASSxAFC0tsxUUoFXcsX/bGitbAUMCP3TtZ6OF0nFPIRPpFREcBHHAF62uMZ
L20z50/j1bY6t/5UFN8CNWHdHRLvBhWr+aiAIWwSmHsdkFK57L1DGaxtyGXUeuxx
kf3p76sSx8ri0lZkJ8sDHPJQEyY6W+TH4/uAiZiYo+DcWsCgQpGvzJiK7kpKV1Y2
rDgZJmOcsqkxgZJKgrlBxmtEHbsC4SrIDHGSRsFGdd4SMddeyQKkLyd4fdId22Ma
JM8kfm8RTXzktG8+BWh336Pg2vWgZrSBzj908pebls9kk70vhkHRJV6PyzfIMcvz
wtx6w1NfRu5GfiL5F/xL7Z4Zrxh7NQOnvqGQ7MDz3GfYNmBMG/mbWk8mYkyrgxp4
kSPyoNmmgEsqEJMUI1Ak
=0neK
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
