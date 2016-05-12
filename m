From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/4] add minimal bcm2835-sdram driver
Date: Thu, 12 May 2016 11:15:27 -0700
Message-ID: <87twi39m80.fsf@eliezer.anholt.net>
References: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463056732-5607-1-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org writes:

> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>
> As the sdram clock is a critical clock to the system
> the minimal bcm2835-sdram driver claims (and enables)
> this clock and also exposes the corresponding sdram
> registers via debugfs.

I don't think this is a good solution to the problem you are trying to
work around.  You're relying on the fact that this driver gets
successfully probed before a driver that would -EPROBE_DEFER on a
sibling clock, which is not a guarantee.

Let's please continue the debugging of clock management on linux-clk.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXNMhAAAoJELXWKTbR/J7oo9wP/3yRUXPwlXDPORYo24VQ98R7
IlL/sTSwQHx9eLN6Q/8i0Hge1PRIaofR2gogfTDXjB9muqHw0pbkZm3n8rvVxeif
3muuZF1kEIALX5n9Acl4C/7F+rajh630Y5eXjraStB5EEL7Blzgr5J+PjjeVZAPQ
7lhy+f+krZArTA+cEG18EVe7tY3KkiJA0nW0lyabZyd6NnYQ5wUXnthiNJNBvEm4
KhFUVNRQZ5gEAqq4/fVAwexHpZmoOJU2/E6DgXiteuMXBGsE2Djs7s25NN4bO6+y
o6d+TBYE1Ia/WJ9TQW+EIu2qzuCPaSOayk0tyzZrPI+1n11oX6vs0oKCY0GFyt5Q
nCTPSiKp83cqVlBiZPAgjJGg9X1dkE752w1a6U16lOOd2Cl5n3KZJ2A+sjHnt/n3
r5X/GVSVsgEJBl/lY1C+GSJaDUG8nAE8OMQcekNXUm0NUStpmT6/DIJKLp2fsFk4
3ukcf6+GjU0Y2KuO7Zms6oQt01bRvzKGJ6+OWdckBtUL1vLS3DjCV1B70hj8N9kL
kt7HCRo/IG64+gk7fhYv4QQfYkd17TtosKCfOTPZdMNMGtPODGPkYiHBsKS3caZv
FIowvY6QnQFJFqc8iRtYe1MpdqngDEY8U9OWL7XSocHzZ15klt/ang8CaGaCHkK7
R3nckrbt3z4E1muFk6ki
=k9MJ
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
