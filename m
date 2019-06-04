From: Benson Leung <bleung@google.com>
Subject: Re: [PATCH v9 5/7] dt-bindings: Add binding for cros-ec-rpmsg.
Date: Tue, 4 Jun 2019 10:57:31 -0700
Message-ID: <20190604175731.GB241153@google.com>
References: <20190531073848.155444-1-pihsun@chromium.org>
 <20190531073848.155444-6-pihsun@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190531073848.155444-6-pihsun@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2019 at 03:38:46PM +0800, Pi-Hsun Shih wrote:
> Add a DT binding documentation for ChromeOS EC driver over rpmsg.
>=20
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

>=20
> ---
> Changes from v8, v7, v6:
>  - No change.
>=20
> Changes from v5:
>  - New patch.
> ---
>  Documentation/devicetree/bindings/mfd/cros-ec.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Document=
ation/devicetree/bindings/mfd/cros-ec.txt
> index 6245c9b1a68b..4860eabd0f72 100644
> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
> @@ -3,7 +3,7 @@ ChromeOS Embedded Controller
>  Google's ChromeOS EC is a Cortex-M device which talks to the AP and
>  implements various function such as keyboard and battery charging.
> =20
> -The EC can be connect through various means (I2C, SPI, LPC) and the
> +The EC can be connect through various means (I2C, SPI, LPC, RPMSG) and t=
he
>  compatible string used depends on the interface. Each connection method =
has
>  its own driver which connects to the top level interface-agnostic EC dri=
ver.
>  Other Linux driver (such as cros-ec-keyb for the matrix keyboard) connec=
t to
> @@ -17,6 +17,9 @@ Required properties (SPI):
>  - compatible: "google,cros-ec-spi"
>  - reg: SPI chip select
> =20
> +Required properties (RPMSG):
> +- compatible: "google,cros-ec-rpmsg"
> +
>  Optional properties (SPI):
>  - google,cros-ec-spi-pre-delay: Some implementations of the EC need a li=
ttle
>    time to wake up from sleep before they can receive SPI transfers at a =
high
> --=20
> 2.22.0.rc1.257.g3120a18244-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXPaxCwAKCRBzbaomhzOw
wrfuAP9QcQ2v/pDWTXePJ8PoBlW9S+7RIpMiCvQTzUnjpZ+iKwD/bQPNeneMkrd5
fBrGE9T80lwQ9Bjy29YcKEPBBfGIRQI=
=SqoY
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
