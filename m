From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for
 LAN8710
Date: Fri, 1 Sep 2017 15:06:56 +0200
Message-ID: <20170901130656.tfiqepmxxh2zrfee@flea>
References: <1503901963-9457-1-git-send-email-stefan@olimex.com>
 <1503901963-9457-2-git-send-email-stefan@olimex.com>
 <20170830143728.friajjequvioqjpu@flea.lan>
 <e7e61776-b8d7-c42f-4e9e-04da835374a9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1331137536867260590=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e7e61776-b8d7-c42f-4e9e-04da835374a9@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Mavrodiev <stefan.mavrodiev@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stefan Mavrodiev <stefan@olimex.com>, linux-sunxi@googlegroups.com, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1331137536867260590==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="igbzx7m6so37linx"
Content-Disposition: inline


--igbzx7m6so37linx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 08:20:18AM +0300, Stefan Mavrodiev wrote:
> > >  From revision J the board uses new phy chip LAN8710. Compared
> > > with RTL8201, RA17 pin is TXERR. It has pullup which causes phy
> > > not to work. To fix this PA17 is muxed with GMAC function. This
> > > makes the pin output-low.
> > >=20
> > > This patch is compatible with earlier board revisions, since this
> > > pin wasn't connected to phy.
> > >=20
> > > Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> > > ---
> > >   arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 7 ++++++-
> > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/a=
rm/boot/dts/sun7i-a20-olinuxino-micro.dts
> > > index 0b7403e..cb1b081 100644
> > > --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> > > +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
> > > @@ -102,7 +102,7 @@
> > >   &gmac {
> > >   	pinctrl-names =3D "default";
> > > -	pinctrl-0 =3D <&gmac_pins_mii_a>;
> > > +	pinctrl-0 =3D <&gmac_pins_mii_a>,<&gmac_txerr>;
> > >   	phy =3D <&phy1>;
> > >   	phy-mode =3D "mii";
> > >   	status =3D "okay";
> > > @@ -229,6 +229,11 @@
> > >   };
> > >   &pio {
> > > +	gmac_txerr: gmac_txerr@0 {
> > > +		pins =3D "PA17";
> > > +		function =3D "gmac";
> > > +	};
> > > +
> > The patch looks fine, I still have one question though.
> >=20
> > Can a PHY operate without this signal? My real question is, would it
> > make sense to mux that pin for all the users, or is it an optional
> > signal that each board designer can choose to use or not?
> >=20
> > Thanks!
> > Maxime
>
> This phy (LAN8710) cannot work without this pin. Part of the problem
> is in that we've replaced without paying attention to this signal.
>=20
> RTL8201 has no TXERR pin. The pin PA17 is used as reset signal and
> therefore is pulled up with resistor. However on old revisions this
> option (there is jumper pad between SOC and PHY).
>=20
> As I said, LAN8710 cannot work without this signal. In the datasheet
> is written:
>
> 	...
> 	The controller drives TXER high when a transmit error is detected.
> 	...
>=20
> In the current variant of the dts, all data is threated as error.

Sorry if my question was unclear, I meant to ask for all PHYs
connected to an A20. I got that you were needing it for that
particular one :)

> So to answer you question. This is feature only on our board and
> highly depends on the chosen PHY.  I don't think this should be
> muxed for all users.

Ok, I guess it answers it. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--igbzx7m6so37linx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqVtwAAoJEBx+YmzsjxAgPP8QAIVqoYjLl/345HiGHjYDuYm6
eNpVEeeffrIvKMJBkEz3hdijHJXocVtzudm3I+gMGzJcEQxmHPjesS0jqKLpRkAT
mWRO8bjES0562StfefshDZtXLjhHFnmal+9nGsvHW43gHW8FuGtGLSR5LVCqgnIP
Y9M5M0iOtcZfX3egbYJ9A8NNdC3H/7aPwX85Trxbu2TMwReFSYta6QkkHjiR1sA0
q3uT7a9Pht7WNcHy3TVeKFY7o6aI9PuONNdldIcBVC/lzGHdLIE/qnKhgaOIB/G5
IzSFwfzKxFkbKI8jJ5Cg2XDgDJz0iOlyvuvvlp0pcZfX0U/1sY9Pv6a2pfQSyyEj
xHqYIZP7BpCNV6gthG3zerK3m5VRPgqLm5j7obC9E3XlcozqpCnkr2fFc0EPt2tr
EHPuXIoiklskfHOKP7Y0fQw7bMbzRKK9udCAi/6NBMnGSjM1UXXh+hlRGfYvIsWz
5ZFAeiljQITMV3sZeOwKldolQhPWOdmfrSM2dnLKyFRE1ZAZl4i4gUijB0K+chRB
KPFZRHFysi9pHcpRQjNQ+TzNINWwQOo+U/SOe2H4DbymnlN/GPDRJ6L+IhaVZGhU
j9kzPqsNVvRZAUcSo8WSWdkT1qkkOqEHmRSmw1JEkQKhKglGbHdeQUWH0CyVoGVs
RSiqVkwEetSKlEgSwpZ3
=3pit
-----END PGP SIGNATURE-----

--igbzx7m6so37linx--


--===============1331137536867260590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1331137536867260590==--
