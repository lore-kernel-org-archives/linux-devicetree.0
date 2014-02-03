From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC] dtc: add ability to make nodes conditional on them being
 referenced
Date: Mon, 3 Feb 2014 20:22:15 +0100
Message-ID: <20140203192215.GA25625@lukather>
References: <1578575.rVWgTPdq1W@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1578575.rVWgTPdq1W@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 30, 2014 at 01:25:56PM +0100, Heiko St=FCbner wrote:
> From: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>
>=20
> On i.MX, which carries a lot of pin-groups of which most are unused on
> individual boards, they noticed that this plehora of nodes also results
> in the runtime-lookup-performance also degrading [0].
>=20
> A i.MX-specific solution defining the pingroups in the board files but
> using macros to reference the pingroup-data was not well received
>=20
> This patch is trying to solve this issue in a more general way, by
> adding the ability to mark nodes as needing to be referenced somewhere
> in the tree.
>=20
> To mark a node a needing to be referenced it must be prefixed with
> /delete-unreferenced/. This makes dtc check the nodes reference-status
> when creating the flattened tree, dropping it if unreferenced.
>=20
> For example, the i.MX6SL pingroup
>=20
> 	/delete-uneferenced/ pinctrl_ecspi1_1: ecspi1grp-1 {
> 		fsl,pins =3D <
> 			MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO 0x100b1
> 			MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI 0x100b1
> 			MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK 0x100b1
> 		>;
> 	};
>=20
> would only be included in the dtb if it got referenced somewhere
> as pingroup via
>=20
> 	node {
> 		pinctrl-0 <&pinctrl_ecscpi1_1>;
> 	};
>=20
> [0] http://thread.gmane.org/gmane.linux.ports.arm.kernel/275912/
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner-HCpLIkUQxWGakBO8gow8eQ@public.gmane.org>
> ---
> This is just the idea I had in [1] explored a bit more. I'm definitely
> not sure if this is a valid approach to the problem.
> Also this is my first venture into dtc as well as flex and bison :-) .
>=20
> [1] http://www.spinics.net/lists/arm-kernel/msg303731.html

This is a nice feature to have :)

However, I wonder wether it's the right way of implementing it. I'd
have another use case for this, which would be to embed a DT in a
first-stage bootloader. We have around 7kB available currently for the
DT, and this is actually less than any of our (very small already)
DTBs. So having this of feature makes complete sense to us
too. However, we also have some other tools that require most of the
nodes to be in the DTB.

So I guess turning wether we should delete a node if unreferenced into
a dtc option would make sense, since every DT user will be able to
choose, without having to duplicate the DT and make conflicting
changes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS7+xnAAoJEBx+YmzsjxAgnRcP+weivggq0QOzMwXUjeSDH8hO
si8/Q5w6/Nb1uBeluE5aRBFpjxV1uLQdToTe8Lt4lKCujZOypJs3/UaTjN6osjGp
2a3d+E9dixFuGNjD0EYmnpOng+I5xXDnuysQxcbjOD+fnlZfSxkUTfPpMDNozIKV
JhwOLcc6vuS31ZCi91RugJ5wJR/l0E94Yg1AHDMJKvYTMMlGAQOYmy4cS9YAF+XV
XiaALtJUWX9gK0yEgYmwUUgKFsqZi3vWGUgDFEM/YJ1oLO/n6GWvy2Y3Mbe5TOEb
uFOEimpTRIUk8W2rMDqTgOmGPnHyN3zYVqmRAzc/Cvdj35gjTpvhuTqEilkadCRH
kqKhsRgkurvpsSXHqLJmjYXz4yCM0r8QNImiczvMf+P5nw/4bt8hSNZ3ZAa1TIwa
Imh7rPkVcIfAEndUUWc1dziwOWR8j7kS0fcuFMgMKvto7FYujwmVaozHu8XPjITa
6meKqx+FGszN+IfyzE46SFgxNK74w0zH4BGUV1UsFmi7cVarSAFjm47CCc+DDhac
dvkqAYv+CGKCaRQWDgxBqpCr3429/aIdYxDSDa6ssLHL74wKWL6gMt4E4lBN4dHk
/V1wH56jNRGNQbf4HRBthQfIXF3a3FUiT5KSO9aioT3FH2l/0WfNWrbzdimaATvS
dfkQYqzks2hYtZ4E/zLR
=Ca77
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
