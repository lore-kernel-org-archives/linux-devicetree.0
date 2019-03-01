From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] ARM: sun8i: h3: bluetooth for Banana Pi M2 Zero board
Date: Fri, 1 Mar 2019 17:42:49 +0100
Message-ID: <20190301174249.59cd960d@aktux>
References: <20190228212840.24964-1-andreas@kemnade.info>
        <20190301143632.kzlr4jphq3rceos6@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0aemLcy6RyPSQCs9We_xvOu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301143632.kzlr4jphq3rceos6@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/0aemLcy6RyPSQCs9We_xvOu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Mar 2019 15:36:32 +0100
Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> Hi,
>=20
> Thanks for your patch
>=20
> On Thu, Feb 28, 2019 at 10:28:40PM +0100, Andreas Kemnade wrote:
> > The Banana Pi M2 Zero board has an AP6212 BT+Wifi combo chip
> > with broadcom internals attached to UART1 and some gpios.
> > This addition is in line with similar boards
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 29 ++++++++++++++=
++++++++
> >  1 file changed, 29 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arc=
h/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > index 1db2541135a7..39e206fac4e3 100644
> > --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > @@ -69,6 +69,8 @@
> >  		compatible =3D "mmc-pwrseq-simple";
> >  		pinctrl-names =3D "default";
> >  		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> > +		clocks =3D <&rtc 1>;
> > +		clock-names =3D "ext_clock";
> >  	};
> >  };
> > =20
> > @@ -122,7 +124,34 @@
> >  &uart1 {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +	uart-has-rtscts;
> >  	status =3D "okay";
> > +
> > +	bluetooth {
> > +		compatible =3D "brcm,bcm43438-bt";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&bt_pins_out>, <&bt_pins_in>;
> > +		clocks =3D <&rtc 1>;
> > +		clock-names =3D "lpo";
> > +		vbat-supply =3D <&reg_vcc3v3>;
> > +		vddio-supply =3D <&reg_vcc3v3>;
> > +		device-wakeup-gpios =3D <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
> > +		host-wakeup-gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
> > +		shutdown-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
> > +	};
> > +
> > +};
> > +
> > +&pio {
> > +	bt_pins_out: bt_out {
> > +		pins =3D "PG12", "PG13";
> > +		function =3D "gpio_out";
> > +	};
> > +
> > +	bt_pins_in: bt_in {
> > +		pins =3D "PG11";
> > +		function =3D "gpio_in";
> > +	}; =20
>=20
> You don't need any of those pinctrl nodes, GPIOs work fine without.
>=20
ok, that makes things easier. I will resend a v2 without them.

Regards,
Andreas

--Sig_/0aemLcy6RyPSQCs9We_xvOu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlx5YQkACgkQfb1qx03i
kyRfcxAAocObObjJgz3viX72ozjLYYWEsJ61fw6JUaBdH87Lh/gelf1uj+oVDKgH
LMD7njYsISPqfDmfNwtkwIYu0/NTXqgEOd0WJSEIS4RvTSfTichIx3LpsuVxBdEU
jw8xDa1f8SfgxMHoFcMxkzBXzcrxIqGELHy66n+NCj+e68vp1YZghFUbwmWbB0Qs
Z0KWywIP0rTKRSwzPFS5py2f+EHuXiajwiAdirBnwaz4VDqSRtX/ysqPif7LQtyP
43INhJqI56FpbO2Jrj0ZvgMyopYIbyFD5V8iEGs+u3T9vwwtIYi0MAbIG8bCn8sz
rTLjE8mb4IYqSZTCUIFiDH+fc5xcGz7kGPg2i3r/UC2TJ/rGkgH/WGk1VOH13GxT
DJlRL3dxS/xo/p+HcOGSdP9QL/GftSzq+s8ik1jlv35KDcNkryQgxjPBsjlwPH6D
YBpVnCgn8oYdHBJlzxZ/XgnlViJ8Q8cS+NJbAjtmR7GbLShYz7WicfTtc1HpPOr8
d9zBCadzvlrlHTuaZIonIw0agfeUa1+D16WzbXZ0drC/Xb29z3w03SfCwk/EhkRN
LeJyNAsmbKMSDj5oC+ORA2Kd+tCMX8k75Xh7yLpXjeR32VwyhUYWQNuOkk0lVU9M
2+BVRs6eq9e8x/JP+1vVB4iGcGWYXppdH171yd3XR5cUpva48vE=
=jpDM
-----END PGP SIGNATURE-----

--Sig_/0aemLcy6RyPSQCs9We_xvOu--
