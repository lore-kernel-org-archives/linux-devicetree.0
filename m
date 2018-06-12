From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Tue, 12 Jun 2018 14:42:12 +0200
Message-ID: <daba73df-037c-2583-3a08-f3f27c4129d1@pengutronix.de>
References: <20180517055014.6607-1-o.rempel@pengutronix.de>
 <20180517055014.6607-4-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Sj2PRcQlY7eZybdA0sq9wWzJEO8fKS924"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180517055014.6607-4-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Sj2PRcQlY7eZybdA0sq9wWzJEO8fKS924
Content-Type: multipart/mixed; boundary="d6BZYFRi4L3iCmOh3nm6wjii3dWC9QFDg";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Russell King <linux@armlinux.org.uk>
Message-ID: <daba73df-037c-2583-3a08-f3f27c4129d1@pengutronix.de>
Subject: Re: [PATCH v7 3/6] kernel/reboot.c: export pm_power_off_prepare
References: <20180517055014.6607-1-o.rempel@pengutronix.de>
 <20180517055014.6607-4-o.rempel@pengutronix.de>
In-Reply-To: <20180517055014.6607-4-o.rempel@pengutronix.de>

--d6BZYFRi4L3iCmOh3nm6wjii3dWC9QFDg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Last version of this patch was send at 17.05.2018. No other comment was
provided and this patch is a blocker for other patches in this serie.
Can you please give some feedback on it.

On 17.05.2018 07:50, Oleksij Rempel wrote:
> Export pm_power_off_prepare. It is needed to implement power off on
> Freescale/NXP iMX6 based boards with external power management
> integrated circuit (PMIC).
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  kernel/reboot.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/kernel/reboot.c b/kernel/reboot.c
> index e4ced883d8de..83810d726f3e 100644
> --- a/kernel/reboot.c
> +++ b/kernel/reboot.c
> @@ -49,6 +49,7 @@ int reboot_force;
>   */
> =20
>  void (*pm_power_off_prepare)(void);
> +EXPORT_SYMBOL_GPL(pm_power_off_prepare);
> =20
>  /**
>   *	emergency_restart - reboot the system
>=20


--d6BZYFRi4L3iCmOh3nm6wjii3dWC9QFDg--

--Sj2PRcQlY7eZybdA0sq9wWzJEO8fKS924
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsfv6QACgkQdQOiSHVI
77Qdywf/T0Izrw+e0Li53mUZBC1xxmYwoUcLfZawU2SQsO4BWC3bRpOycrT5AOIZ
lrCTbNjBWl9a1AVF4FhiWj+u7WaOwo4QWQTFPUwHJ4mBii/IWfEcz+l6Ivu0SSlZ
FrZ//lJlaG67yUWG23ZiGNVTpNrdIoy2Awe5fBCy27IBdRf0INY3mB+VxqdCOwUu
Ch2emdFFSNOQSOEWQJDz9EObHLqf/7adzNgXuIUpSO33rXO9LJPxdY4VOdzhbfy7
Vq6x+Zl54rwyW4stbtklrBnkjjbgbvzqOSIutUEMOMwheohpIcUa6r8jDZXpHnCE
CVRJI4cEfYuMFRFR+SAhEDFuYEYwyQ==
=0P0j
-----END PGP SIGNATURE-----

--Sj2PRcQlY7eZybdA0sq9wWzJEO8fKS924--
