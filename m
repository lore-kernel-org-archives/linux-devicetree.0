From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 5/6] ARM: dts: sunxi: add dtsi file for V3s SoC
Date: Fri, 20 Jan 2017 21:48:11 +0100
Message-ID: <20170120204811.oqiscwuzn3emjrx4@lukather>
References: <20170119175448.11445-1-icenowy@aosc.xyz>
 <20170119175448.11445-5-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3198829114318312645=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119175448.11445-5-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3198829114318312645==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvsuelozp4qiyyig"
Content-Disposition: inline


--cvsuelozp4qiyyig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 01:54:47AM +0800, Icenowy Zheng wrote:
> As we have the pinctrl and clock support for the V3s SoC, it's now to
> run a mainline Linux on it.
>=20
> So add a .dtsi file for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Next time, please provide a description of what that SoC in your
commit log.

> +		rtc: rtc@01c20400 {
> +			compatible =3D "allwinner,sun6i-a31-rtc";
> +			reg =3D <0x01c20400 0x54>;
> +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +		};

Did you have the chance to actually test how the RTC was behaving?

Other RTC have been pretty bad at keeping time, this is probably
something you want to check.

Applied,=20
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cvsuelozp4qiyyig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgneHAAoJEBx+YmzsjxAgtH0P+QEK7eFuJEKq3c2/gX7Q5oBa
dIgLeUuaq7JwQsvOrcTtQlu6cFCzlCRbQbRXF78ylfjIjh7WmIg0DKWfHbmZkSwR
xsshWiXgmzXbo8jUmZUrPyFwtKDVU2xr1cqiSJt32r7mE3x6y/fCBSeo4I5Xrtzo
OL8MYOZYaT0v/YAVu/zK0f0WX392FbSfvOqeh9k1E9EKru30oGZnq1eU2sT/iEaF
pdEpal3hQZVuY8zLPoHKh8rKgYr4Uhxt4ciIH/nYMJT2rnmnqMm3F7DsujVr8QV2
AVYoAdlze7MZwS2b32HnPknVpwi2pD1vlu6PpCRRdXzh9FgV33np+B46Sd2rqHKu
eZtp4WfofbDHi4TleDprLa+VU0a18d3X2+1Dh4NreIrmAJxsA20ooOdAG7IZxddI
zHZuB1Ifw7OPGVPw5mZ+7cXWGsTeV68rb4JDsABgt4gEzDJns6AHRi2y04VY+G9+
f2FbyBr6RUKw6N/3kanXndPK+/kCfmxahdtbZgDcqeq0tr/eI1hjrrLk15A53zwM
nd9O4sm34X/h+0CVCcZNMDIwmB4eeVeyh5SKcEo80pRjYrHgJVXKdn513P7EDtVk
SRrBkHEuY4LO6WNK41oE/0YmymudnRFL+qBlG42chfxzoZHyZuIYQGv7wDe5LXpW
hVIjJQuAwnJWuFZRgCNZ
=p76S
-----END PGP SIGNATURE-----

--cvsuelozp4qiyyig--


--===============3198829114318312645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3198829114318312645==--
