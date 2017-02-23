From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Add regulators for Sinovoip BPI-M2
Date: Thu, 23 Feb 2017 10:37:35 -0800
Message-ID: <20170223183735.23fzypxnvumsnpkr@lukather>
References: <20170223065539.47985-1-manu@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yjx3b5ltd2vqpfge"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170223065539.47985-1-manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yjx3b5ltd2vqpfge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 07:55:39AM +0100, Emmanuel Vadot wrote:
> Add the needed node for DFVS on Sinovoip BPI-M2.
> This add the axp221 under the p2wi node, the regulators and
> the cpu-supply property for cpu0.
>=20
> Signed-off-by: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yjx3b5ltd2vqpfge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYryvrAAoJEBx+YmzsjxAgvgMP/1PCOTjUS8sdGSyWI+XQ2UxX
pFCsixU35l5pJCdmxytYIy9LH86O9cx8jSmPdquAxn6opLGAAS9BZtsa+77i1oFV
CT5ddMx90o2R/IPmLi5XPj0GE3rzl5cnR59J5+p+OdoWOUzgN5mNno/sCxp+81nh
aKapqJJSMXwaWzFZ6eg3FA5Ci/YAXu7QG93cbVvJ3BCV+9Vh+fqrhNCQ811xH21s
ZFES93DaFXl3Y94i9qB3o973mlV8QP7F9qcvLSji7eq6770PuGtE6d6SLTdeCEwQ
b7WlhewT5+9YXTo39SBbVRA9+2UA57w7AJSw+vToDKAjxQkYuFhFvkls0MqPYKzK
jYFlEK+VRe0I3WxN/e/G846Upn+JdLxDJBxhYQDDG0wQgguOFoDUotCxvEVNgTnW
1wdrUAbX+NKB89r7bKmwMNtbIatzHFdHK6ptRSWCxKP59ZkRJvhCCRuQKMpkUW1v
GUDcEn51mrD2xA4yO3yhUKBCu+S4B9qure/+q0BpDNB8RCdQBJAjx69y3hbBIlpt
fZfaxYgbZioahLXew4u2UVehr65M5GOSzc7hkBEV5GcpKM4/iwUAxr4Y8Gs0BbVZ
dEmm5HP9nUrvRPc0upmmDZKarxXHUrB4ILzidj/sh0TGM4TApp3fI5S7fzhl6bfk
kea0xOn+uZXLvikbQ+hm
=Oplb
-----END PGP SIGNATURE-----

--yjx3b5ltd2vqpfge--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
