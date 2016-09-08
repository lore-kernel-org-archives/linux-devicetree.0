From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Move A23/A33 usbphy and usb_otg nodes
 to common dtsi
Date: Thu, 8 Sep 2016 22:23:20 +0200
Message-ID: <20160908202320.GU8913@lukather>
References: <20160908032535.12987-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bGopQmzlzQgFk3Fg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160908032535.12987-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bGopQmzlzQgFk3Fg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 08, 2016 at 11:25:35AM +0800, Chen-Yu Tsai wrote:
> The usbphy and usb_otg nodes in the A23 and A33 dts files only differ
> by compatible, and for the usbphy, the size of one of its register
> regions.
>=20
> Move all the common bits to the A23/A33 common dtsi file.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>=20
> Hi Maxime,
>=20
> This patch applies on top of your A23/A33 CCU patches.

It was not applying properly. I think I did the proper fixup, but
you'll probably want to double check.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bGopQmzlzQgFk3Fg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0ci4AAoJEBx+YmzsjxAg8rkQAJ1AehUAdM0ahC12bMhwc09j
knmH7ov2bxMFYLQ7OGboaqGVpwUd0zT7ZIPXrc7xCnloKDUCGlFp2ZkhL6kesQW4
eqTpnaPrCgvZmitkpUNBXjaJHD7UbtTG3OmFeLQDDJdIpFBuQ5t70ymbcRh+QyjD
TNuCK94VXaisBNQ/LqIbsG4tTwNqQEDsk2LKnlV2fbuDnftVogCUbg2zQptoEae8
x2v8M3bhsr4AswTc6aDU6oXSOmSNuL7CsCnn9s7sXZzUGoX4xIcztUhrZ1ytPEOs
p1hPuKN4MfHYd4AE8kLDSP9gupyDbOcvqZXUsBZHd9dTHZNA/Qo4J42JVotqdyeA
7oC/SU+Q2T4PvquUN0oShTAewoNngVnpDhjJz8Qmzh5khAEATBVa55qULCCVccEI
/I42ip1R6DcRR2sm29CqpXLsU9kI5OPwBFmRIccg3Or/yApb9MwA1K0kUXv4pRdY
YLhF6DG0m7wkdZElBNYZ30gzmhsQrXXwf1k74mJUZIAm7F49/HOavldFFafXa+qp
jW1y8u6sLUKoS7NZJRIqAV4QLrqF6NK1csviJkdBe2P16c6zYYgz0AYTL/zTrSg9
FHP0mAcu7aYR2ScnNnelb+Cbq/S3PJ3w/UnCSpcsS//znYHcQdC0belwL53cyXbL
w+sRBkDaD4CwgxQIq7po
=Co00
-----END PGP SIGNATURE-----

--bGopQmzlzQgFk3Fg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
