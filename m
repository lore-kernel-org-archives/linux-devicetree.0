From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from drivers/media/v4l2-core
 to drivers/of
Date: Fri, 21 Mar 2014 15:37:17 +0200
Message-ID: <532C408D.4070002@ti.com>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de> <3632624.gNVi6QOfGx@avalon> <20140320222347.CAB6DC412EA@trevor.secretlab.ca> <2848953.vVjghJyYNE@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="G261urBc241986SSMdbrsee8OkqQINdFH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2848953.vVjghJyYNE@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--G261urBc241986SSMdbrsee8OkqQINdFH
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 21/03/14 00:32, Laurent Pinchart wrote:

> The OF graph bindings documentation could just specify the ports node a=
s=20
> optional and mandate individual device bindings to specify it as mandat=
ory or=20
> forbidden (possibly with a default behaviour to avoid making all device=
=20
> bindings too verbose).

Isn't it so that if the device has one port, it can always do without
'ports', but if it has multiple ports, it always has to use 'ports' so
that #address-cells and #size-cells can be defined?

If so, there's nothing left for the individual device bindings to decide.=


 Tomi



--G261urBc241986SSMdbrsee8OkqQINdFH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTLECNAAoJEPo9qoy8lh71PigQAKz1zNAFp441Mj2R8m1wNZlv
CEbmHLRAMyuNykNlVDVfIyPRVtVrv41+IGFknHUdvQl4h8GtKs4z8voyEQlnohN3
BOVIdMtUwGgO+bsk+YQiLOUoKtmi32g3t4gzx2OT9vZo3aWncaP3PbbuzGTTOS50
p37br2P+1hOe2lcVYOPMcUq+C31x5gbGJGLN63QqwF4Nz0ZZKq5l7A3a6AMsdRFv
K72llCJouxRQF5nOmiaSyCJgEUsVeYtzy3UY1TaqMrA6d2xEb0hH3f0EwPuSDRmo
dVzFLN806uDdKbdO9iJs2pZOkQoppmsEATCnCS+JtIYvcXOIxUDUJ82ie3Y5ku55
2ovqyKQHKOR9QKMDqfK1i7+MyxwAk0RJYgIEq8nudcjyaFsOVgFOqp9PHy+hZTjL
S4unO8/xULDHkMgewEzBsQbjr1MaEazWRpzQBe3GRxppkCaT7LmwrhIrFKHgiUo+
DxDp8pmHUcvyO2z+gMWCb/Nt3xZizyCoeD8gEkY2/Y4IqDsdkOFlyxA3yQXvTIMv
AM8CBCrUliaFyQtM+sp1C6aQUpUUYdmqYnmrmqXuMkNyYM+BjBlfYw0U1ggiBcmY
+HFypZAX8vKx8MsmvvB8hYpMExyMdWMC7ba4osVOFi7a3J1rDlGBJCYwj0nH8Vhf
J2YuELr2WaRtOhT/azuB
=4DEJ
-----END PGP SIGNATURE-----

--G261urBc241986SSMdbrsee8OkqQINdFH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
