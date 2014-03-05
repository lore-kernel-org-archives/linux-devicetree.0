From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 0/8] Move device tree graph parsing helpers to drivers/of
Date: Wed, 5 Mar 2014 13:35:28 +0200
Message-ID: <53170C00.20200@ti.com>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Ijxt5XB3RhGk7AVmrWSf4NnRCNT4LOlEX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394011242-16783-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Ijxt5XB3RhGk7AVmrWSf4NnRCNT4LOlEX
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On 05/03/14 11:20, Philipp Zabel wrote:
> Hi,
>=20
> this version of the OF graph helper move series further addresses a few=
 of
> Tomi's and Sylwester's comments.
>=20
> Changes since v5:
>  - Fixed spelling errors and a wrong device node name in the link secti=
on
>  - Added parentless previous endpoint's full name to warning
>  - Fixed documentation comment for of_graph_parse_endpoint
>  - Unrolled for-loop in of_graph_get_remote_port_parent
>=20
> Philipp Zabel (8):
>   [media] of: move graph helpers from drivers/media/v4l2-core to
>     drivers/of
>   Documentation: of: Document graph bindings
>   of: Warn if of_graph_get_next_endpoint is called with the root node
>   of: Reduce indentation in of_graph_get_next_endpoint
>   [media] of: move common endpoint parsing to drivers/of
>   of: Implement simplified graph binding for single port devices
>   of: Document simplified graph binding for single port devices
>   of: Warn if of_graph_parse_endpoint is called with the root node

So, as I've pointed out, I don't agree with the API, as it's too limited
and I can't use it, but as this series is (mostly) about moving the
current API to a common place, it's fine for me.

Acked-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>

 Tomi



--Ijxt5XB3RhGk7AVmrWSf4NnRCNT4LOlEX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTFwwAAAoJEPo9qoy8lh71JEsP/03+t53g9vANGhDyiOXREbXb
IEaTqZEKLSF0gK6VP3wmOhDwKbM10Fs4pF4J4RgxZhr5uFRjMbm9sNg/mdurGFMq
hxdH0er2i7sjIMU+aEfMQ59VvvLelkDjE5KhafHqf9HGuSNIjrVSdA47zrawnxiJ
RWtJ3jNi417S+N4x8THoCZk3tScdVt2lIe+AHrvxdZDoLU2UyBr0FNXyxYDz3qwu
NkUipsQEdaTmgMkDtNrFgLY1Prp8pLNeP5arHnrQAhK8abrhijM1Zdw48flRxsx7
GUn5n0FpooIUW3vthAD3CZkQ55qr9/2ux5r1t27YZw21o6oFLk01GlLz1F7bS9vX
YHtTtnWvPjYWEx+PokQdfjrXssYxDXDXznztlpGBUb+JcegYt9Fe0MAqE739LYKh
q7IDmiAfSk4Xug1Z4QeD6H8y7hLyqbaU55L12/0SuHeVrSmXrhJZx3+cVqYC5X58
g/80BQ2GOOUOtiWEGEWMp/vC8x7Zbpejfu4sKDH2Dy5VNPAGkXRmd5zkyy1GGQFz
VgYwDl5Dxvxpfdq+oAIq3Ek/y48q/t9YMm1fgc/5nT16axJcLErPpvOavWqwRJ4T
VU2RIXli2hWmQw0fIOsy1444vDGV6alI1DJ4NnmO5zaTzDIbx2/rBRT+aAx9eky2
VyshKqNekhVO41mv3F3g
=TPD2
-----END PGP SIGNATURE-----

--Ijxt5XB3RhGk7AVmrWSf4NnRCNT4LOlEX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
