From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESUBMIT PATCH v4 7/8] regulator: sky81452: Add compatible
 string for device binding
Date: Mon, 13 Oct 2014 12:35:12 +0200
Message-ID: <20141013103512.GJ27755@sirena.org.uk>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-8-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KOBxLkMFRQI9H+bc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1413179262-27636-8-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gyungoh Yoo <gyungoh@gmail.com>
Cc: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, lgirdwood@gmail.com, jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org


--KOBxLkMFRQI9H+bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2014 at 02:47:41PM +0900, Gyungoh Yoo wrote:

> -	np = of_get_child_by_name(dev->parent->of_node, "regulator");
> -	if (unlikely(!np)) {
> +	if (!np) {
>  		dev_err(dev, "regulator node not found");
> -		return NULL;
> +		return ERR_PTR(-ENODATA);
>  	}

If you're doing anything here you should convert the code to use the
simplified interface for parsing regulator data based on putting the
subnode name and regualtor name in the regulator descriptor.

--KOBxLkMFRQI9H+bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUO6rfAAoJECTWi3JdVIfQ9qcH/jzv0A79AYL4sIdrwwwOSc/e
IUxPbRYbjmlK7e+TAjP8NmNOqneuJjgV2MUbNai1RJadQfcRbiz5PjGYBWPEZ5rK
+DOaG/LfjcR7zbPx38GAYOLlkkaerIin0GlOYrfN5gI3nxbP1CNfbDq8iPToiN6D
diRwk4tEV6TOOB0x3hJB0JK7yDODExUz7T56BkrTl+FBFJ2QcOkLoYK5W1MbDF53
JlYddM2P3jdY0jh8BxvKV6gh0uhJTlmXbXAhG7r4e3F1AUGbgcS/cGwMAYhe4eyt
XrORHpshJTc2TOZ02EWtRzQGPSLoQKaXekt3iyc+xSeUHCOCamOc6oGrXAYtFBo=
=gpRg
-----END PGP SIGNATURE-----

--KOBxLkMFRQI9H+bc--
