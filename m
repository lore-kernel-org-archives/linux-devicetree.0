From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: aspeed: Add I2C buses
Date: Wed, 04 Oct 2017 15:11:50 +1030
Message-ID: <1507092110.5452.11.camel@aj.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
         <20170928075149.8154-4-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-hCFI9HuFbQh5/Bbj0dYB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928075149.8154-4-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-hCFI9HuFbQh5/Bbj0dYB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-28 at 17:21 +0930, Joel Stanley wrote:
> Now with an upstream i2c bus driver, we can add=C2=A0=C2=A0the 14 i2c bus=
es that
> exist in ASPEED G4 and G5 generation SoCs.
>=20
> It also adds aliases for the 14 built-in I2C busses to ensure userspace
> sees the numbering staring from zero and counting up.
>=20
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

Acked-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
--=-hCFI9HuFbQh5/Bbj0dYB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1GaOAAoJEJ0dnzgO5LT5XBIP/3+vNH3AKNYGLqRdqhKzrEyU
urivOTKK7VbUzGa4LgGeBxabmX+PGiWC3ipvjzgiSkrBvbBn8imI5RlGEccgR9Dj
e8UtM37PNCsh7B31bjDPQ5BqPvWnG/UIixpM2mINwolVXkZTo7HXwolClidVgDGW
4TmMVwjVnID9kdxQ0dqy+Ll9VxPYpdUCjkmoaBHkVl3OkmtVycGl8jBAtj/i96Jq
1Wu0IBQwCvdXmyTlZHChIYoPo7/hCUcFu4neiYnQg8aNu+I0e1gefPVekfB4NHUl
mX+FSzUndrNXOFcyZtJLgvw0z2VYDTE6ssw3HxTn6e5/1RHazJ8bCpfFfLzXxsJk
oH2iMj1q4qgerxIlw+COccfMVLZRHnf6MnQOdAgAVHYXN/ZqUW06ii3ay6Xz772m
CF0crpMZBnbLy/i8SKt87RjXlSOC2co+idj/9e4KKl3UDSAtPQCsY8DgSCnwRWSk
zTRgXpkmVdiV1Tv5Hxr2pNONKwU7TF0jGYLgQOSO3n8YTunAlNCkaAqv7SmywLlt
6v4RZH2gdDnbs4fh1mGRpB1I7M9tpzXBZg0tsMyn6Sgce4Z/GrhEJRNMBz3XUdME
Ucb5Z1iSAJ2vmdkBEKlzqsKQ+ava0EvV8KNWNmt7IiN9NYxAkdbhGbPJw2ItPgT2
AccyKEscx1y0KvCW06vj
=k1Ho
-----END PGP SIGNATURE-----

--=-hCFI9HuFbQh5/Bbj0dYB--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
