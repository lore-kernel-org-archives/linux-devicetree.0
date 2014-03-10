From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from drivers/media/v4l2-core
 to drivers/of
Date: Mon, 10 Mar 2014 11:29:11 +0200
Message-ID: <531D85E7.2060409@ti.com>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de> <20140307171804.EF245C40A32@trevor.secretlab.ca> <CA+gwMcfgKre8S4KHPvTVuAuz672aehGrN1UfFpwKAueTAcrMZQ@mail.gmail.com> <1536567.OYzyi25bjL@avalon> <531D7E9F.3090708@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bIh8W89TUIJmlfTSEVOve9C1uhLTE6eBG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531D7E9F.3090708-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--bIh8W89TUIJmlfTSEVOve9C1uhLTE6eBG
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10/03/14 10:58, Andrzej Hajda wrote:

> I want to propose another solution to simplify bindings, in fact I have=

> few ideas to consider:
>=20
> 1. Use named ports instead of address-cells/regs. Ie instead of
> port@number schema, use port-function. This will allow to avoid ports
> node and #address-cells, #size-cells, reg properties.
> Additionally it should increase readability of the bindings.
>=20
> device {
> 	port-dsi {
> 		endpoint { ... };
> 	};
> 	port-rgb {
> 		endpoint { ... };
> 	};
> };
>=20
> It is little bit like with gpios vs reset-gpios properties.
> Another advantage I see we do not need do mappings of port numbers
> to functions between dts, drivers and documentation.

That makes it more difficult to iterate the ports. You need to go
through all the nodes and use partial name matching. I think for things
like gpios, the driver always gives the full name, so there's no need
for any kind of partial matching or searching.

It looks nice when just looking at the DT, though.

 Tomi



--bIh8W89TUIJmlfTSEVOve9C1uhLTE6eBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTHYXqAAoJEPo9qoy8lh71bKAP/0BLKbGZuSlBttYPCuKE2QgJ
3TrJWDTyxsLwyHZlaRf7r8E9uP15CpGiYdu3ki1uxs3JAfp6ISNWodcCTdBxBcIi
z7IzB9mrjkQ6pYBxA7wMqAbVBCyJSmQxBMUVkpC5ZhiFxXvphpzjDDCk/Ps4mAHu
RGVBWSfoijqjOkZFzqqSCbjeiOgDYTcBI9Q1Vl7T+g6hurVJ9QHq8Fa3dUzDXFZ8
zGqhVdSP5hDA9CpX5T4t668hx5LS6PQ9TZK/FAYTJ0FyJeELmuB3P+WOR4RwzcGA
zyhWIIA4FvwvS+BdUO430mVFs7u2wf7PrEkNknxvHiXjsZOxp+DkaV1E6xpJhqxL
IR4kMx5cW1bWMEoAz3op3xOFvtyzWQR4ycpAoQZirFl1AveyxW5xajGt1NYCKl03
Hq3bsUBsrnAt4ttSgprQudq45bd5wVKJK0NailEuKPwynmXiNphUVVqHTgDIPh8k
0oUw86GHYFXizJaDK3eLesiW1mnLL2SRs+fAf/5Pj4ZviBbKJHexgdcjR439xp0U
64eIEN7wGMbyFpFR9R8lJBdTS+Wqrlo6r01EOb3tZMcn/fanJomx75OCFO09vD3z
KFFWguKUx1GvL6q0Zx6vB/MYdifYnk1kQmt7dSW6vY630yRKJKHKj3rZ7Rvokycb
k5/gKLojCM7fmZaItMmo
=Yge3
-----END PGP SIGNATURE-----

--bIh8W89TUIJmlfTSEVOve9C1uhLTE6eBG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
