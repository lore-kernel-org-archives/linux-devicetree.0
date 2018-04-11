Return-Path: <SRS0=ytM0=HA=jmondi.org=jacopo@kernel.org>
Date: Wed, 11 Apr 2018 10:35:16 +0200
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH/RFT v3 0/3] thermal: add support for r8a77995
Message-ID: <20180411083516.GJ6436@w540>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <20180411081258.GI6436@w540>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Content-Disposition: inline
In-Reply-To: <20180411081258.GI6436@w540>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I am sorry

On Wed, Apr 11, 2018 at 10:12:58AM +0200, jacopo mondi wrote:
> Hello Kaneko-san
>
> On Tue, Apr 03, 2018 at 09:43:02PM +0900, Yoshihiro Kaneko wrote:
> > This series adds thermal support for r8a77995.
> > R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> > Therefore this series adds r8a77995 support to rcar_thermal driver not
> > rcar_gen3_thermal driver.
> >
> > This series is based on the next branch of Zhang Rui's linux tree.
>
> Seems like I cannot find Zhang's tree anywhere. My google-fu is surely
> bad, but can you paste a link to the tree here below, please?

It is clearly this one
https://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git/

Sorry for the noise :)
>
> Thanks
>    j
>
> >
> > v3 [Yoshihiro Kaneko]
> > * As suggested by Geert Uytterhoeven
> > rcar_thermal.c:
> > - make use_of_thermal in structure rcar_thermal_chip a single bit
> > - add feature bits to rcar_thermal_chip
> > - add the number of interrupts to rcar_thermal_chip
> > - remove rcar_thermal_type in rcar_thermal_cip
> > - make variable chip in rcar_thermal_probe() a const
> >
> > rcar-thermal.txt:
> > * No change
> >
> > r8a77995.dtsi:
> > * No change
> >
> >
> > v2 [Yoshihiro Kaneko]
> > * As suggested by Geert Uytterhoeven
> > rcar_thermal.c:
> > - remove rcar_of_data macro
> > - store a pointer to rcar_thermal_chip in rcar_thermal_priv
> > - remove unnecessary cast in rcar_thermal_dt_ids
> >
> > rcar-thermal.txt:
> > - drop the fallback for D3
> > - update the paragraph about interrupts
> >
> > r8a77995.dtsi:
> > - fix the base address and the register addresses
> > - drop the fallback
> >
> > Yoshihiro Kaneko (3):
> >   thermal: rcar_thermal: add r8a77995 support
> >   dt-bindings: thermal: rcar-thermal: add R8A77995 support
> >   arm64: dts: renesas: r8a77995: add thermal device support
> >
> >  .../devicetree/bindings/thermal/rcar-thermal.txt   |   7 +-
> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  30 ++++
> >  drivers/thermal/rcar_thermal.c                     | 154 ++++++++++++++++-----
> >  3 files changed, 157 insertions(+), 34 deletions(-)
> >
> > --
> > 1.9.1
> >



--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJazcjDAAoJEHI0Bo8WoVY8TBkP+wb3wuQVJNiXwzu4TZfcbq6l
kaoJaIva4fGJppRAbMBHh72snIaltt0CLn9Z8vUDceScdhuqQ8SHTEC7CqmXlVdq
N+xTtpE5Leqfe6tLU8BPU8p/RUUqtuT/b7NfNelTt6SKfF9ESq1Q+8HvQ+34CGVE
xyEsPQUypVqqQzQ3wtBJCNUrXXp0WF57Tk/0FZh1xH98wWsevSaVCneBoEutnyLh
7pG5DtLrq8zFSBvjY7bIOXpZYzFQTVNUkmbZRmt3sfcqadu9MDt5yeyYP2iao9nb
dN09FtFqXU1YZiIbxKEEIz6iMDwTQm2sWwqLqR7CDbu24C93DgKcvPAn0k+fuOJ+
swm6+/QUbrvJ8hR3/7vzx3o1JX6r9UzfyyMWVLAYBP3bXx5TxSO4pUgMRCQ+k1xF
gZXpCutYIJGoILABqZEuqPIIy1628eFpJtOXeH0MYJPH8th0E1PXrAvyTWUrYhtg
PlMe/58kT7V781KN5XhWsaquXliyuKR4wpyyOgSBXZwOhulIxvF3QiIEQtOydS3T
01555JTEpd9ztn2As7cq21+ee+aU7xAOEWVNZ7HcC6No2Hy/4+Y7ZQE98WEZvQtd
lmy90DNZqtO2y/Yl375qIkNYFPvIQfidZMMTfsA+sY7H1mHToQ8a5CQu6PVyDcGp
xKIzagmX+sLGEo63o9hb
=SikC
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
