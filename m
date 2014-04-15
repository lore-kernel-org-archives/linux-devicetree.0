From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
Subject: Re: [PATCH] dtc: add ability to make nodes conditional on them being referenced
Date: Wed, 16 Apr 2014 00:16:37 +0200
Message-ID: <12484017.EBrG8OPNT6@phil>
References: <199290403.sj4aYrj8FC@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <199290403.sj4aYrj8FC@diego>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 16. M=E4rz 2014, 22:22:02 schrieb Heiko St=FCbner:
> From: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
>=20
> On i.MX, which carries a lot of pin-groups of which most are unused o=
n
> individual boards, they noticed that this plethora of nodes also resu=
lts
> in the runtime-lookup-performance also degrading [0].
>=20
> A i.MX-specific solution defining the pingroups in the board files bu=
t
> using macros to reference the pingroup-data was not well received.
>=20
> This patch is trying to solve this issue in a more general way, by
> adding the ability to mark nodes as needing to be referenced somewher=
e
> in the tree.
>=20
> To mark a node a needing to be referenced it must be prefixed with
> /delete-unreferenced/. This makes dtc check the nodes reference-statu=
s
> when creating the flattened tree, dropping it if unreferenced.
>=20
> For example, the i.MX6SL pingroup
>=20
> 	/delete-unreferenced/ pinctrl_ecspi1_1: ecspi1grp-1 {
> 		fsl,pins =3D <
> 			MX6SL_PAD_ECSPI1_MISO__ECSPI1_MISO 0x100b1
> 			MX6SL_PAD_ECSPI1_MOSI__ECSPI1_MOSI 0x100b1
> 			MX6SL_PAD_ECSPI1_SCLK__ECSPI1_SCLK 0x100b1
>=20
> 		>;
>=20
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
> Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>

ping?

Is this ok, bad, something else entirely? :-)


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree-co=
mpiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
