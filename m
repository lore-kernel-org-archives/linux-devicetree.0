From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCHv3] arm64: dts: allwinner: a64: teres-i: enable backlight
Date: Fri, 8 Feb 2019 21:17:11 +0100
Message-ID: <20190208201711.fqqvhqd7gbqnoefp@flea>
References: <20190208141629.14323-1-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8062259145461660037=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208141629.14323-1-harald@ccbib.org>
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


--===============8062259145461660037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n3ufijtwuazhhq7b"
Content-Disposition: inline


--n3ufijtwuazhhq7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harald,

On Fri, Feb 08, 2019 at 02:16:29PM +0000, Harald Geyer wrote:
> Enable pwm and add a pretty standard backlight node.
>=20
> The regulator is always on, but we include it anyway, because it is
> required by the binding document.
>=20
> Signed-off-by: Harald Geyer <harald@ccbib.org>
> ---
> The backlight node got dropped from the initial submission of the
> teres-i DT, because PWM support wasn't available in time, and I
> kind of forgot to resubmit once PWM was in. Sorry about that.
>=20
> While testing this patch I noticed, that sometimes on boot the
> brightness is set to max_brightness instead of the default specified
> in DT. I couldn't reproduce it reliably, but it seems to be related
> to changing the pwm period. I guess the logic trying to detect
> the brightness set by the boot loader gets confused in some corner
> case if the pwm periods don't match. However unbinding and rebinding
> the device to the driver always made it go to the proper default
> brightness, so the problem is clearly not in the DT.
>=20
> If the theory above is true, then it implies that the version of
> u-boot running on my laptop doesn't completely overwrite all pwm
> parameters. As this might be specific to my installation, I didn't
> mention the issue in the commit message.
>=20
> Changes since v2:
>  * Drop all the other stuff that got merged a year ago.
>  * Rebased on current sunxi/for-next branch
>  * Add power-supply property (just to conform to the binding)
>  * Use slightly different brightness-levels
>=20
> Actually I tried omitting brightness-levels completely, as it is now
> optional. However automatic calculation gives unreasonable results
> (depending on the exact value of pwm period). A report has been sent
> to the author of the code.
>=20
>=20
>  .../arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/=
arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> index 7b7b14ba58e6..2a78932d5d3b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
> @@ -21,6 +21,15 @@
>  		serial0 =3D &uart0;
>  	};
> =20
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm 0 50000 0>;
> +		power-supply =3D <&reg_dcdc1>;
> +		brightness-levels =3D <0 5 10 15 20 30 40 55 70 85 100>;

The backlight perceived brightness should increase lineary with each
step, which means that if you have ten steps, each step should
increase the perceived brightness by 10%. The eye being what it is, a
exponential sequence is usually a much better approximation.

It looks good otherwise, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--n3ufijtwuazhhq7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXF3jxwAKCRDj7w1vZxhR
xd9PAQDfIXB78qZpCvPrEnHhSPEk/+05+/hn9JH47upZR3ZpOAEAsOgI4hEfo5dU
/cNQ7sqdeDyZNY1GCGUFfIRDYRQx5AI=
=raX6
-----END PGP SIGNATURE-----

--n3ufijtwuazhhq7b--


--===============8062259145461660037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8062259145461660037==--
