From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/7] ARM: sunxi: Add debug uart used by sun9i
 (Allwinner A80)
Date: Thu, 25 Sep 2014 15:27:25 +0200
Message-ID: <20140925132725.GG15315@lukather>
References: <1411570141-29960-1-git-send-email-wens@csie.org>
 <1411570141-29960-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wQkw7DhpL9hyPo7K"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411570141-29960-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--wQkw7DhpL9hyPo7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 10:48:56PM +0800, Chen-Yu Tsai wrote:
> The uarts on sun9i are still compatible with the dw_8250, but are
> located at different addresses.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Queued for 3.19, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wQkw7DhpL9hyPo7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUJBg9AAoJEBx+YmzsjxAg+QEP/AtTa3/QBVwNArQSpRZ6de2Z
WISnNAU0+diBe07Cqteaj8V0lBs5FzRbItZFEsxXpA4GQ3JUqyFwiv6gBTt4YryB
QDww+eDeprRwAqpPSCeXepwGow0zXNw5aBu/lWEwWVizJmbUIANINbGx7nqKIoHT
L907EzI3RteVh4khd4YA0vQjIoQz0oH2ydmZcMoBCegbLcGA7s74YB37XEVRhG0b
jlds4YwkePOMxvjxjYu6gkQBxez0D55Vfj2TV/27BV7ou3K0GefcPb4oijrUKWBp
/HNik5OcfuKtmPxzwNTDFbfFhTCBikVvNf7cxsMHSNJeIJ+KYUOLmg1G9G0KS7BU
dXtBW9aGgeiMWCVO706yXIj8vJyN4wcczyNGRenGWiU//fo6zP74elsWKvw+SXnj
HPLzK7iAn9q3QZ8M7iB2o3k0KLGS/Qo1/6egAb/CmMwY/cd2VfvNjtYgcZ8EsDeI
0TR7I2/v20xbdt2l5hGNecpvJuz2fxd6hzv1dE7qbD/HaKRGBcDweoBXXCuq5zsN
XbkuRr8UKZzCDksj1eQXsOBS78iT36h3ZJhbrBJV40vCMDGKkgng1E7g/alhnQKk
Re63PrF5n2KO7yXpWKkFkiOqD/TvFt3ymwBQ80x+zKeyBJXjyN3obv+Z8p7Q96IQ
YbSyhQ62PcN4LE+dEaM5
=0jW+
-----END PGP SIGNATURE-----

--wQkw7DhpL9hyPo7K--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
