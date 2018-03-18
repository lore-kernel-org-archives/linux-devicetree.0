From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net-next 02/12] clk: sunxi-ng: r40: export a regmap to
 access the GMAC register
Date: Sun, 18 Mar 2018 22:31:29 +0100
Message-ID: <20180318213129.ucwslzvwq6khxrcd@flea>
References: <20180317092857.4396-1-wens@csie.org>
 <20180317092857.4396-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2042047274983594640=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180317092857.4396-3-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Mark Brown <broonie@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============2042047274983594640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4a7ajsffxfx5sy2q"
Content-Disposition: inline


--4a7ajsffxfx5sy2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 17, 2018 at 05:28:47PM +0800, Chen-Yu Tsai wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>=20
> There's a GMAC configuration register, which exists on A64/A83T/H3/H5 in
> the syscon part, in the CCU of R40 SoC.
>=20
> Export a regmap of the CCU.
>=20
> Read access is not restricted to all registers, but only the GMAC
> register is allowed to be written.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Gah, this is crazy. I'm really starting to regret letting that syscon
in in the first place...

And I'm not really looking forward the time where SCPI et al. will be
mature and we'll have the clock controller completely outside of our
control.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--4a7ajsffxfx5sy2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqu2rAACgkQ0rTAlCFN
r3RZ3hAAgb4yQBq5NtA7jdHHhbmyPzWIGcsXEHA8fncNM8q+FTzBq7Qs0ZLdMClE
gWA3wHvAenbpP+Zg64Kia/4Wj3p2oA4nh84jvZnTZeNC2vsMjOBleKxFFMeFa45k
kqfpG+gpmklO4BL9XB5vyYCLmez3/VpEHUEPNlaOtbvPvnLbksHTPyedD8O8AwY2
ZDgXqI+vSN/oseNfwEI1Ssp1yT7WKnmEhyI8aOuXttdSxgbb8jhS4gb8IPBXF0tx
szW3PcZctdVsTQH4nOhLYvT6kQzk4IWMYD3wf6g5LUhKY5ThVrICAR5tnf+irKa8
ngk6OIMtYvkJ5yN1VjnjLkBXvSWxohSIWP1OQFsOMJu1zgcNEsM5IQEEO10ICwvC
v2EApmLkLeFjlFX6FTyhz6NsjawoTCF5+WrSBEBTbmo6u/8SOzPJhSMdWCuaMWV6
3W5q7V9dxYaVLzfyQrzsFhRtoiuOxxDpskfAQDmmb7T+dJRWbyy8+ckiWboMqrP7
R5UykJzJZriN0Xd+Bd4FHQZoyqVWOLZ8nplKrDRNF/M3f6b7NC+Rbp1A+TUbA/OB
aMzRukKj47+jEBGfWzuKS74rD0Y71JlQ4AHn4PRzDq2tkJcE5SFu40Z5/ScIXWib
wBFQwY79gRclFrxdDqQabXU8RTu0Yd1UC4PPtN3+zRa/SMFw44o=
=WBGW
-----END PGP SIGNATURE-----

--4a7ajsffxfx5sy2q--


--===============2042047274983594640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2042047274983594640==--
