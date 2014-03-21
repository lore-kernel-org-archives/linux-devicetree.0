From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Fri, 21 Mar 2014 15:30:20 +0100
Message-ID: <1658201.GilyGRJEEa@avalon>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de> <1755937.SSGT2MZJMC@avalon> <532C4B3C.4030406@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1422452.LVKZ4jzxXA"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <532C4B3C.4030406-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart1422452.LVKZ4jzxXA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Tomi,

On Friday 21 March 2014 16:22:52 Tomi Valkeinen wrote:
> On 21/03/14 16:13, Laurent Pinchart wrote:
> > On Friday 21 March 2014 15:37:17 Tomi Valkeinen wrote:
> >> On 21/03/14 00:32, Laurent Pinchart wrote:
> >>> The OF graph bindings documentation could just specify the ports =
node as
> >>> optional and mandate individual device bindings to specify it as
> >>> mandatory or forbidden (possibly with a default behaviour to avoi=
d
> >>> making all device bindings too verbose).
> >>=20
> >> Isn't it so that if the device has one port, it can always do with=
out
> >> 'ports', but if it has multiple ports, it always has to use 'ports=
' so
> >> that #address-cells and #size-cells can be defined?
> >=20
> > You can put the #address-cells and #size-cells property in the devi=
ce node
> > directly without requiring a ports subnode.
>=20
> Ah, right. So 'ports' is only needed when the device node has other c=
hildren
> nodes than the ports and those nodes need different #address-cells an=
d
> #size-cells than the ports.

I would rephrase that as the ports node being required only in that cas=
e. It=20
can also be useful to cleanly group ports together when the device node=
 has=20
other unrelated children, even though no technical requirement exist (y=
et ?)=20
in that case.

> In that case it sounds fine to leave it for the driver bindings to de=
cide.

=2D-=20
Regards,

Laurent Pinchart

--nextPart1422452.LVKZ4jzxXA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTLEz8AAoJEIkPb2GL7hl1VvAIAKrdmomDTdcBJr1NaaefFaQK
2pA7MWuE/RRkUmMe2HjAfqqapyEW1sMJ9A0R5NUy3JC/7xmu+rEtm6VyBja5v6kZ
O8bd3mFpER6KPWS8GZPQJ2QT3cnTOQKpuybZRDmIFPMGhfnqq9nfW69U4QjlbfKs
VFghO8k3I+fUzEql8meii6GRwtSdMWWPsyncf94a8Wj93mY+tNhtibfpeFoxhmU/
UiKm1+xYcRxJ5gWuG567BMlGACsYaI9uSv/WWDmLZHW0CMJ2J2NWMSYSvxBNFtlm
+aVRGBHVVMAPfj8zI8LKelHqtz/ieJpDxuyNHWuXE3LJiAhWUPhvW2dkhBCGlWo=
=Qk0J
-----END PGP SIGNATURE-----

--nextPart1422452.LVKZ4jzxXA--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
