From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v2] uio/pdrv_genirq: Add OF support
Date: Thu, 14 Apr 2011 18:59:31 +0200
Message-ID: <20110414165931.GA19228@pengutronix.de>
References: <1302774106-32764-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1302774106-32764-1-git-send-email-monstr@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Thu, Apr 14, 2011 at 11:41:46AM +0200, Michal Simek wrote:
> Support OF support. "generic-uio" compatible property is used.

This description is not true anymore. Please also add a short paragrpah how=
 it
is intended to be used now.

> Signed-off-by: Michal Simek <monstr@monstr.eu>

> +		uioinfo->version =3D "dt";

Minor nit: "devicetree" is probably more descriptive.

> +
> +		/* Multiple IRQs are not supported */
> +		if (pdev->num_resources > 1) {
> +			struct resource *r =3D &pdev->resource[1];

Are you sure the irq-ressource is always [1]? (Similar question for the
if()-block above). Try platform_get_irq().

> +#ifdef CONFIG_OF
> +/*
> + * Empty match table for of_platform binding

While it probably doesn't make change to put every supported device in
upstream, it still deosn't technically have to be empty. So, mabye drop this
comment and add something like "/* empty for now */" to the table?

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAk2nJ/MACgkQD27XaX1/VRsuNgCfdS6fQTSKO9qBpXWJbYmCa7fA
wxEAoLsL3ta1bfx6AjjcOvBsUkOWJkLu
=0VEc
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
