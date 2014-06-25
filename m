From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/6] clk: sunxi: Support factor clocks
 with N factor starting not from 0
Date: Wed, 25 Jun 2014 22:15:51 +0200
Message-ID: <20140625201551.GI19569@lukather>
References: <1403603980-31101-1-git-send-email-wens@csie.org>
 <1403603980-31101-4-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NyChO5MpGs3JHJbz"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7O5VSOQKGQEOPWJM6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403603980-31101-4-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NyChO5MpGs3JHJbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 05:59:37PM +0800, Chen-Yu Tsai wrote:
> The PLLs on newer Allwinner SoC's, such as the A31 and A23, have a
> N multiplier factor that starts from 1, not 0.
>=20
> This patch adds an option to the factor clk driver's config data
> structures to specify the base value of N.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NyChO5MpGs3JHJbz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTqy33AAoJEBx+YmzsjxAgswwP/RC7rvYBP2z4wH0T327EPD6E
UvoahyZbmXusXrJk2vRMWBgEPlD1n8GV6hNnE+zWIxCi0T7+gNH73rwVouGFtCqn
Y4NisQD91nGaCI69Z1jLDdd/H5+WiQ5MDKnriHyfoJyTXuJehQnS92T0uPLW5P5Z
6GHgvaIKiLR57qp9kpJ7ccW9TUFwBAB0TWEbkhnBda8WDCZLrZwPCpyuSfwLWAep
IQkwyt2BEgcC2PhpWYpRH4LtnhCN/YV/nzW9k12FrDtp7NAdw5qczHOlOGogrbwE
2bYdGGHHp+DgY+SJk1zGR/H/8fFUZWA0Mvmzm3s4F1ygwDpCn3t83k/kd6FUb3Gl
C66gLOz6ccKaJq0t53ExrpoxGF+0XvKfnIQME2RQY7vloy7iL4lubsAM34QVVUWW
RlsSF1GKkaHll8vT9MoTkGUnxNwc+pyL08WWA+KBo0xSlki5dl114+XXdxGj7u52
7Hug4vs6g8VtmsExv8I08dUaPxaXe1mKkDwfZYMitZyIBcRY6uRHVK1dHuKPTN+F
I1NQ6hUj2fBSPXAEWPzS5jRuh4GdvKhBN9bMXwVtfs5A7yEG8G9b8Do4lCou+48v
aDZK23yj44Y2jpUgTooswg7Qcl4XRsGVW7CFr/dSM5NNu0o6XhLhii0hsZx+ocYZ
1TMwp8mk3bcOcVhmByZW
=/VF5
-----END PGP SIGNATURE-----

--NyChO5MpGs3JHJbz--
