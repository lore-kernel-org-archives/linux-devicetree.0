From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] clk: bcm2835: Add PWM clock support to the device tree
Date: Mon, 21 Dec 2015 15:57:14 -0800
Message-ID: <87twnbe4o5.fsf@eliezer.anholt.net>
References: <1450728779-2599-1-git-send-email-repk@triplefau.lt>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450728779-2599-1-git-send-email-repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org> writes:

> Signed-off-by: Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
> ---
>
> With the upcomming PWM clock patch (see https://lkml.org/lkml/2015/12/6/74)
> PWM can now be used and can be added in the RPI devicetree.

Looks good to me.  I'll try to keep a watch on the clock tree and
include this (possibly moved to bcm283x.dtsi depending on if 2836 lands
first) when I have something I can pull from for the BCM2835_CLOCK_PWM
definition.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWeJHbAAoJELXWKTbR/J7oB3QP/RBEMFp0SHbJS/1JJQYpTlMA
w5zkQjuffFmmieNMhdZtmYbsTdXDo3TgtD06jR8wlvYtBrVh2x3AL6GWPn2wqJgG
w7QqQbPlYnhwOTNap64yO/EOfkc4uvfB9DnyeQdIIxZZwfvM4BlFT4UjTNZH3jnp
IkiovzSPC5qIbM8Q0v40+UaGo7sXCGaPUxgz1Mr7yy9PZtbnpXAzUW4dB+KOpzYY
kgPoxFkCsNy6AK+jUTQJHdhHWz3OyF7NqQRvlvNSXpxXWGF9dkLebRCOer0tTH1H
TFRZYFzVcj0W0YTy/pLYhLUzcZ+YB1pwEiMxjNXYIP+ey+wI4Md3Lnxu1wehVN9S
InPnZeR0XJ8P742TuSYMeFDTBe764PU/8sIhXX8V/3FpJ6NSdA63imcikXLG82IV
oLWxYsmTJ4ehk5YCkuL2WvS9r021VyUNUWnB9n0zl15ggDfop09dEkJYp2x55RxI
k1dOC+GA4EYF3AiN4x2myPj0gi+CnrblmJq/5ZWJ19SvZoikOhQCW7qtv1e09TRM
R8KcqJHiRXv8ip8CY+BN8yLqCoOXW41S6Pti5ORecmwiGFsmsXNHrpFBWkslEWqI
078/IjAF4hmyD+qG0HciLDpWGnAkx+ZuiQF3+HywGgTaaZB9m1cBoW2B6uq7t31M
XSIbrs3R1v5Zm/U+5drc
=Y+B7
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
