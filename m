From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V2 0/3] ARM: bcm283x: Raspberry Pi Zero W support
Date: Thu, 03 Aug 2017 14:23:29 -0700
Message-ID: <87d18cxs4u.fsf@eliezer.anholt.net>
References: <1501434634-2325-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501434634-2325-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> This patch series adds support for the Raspberry Pi Zero W. It depends
> on "V2 ARM: dts: bcm283x: Move the BCM2837 DT contents from arm64 to arm."
>
> Currently there is a regression [1] in the brcmfmac driver. This hack [2]
> avoids the issue and make wifi probe on RPi Zero W.
>
> Changes in V2:
> - add aliases comment and gpio-line-names into bcm2835-rpi-zero-w.dts
> - rebased on V2 of arm64 to arm patch
>
> [1] - http://marc.info/?l=linux-wireless&m=150029709021719&w=2
> [2] - https://github.com/lategoodbye/rpi-zero/commit/95ef5b8fbc05d9ec086970648767cafa10483622

Reviewed and pushed to my dt-next, will try to get a PR out soon.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmDlFEACgkQtdYpNtH8
nugQEw//d4C9HtUCL1uKVY+9LqnNha0DYyghSKKcCiQvyIuvGlvGdX7D65tnb4qh
qtYpxWqwsCz7Ux4fpqr/Irg2EP9QgAxsggEpLSmQXqk14BGGrN8L1nU6bAKtG3gb
1A/lZ+tvz6o0JYM8J7iAfBTgErFXmlpYXb4fxabnsoFXY+pcO6BeHclrUGANe6BW
uBDh72fveo+SVZclFSqnno5yhvwwcdydnoqQk8DZlsJrFMUpfO0sllB2ZK8bq8eh
gQIGLgJ6SUMR1gzKV3xTHCQ7GLQAwqYMtGhGRbuvkk0bx5z9tNkstiiJ/sWVI75a
9PJbEyqt8jRmklCApf45kXzxTiIouenSNVxVqQHxhDTSb23RlGOaRpioIVNKiHGy
pKW+WFVwAyuoMTewfGk7c3gsdaN2wzPt15Vbc/tB03SjOfiGTZ2EYK61eyAE2TQn
E45IO+MvGmNReWG3JPNS0lq/8t4+RYj2xUqifBt45+xlD9Iyx+eZAjCVP9QhaHNK
Ecx8kQYfw08Mwg4bB5FkGMBHEyz+v/5XcauiUFuUDSc79simzI9QCr3zMOiN0+yu
gQrpEexGwq3CZqgmFi9R5qWyF0lyuMUk97+xgOr/96N0JFR8FC0A2hdXnN2CjY4v
mIhpnLnW3goJgYN4AvqnGEwvFhwygjqJ5BJBnBufxHCAJLTTflk=
=Jwp+
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
