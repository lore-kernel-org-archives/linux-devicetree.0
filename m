From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: h3: Enable EMAC with external PHY on Orange
 Pi Plus 2E
Date: Sat, 10 Jun 2017 11:24:53 +0200
Message-ID: <20170610092453.wl3gymli4m4eiqam@flea.home>
References: <20170609153436.18370-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="v72bnm5ywemja64u"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170609153436.18370-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh4Ykp1iOSErHA@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--v72bnm5ywemja64u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2017 at 11:34:36PM +0800, Chen-Yu Tsai wrote:
> The Orange Pi Plus 2E, unlike the Orange Pi PC and PC Plus which its
> schematics are based on, uses an external Realtek RTL8211E PHY in
> RGMII mode, with a GPIO enabling the regulator for I/O signalling
> power supplies. The PHY's main power supply is enabled by the main
> 5V power supply.
>=20
> Add the regulator and PHY nodes, and override the PHY phandle under
> the EMAC node, so that the EMAC works properly on this board.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--v72bnm5ywemja64u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZO7rlAAoJEBx+YmzsjxAgjjMQAMJOCQDnTQSfEWaD7Z8/fzM/
YkmH70pEdTOqZQg1v32OMIxW3sSskU0ady0DCA91/Rv2KIiA3md+jXgz39Bc8owp
VV61EUEzjahpdcLXuBLfenR1buATWvDWq20Sd8zf1AZ3zaay7f8c5Tyg0S6T+Xkp
S2nYMIEXqef4xBjSNcsiaaoXJj+DBlCy44XjHaDaTTXDd6l0NnWPGU3LPkdElqvg
Zd5SExfW+M81a+bq/88NiZDUJtuVbVX7GyasTl5hrItZfTcbjk0pmSD0AOrcyeYT
wqv0l/W8hPRte8S7bkwFxYm43vy/rY5P7ChoirWNvqAJbvANwjl4fTV+9Plt0mrc
nNGJNeI5KLOGORd5+COoZgdlmWlNKnZiquEJa2lRYzBUeGVXO/WHcyNzSyvFzdK8
u9jrP65IU/qQG60bBRsJj4LCXY7Ts7uef+36N70kefGaPpdn06n5Y58K5WsgBjnW
6DWSVnz7Ze7e+XFiNpOWP6O+WAcrs4FzjRdVqoSraCzWvZN+QZ53Dwr7ofMgk/Eo
ZkxOWHnR9J0Bp4E0wLOgDLySWTDyDBGBsYtP94xsCLJIvleU+9Q/wJkwGfAa35Aq
wE/HA9Lyzyy1ELu8HVCvrsSyIG2yj1kPdBrrDGpiYXIzI5DTmCmaHR9GypdpcMFo
822khfE3u/6otkuv0yVL
=5xYe
-----END PGP SIGNATURE-----

--v72bnm5ywemja64u--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
