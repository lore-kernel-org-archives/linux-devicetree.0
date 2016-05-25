From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: dts: axp209: Disable ldo5 by default
Date: Wed, 25 May 2016 14:39:24 +0200
Message-ID: <20160525123924.GF9232@lukather>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
 <1463500571-28970-3-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463500571-28970-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 11:56:07PM +0800, Chen-Yu Tsai wrote:
> The output pin of LDO is also a GPIO pin, and the on/off settings of the
> regulator are actually pinmux settings.
>=20
> Disable it by default so it doesn't conflict with GPIO usage.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZz8AAoJEBx+YmzsjxAg0WEP/1flH+yf6LvgsJxeVmgXswbx
E3+zT00B4abqx+U5I7D0NUeS2q7e58Fq7NAisuL6C5d1xsifoga5T2D3ghPTykFc
2cvhEg2X97A8wRzhduFCRv4ZLTsMoPgoi2zT4HMSffXdy7onWGEDDX4Diwe+X+Iz
NGNADbmT/b7dJyB0Qlq5nBp9zfgZcQ4sqndlrMmz4S/wRJ21Q/ZKgZihKQv+4OlF
McrsiXa3imLg2ESPGwzxgv78O+wJ1xdwti/4bZRBK8OGq4vA63yScSABejCC70cm
Ad9FUKo92C+HiuHph8Y/MLGq7t+MKJKFsmzpbmDDTWxt6a7iKMXVEMnDGapG+t7p
gFqD/8yWDlny3h7pnrOT9ns6pIqe6RKaNiP2BZw0x1FrIOh7b1kSA2Hok9fPeamX
5XQS9UcB9Fk01aO3e2Ad8I1LR1Cqdf2gAaX/TpD5FOwG53Fu6Nia9gSoyEDSSekS
V18HUAIAjoBXfLLbPupp4jVOJV65y05DV5xW+37yTTjH6V4B1om9z9BT5wFdjulc
YlwY0sy+Ai06IZYv7n5HQMxnIGEtjg2Ce38dF2Mli1bE2ruvYcGi4EI/RVSwo8kP
KPDyMBkdZ2PoGV2ahh279/zpIpourESR1QTydvLNHPU42D7sApKOMY3c/YpoB2Fz
j6X0rcGPHGXpMXnmFGz/
=OIpC
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
