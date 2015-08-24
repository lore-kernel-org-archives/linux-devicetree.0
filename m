From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: sun4i: inet97fv2: Disable unused usb
 controllers
Date: Mon, 24 Aug 2015 15:35:18 +0200
Message-ID: <20150824133518.GL2413@lukather>
References: <1440369446-22195-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qySB1iFW++5nzUxH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440369446-22195-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qySB1iFW++5nzUxH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 12:37:22AM +0200, Hans de Goede wrote:
> The inet97fv2 tablet only has a usb-2 wifi device connected to the second
> ehci controller, disable the first ehci controller and both ohci
> controllers.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Queued, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qySB1iFW++5nzUxH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV2x2WAAoJEBx+YmzsjxAgySkP/2fV/qvALBYx9By67bBoa66a
TmA66TLO+Qt5TeZoIRxGESpXsF4A2QqLOVTtUXOQOaAhDd6E6ZvhuinC+ghzK1uv
Jt2YyzL40C6mlkWhAzTZ9r0yZhBXQ7b1TA3vFTskkMzBNICJ6fBzXvidFCTkLr76
p8Rxw+JMIFkF81qDzLKTHX9nVK2DfKt/hc7UDuppsmVUl0xbmHM46E6L8DNk+mrc
PewRYH0mOXXqXOqMXsm7Z9B6xM5jAOfEmi8D2l3FLv0pwpnb0lraXKQf9Hj9Vfe0
vaCGJRDzyRaFYSBq2vO9paSQJzEfYAE0t2HFV9I9pRw0Rxf8nyrFnwtH3gsIftk9
1705ZifoWtylXzBrulRRGVviuPHRjet4fXC15RsDLpe9nuK7Olg1rWgsyZhrV41b
LA6PJNfaqJmZcF1LMYigAS9aAUHJpiK6pJQDyVnrpfPzmi0bW4kC47eeW8by/OHB
PaSa3Xlobe32FyZtXAT6wddmR7B0xrI7TCR5VHK+l2hGyG0x5BVt4uJaQBt6wvBQ
Kf5DUrmwKaPSHevbD+TQuhWlF1jIYytqa0VLOgAJfNLWMnX/3b3NEYRBpcAHmpni
FOCHhUbzBycoOqLFnzGuRRuAU9drmPGZrASlLT4EwizIrmdefOehPlsFYJfH3qkI
Fi1/JNb1IXVADiOtu/HO
=CC8q
-----END PGP SIGNATURE-----

--qySB1iFW++5nzUxH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
