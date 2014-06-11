From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RESEND DT 1/2] usb: gadget: pxa27x_udc: add devicetree support
Date: Wed, 11 Jun 2014 16:17:10 -0500
Message-ID: <20140611211709.GA32634@saruman.home>
References: <1402521141-26235-1-git-send-email-robert.jarzmik@free.fr>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402521141-26235-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 11, 2014 at 11:12:20PM +0200, Robert Jarzmik wrote:
> Add support for device-tree device discovery. If devicetree is not
> provided, fallback to legacy platform data "discovery".
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>

you must Cc linux-usb. Please use get_maintainer.pl as it'll help make
sure you get a better audience. Please resend with linux-usb in Cc.

--=20
balbi

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTmMdVAAoJEIaOsuA1yqREX2MP/3rj77pbzI7QiX2R+LGZEyT1
0y/6Try0tp0fJJ2ax0QeQUZgRGeqjwf5mvwf7UHmFJTQ17BZYbM/tVYlbvqvWn1K
esgp1qOTdDhAyuLIHNPfojHk1M1LiWCinqyUv9RMamNj54PRe93YjiMFYR57uzMi
vAp277eTXejQxpUjhOQ7lJeEAdl149BXxneMeBIycoI0qcncCV/H6ORhZKMbnHQC
7ijosFqiioy24Ug+43TRWIJL+9ikNf4lQ9Iw+jvuB6eEOxvA09dYwQRjY4DHxFdX
XF4tBnwe7OhGI8NPS80Uu7ZlZ0gGtYErhS2WcduXcyuSCtJ5FiOZ7vcwvs6Ph/oV
0UfPfc3dEyXG/3SZo5MyoVuFzUK5KeXCuFPYpirzI+ANVyYl5SBEqRqwCJBBn4iD
9oh1xa5F7fiWj9RS9+CJP8ffsIEFIluHvCSl+ANkRL43x33aKoi2dxFB990BH+Cu
fkh+bABKD2BOq9wLWZJiVwlu+99swqwq7NqMSZLOISasbTdq0zMtz9QnXWxSgVhr
QgtgZ2X1S9FUq7KD4fFqsjNzxJiy4hDcwe+VIfxJQPZP2vo/y3xnvegkIpe31lfd
J1Q8YsVsz2C8dSfHsn6zh0iTf54aqKDSnxc0D1VYHMbwnqjzB2+IsngE6qsoVq9e
6PyAKIaoFHxgQfKbxZCG
=nbS5
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
