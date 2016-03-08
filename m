From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: bcm2835: Add VC4 to the device tree.
Date: Tue, 08 Mar 2016 10:04:35 -0800
Message-ID: <87bn6ozw0c.fsf@eliezer.anholt.net>
References: <1457123528-13482-1-git-send-email-eric@anholt.net> <1457123528-13482-4-git-send-email-eric@anholt.net> <56DE6A80.1060707@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DE6A80.1060707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 03/04/2016 01:32 PM, Eric Anholt wrote:
>> VC4 is the GPU (display and 3D) present on the 283x.
>
>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dt=
s/bcm2835-rpi-a-plus.dts
>
>> +&hdmi {
>> +	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
>> +};
>
> Isn't that the same everywhere? If so, adding it to bcm2835-rpi.dtsi=20
> seems like a better idea; it'd avoid duplicating it everywhere.

It's not the same everywhere (_HIGH vs _LOW), which is why it's in the
individual files.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW3xQ0AAoJELXWKTbR/J7oqKgQAIvf7dwXxF5YWTpbqYHSLZM3
iABdxFdg/oe/a3sgmpJmlno/ETB4naKEwp+4RTJklZFQYFBTIDbaP2AarSWjmqxO
du5IAMlv1usRqNyF7qGK3IsvE/jxY+67ZgRZZEIIGu73GXC2G0ckyQU4ZSCPUr+B
JK2JewqqXl41f5Y1EZUlStyVy3lum2JuJzgQZS7Jk6sdnvXjapUE4/zcbP0UY0gN
3hpKZrGkTWerwOJPNBZbqGXQxc9Vnye8R4pT3j40/By828y+MjDJXo9ZEUGZnNvk
Sb1LAt2ID6YaU+oN78i78mPy6Nwb/LrLk/HUfGbekXpMyAtmSEIfQYjPU9IsjSg/
8vq1LHf30ZQs57U82Lf+f/KBKaLZF3+IFqXsL+wDX/HL1535nrX43PfVEmcFwYNs
NgnfPkXqZAXwOsXVTfk2acJqJw2zjwTpZ/OiaeplV/D/JQD/PWEOc7Sd78e8qxCA
rmxoJiQbIAK5Dh7wM1RiS/hpYmbU2B0o2V1Ep/9tVXQkOkioUAbAsdfcbyOHuAiA
q0V51oOI2GmzWmfFD5ZHJAlMhz3dQF3O2VUAR5go/r+1pSwSXmyY6HAz6RXT0oVp
VgohMPYVsyMbfNEeoevLEx7/u1YG0P6rdoWfyTK6MuGGMR0XuhL9n8uyFRcqnX/2
9Xs2vHukSaDPAB0GL/jX
=ipWH
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
