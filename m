From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/5] regulator: max14577: Add regulator driver for
 Maxim 14577
Date: Wed, 27 Nov 2013 13:16:26 +0000
Message-ID: <20131127131626.GH3296@lee--X1>
References: <1385135469-27044-1-git-send-email-k.kozlowski@samsung.com>
 <1385135469-27044-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385135469-27044-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

> MAX14577 chip is a multi-function device which includes MUIC,
> charger and voltage regulator. The driver is located in drivers/mfd.
>=20
> This patch adds regulator driver for MAX14577 chip. There are two
> regulators in this chip:
> 1. Safeout LDO with constant voltage output of 4.9V. It can be only
>    enabled or disabled.
> 2. Current regulator for the charger. It provides current from 90mA u=
p
>    to 950mA.
> Driver supports Device Tree.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mfd/max14577.c       |    3 +-
>  drivers/regulator/Kconfig    |    7 ++
>  drivers/regulator/Makefile   |    1 +
>  drivers/regulator/max14577.c |  268 ++++++++++++++++++++++++++++++++=
++++++++++
>  4 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/regulator/max14577.c
>=20
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 94b766d..d841f2a 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -26,7 +26,8 @@
> =20
>  static struct mfd_cell max14577_devs[] =3D {
>  	{ .name =3D "max14577-muic", },
> -	{ .name =3D "max14577-regulator", },
> +	{ .name =3D "max14577-regulator",
> +		.of_compatible =3D "maxim,max14577-regulator", },
>  	{ .name =3D "max14577-charger", },
>  };

If you separate this patch out and make it look 'normal' i.e. sort out
the indenting, I'll apply it. Instead of this randomness, I expect to
see something like:=20

> +	 {
> +	        .name =3D "max14577-regulator",
> +	        .of_compatible =3D "maxim,max14577-regulator",=20
> +	 },


--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
