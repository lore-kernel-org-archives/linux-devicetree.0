From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 04/10] dt-bindings: display: Add Allwinner MIPI-DSI
 bindings
Date: Tue, 6 Mar 2018 14:23:07 +0100
Message-ID: <20180306132307.onmqodndydwu3v5s@flea.lan>
References: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
 <eb9c3f0c0270334154b48605e2ded542236ced79.1519204731.git-series.maxime.ripard@bootlin.com>
 <20180301221543.szhh75wplyq4rvhd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2073760980=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180301221543.szhh75wplyq4rvhd@rob-hp-laptop>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2073760980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xrbqrypybnr7yb3y"
Content-Disposition: inline


--xrbqrypybnr7yb3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Mar 01, 2018 at 04:15:43PM -0600, Rob Herring wrote:
> On Wed, Feb 21, 2018 at 10:20:28AM +0100, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@free-electrons.com>
> >=20
> > The Allwinner SoCs usually come with a DSI encoder. Add a binding for i=
t.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 84 +++=
++++-
> >  1 file changed, 84 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun=
6i-dsi.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.=
txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > new file mode 100644
> > index 000000000000..cbcc673b9bcc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> > @@ -0,0 +1,84 @@
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
> > +
> > +Any MIPI-DSI device attached to this should be described according to
> > +the bindings defined in ../mipi-dsi-bus.txt
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
> > +dsi0: dsi@1ca0000 {
> > +	compatible =3D "allwinner,sun6i-a31-mipi-dsi";
> > +	reg =3D <0x01ca0000 0x1000>;
> > +	interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +	clocks =3D <&ccu CLK_BUS_MIPI_DSI>,
> > +		 <&ccu CLK_DSI_SCLK>;
> > +	clock-names =3D "bus", "mod";
> > +	resets =3D <&ccu RST_BUS_MIPI_DSI>;
> > +	phys =3D <&dphy0>;
> > +	phy-names =3D "dphy";
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> > +
> > +	panel@0 {
> > +		compatible =3D "huarui,lhr050h41";
> > +		reg =3D <0>;
> > +		power-gpios =3D <&pio 1 7 GPIO_ACTIVE_HIGH>; /* PB07 */
> > +		reset-gpios =3D <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
> > +		backlight =3D <&pwm_bl>;
> > +	};
> > +
> > +	port {
> > +		dsi0_in_tcon0: endpoint {
> > +			remote-endpoint =3D <&tcon0_out_dsi0>;
> > +		};
> > +	};
>=20
> Kind of odd to have a mixture of panel and port. I guess that's valid=20
> though.

I guess the most elegant way would have been to have the panel also
part of the OF graph, but we have to conform to the generic DSI panels
as well :)

> I'd recommend you put port under ports node so if you ever have=20
> another port you are not mixing unit-address spaces.

Ok, I'll do that.

> With that,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--xrbqrypybnr7yb3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqeljoACgkQ0rTAlCFN
r3SsBA/+Mc752L8vTvUgInFjgUhUnrblwMEQcm7aNO+iqgNm1AYbp4FY3zenX9Ba
EoXsqdfxeBaaP1B1tSkQzSjOFKIiCpkv+fTFed0cXSQcd/Fohc27CVljiKaYB+em
90g2HMdxqpaPWOKlDrH62q6JKnlYin+/9E4C80gtLD2YcimocpgrveH4myqqVcao
rujWljkmX7kRY9hySxDorNx2ciQCm7l9OTvLIYv0zuacGnx31LKHpw9ZtGiukA4A
3GTq4uQrlV1eez/Vg8zosEmgfshHL5tpci1L0h3HVswSaZAKYd2SfoUVC3C1QF/k
GsEokCASAN2tvaeNiZKFfxQ6uY34tzTewO1X4KDGEXhkwJ0qq3DyL5OQ14o7FcMr
vMFNDD+8knnh89qVatYYc1xnvF6Rkp6M6ggUQ8TggclQxb17qPm7eufEnWRj38eL
rrAax/NVqZetlLRh7QX5Ulc2heIRk7THGl5/S0/hOF9QwBcil+A0tqg3JvC/Zs+i
SS1FeRlyD7mvKq1Hkb+hdSOLnYC4m+z5P80vdb90b9y0+y+3r4QgH/EEhW1hm8TV
CO/ggT7Eyu98Yfr7i/mxC/BCbkCCJOw61LSB9GMuuwbZTr1aFUofTUTUxqUTM7Nv
sAwQqm9ONeiD6JefhI8VN98Z0mFOgZdZBcI4CWZrVuzESe6cJnI=
=eTXM
-----END PGP SIGNATURE-----

--xrbqrypybnr7yb3y--

--===============2073760980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2073760980==--
