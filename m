From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCHv4] arm64: dts: allwinner: a64: teres-i: enable backlight
Date: Tue, 12 Feb 2019 09:34:02 +0100
Message-ID: <20190212083402.tb43rxa6pkq3ctok@flea>
References: <20190209104018.6765-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8969224904763226706=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190209104018.6765-1-harald@ccbib.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8969224904763226706==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7kjgubf4vlob5jm6"
Content-Disposition: inline


--7kjgubf4vlob5jm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 09, 2019 at 10:40:18AM +0000, Harald Geyer wrote:
> Enable pwm and add a pretty standard backlight node.
>=20
> The regulator is always on, but we include it anyway, because it is
> required by the binding document.
>=20
> Signed-off-by: Harald Geyer <harald@ccbib.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7kjgubf4vlob5jm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGKE+gAKCRDj7w1vZxhR
xcCDAQC47v1EPuWItskGR2u5Yl+vpn+uibN/ON1cWU5Bz+KL+AEAor2oGLUEtih2
AnUW1uqSNSaQJfuXJNncZaFydybfGQk=
=TMlC
-----END PGP SIGNATURE-----

--7kjgubf4vlob5jm6--


--===============8969224904763226706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8969224904763226706==--
