From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: Rename reference-design-tablet
 touchscreen node
Date: Sat, 27 Aug 2016 00:34:29 +0200
Message-ID: <20160826223429.GM3165@lukather>
References: <20160826144226.29969-1-hdegoede@redhat.com>
 <20160826144226.29969-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mI5TpPl/qDRoXxBg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160826144226.29969-4-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--mI5TpPl/qDRoXxBg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 04:42:26PM +0200, Hans de Goede wrote:
> Rename the reference-design-tablet touchscreen node from gsl1680 to
> touchscreen, all? tablets seem to use the same power and interrupt
> gpio-s, but not all tablets use a gsl1680 controller making the
> gsl1680 name somewhat misleading.
>=20
> Also move the reg and compatible property to the actual tablet dts
> as they may differ per tablet.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mI5TpPl/qDRoXxBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwMP1AAoJEBx+YmzsjxAg6IUP/1Rhq6k8/W/yjuJGq5OxO5bp
x3ffrN8dVCJIm/HY9VZ8VZmbEcKwJ3P7d80YABgVbeD9MsppsxLKFAk9mnPp4K/Q
znrpKTY6E5xHHBx+julIbFc619Ivmx+v0/54M5kBRrTTzHfzuBU/rMi4Unf5eNRt
t9flKOhxXiq2DVCqms3Zs2R2kr87Is/qXuEr+1KUnajcg7IKg/XfieTXKZkXij0r
MlhgkOpX+FLXXKXOTq7nyZXCBqDYf1dhoM1J/aVGTAyvdrASah7O637otFmn3ypT
jd/yNDpUnU+n42KEW6F/oJtkgVuESZoa7wwwrWwjifkYv+MGMEdQkhirIoZintXU
Ghn1rVL3SU2iIyi6iCkJRvVfU8b4NtGrbuljiugt6HZ6n/9UwROhtfd67NdZj8n5
rNHy6qflti4W3QSatZEMkpRIIP0r0ojz1rQg3fYUmzMIOMGer6xXMzf1Qo7o6raQ
P8UcbfTc5dD+xFACWEYnf+P9qOoo+PYKePOIaYkNcuovgW5oEPbyUIJwosRfNSO6
KaFkg/wSmYe/Haos6vlR0DAd03wQ/cAs9cPBhzHokPzzZPmx2IbJcUR9n4StGVdy
lFqOoiZIRNPNCkR3Vmtz4oN9uEsZSfiO12QwhKY5CSVEiV+7khKdduICNoQE0AG4
uu0blED7CoovzU4aZ3/u
=pqSn
-----END PGP SIGNATURE-----

--mI5TpPl/qDRoXxBg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
