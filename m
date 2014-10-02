From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: dts: sun7i: Add Banana Pi board
Date: Thu, 2 Oct 2014 11:46:37 +0200
Message-ID: <20141002094637.GL6884@lukather>
References: <1412148366-18346-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TxukmIqg3MmZ0Kmh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBTN7WSQQKGQEALNN5GQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412148366-18346-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--TxukmIqg3MmZ0Kmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2014 at 09:26:03AM +0200, Hans de Goede wrote:
> Hi Maxime,
>=20
> Here is v2 of the Bananapi board addition. Sorry for taking so long.
>=20
> Changes from v2:
> -Move uart3_pins definition from a20-sun7i-bananapi.dts to a20-sun7i.dtsi,
>  the addition of the pinctrl node is done in a separate patch
> -Use the new dual license header as license header

Merged all three for 3.19. Thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--TxukmIqg3MmZ0Kmh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJULR79AAoJEBx+YmzsjxAgn9wP/148Mzwu3IPt/q2300vVPzCr
T3pIyxpRh/8IXrAD2SLlTxq90qSmk67rcHn+yx6PfiT43T8MrmMkPhkXOvo3Xa7k
e8kwVoIOUScm3KQvC2CYtG/wyB7pkry3wDisDL2yiif82a+Ee57zjQRdNHeRUzV3
UrB3Wij50n6chMONia4Ny3dol4/csg1md5Nrp57srYI1WKXfnx35oT7E7WeUCOjJ
jIYqNeiNRQ3fcgHINTOF/g6Ob3+eHDS87lhnWujDwPbAgaZQk5VR/jtaCmNVCYHO
hJzorgE9/BHBzWIqiCKyRnVYuR8iAKgkANjbelXHwmarB+oYFTpholIxOu9QXzwj
EUC4S8x8v3/YrIK0peDV3ULqSqxzr4ko5ciYGdDcDr7jEL9bFAbYu2QHJpNqB8y4
YyHh6qoQLAnFDNqYTdrXfnESUf8ijZSfZzN3l7U+qfZs21f87iowS7I2ok9J1M3o
6CZTmZdQFvBglIMO9rtMY827FABD5PPv+elsedQ7q26fEDD827dmHhumghiHqXKt
REr+QG9/W2XUOwmZM1437SUyGs/XgVMDns5GYubdFFCwEhNd710uTU7dI7MQB1Mz
RBkaERtbP7w5PtqiidlkoXcn6Rp2d+TOb14EfaFld+dsCbvjusbuxv9VqoEkAi5U
2z0PhF58VJB7yd8dVCH1
=dFtH
-----END PGP SIGNATURE-----

--TxukmIqg3MmZ0Kmh--
