From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun5i: q8-common: Enable USB-based WiFi
Date: Thu, 23 Jun 2016 14:01:26 +0200
Message-ID: <20160623120126.GB3785@lukather>
References: <1466674155-3365-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466674155-3365-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2016 at 05:29:15PM +0800, Chen-Yu Tsai wrote:
> The early A13 Q8 tablets all use a Realtek WiFi module connected to
> USB1. The module is powered by AXP209's LDO3 at 3.3V.
>=20
> Move the related settings from sun5i-a13-q8-tablet.dts to
> sun5i-q8-common.dtsi, for all q8-based tablets.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXa8+WAAoJEBx+YmzsjxAgeQAP/RgHFHzMU2e7oJvVB/cgx7w2
nbgTSIHUQMx5Spqcx6yGCbQ/mf0/SYShFoDelyu90r9qBijyqO9zP14g4Pmzik9Y
k5W2S54QxXqHnA4U2Sl69qHpBT/q5BPg+1TILdveoMWBXtlv+GwoonnoiaDA3JSz
GX8jz+8WFQksKbFtyuWkptdHvhcIo3Wj9kFCCLnLPIC4wxuIdaVaRF6Bf02JH5Ru
dmuWCZQgYdcAuC4R6Wm4FbfIX8mBnA+1QiG39e4KJ1zltcoxMQiw3thsB+QmKxe1
4I1PYHNpL8UQz8uF3xeAPKWHoRjsEIAruzYtbqwcMiobz0Rv7X249piKnTpcKljA
uuN7o6a+YoWmpv5GGU93tG7dhuTvIPHhgDXhhx/+3Su3I2hOdDSmU4IIML4cANWx
1l6L+3c2rqZNxeqZPpU08HyFZUH1Th2SXliMkpKuh0HjyuGlXtT7oEN/nxAGqCfi
AfltoknpgwDo1QlYLgzMxIwmupnlQLbXPmBXb62WqbW4Hh12GSjuY2NwpHTxIRYf
MJO2Edr+bACUOe8KbQUJMD1ltVzIEsf5SdAlub+7sqoCLmduEU0wwHSQ/Sz8y61x
5rA98i22cT/iKr1gsHT/BU4LStqeMvo4z/4Xw7jUn3brnFyelLtv8m7CMcFV9VoH
CC7zzYc7bI/VBIkN9LD0
=HuES
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
