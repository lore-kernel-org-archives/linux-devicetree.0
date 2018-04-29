From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] ARM: dts: imx6qdl-cubox-i: Move card-detect GPIO to 1.5
 SOM devices only
Date: Sun, 29 Apr 2018 15:47:24 +0200
Message-ID: <d167cc6987fdb7f04493c634873d430dcd216887.camel@paulk.fr>
References: <20180422142151.17910-1-contact@paulk.fr>
         <20180422143911.GB16141@n2100.armlinux.org.uk>
         <8012696a7bf0132dd2361a896bf0abfbe8a3084e.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ITZIi2Ig0YYHofRB2UVM"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8012696a7bf0132dd2361a896bf0abfbe8a3084e.camel@paulk.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


--=-ITZIi2Ig0YYHofRB2UVM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 22 avril 2018 =C3=A0 19:22 +0200, Paul Kocialkowski a =C3=A9cri=
t :
> Are all CuBox-i units that have ever been sold supposed to have a
> connector with a CD line? I find it hard to believe that it's broken
> specifically on mine.

Do you have a clue whether there should, in fact, be a CD line on all
CuBox-i models out there? Although you seemed to imply that my device
might be broken, I am still confused about whether this issue concerns
my device only or a specific revision of the CuBox-i.

> If that's really needed, I could open up the device, check whether the
> R8 pull is in place and check the voltage there.

In case there is a doubt, I will proceed with opening the device so we
can have a clear idea, but I'd rather avoid it as much as possible.

Cheers,

--=20
Paul Kocialkowski,

developer of free digital technology and hardware support.

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-ITZIi2Ig0YYHofRB2UVM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAlrlzOwACgkQhP3B6o/u
lQzr8w//cnYyWWXzTLDgBVLSucI2AUe08T5EExDfWwIH1MWg5hPskU/OZf66mZqE
6/CTZj14sxvVlC7ES6d7t2C4eyE7sUcEx4VVu6bLPPq8vleuT11kc+nX4yuIpL0o
CsECtBxVZBrmKbhz7khSkpVXWrBuOqJetoYR35PePX+T4tMFpta361Wnt+gj8ATk
0FUrC9JNIpwZ8VeiNVQbW+7j5+aA6QrEcJ0EJpbrkDFIkr3ppPS6CQ7iBbO3OhDk
PbEeX6iC+IJoifkO6q7yawXGb++vWCUUNHXztuuGyfrkkq7XIyarTAgkhXqC8BsW
ZfDO3WHjXZjksI0GodbDAB8Uam6GVk/U9Y7RHmQpn9uPUE3V58QyOLvXEXDnn5Wu
M7+rDKj8zN7ZzvmI+cuKy1w0fp1B0xa54cYDI0DOUtYc1pxGxZbyyh1si2ZDv4Ym
uQY2j/ANK7pt6ww5GE8ZrFWS9n+UebzUJSOM5mnql1NTcA9wGqW+x4n3K/3IDe+o
jk1k1Tx4Q8ShQ566cKAvpLp1Muaarn+67PM/vKGRmRLS83V5rKMmxyxrwUcmH9/q
9D+cNs5YP714TKEinRz5QBNyexcpBOD1hWXnGHnuUmIW0mdYVkO62lqIiNwnD2Ty
+J6PdgV0BSuHyXQwpeGz4uQWhPx+9jX/hx2BfqpMYi4nSCyhBJI=
=cJkM
-----END PGP SIGNATURE-----

--=-ITZIi2Ig0YYHofRB2UVM--
