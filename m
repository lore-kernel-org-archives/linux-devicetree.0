From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: add binding for the Allwinner DE2 CCU
Date: Mon, 20 Mar 2017 10:55:25 +0100
Message-ID: <20170320095525.osvx5zba4xkfqm25@lukather>
References: <20170316204748.8596-1-icenowy@aosc.xyz>
 <20170316204748.8596-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0593311160=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170316204748.8596-2-icenowy@aosc.xyz>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0593311160==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bvtb6bi2qa3loh6l"
Content-Disposition: inline


--bvtb6bi2qa3loh6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 04:47:41AM +0800, Icenowy Zheng wrote:
> Allwinner "Display Engine 2.0" contains some clock controls in it.
>=20
> Add them as a clock driver, and make a device tree binding.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Docu=
mentation/devicetree/bindings/clock/sun8i-de2.txt
> new file mode 100644
> index 000000000000..c19496f037a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
> @@ -0,0 +1,31 @@
> +Allwinner Display Engine 2.0 Clock Control Binding
> +--------------------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun8i-a83t-de2-clk"
> +		- "allwinner,sun50i-a64-de2-clk"
> +		- "allwinner,sun50i-h5-de2-clk"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the display engine subsystem.
> +	  Three are needed:
> +  - "mod": the display engine module clock
> +  - "bus": the bus clock for the whole display engine subsystem
> +- clock-names: Must contain the clock names described just above
> +- resets: phandle to the reset control for the display engine subsystem.
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +de2_clocks: clock@01000000 {
> +	compatible =3D "allwinner,sun50i-a64-de2-clk";
> +	reg =3D <0x01000000 0x1c>;

Please use the full size of the memory area allocated to that device.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bvtb6bi2qa3loh6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz6cNAAoJEBx+YmzsjxAgkp0P+wVDmXMejCJewPQsa3US2c+E
Q8GtBjDThWmpPG8Plyrv4KyvxP7Dg/Zubev9WGU856z10O5WhAHne17M4gQj4pIh
ZAyI/pd67/0u0P9EK/e3Qcc2zuaWaWV+Rv5J62NoqoSY3aCMcl0mBF1k5XKkP1Kn
wV3oUDoMmaJU1u5wmzzvzfdLjFKBtgYdLYJlxDZzP+fuMs++TGY0YktbT94YFh+H
xwkyl3IdrvP6+adleacNs5jrOzndMhe0vVhzjJmc/VWX3FAYPt7Efxw12lPL4rvY
6lQ7LV2AtRvrrF2QRiRafEYtemv8er5OYxyTKScy5a/KqKrjR9H7uO6iZxqIUikf
fgRWc2t5nCrPQxxmn/O9NQcI34shEzJa9qAPsMzBFmLEhQ/OFACNS3ExjeU5VH/s
Jf4UCPbf4GhF3+PZ+FpyVT+cbZ2QErnnHXCTdvxk0leshQ+aHBYII8wymp2u1YjJ
uhqcqTherN8aA6eo4AGyCB1ECJ7aU4a31t37bX+d5t5Wc1TiyQlIm+rOoWkZS7JQ
oXxCRpBfFESkpLXgIRYYBiWmTTfMcbAsWGmMKW2hYFENKuTgZH1ww/iQ8wI0ijkJ
wEx1cBDBmWYYWrv8VDroqCuBcaE1DvC5vUZVrhNYiDVxX1lJL3fkcrk9jiI2g7NL
xy4MrjPMAbxkv2aCJytP
=um0S
-----END PGP SIGNATURE-----

--bvtb6bi2qa3loh6l--

--===============0593311160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0593311160==--
