From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 07/15] usb: phy: add notify suspend and resume callback
Date: Thu, 12 Dec 2013 22:27:22 -0600
Message-ID: <20131213042722.GG867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-8-git-send-email-peter.chen@freescale.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386897825-6130-8-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:37AM +0800, Peter Chen wrote:
> They are used to notify PHY that the controller enters suspend
> or finishes resume.
>=20
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  include/linux/usb/phy.h |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
> index 6c0b1c5..a747960 100644
> --- a/include/linux/usb/phy.h
> +++ b/include/linux/usb/phy.h
> @@ -116,6 +116,11 @@ struct usb_phy {
>  			enum usb_device_speed speed);
>  	int	(*notify_disconnect)(struct usb_phy *x,
>  			enum usb_device_speed speed);
> +	int	(*notify_suspend)(struct usb_phy *x,
> +			enum usb_device_speed speed);
> +	int	(*notify_resume)(struct usb_phy *x,
> +			enum usb_device_speed speed);
> +

I still don't think this is necessary. Why don't you just call
usb_phy_set_suspend() directly ? And why do you need the extra speed
argument ?

--=20
balbi

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqoyqAAoJEIaOsuA1yqREnnwP/RngnOiIjB/XKUgLR5MX9k4V
7cVXtJERo1eU4HIK2FlT34eN3Vff60tcLEMDGKq4NYSEOrfmpB0fwDt3h7Uq9Qei
0WPIKRw582C0V6UK2M4ZcxH8pGfWI7bfo+xIIzBy5PS/DT3NzDmtv8m1dEeczLI7
NAAXKEpa+AOTmc8qQHW9Agn8BkzRf6KuoWE89mTvDgSZ23fXKDK0UYU064RWOpwf
HMeSYO3IZBsy1Cn6/tIIOsKWpISsbP8JWCGugDokUaA6fLqYFxEe2dtzCvcdQk3X
MO8j2NU8k+nv0bngrEjbi/9TNvXs41BAOqq7yxC3eh7O0vbw1CEQWme91fhrB0WE
BMSqKLxclmft4XhLQEK8iTJ9k9xT/rAH1iWcsJD/JH3Ofyn2eXkLfrLnuE70GoCD
WK3mndnkR2j0KRK4GU2FeU9jL6roSpgBYArbyrmmByd9M0AM+eYR4ZnesaHuadLg
uUFlFNGY3wWK04BtPLaFQIF3QMlDkU1huI6LPEVbfP33sjGMLGYGOnkDFfa8S66S
Bl1JhkazRF/RUW9LpiiPWz2Vxs+oqljCsRm9g0z3jSSAxufGhWF8BRVw6rOjWzUV
u9X3lnJDvhGvTR5vpV6kStoI5YPsQ+X+nDT1T0ouql/2RTorOdSYY2v47cY4lO6h
Qqgm2tV2eiq3xa62AcpV
=j7yL
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
