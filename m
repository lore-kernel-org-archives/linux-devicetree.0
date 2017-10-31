From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix fifo size for EP 6,7
Date: Mon, 30 Oct 2017 17:40:59 -0700
Message-ID: <871slkw3ms.fsf@anholt.net>
References: <1507371414-21688-1-git-send-email-stefan.wahren@i2se.com> <160210128.18582.1509137904239@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <160210128.18582.1509137904239-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 7. Oktober 2017 um 12:16 g=
eschrieben:
>>=20
>>=20
>> In case the RPi Zero has at least a device connected to the OTG port
>> at boot time, the upper limit of tx fifo size for endpoint 6 and 7 is
>> also reduced to 512 bytes. So fix this accordingly.
>>=20
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> Fixes: 1aa1d858f582 ("ARM: dts: bcm283x: Add dtsi for OTG mode")
>
> gentle ping ...

I've tried to make sense of this a couple of times, but I don't get it:
why does EP 6/7 get reduced to 512 bytes in this case?

However, I'm not an expert in the USB stuff, so if you're confident in
it, I'm willing to apply (once the merge window opens back up)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAln3xpsACgkQtdYpNtH8
nuipHRAAput9DLD1lm0Z1s+MSIYb3f1+ivhTet1z8qsg05wZ+gmEq6nSUq1Fcp49
MUsTRRufkUnHh+9UHYDYZdvc4b/C7+adRZ8eDV9BwPlB0fWJAqbLCly/k0sr0W6s
5kfTLeXcDZYDTJwLtuYA6ijTSz8u2i69BmnJOrZhlG9fch/QT7SGDR4BRnZF1S5A
kqLqJT9MbtzGEIMRfD2TbwQSwXmGQpN/b5/ch2vwFbG0tMUUPUb0sDh0Hvw18b+h
o079ejNYGJjM7bkPWay+Gm9/iMNjTon2METUpVdxDt0csoy5sOLYklS8qSJqOHVi
zwI0u1v1f6dxrCOV1Ml2n95w3IuElYt4zMNV2L/AelHpfhdj7Xd3rFWNsMr5fjTP
fEMTzKwBlmEcOjVU8QrWbg+ZOBfbfAPdVwIMKdsDEo/itmfWsmKOd3eioaSdL++L
0m+p7RV6vIGSPrMjhyAXA6TsT9lkr+tVsCgHyGypgdrfEoHVQyFTbh7gEyirkb9t
V0mxK2U9/jMx+xkHkBX08yfsjD5KUxi2yZUuBZEE+B9+EiovB2ZuCT8TCz4oBCbL
LfDVRraMRvLo2ztI4AaCQOxyFHeL2TcLsc5XZxifgkCVU/dByj8Tuec+UQHIm5/y
n7U2C8mNHecJaY6k3bQ7VT9CzUFRogFE407DQOKePt+8vkAwH2I=
=cBFp
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
