From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v6 12/13] MAINTAINERS: add Mediatek shutdown drivers
Date: Sun, 1 Sep 2019 22:12:15 +0200
Message-ID: <20190901201215.lkjb54amhjjpjqrp@earth.universe>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-13-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="enskgkpgm3vynalk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190818135611.7776-13-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sean Wang <sean.wang@mediatek.com>, "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" <a.zummo@towertech.it>, linux-pm@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>, linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--enskgkpgm3vynalk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Aug 18, 2019 at 03:56:10PM +0200, Frank Wunderlich wrote:
> From: Josef Friedl <josef.friedl@speed.at>
>=20
> add Section in MAINTAINERS file for poweroff driver
>=20
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v5: none
> changes since v4: none
> changes since v3: moved SOB
> changes since v2: none (=3Dv2 part 6)
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6426db5198f0..4172a3177633 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10128,6 +10128,13 @@ S:	Maintained
>  F:	drivers/net/dsa/mt7530.*
>  F:	net/dsa/tag_mtk.c
> =20
> +MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS
> +M:	Sean Wang <sean.wang@mediatek.com>
> +L:	linux-pm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/power/reset/mt6323-poweroff.txt
> +F:	drivers/power/reset/mt6323-poweroff.c
> +
>  MEDIATEK JPEG DRIVER
>  M:	Rick Chang <rick.chang@mediatek.com>
>  M:	Bin Liu <bin.liu@mediatek.com>
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--enskgkpgm3vynalk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl1sJh8ACgkQ2O7X88g7
+prLXw/+IHmCR/FU/6lA6ifbZk9WSF+RGRWcKNrqqUkaVg3yMF0QizjvQ1zQQxRp
hb8o6lo0muECVRhfppPXezPrd51ugSSrdo+h7knBwYHKcJ3ESAB3yuKDqPLSugkS
AX0fFXGTLN3ey8Oq/ORuLhrK2VGMcLR6bAf8JzopXW8WIJMZyanXhuMp02BB75j7
7bUwD94IiLrd3wntAinZB/ytEVKK3hRDf2IcCyrkL/qTDVsv0ngWn/CY0Sh0aWCo
UgVxapwaDFttTGEaFKtp1pjlNw37zt9RVNFDwOJHPsbMMweB3CR0SHfQJcaXrHO2
2Br+GFSOZu/EknnOsZhnAQECa5cRIsQF6K7U6gmDEhuZwwAQs3Hr+auawIOaqJpt
BKW6ryw5mOKmaMJKMvyLgrO5JafA2/ul7LhXzzZBXZvW43YyGMs3h55rSECdHQNV
iFrDYW3ujiNLmvn272Agi1tlwM7zzfMjT6r1jXtugPc40tDBoQcmg3URbI/TAM+c
IQ5ha2j9FYFUaUOgrCHeu5fJVhWPHeRqxuxNwHmodGwgsaSWvYPoShJGQdr3lVp6
ntKtlKrIpibl2TRJ4aHKutxKuOs+4R2CwIEVBH0e2bqBtmGGZQivvvOfmD0BqKqi
1TIxjVbby9tddeROJxh1l7BPaXVKnkTKoxK2xoEv5Uzzb5I7RFM=
=hSBs
-----END PGP SIGNATURE-----

--enskgkpgm3vynalk--
