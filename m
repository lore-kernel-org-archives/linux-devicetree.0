From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: enable SDIO Wi-Fi on Orange Pi Zero
Date: Thu, 24 Nov 2016 22:30:11 +0100
Message-ID: <20161124213011.vyyfr6ikhgt3xath@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-3-icenowy@aosc.xyz>
 <20161123075950.fjtplylunwale6j4@lukather>
 <CAGb2v64taF9x9MDYW+KUEEUUoSx0bF68QNc7uZXQoNrsozMGtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8537951652175948285=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v64taF9x9MDYW+KUEEUUoSx0bF68QNc7uZXQoNrsozMGtg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Andre Przywara <andre.przywara@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============8537951652175948285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="egkksv3xq2ymvgum"
Content-Disposition: inline


--egkksv3xq2ymvgum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 10:25:57PM +0800, Chen-Yu Tsai wrote:
> >>  &r_pio {
> >> @@ -111,6 +148,11 @@
> >>               pins =3D "PL10";
> >>               function =3D "gpio_out";
> >>       };
> >> +
> >> +     wifi_pwrseq_pin_opi0: wifi_pwrseq_pin@0 {
> >> +             allwinner,pins =3D "PL7";
> >> +             allwinner,function =3D "gpio_out";
> >
> > And same thing here.
>=20
> Might we do away with the pinmux for gpio pins tradition?
> Recent patches I've sent all omit them.

Oh, yes, that's true.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--egkksv3xq2ymvgum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYN1vjAAoJEBx+YmzsjxAgfTkP/3igca1V4/zoyReXfrvFXCtM
506Ubsf4eEime7/44UYscdL9vNcWW3+r/NKaQUmuc9o2Kg2Q9etob3r+FXmmMlbX
g5Vzx7daMZE2ckPzLzCsij0THg5q+DZrDpYypNVA+NL7sgPralJP/R5m7VzqdXk8
/XAm0CxaVsCvpzD26zxsLob7jXs8yNeVwwZa57tNSI2DXN5KTwHTpahpJPQSQk/T
mhXI5I0XoWhVPmHBRDwP2IFe7RdUzCTJ6m50pdfTWTz7gg790C7V4fQFZcfg8qAr
GiZ615EikfIQkZ51m/NHNz8UGN7vHMIBbCdjh2isIDK4fIzIJCFaa6RHtRZ16R2O
e+u3vSYHNDRGv8/kvl8tz+IxkZnVMATAEXEue4pB6+V0C5exzXeO9qGFiCH0ZD1g
6/G+C8Y+fyG76A4Ff6SwhZIlf3+UqGHo4NbglOPIgDaRl6z9tNY+K5fP+YVRNs1z
b9JMfkH3agsMHaEiQaE8HwHY/HYHJRrql95tLWm0mAI8MXoszFN+MQaVZipFvLVS
AAP5Rk0Q1ZO5OI8ThQrZ+3ibXUewxIuuMS1DeZ96q2zIIDCaEaIBdAOiXm03QEHR
BLrEUuEXa2Yz8wKQZP4HONXj5z1ajSHf/GveKwruArPvopMmQDiOzBbWI4iK+eMw
5MV5TRVXZ2rWaJy1C4WZ
=rXMI
-----END PGP SIGNATURE-----

--egkksv3xq2ymvgum--


--===============8537951652175948285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8537951652175948285==--
