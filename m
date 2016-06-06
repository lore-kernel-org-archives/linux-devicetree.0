From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 27/32] gpio: Add support for the FXL6408 GPIO expander.
Date: Mon, 06 Jun 2016 16:50:31 -0700
Message-ID: <87port98s8.fsf@eliezer.anholt.net>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com> <1464817421-8519-28-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464817421-8519-28-git-send-email-kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> writes:

> From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>
> This commit needs to be split up and cleaned up.  Also we should add
> interrupt support before pushing upstream.
>
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>

OK, I've confirmed with the firmware maintainers: We really can't drive
this natively from Linux.  The firmware is polling one of the fxl6408's
pins 10 times a second for detecting under-voltage, so if we also try to
drive it we'll end up smashing each others' I2C transactions.  We'll
need to do a GPIO driver using the GET/SET_GPIO_STATE firmware calls,
instead.  Unfortunately, we don't have a direction-setting API for that
at the moment, but it'll at least let us read the HDMI HPD signal.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXVgxIAAoJELXWKTbR/J7oiOUP/iCUKM2ALetrzGMef5oPyWRw
iBh/BAo0aPbYCN1ISB3/uL92QFEIo6HqirK/Xcn4adzUiMO6Vlqa9KLZEtgkATlu
VdsZO5pktTv4RUHw0oCMUm1UO7wp/3StbdcwgPl5kHBQIggvD3C4zbuM2BN/xlvR
mw+n0Drp3mTJJ0/6hLORBhceCuqg0D8OwB4/cCNCnb/splZDpNxWHNDdJNCxTKzP
N9nkeX2cJ2YFBF8vziL880AjSle2ktVFrMPg/EZ/TwwxSwfdm0rKUH1FFn3BbG/K
40c5jx8sKGBRX+bAZNYeAS12o9ChQDqXCka4UVWqal6uhuQoKTZCIuFfrR+eKpSy
bR0MG9yh+vOmAZxRehgCi8bhrvm3uYgu9f/VlijdNLxUw/lxN3u+Lw+JoyZo9LDY
MZb9QdT3sXAKCVnzfxbyppHX6M6emZDlj6WrYSZQLo+1hQxzcIo1hCSZd2/db8Wb
uJV7aes1hnHEBfP8LbxHSqQ5vmEKXTfrqDkjTEqWDbxx1jiIuyMBm80YB1OF/qeZ
NlS/B8awjgl6ShSCI160YYaAb4gr1U3aLGiT7HiOHJIcNZW71oxSTmaHbyPo3dQu
6nHPTAdzC7qtTC2JWlvFQ/8i3lnQRgdummUDkREkq/1dSG03ElgWR6dhI3g2S0wb
RNfxNK0s0gm/OSbv2g9U
=UGRD
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
