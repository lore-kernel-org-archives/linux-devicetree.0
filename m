From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 2/5] ARM: dts: imx50: Add Kobo Aura DTS
Date: Tue, 26 Mar 2019 17:26:53 +0100
Message-ID: <20190326162653.GD2095@latitude>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
 <20190319152421.16179-3-j.neuschaefer@gmx.net>
 <20190322013151.GR12513@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190322013151.GR12513@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, thanks for your comments. I'll address them in v2.

On Fri, Mar 22, 2019 at 09:31:53AM +0800, Shawn Guo wrote:
> On Tue, Mar 19, 2019 at 04:24:17PM +0100, Jonathan Neusch=C3=A4fer wrote:
> > The Kobo Aura is an e-book reader released in 2013.
[...]
> > +	sd2_pwrseq: pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_sd2_reset>;
> > +
>=20
> Please do not have random newlines.

Does that apply to all empty lines between properties?

>=20
> > +		reset-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
> > +	};
> > +
[...]
> > +&iomuxc {
> > +	pinctrl_uart2: uart2 {
> > +		fsl,pins =3D <
> > +			MX50_PAD_UART2_TXD__UART2_TXD_MUX	0x1e4
> > +			MX50_PAD_UART2_RXD__UART2_RXD_MUX	0x1e4
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c1: i2c1 {
>=20
> Please sort these pinctrl nodes alphabetically.

It doesn't make a difference here, but should I generally sort by name
or by label in cases like this one?


Jonathan Neusch=C3=A4fer

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlyaUsUACgkQCDBEmo7z
X9sy1RAAniEdi+8w5/NPyQRbEYP4cdEcBxUhgP9VZXT1QxAxFoRDcYYOF0HUmu2g
qz5ppATEQ7+/rJZH9KTsOtNKEBW/+QjKs1gNa8ZYE9wWkF/LEz8twQHDv7VsmUbm
KJSUIOvXDvJ2U8PXLZowPjsOP+I6N7BQkxOGr0pDBcpsrm3INNHZYOXKfRzc5ogU
OuV6i9UDzS7/A/L2CORuOit/27R9iP0w8noLWgJdwW49Nx2lcnT9QXlFQYqAKvlY
GV25ht7eNJuPrh1RVm40zh59WT3vYQHS3vyVYoI8heSWx5pP7YuHLRZvUJgahXQ6
vn781Fz4zqp+7VqDscUk3xsy7K4oG0hsbBqBCUiyIsyz1ndAOEjbDoViCjfJRTeA
e0cnEX2ZXkm8EknLOSkahcqp1lCthVHdjgd7Q98OAYRCX30uGLlvSgqChZ09kzRF
RbUL/3EiLeJp58hXSMV0p9JH6ESVleiXmI5VGJT4LLI2SaQ6xtQM+dtta6w/CCsm
gS16xfRL/znFp4+ZtDFwbInDH/RRj+WWGETruMnX4pLgx+TiEJ57kL0psqDwjGDF
E8ha2On0qwh6x7VrjdGYvM/PeqkPxYYNJlsXZOUdpk0AQS0WDe/+jQvVIEXxQ9t/
bi8rxYU3QZFZTT4rkl/wXGhL5bRn35FTqFtmX5SuSfYysJ8rMhg=
=2tJW
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
