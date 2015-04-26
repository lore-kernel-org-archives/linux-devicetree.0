From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sunxi: dts: Add A10 uarts pin muxing options
Date: Sun, 26 Apr 2015 18:11:57 +0200
Message-ID: <20150426161157.GM5627@lukather>
References: <1430043338-28982-1-git-send-email-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fDP66DSfTvWAYVew"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430043338-28982-1-git-send-email-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--fDP66DSfTvWAYVew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Sun, Apr 26, 2015 at 12:15:38PM +0200, Richard Genoud wrote:
> The A10 has 8 uarts, only uart0 and uart1 where filled.
> This patch adds all the missing uarts(2 to 7) pin muxing to the dtsi.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

It's obviously correct, but I'd rather not add new pinctrl nodes that
don't have any users so that it doesn't bloat the DT without any
particular reason.

Feel free to resubmit this patch if one of these nodes become actually
useful.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--fDP66DSfTvWAYVew
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVPQ5NAAoJEBx+YmzsjxAgqkYQALQeom7fFQKFHOHyjSzwotAZ
Iqii6ZJzdR1LG8v7nyoAw/a0EFxDjhzjsW6L7hO9SEd20CX7y6g6aEh8ylYcuEAA
RNDXUV/XwBndxzbdMHi01MI3cKYlhDAhHBJmrRRW63RTSx1ajPuP+kWqUbJHvF+v
ieB/pOOab2eHVm/oh/4qgCLlNAY+rr3bdjYv1xtxJQ+zNUlhvyTngihH/LK8pJDi
FUMZxRJfoaPIe9ECObuJDwzSsAJ8475o0nj+vRic5hEkahJMMWa+eHH5tSXuLp0d
ZCRusxkwBKlLu9cQFlNrh+5h9YtstHi8SDUzPPCa9FgtbByM5Vz3jZWocejdBiUR
Df2PTtCufgRCflKvgXOfIWO1XNRAE8xLh9gpTk25Gb+VmKpd8+VQe1162nY7xSAN
JV0W+pKv2DdM5lPwQBwmHAoSeW1gno+Ve4HSbk7EvSJL7kHMLQMewgSCLuNAEjMG
UvkPuntQxEQndBUkT6e83Uj+NG2S3S+dOtFHNegSAg7zeJmS+ZkN1IhPl+ZIinpz
MT8uJtK6ZknWQOZSiNLnblpc8qssf8Z9j9fl+PxD6svYD5WdOlEGYqUGs31FDFHE
I+zQL0losSrWXZRXSlFJnCYYhxwc4jtbzGGSbi4gZqXb//83MOlxawb453DlMMSm
PLg71/2hjCMlUxaRKHV9
=G0Zs
-----END PGP SIGNATURE-----

--fDP66DSfTvWAYVew--
