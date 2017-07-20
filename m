From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 11/18] dt-bindings: display: Add Allwinner MIPI-DSI
 bindings
Date: Thu, 20 Jul 2017 16:21:22 +0200
Message-ID: <20170720142122.petsm4u3oavjymui@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <41dca303c02faf350e765b81c36ddcddbba6f950.1499955058.git-series.maxime.ripard@free-electrons.com>
 <20170717184149.sv4xdspjwnhmctog@rob-hp-laptop>
 <4634787.BNPAe4WyE2@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1762951962=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4634787.BNPAe4WyE2@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1762951962==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lefycozkciofqjvr"
Content-Disposition: inline


--lefycozkciofqjvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent

On Tue, Jul 18, 2017 at 01:18:42PM +0300, Laurent Pinchart wrote:
> On Monday 17 Jul 2017 13:41:49 Rob Herring wrote:
> > On Thu, Jul 13, 2017 at 04:13:06PM +0200, Maxime Ripard wrote:
> > > The Allwinner SoCs usually come with a DSI encoder. Add a binding for=
 it.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > ---
> > >=20
> > >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 85
> > >  +++++++-
> > >  1 file changed, 85 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt>=20
> > > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-ds=
i.txt
> > > b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt new f=
ile
> > > mode 100644
> > > index 000000000000..2e7c5aa7020f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > > @@ -0,0 +1,85 @@
> > > +Allwinner A31 DSI Encoder
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +
> > > +The DSI pipeline consists of two separate blocks: the DSI controller
> > > +itself, and its associated D-PHY.
> > > +
> > > +DSI Encoder
> > > +-----------
> > > +
> > > +The DSI Encoder generates the DSI signal from the TCON's.
> > > +
> > > +Required properties:
> > > +  - compatible: value must be one of:
> > > +    * allwinner,sun6i-a31-mipi-dsi
> > > +  - reg: base address and size of memory-mapped region
> > > +  - interrupts: interrupt associated to this IP
> > > +  - clocks: phandles to the clocks feeding the DSI encoder
> > > +    * bus: the DSI interface clock
> > > +    * mod: the DSI module clock
> > > +  - clock-names: the clock names mentioned above
> > > +  - phys: phandle to the D-PHY
> > > +  - phy-names: must be "dphy"
> > > +  - resets: phandle to the reset controller driving the encoder
> > > +
> > > +  - ports: A ports node with endpoint definitions as defined in
> > > +    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > > +    port should be the input endpoint, usually coming from the
> > > +    associated TCON.
> >=20
> > Output port for bridge/panel?
> >=20
> > > +
> > > +D-PHY
> > > +-----
> > > +
> > > +Required properties:
> > > +  - compatible: value must be one of:
> > > +    * allwinner,sun6i-a31-mipi-dphy
> > > +  - reg: base address and size of memory-mapped region
> > > +  - clocks: phandles to the clocks feeding the DSI encoder
> > > +    * bus: the DSI interface clock
> > > +    * mod: the DSI module clock
> > > +  - clock-names: the clock names mentioned above
> > > +  - resets: phandle to the reset controller driving the encoder
> > > +
> > > +Example:
> > > +
> > > +dsi0: dsi@01ca0000 {
> >=20
> > Drop the leading 0.
> >=20
> > > +	compatible =3D "allwinner,sun6i-a31-mipi-dsi";
> > > +	reg =3D <0x01ca0000 0x1000>;
> > > +	interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > > +	clocks =3D <&ccu CLK_BUS_MIPI_DSI>,
> > > +		 <&ccu CLK_DSI_SCLK>;
> > > +	clock-names =3D "bus", "mod";
> > > +	resets =3D <&ccu RST_BUS_MIPI_DSI>;
> > > +	phys =3D <&dphy0>;
> > > +	phy-names =3D "dphy";
> > >=20
> > > +	#address-cells =3D <1>;
> > > +	#size-cells =3D <0>;
> >=20
> > Not needed.
> >=20
> > > +
> > > +	ports {
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +
> > > +		dsi0_in: port@0 {
>=20
> I don't think the label for the port is needed, you should only reference=
 the=20
> endpoint.
>=20
> > > +			#address-cells =3D <1>;
> > > +			#size-cells =3D <0>;
> > > +			reg =3D <0>;
> > > +
> > > +			dsi0_in_tcon0: endpoint@0 {
> > > +				reg =3D <0>;
> >=20
> > Don't need reg when there's only 1 endpoint.
>=20
> And no reg for the port name either when there's a single port. This can =
all=20
> be simplified to
>=20
> dsi0: dsi@1ca0000 {
> 	compatible =3D "allwinner,sun6i-a31-mipi-dsi";
> 	reg =3D <0x01ca0000 0x1000>;
> 	interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks =3D <&ccu CLK_BUS_MIPI_DSI>,
> 		 <&ccu CLK_DSI_SCLK>;
> 	clock-names =3D "bus", "mod";
> 	resets =3D <&ccu RST_BUS_MIPI_DSI>;
> 	phys =3D <&dphy0>;
> 	phy-names =3D "dphy";
>=20
> 	port {
> 		dsi0_in_tcon0: endpoint {
> 			remote-endpoint =3D <&tcon0_out_dsi0>;
> 		};
> 	};
> };

I'll change that. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lefycozkciofqjvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcLxiAAoJEBx+YmzsjxAgq1MP/3O29SFoQU/CDCC0jxAMq+5X
P9Qau1FyM7pP3L9dbEVBO6RRZ4HiQstQsf1DS4s616W5ByfUmu89lja0BxwTFAA+
awcejZVUXD768FrQ2kjUVxgBfOu8CfVmrqYDRVQzmLgf9rN02+6XTMmvVdf/uDIt
8m7tupvjMXugRZBfvAl8g+WdxfPxu4nNDyUTXiLmdwf1Qagz7j7LTY9/zSSZwcKH
Moruw3evbG0UigVw3ijRLsbR5P4AauifDs8Gy50I+LK22tf2ZzaaUIJ7NmrbKuAZ
PNgtkDPxSeXU1G71qgxZYfQh3TsdNTNFqM1aw8Qga24D02bZL9y9SsRgE3AAl9LK
WEcMvqSEIOqspLA44u7VUtfGmT+R7yYnY2bK65MhuJN53Aq159ZNX5oRXAsewKwH
iS1tFbAHbJbITnXixeRefRNNw0r8deBUvWjCzHH2bQexkT8Oai5sxnI3cFcTkIaK
eMxxSDLxFhoSKaSzoVvzwvNm0t8Hdsgek6y4BO/xfSbWCCAs7jTeZTaIJAoofUJN
Fk37Rq0Rnm4nN4TP/V9mkGMQfILW7nHeCUyDfXA2pVku6s/f+foVJ4QrrrXhbA1f
NP8WuLqLc4mCX0b+1jB5V2JofolZPaTF3SaOQfeX62fxrq/+hTrQYJOKVbU3XXRu
kWOQptcPXDr4t0UX1r80
=54NG
-----END PGP SIGNATURE-----

--lefycozkciofqjvr--

--===============1762951962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1762951962==--
