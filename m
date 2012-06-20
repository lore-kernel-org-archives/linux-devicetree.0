From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 0/3] regulator: dt: add policy to match regulator with
 prop "regulator-compatible"
Date: Wed, 20 Jun 2012 11:00:58 +0100
Message-ID: <20120620100058.GD3978@opensource.wolfsonmicro.com>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkdYSLiLZwVwY1tU9PWGTx2EGP6OykeXE5rtwRKAHror-Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYSLiLZwVwY1tU9PWGTx2EGP6OykeXE5rtwRKAHror-Yg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, lrg@ti.com, lee.jones@linaro.org, swarren@wwwdotorg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 20, 2012 at 10:59:32AM +0200, Linus Walleij wrote:

> If I had today deployed the device trees generated prior to this patch,
> and try to boot kernels after this patch with the same device tree,
> would they still work as expected?

> I don't know it it's an issue right now, but at some point we need to
> realize that people will expect old device trees to work on newer
> kernels.

I don't think anyone's taking that idea terribly seriously right now for
ARM, lots of the core SoC bindings are still in flux or not there.

Even for PowerPC where this has apparently been achieved I've still had
to push back on new mandatory properties being added :/

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP4Z9SAAoJEBus8iNuMP3d2zQP/AtTmTv5hFGdA7J6W6zduBe9
A80Z2vxlMn77rV+WMtY6UjD1LG03A49Q1xK60mzWUS6Y3FT/xA20zWsdRUFGnLTJ
xTQv/RVN4KQ8xo0i9tRKxHqLcJMvVssXjC3CFtu1WqnGO50qkJ7qqQdT/hiNJ3wn
T2HnShE6i4/L90/XRi/U9ZG3UkOsoxg/Itd5/4LzfpOWzprZcSbSwGHHe7qIAgsu
deBwZySdozRQfFhpPn9PutP5U8Npkbly5QBt8oMSuZwzqnYoFp+W92ZjPogCc5OF
MWoiUNPrt+n6P+utZnRQhkgE0XIcut9FGAQImYESX/ieBSZGQKHVL1/zX6ifHTFK
5SQSf5r3VyD+QzVfRrr0KbPKo0NksaqlLuHGQApIEcDoB/UWTq22iFZr6qB6WspN
zjaDRDA4tWIjXPPMgpDE4N7tymoQRNtZM5Gdo4iJ/KfAReTV/iczQWBVzV5J/tl1
V1cu8/3Tapi2sCmiz0RGRxeWS4DJmNiu9hBP5b9lMTBiPp3W/ruTq8X9ZKT8ySiA
391qmVVikcEjAWf+L2MQFhM1g+DK3YJYVNKhdjGZud0Cq4rF/MG8lbHavtBPIdOX
MkPZOb8+8PH8CamHm6/EQtc6rrcYx72DF+iBkLoKBJXBzUc1Mqlw+xaKBgdzdPqT
X1eiMysIeEcUYqmbQ8E4
=WphM
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
