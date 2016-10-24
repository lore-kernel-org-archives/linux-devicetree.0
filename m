From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFT v2 09/17] regulator: fixed: Add over current event
Date: Mon, 24 Oct 2016 18:53:20 +0100
Message-ID: <20161024175320.GO17252@sirena.org.uk>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-10-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fpolVoprVozDR81Y"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161024164634.4330-10-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fpolVoprVozDR81Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 24, 2016 at 06:46:26PM +0200, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:

> +		if (ret) {
> +			pr_err("Failed to request irq: %d\n", ret);

dev_err()

> +++ b/include/linux/regulator/consumer.h
> @@ -74,6 +74,10 @@
>   *             the most noisy and may not be able to handle fast load
>   *             switching.
>   *
> + * OVERCURRENT Regulator has detected an overcurrent condition, and
> + *             may be limiting the supply output.
> + *
> + *
>   * NOTE: Most regulators will only support a subset of these modes. Some
>   * will only just support NORMAL.
>   *
> @@ -84,6 +88,7 @@
>  #define REGULATOR_MODE_NORMAL			0x2
>  #define REGULATOR_MODE_IDLE			0x4
>  #define REGULATOR_MODE_STANDBY			0x8
> +#define REGULATOR_MODE_OVERCURRENT		0x10

This is adding a new core feature with a new mode and should have been
split out of the driver specific change with a spearate changelog.  Why
does it make sense to report this as a mode, we don't report other error
conditions as modes but instead use REGULATOR_STATUS_ with the
get_status() operation?

--fpolVoprVozDR81Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYDkqOAAoJECTWi3JdVIfQrm4H/j8ppy9ICV8PbApuQVlmdQVy
O0yrpQZ+MEqJb+pQqxnlwSlSWeWFysUIOPHdi80OIJ/9EfJfjavmSA+EyblLWJfh
7gQ/+fy7KIaWACGORlLq8q1GVz4TvEVbLIC9oDpBIhzRp/Qs9mpK8NFqejFlLOoZ
V5UIVGLngb+DezWW2W6CT57/arJmyi20C9Mj5Y7URfzpeqT7WMbPBVwP0D500iAk
BysjGVZUzaFzNAKXypCXlnknJGespx67dvxAsWh4wp01n5BsoZvdCFv81xERrm7t
KjXybzY3ZdsrBOja1MLNGUqWBPYpq3zcVowi7QPZ0XmrVjUyMFb78CQatdUtw/k=
=fuoz
-----END PGP SIGNATURE-----

--fpolVoprVozDR81Y--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
