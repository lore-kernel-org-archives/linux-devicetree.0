From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] dtc: add ability to make nodes conditional on them being
 referenced
Date: Wed, 16 Apr 2014 17:30:53 +1000
Message-ID: <20140416073053.GB12216@voom.fritz.box>
References: <199290403.sj4aYrj8FC@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3153928112175093778=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <199290403.sj4aYrj8FC@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Philipp Zabel <philipp.zabel@gmail.com>, grant.likely@linaro.org, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree-compiler@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============3153928112175093778==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2014 at 10:22:02PM +0100, Heiko St=FCbner wrote:
> From: Heiko Stuebner <heiko.stuebner@bq.com>
>=20
> On i.MX, which carries a lot of pin-groups of which most are unused on
> individual boards, they noticed that this plethora of nodes also results
> in the runtime-lookup-performance also degrading [0].
>=20
> A i.MX-specific solution defining the pingroups in the board files but
> using macros to reference the pingroup-data was not well received.
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
> 	/delete-unreferenced/ pinctrl_ecspi1_1: ecspi1grp-1 {
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

Sorry for the delay - I'm pretty busy with non-dtc things.

Concept looks fine to me.  It's perhaps a bit special use case, but
the syntax is well isolated (that is, unlikely to mix badly with other
possible syntax changes), so I'm happy enough to include it for those
who want it.

Maybe change the keyword to /delete-if-unreferenced/, it's a little
bit more accurate.  It's a bit long-winded, but I can't think of a
more succinct term, so it will do.

It needs testcases.

There are a few minor problems in the implementation.

With those things fixed, I'd be happy to apply.

Some detailed comments on the implementation below:

[snip]
> @@ -472,6 +472,8 @@ static void fixup_phandle_references(struct check *c,=
 struct node *dt,
> =20
>  		phandle =3D get_node_phandle(dt, refnode);
>  		*((cell_t *)(prop->val.val + m->offset)) =3D cpu_to_fdt32(phandle);
> +
> +		reference_node(refnode);

This may have some slightly unexpected behaviour when combined with
/delete-node/ and or /delete-prop/.  At worst it should include the
unnecessary node though, so I don't think it's a big problem.

[snip]
> +struct node *check_node_referenced(struct node *node)

This function needs a different name, since it doesn't actually check
anything (it just triggers a later check).  Maybe
mark_node_needs_reference().

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTTjGtAAoJEGw4ysog2bOSL4cQALVt6CrD58QnSr+a4X2IAhK0
1cDyuoYPwG0aG84t1VWPMNfKgGCOvHLqPb3EGRdbF5Z39B2sHPGYlE6haVKoL2IS
Y4Xdm9TSpY+snOr4z5rfyzP893j/5FhGledHMATQiW6QMQP9F1hpq9zS/vxqikQP
noTB4GVH1h7mjKchK562fGL+1kFbVlbq9VLHv6gDV2kR6JLHK4/kHrBrxNtpXAxm
8QiBLFXIcus3YlKEVK/CV5lnm33dXU13nwQqd/ltdB2HvFJPlzOr+fh1K34BPeh1
xpsSbtuUbgoVWf7qVtE0FxjWhgF+ym7yZ8vXTRlTzGseQh17zW2Sxm+Xa8GuKSGK
S5S6TXysaFoHf9DELDvCVq40CYKmtEJ5VYg2mHMgQl61APHb9Uqj/Vb6+P7hWUzy
YHSoz532bM/D7yW7YTJS2t7BIkL7zuWksHkSc8uy76ceObI6ZzzCS6elovYDWuHl
uhhOI7qKafDdcgiLFA5NhkQcXtyRzuf1ThdAPp8/o/a1rajh7r8WDZF59T8fl1yf
UsM/Gut5CZhPUNTJWhdcE2s9TdK31G3nCSCBzqhYYqh0+SDF5yXiR7bACW+oZU/5
T0ttlNJg/FCv2e+VS9//xe9Y7MgpK2h1G1aGfC6wvSTHnRJA5VcWJ5jCpXVHklyX
juSwo+NubG72aWoO5zFz
=J8d5
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--


--===============3153928112175093778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3153928112175093778==--
