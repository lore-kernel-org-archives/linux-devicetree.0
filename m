From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 11/18] dt-bindings: display: Add Allwinner MIPI-DSI
 bindings
Date: Thu, 20 Jul 2017 16:19:45 +0200
Message-ID: <20170720141945.s2w2qcwnawsosz4c@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <41dca303c02faf350e765b81c36ddcddbba6f950.1499955058.git-series.maxime.ripard@free-electrons.com>
 <20170717184149.sv4xdspjwnhmctog@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1994584793=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170717184149.sv4xdspjwnhmctog@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1994584793==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bycugp2lt4gaarhh"
Content-Disposition: inline


--bycugp2lt4gaarhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Jul 17, 2017 at 01:41:49PM -0500, Rob Herring wrote:
> On Thu, Jul 13, 2017 at 04:13:06PM +0200, Maxime Ripard wrote:
> > The Allwinner SoCs usually come with a DSI encoder. Add a binding for i=
t.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 85 +++=
++++-
> >  1 file changed, 85 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun=
6i-dsi.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.=
txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > new file mode 100644
> > index 000000000000..2e7c5aa7020f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > @@ -0,0 +1,85 @@
> > +Allwinner A31 DSI Encoder
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The DSI pipeline consists of two separate blocks: the DSI controller
> > +itself, and its associated D-PHY.
> > +
> > +DSI Encoder
> > +-----------
> > +
> > +The DSI Encoder generates the DSI signal from the TCON's.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun6i-a31-mipi-dsi
> > +  - reg: base address and size of memory-mapped region
> > +  - interrupts: interrupt associated to this IP
> > +  - clocks: phandles to the clocks feeding the DSI encoder
> > +    * bus: the DSI interface clock
> > +    * mod: the DSI module clock
> > +  - clock-names: the clock names mentioned above
> > +  - phys: phandle to the D-PHY
> > +  - phy-names: must be "dphy"
> > +  - resets: phandle to the reset controller driving the encoder
> > +
> > +  - ports: A ports node with endpoint definitions as defined in
> > +    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +    port should be the input endpoint, usually coming from the
> > +    associated TCON.
>=20
> Output port for bridge/panel?

The DSI panels and bridges are subnodes of the DSI controller. But I
should mention that :)

>=20
> > +
> > +D-PHY
> > +-----
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun6i-a31-mipi-dphy
> > +  - reg: base address and size of memory-mapped region
> > +  - clocks: phandles to the clocks feeding the DSI encoder
> > +    * bus: the DSI interface clock
> > +    * mod: the DSI module clock
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandle to the reset controller driving the encoder
> > +
> > +Example:
> > +
> > +dsi0: dsi@01ca0000 {
>=20
> Drop the leading 0.
>=20
> > +	compatible =3D "allwinner,sun6i-a31-mipi-dsi";
> > +	reg =3D <0x01ca0000 0x1000>;
> > +	interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks =3D <&ccu CLK_BUS_MIPI_DSI>,
> > +		 <&ccu CLK_DSI_SCLK>;
> > +	clock-names =3D "bus", "mod";
> > +	resets =3D <&ccu RST_BUS_MIPI_DSI>;
> > +	phys =3D <&dphy0>;
> > +	phy-names =3D "dphy";
>=20
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
>=20
> Not needed.
>=20
> > +
> > +	ports {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		dsi0_in: port@0 {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			reg =3D <0>;
> > +
> > +			dsi0_in_tcon0: endpoint@0 {
> > +				reg =3D <0>;
>=20
> Don't need reg when there's only 1 endpoint.
>=20
> > +				remote-endpoint =3D <&tcon0_out_dsi0>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +dphy0: d-phy@01ca1000 {
>=20
> Drop leading 0.
>=20
> > +	compatible =3D "allwinner,sun6i-a31-mipi-dphy";
> > +	reg =3D <0x01ca1000 0x1000>;
> > +	clocks =3D <&ccu CLK_BUS_MIPI_DSI>,
> > +		 <&ccu CLK_DSI_DPHY>;
> > +	clock-names =3D "bus", "mod";
> > +	resets =3D <&ccu RST_BUS_MIPI_DSI>;
>=20
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
>=20
> For what?

I'll address those comments, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bycugp2lt4gaarhh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcLwBAAoJEBx+YmzsjxAg4g0P/A3RnJ5AeYbQkPPKW+629uJw
RI05/VB8X7TA8CYrMo3Dmk8ZJHlvkjkfn7DrgzC4raCbdgDIl/Ei+tjyrAU1Y7n9
ujQiO2GLl/pcu0uF1tyn4U+t8X6MKj5S5MhFO3S5+UYDAR6MUWOfjo7T9asQ8fH9
wE3RvIPuXYgzabwiz3txCgXioNgav89pRjnNNCqsF0ljSe0KSyFsmr0G8Aw6AV4Y
lQSI1g6/5BgI7ckSXIGAqOH5oaAcOvkhppQdDzl52iVfW2oqxx1axspqVurX3Wzo
23t/5vrXOCwYB73OOsVWAN2st0a2XF3jIDNPuxjADJ08IFn3/CXZwWS5cH0+fiV3
qu9rq+Hkte53DONvAMuMnk1foT7YKL/cmSOddrhRTadnH4OwTcd5lLzDWGMo4Cgl
6T9M+rsUhD8BBeYNoPmQ1gmWTmr1IahA1ncenHkp68Hg7LskIuc4r9vCQq8evyz2
/Rb++HXhGbPdfFK/2aXMDhHZ/ldld+r0l6xwIswALWM0dVk+ai+Pbeus6F2ErArc
aSN8uixDlaUk+lB4N7LCRkMtfaizFTFhdbs7qYZdHlcnqDLLOtC6GQWYiLqg19Tw
XKASDfiWmK+Zqz32ZzTXKNLdlQUYMpQRGbxU9SqgVTS7P6NxuiNgXK0P1YuoR5Pc
ZILjCkTO9dxh0DjvrIMe
=hezm
-----END PGP SIGNATURE-----

--bycugp2lt4gaarhh--

--===============1994584793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1994584793==--
