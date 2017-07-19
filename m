From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 10:40:59 +0300
Message-ID: <87lgnk6fhw.fsf@linux.intel.com>
References: <20170718214339.7774-55-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-55-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Herring <robh@kernel.org> writes:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: linux-usb@vger.kernel.org

is this going through your tree?

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAllvDQsACgkQzL64meEa
mQZsyhAAweLG/7T1oEkSP5fRKTKqC4MR9o6rekDfNVHUVGbKDPdvU91AjYaRUGwD
RulosBB+GoAL9Qpwuy3mK1VYzqXmS0lZNOf63vTV3vdUg72AZ3mpGD66b0SqMepQ
NBSRHfxufuGeOjbXLV9k81TneclBBTPwCiYzNm53xR1sAu6ypXZxs/yhMH0PAfGZ
6t2crz2E+iU6WWU4Lb1yEuhXkVpWbpKKPoIjO6kE/NhQkHtrhsqAlP/lCYQlFhBf
7tMl2jjeRDWg67ImPsWBEPhxAXMGYNXj1cFjaxZgaRNbH0Sbr7i8X6YnDzoivyQV
sAQGxz9YVg//qOH3C+2xjxLVXExeSgIte1eu5NFErgLiZlKS6a2WPlu4XOcYLjFe
WzlyO2XaUq/6SwXPftBWOeaDwHbiql5v/+oGqOI5ANj/H2GnO1F4JPI50ufqfjLe
1F0ZXfHOMxV0LCnCDZlwwxImra+MS76YChwmJFQf4a1Znx6theTCcpwhJKudHQKj
m/qEWgd9F0abpF4740ILQU9l1jqLfvekmeYojIimzV23Mefq1MVIL+FPWCi6v0qu
F1lNvvz3YQ37EOSHzpfW3ASFU+ltVVUucD+dQtYjo7JAqAUF9/I3Bc7M+1/bI9/L
K5ohn0meZyTtR7FJksf3DZYabuItAdiCu9WRzNH+QnIIgQI5E2U=
=K5D4
-----END PGP SIGNATURE-----
--=-=-=--
