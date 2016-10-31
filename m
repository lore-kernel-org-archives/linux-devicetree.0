From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM: dts: bcm283x: fix typo in mailbox address
Date: Mon, 31 Oct 2016 11:06:22 -0700
Message-ID: <87zilkqtpd.fsf@eliezer.anholt.net>
References: <6b13e96d-78d1-fcab-4273-803310ae4da6@suse.de> <1477848139-32267-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477848139-32267-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> The address of the mailbox node in the bcm283x.dtsi also has a typo.
> So fix it accordingly.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> Reviewed-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
> Fixes: 05b682b7a3b2 ("ARM: bcm2835: dt: Add the mailbox to the device tre=
e")

Pulled to bcm2835-dt-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYF4gfAAoJELXWKTbR/J7oFI8P/36CVo2AfHCO+Ra2Jl4I96q5
YtYK1pKIjuc7W+g9T1IFGCQ8SQpqG5ONa9AenrswSf2wd9gkLIrcw67e9NyslMS9
hmLICPWTMSobJycXeZX11gp5iheQfe1no6vUcqDfWvNpmWLsArly8MluurGZwyoc
SP5JLood3wf/ZEN0NiDRWnm5BnFgyPVM7Dor96y3HUHLDcWoChYSNhKjMiOggSKv
uBb40a1Prr6/OxpVBnNVU57X+t80Uth7DTjWUh7dZNVGxP3D5Y0sRQKhUNeyq0ow
QJ6W3GUN7g1QjtfSzqnN8sq80Ex9ZV9KIuQo2jNO+QwH+zsVqraduRM5zgJlBsp2
JbVvW4zKR3Ku244aQmBLqcYXxzWZXxXhQ+MYfMuDvBnio1ZG2cpE440EJHOSnBX/
pZLHILp8ZOP0HfVXQjnywjhsuYe5Ka6iGNDO3g3hkZ2LtFuvzxHclpFGF5n/Yc0h
u7GdTgZdWCId3pTGJyBrIfcV9d+psqterKXjMYqkgL2eSfbKrJ8urZiFddjH16El
c0lAvBkyTQv7DDOtykPSriAMdzziW4J8JEP+9luefgEekjw64NtguTOuIpVPbkrq
U3/RnzYlUlRu424SrzjVqvqBbNlOiMTB3lM/J/QkH7WR2JLVnLVg2vfFT04L7748
8q4iLsBWcQhUsePINNlA
=6XCV
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
