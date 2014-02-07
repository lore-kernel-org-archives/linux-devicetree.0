From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/5] clk: sunxi: Add support for USB
 clock-register reset bits
Date: Fri, 7 Feb 2014 20:30:00 +0100
Message-ID: <20140207193000.GP3192@lukather>
References: <1391786513-20780-1-git-send-email-hdegoede@redhat.com>
 <1391786513-20780-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UJEqbsikIZBgizPR"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPHI2SLQKGQEXTZNQUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391786513-20780-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UJEqbsikIZBgizPR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2014 at 04:21:49PM +0100, Hans de Goede wrote:
> The usb-clk register is special in that it not only contains clk gate bit=
s,
> but also has a few reset bits. This commit adds support for this by allow=
ing
> gates type sunxi clks to also register a reset controller.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UJEqbsikIZBgizPR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS9TQ4AAoJEBx+YmzsjxAg/tkQAKDgHKtNqNpiSAYWvgxKdycH
SC3J5rFlPz4ut66JMoF8nn+AGaH88qTqviz64GoINGpXLseZaBKhb9hkOHbhtOf4
8g+69xg31XZJPMPFnDQneL/7keE5T1qk6gsmUZmXZ6kVdUQK1bwXQTwSKDsLho4K
hO5K6h6e2Yfje6tERtHweRzY2+hFS8fiy42bDxFlWutsrfwAl4RD+Wi+gprNAphJ
ZwEBMxsuCvigrDip6/b0Aie+fBCsZoTCMCG1GhD6FqWPOu5Q49U5DCw1DB2iHjY3
W6VLKMOV2AoI2Maijm29/+GRMqv6mj8vhWUdxkpKSfydKSeoxAbQo+65EE6GYWct
c83phvhLqSdNf3pycFZoDU75yBlW+2Sk8KHR+VWSpJ0gjLJfqe5CeqEjDO6cOjhj
FBiOXdgY7ZcACu7Yxk7sc3v2fkjhzNWojbasj7gkz+FWCaIjMZpj3vjtbac20HRO
8YEHzNf7gNXX+5Xq3yyCyp0t9zl54C+rE6XNuiX6DPW9S/nTNMtgu+xpOp2ctTeP
OhysFKIcETCKwKN3RXT70q+PjhJ3pfffc4g4ngXYqr1Kg3Y5lkTtvcr/xR6aLy/z
AndhzvStilNxc1V2/MQElb8vnTOyThOlhdF+RCLw3t7hfyhSmpqm3pPcfQv+vSUA
fUaFborN3oglgiZoz9Hl
=zNxT
-----END PGP SIGNATURE-----

--UJEqbsikIZBgizPR--
