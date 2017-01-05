From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
Date: Thu, 5 Jan 2017 20:04:03 +0100
Message-ID: <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
References: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JJ8Vvqv6Mfa4dJ0qNrQRE16HXMlDoqFWJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JJ8Vvqv6Mfa4dJ0qNrQRE16HXMlDoqFWJ
Content-Type: multipart/mixed; boundary="anoo8XCAdbfswIQlb0nnRM1LRGIF5OU98";
 protected-headers="v1"
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
References: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>

--anoo8XCAdbfswIQlb0nnRM1LRGIF5OU98
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hello.

The patch causes cpufreq module (scpi-cpufreq) not to detect cpufreq, so
it actually works, but...
Loading the module causes few errors because of not found frequencies or
something, then it is all okay. However after loading scpi-cpufreq you
cannot actually power the cpu off and on. You will power it off
successfully, but when trying to power it on, the cpufreq driver will
error out, and then after it happens, the cpu that was trying to go
online will be offline again, and that is a little... unfortunate. The
question is, and I cannot really test that: will the module actually
autoload after this change?

W dniu 05.01.2017 o 16:02, Neil Armstrong pisze:
> The current hardware is not able to run with all cores enabled at a
> cluster frequency superior at 1536MHz.
> But the currently shipped u-boot for the platform still reports an OPP
> table with possible DVFS frequency up to 2GHz, and will not change sinc=
e
> the off-tree linux tree supports limiting the OPPs with a kernel parame=
ter.
> A recent u-boot change reports the boot-time DVFS around 100MHz and
> the default performance cpufreq governor sets the maximum frequency.
> Previous version of u-boot reported to be already at the max OPP and
> left the OPP as is.
> Nevertheless, other governors like ondemand could setup the max frequen=
cy
> and make the system crash.
>=20
> This patch disables the DVFS clock and disables cpufreq.
>=20
> Fixes: 70db166a2baa ("ARM64: dts: meson-gxbb: Add SCPI with cpufreq & s=
ensors Nodes")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch=
/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 238fbea..5e63e3b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -137,6 +137,10 @@
>  	};
>  };
> =20
> +&scpi_dvfs {
> +	status =3D "disabled";
> +};
> +
>  &uart_AO {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&uart_ao_a_pins>;
>=20


--anoo8XCAdbfswIQlb0nnRM1LRGIF5OU98--

--JJ8Vvqv6Mfa4dJ0qNrQRE16HXMlDoqFWJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFPBAEBCAA5FiEE8PeJXyv9t1Bfiq63mRxoPZnIFPkFAlhumKMbHHdlYmN6YXRf
MjAwQHBvY3p0YS5vbmV0LnBsAAoJEJkcaD2ZyBT5LigH/3qRpxRHuPpYX8d7qRiE
NZhbeIGqPYBpbxgmW03hLLdztRpDJWDeXWMvh6Ny9WHwqGPv0Ttvs81T4MVMCr3M
3QqXADLmPTAj1Iz1sy55w1RsWbD4eIO7qZIc/HTXklQc6uRiFE0Cv7rgXxJV0f01
QRcyraUX0MVllSzFNy2zPyY3ERQhr1tOlDmvN/g0FKE/RoN1nRG0Wg2FUE55m19B
1TGqKeeq3YUF3uC1rl5i0U/qezqAt+7/7+K1utU8l4SPsWp9IUIPH0GhnRK+7Ond
jlS/36WDnk18VPR/q/CKO6peJOnBDwn9aXUsDfnj8hu4ggcaQkXVp2j1p2BjOsh8
VfA=
=sNEX
-----END PGP SIGNATURE-----

--JJ8Vvqv6Mfa4dJ0qNrQRE16HXMlDoqFWJ--
