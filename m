From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 11/12] usb: phy-mxs: Add system suspend/resume API
Date: Thu, 26 Dec 2013 10:25:20 -0600
Message-ID: <20131226162520.GC3937@saruman.home>
References: <1387857536-4996-1-git-send-email-peter.chen@freescale.com>
 <1387857536-4996-12-git-send-email-peter.chen@freescale.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387857536-4996-12-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 24, 2013 at 11:58:55AM +0800, Peter Chen wrote:
> @@ -398,6 +433,29 @@ static int mxs_phy_remove(struct platform_device *pd=
ev)
>  	return 0;
>  }
> =20
> +static int mxs_phy_system_suspend(struct device *dev)
> +{
> +	struct mxs_phy *mxs_phy =3D dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		mxs_phy_enable_ldo_in_suspend(mxs_phy, true);
> +
> +	return 0;
> +}
> +
> +static int mxs_phy_system_resume(struct device *dev)
> +{
> +	struct mxs_phy *mxs_phy =3D dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		mxs_phy_enable_ldo_in_suspend(mxs_phy, false);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(mxs_phy_pm, mxs_phy_system_suspend,
> +		mxs_phy_system_resume);

this will give "Defined but not used" warnings when !PM_SLEEP.

--=20
balbi

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSvFhwAAoJEIaOsuA1yqREwa4P/R+UIyExE1jRe1Ndjj4Nk+FX
RF5xscO4XVaSISkEX6h25qWpHePuSVcB9DAl6CBX+jWSkhRzYVn4OwYEEQt1fdgZ
tVPji1wunkQKnVoz9t2uRXfOBpwaaxwQVfeSh2B0Cr57Kyr3EUkhkXpaPtp0sihX
nWk6OSlPIpJiGwzAUx1DWKapNwq0c57PmrXsUWMyU94wecsuwKXNEt2jUeCJumPt
ESSD8G0asXshFhGKP1Drxu4juTDSWgMNDCTCa3towDBC591Q4X6FssMpkp39oHfE
KlAT3Gk9WWdqIZemP0eDWnDERQPZ6aGkq59bSj3ZDQs1889fZlKPXsWzllGzsVp9
eHaw0GqRCnNyKX7DkLF0U4TwE7rwHOxQXuIM+zNDb7z1TedCZioq4mqRoKds849M
sGki6RjCdHSb2EkCiWyLO8BJp1Uh9k24ZCzJgHTfCBKpY2f15PrgFCBWDuVJQZPA
4lj9i+ZTFjybP0Wzce08umjTi4pG1FBpxPEdt95ohGlo1zEGKmU5gTKYhbSwn3Bd
pOGs49tTzSfJDJWCTmXvxOHvTjTanZS0SfKZkQMRsZpOVTZeEjo4XIQeueyodRyv
puDn/VC76jf+n03RU7SV960OnhLkT+vlHfiva1IchcM9qQ3QJNWRuuiqggHQfzFG
68u7sCxkb7nax8d5nNwc
=o2od
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
