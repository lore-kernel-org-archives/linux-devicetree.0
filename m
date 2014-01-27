From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/5] clk: sunxi: Add support for USB
 clocks and reset bits
Date: Mon, 27 Jan 2014 15:45:36 +0100
Message-ID: <20140127144536.GK3867@lukather>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBG7ETGLQKGQETKMLZSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390426587-16287-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 10:36:22PM +0100, Hans de Goede wrote:
> Hi Emilio, Maxime, et al,
>=20
> Emilio, here is v2 of my patch-set adding support for sunxi-clk USB clock=
s and
> reset bits. This addresses all your review comments from v1.
>=20
> Can you add the first 2 patches to your queue of patches for Mike for 3.1=
5 ?
>=20
> Maxime, can you add patch 3-5 which add the dt bindings for this to your
> tree please ?

Apart from the comments I had on patch 2, it looks good for me. Once
we agree on something, you have my Acked-by.

Thanks for working on this!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS5nEQAAoJEBx+YmzsjxAgq50QAJk22Elaf7E7bi6Kxbfco+Vf
DpzQVW1cfe3974t19WOp+tnvH1FJ22fzuqOzqH3N48CqhGLbtWUrIoq6EvlICzNI
T7wULvHbA10jPUhSBmuLdre9oD7nFRNb17hbtq1iBqs7oE6B02fZXFd2E4IgV4h0
gObkqVubS/5NquFn7USnalPQH362Ayq0NvE7YaHJq8ZGKAJyhzCyexbiXRExL+Z/
ZfmUfXidJ6JgFarnwmC+uAyVazf2k3PZz7w7xPUar/bhcr5QLA3pw0tA0AP7KMl/
ypPTR3pXQBGAtH5JO7K5/dafxst/BRhmLXJdPqC7BDFKnBSJI26O7Qia5A/SHxX9
XXI2YO3aUtUMg+ZmwvHyKs4nfi8nRC+/3t1wGFwMe8ihHhyyVUD2+cZsTxTsnvu3
Osy/zsHC6+o/hfkdQ6kL3p7X3QBMRPGE3kRgOZfaRSiUWEdg88PF1CbNRpusEPBV
8SGEFA/VI3dY3tdNzKyO7Wrg854IsU/dewodQw5zfzgw1efibUd4rX2WUBfNpHJ7
+uz7kfp6QTdqE73g6s+bTjMxGhuvKV7aC0DT0wnTbOywJsrAYn3CZLi907mxnzat
g+xywSfAfpXsBKDASjUVQW0bpA6l/1hA5Uckim8tBNDHSHfzey9fJvIhcze7zisQ
XsaeRGNg6+oqrOkZkk/8
=Uh2L
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--
