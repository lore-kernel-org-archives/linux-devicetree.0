From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] Revert "ARM: dts: bcm283x: Fix DTC warnings about missing phy-cells"
Date: Sun, 07 Jan 2018 14:08:23 -0800
Message-ID: <87incdjp9k.fsf@anholt.net>
References: <1515332212-23593-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515332212-23593-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> This reverts commit 014d6da6cb2525d7f48fb08c705cb130cc7b5f4a.
>
> The DT clean up could trigger an endless deferred probe of DWC2 USB driver
> on the Raspberry Pi 2/3. So revert the change until we fixed the probing
> issue.

Why's that?  I found that I needed to enable the generic no-op phy
driver, but other than that it was fine.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlpSmlcACgkQtdYpNtH8
nuieRg/+IMEWys2PF4yp101GtGCgjt1xGV+PngZEq2PSB9DsrDRrQmLuTx7rJDar
rrI8+1paRRfSJ9fGlofNqqu4hdIoE+b8xBd2YWIEGQQnC6nCv27WVT8hV1HfYZhU
ka/rMwhFmOsZnTiDSfuGVj1Iqpug1G1jTFW4v4KSfGYZEYvBKwm7lHlP7RjsUdvK
skJkI8IcCsUy36cISiy2cnkKhhxEeZ0dFCsMUEVUC+k58eXlK/q0YNnNw1tYjQ5u
z89Jt5RpopX7YhxtABYAXytj5F9p+nAFv0cYxIejG1OEQaN+CdeqScjY3HW+8n2/
qxpWbfx5TGuxxa7CAPGer3gc2fa7Zai7z8P5hP4ognwPEGQgvrl3gFL/kP9V+z0R
jJ02c44gukn+c8CxXj+gulTOIDhXn1CtQK20xU0Rp8+H6C68v6JAvCWv5IT+mODz
x2GhAlbY0Bxt3L18knwa8tWyWB/40xhBMfMQ1HBoAdkIb0Y6APuTodcGzEjZmKK7
XuFWI+5hovfe9KyVZdHzd0UCRV0Bfw/cijzthzLie01V+fp5gQO1fDARK1K2kDZw
oEMXHrNvBjNRCr/WfEClUAQJlEP+PTwjcJb4sTPletXp/bD9ickBbn2xuYSknZmt
AGCFCosSYP3LchJ7PT9LTUPaiAkNohTC1he/CfEKhHyB5l0/gcw=
=dBVE
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
