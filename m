From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH RFC 4/4] ARM: bcm2835: assign pins to sdhci pinctrl
Date: Tue, 01 Dec 2015 15:03:51 -0800
Message-ID: <87d1upu5yg.fsf@eliezer.anholt.net>
References: <1447949176-21926-1-git-send-email-stefan.wahren@i2se.com> <1447949176-21926-5-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447949176-21926-5-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Finally this patch assign all relevant pins to the sdhci pinctrl.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm2835-rpi-a-plus.dts |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi-b-plus.dts |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts |    4 ++++
>  arch/arm/boot/dts/bcm2835-rpi-b.dts      |    4 ++++
>  4 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
> index 50be11d..4d562d9 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
> @@ -28,3 +28,7 @@
>  		brcm,function = <BCM2835_FSEL_ALT0>;
>  	};
>  };
> +
> +&sdhci {
> +	pinctrl-0 = <&sdhci_alt3>;
> +};

[...]

What effect does this have?  Does this change any pinmuxing at boot?  If
so, is it just resetting things from what the firmware has set to what
we expect it to be?  Does it enable card detection on the Pi B?

As far as the whole series, I really like the improved description in
patch 2, and patch 3 seems like a good idea, too.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWXidYAAoJELXWKTbR/J7oygAP/jy4u+/1tS+ZboIEUW85QC/f
Oi0E0yMIIxFOJv9ZsYMGoWLormsqosHuSrqgNgeeGHQJmTbfPjiZeh9V8SYtiY2t
1xlvBNfkODAo2nHOBmKnIuiVmmeq2702nWxcpwesr3plUCKbUfMhD2ooa+vaTwJI
8NstqR/La0YC2QU9K0t6ePvH2UO8bQF28BFnXrRoEvDHaqgzQ0aWSFDNk2Ipc+2d
4EAKH4Xati3b5iCLhJ6FtYe/DvTUboMhg4ksUnRR5ArfHwoNhm+YtAT3xpGOT2nB
GSQD42ftzDzYSW3wXq9N5cOKzRj3GDlrDfYoQK9533Ms6IEuq6ksdPK+cHDKQgwB
EkeVOXvnZo3+35S9YCl9WonpTYEveLtYVbAbYm2gLchGFqL/I7WBW+8WWUYYMKgk
Xyhxb3Rux3GRLwiiEICmibRlDes211j/wUAXPtC0nmQEEhTow/dW39QggD75rStL
Fbxr0jlOqxCp2jLQgibju1Lebqx3y3LtxkhAPLfUnPYtzdJd29dRiwa/uqAZPDId
d4G36Zggy36jUrv1IJlrPh4AJzBz1Vkc8K+QAbbtQVKZ7BfqME6R9I9Igl46OBjD
Ebk9d7bg65mzL7wYEFRFjDm0seQ0QQ9DIOnhAp5NaAXqCwVee40P5Nr+VOgdx0rd
JyclkAQ7FOc5Q6FeiIME
=yUm7
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
