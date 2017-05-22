From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: orange-pi-zero: interrupt triggering for
 XR819 WiFi chip
Date: Mon, 22 May 2017 09:49:17 +0200
Message-ID: <20170522074917.msy3sypver3kai5p@flea.lan>
References: <20170519213550.8434-1-geomatsi@gmail.com>
 <20170519213550.8434-2-geomatsi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ez4eittfibstl4yl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170519213550.8434-2-geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ez4eittfibstl4yl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

Thanks for your patches!

On Sat, May 20, 2017 at 12:35:49AM +0300, Sergey Matyukevich wrote:
> Specify interrupt triggering for XR819 SDIO WiFi chip
> on orange-pi-zero board.
>=20
> For more details see: http://linux-sunxi.org/Wifi#Allwinner

Please don't reference details in a wiki page. URLs can change and
wiki page get rewritten. git history is immutable. Your commit log
should contain everything there is.

The patch itself looks good though.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ez4eittfibstl4yl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZIpf9AAoJEBx+YmzsjxAgDFoP/AsdikJ0w9UzWtzBYEJ9zggI
7TeIfyUyFtaL+cyQqWZF/DTRcbwwEq0KrFSlLhnnZ5kOsyya+l1MqnG8ihGvLWQF
TiTSmnsTxrLyg+yN0n+tYlQ3yVN0WBLg/i8e8zLX3z/ZEvzjjKKyhTCyuylvGq/k
U1PHbGBfrUmWD5K9vH86ygGg2t3bi7G8XcBrjwe2vm+YL/zFQNPovtMeuZvbshIG
ful6XGvWlHWoNjR4Kvqr5+RQ66em7wal4QiVthzl8o33WvVNOTUFGm68z3F7Kutd
juxTQ+Ne8xP+0rPWy8EHyZRGdRDFrTJy5qJe/M8Lzf02rPTsyZ4nke9At59riMCI
yK1ZOSK+p5I2i+Sn7uHkGrNtE3rKFoJQ72OHswPve7qmvPe18bWhrCanAIx7o28l
W0dNHnR55seueWx71uhFlQsAqJxy7VFazHjlH1w18Lc9Pz3RTBlysqNX5VpPkuxj
M/itR0wFAkYqLllWmFpPO8PA0k1GA3RP1M1AafyKtFo2qpOVDo9Obhh0NCevUdkb
/ZHZeBx56SNmcBt3okBqHVaKJyNbWNYILf75E+81ury3N3ScB+BSvUEQR6UhH1Lo
dLlWeh6UnBDPTNqjVsQYydOHzH5BqoiETEwo0OZXNgCx5cG2y/xDCJ0IExGfJPSD
TtUvBz4RWcSfOzObd7aE
=6Tii
-----END PGP SIGNATURE-----

--ez4eittfibstl4yl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
