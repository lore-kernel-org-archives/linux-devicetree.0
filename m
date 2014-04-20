From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: mvebu: Add USB3 UTMI support
Date: Sat, 19 Apr 2014 22:22:55 -0500
Message-ID: <20140420032255.GD26893@saruman.home>
References: <1397816563-9000-1-git-send-email-gregory.clement@free-electrons.com>
 <1397816563-9000-5-git-send-email-gregory.clement@free-electrons.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397816563-9000-5-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 18, 2014 at 12:22:39PM +0200, Gregory CLEMENT wrote:
> The usb3-utmi registers allow to configure the internal USB PHY of the
> Armada 380/385 SoCs. A small initialization is needed to be able to use
> the USB3 ports.
>=20
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

looks like this should be a generic drivers/phy/phy-utmi.c driver

--=20
balbi

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTUz2PAAoJEIaOsuA1yqREO4EP/jNZO1AxWmt82Jibv1FYvn1B
zZNy8kl8oldc+CARHLI50TdUuN6BEFNQFeusOAVhSkPvkVjRu3/eDAukuZlJTLEN
hdfR3YUC+30ZpDPPYIqFyPKkEayzh/c5HnMWnRURxnraoi1CYKvHFQu/TDV/zAS+
QO8AN73mXwtlG7Z9N2f+V+56ocet9PYXAkv+VgOD3DyTuDdbmY7tqxnmwFrm5jpH
SE1vqic3JKYZlV1Ujali6KEjX79cp2aSh1fmAZqeRfoefkZ2pOGrltvi2mHk6bwZ
Ky2phO58Wel6tCRk1liPAbGCAF/Wc+5k5Ws5VOT8gvtjYQbTGV1OJvyBLHhC+bpy
2y8DwcPCB1jP6mr9p1IDTCwP6dS68svewYEtOrO1heW0dDonIfmzoTnVzr/+wHNI
vqZNw4NW1XR1EYXmOUxdkPBC+jCf1kiqM0zoQ4BxfldVuoylHtLaxpOBDsQmJyqG
HLyuIgOo7y3utTM7EJhRE6TSR+lk1d/1KbpHkmSxhECxc3vkuL5CjhCL3YZ31HGX
FEhN2pmtwsRrl2HxM8lzE21QmdWjlPwYkrMbcIBWvldQ8KodETFruavnsZFFJYnj
64ivZ7YqYey7MiQG0GEeiLD8nzJDL3tBDopWgYPcujgoO8qsEM7pyfTKgdcpBSM/
YEaNzxfP5wd37SEKdTBK
=8OR0
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
