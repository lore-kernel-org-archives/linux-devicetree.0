From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/10] pinctrl: mediatek: Add Pinctrl/GPIO driver for
 mt6397.
Date: Thu, 14 May 2015 08:22:28 +0100
Message-ID: <20150514072228.GB20358@x1>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
 <1431567346-33780-6-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431567346-33780-6-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.orgl
List-Id: devicetree@vger.kernel.org

On Wed, 13 May 2015, Hongzhou Yang wrote:

> Add mt6397 support using mediatek common pinctrl driver.
>=20
> mt6397 is a PMIC, and pinctrl/GPIO is part of 6397 chip.
> Pinctrl/GPIO driver should obtain regmap from PMIC,
> so adding this support to common code.
>=20
> Also, mt6397 is no need to support interrupt controller,
> so changing common code to skip it.
>=20
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c                     |    3 +

Please break this out into a separate patch that I can take through my
tree.  There is no need for you to bind up changes in multiple
subsystems here.

>  drivers/pinctrl/mediatek/Kconfig              |    6 +
>  drivers/pinctrl/mediatek/Makefile             |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt6397.c     |   78 +++++
>  drivers/pinctrl/mediatek/pinctrl-mt8135.c     |    2 +-
>  drivers/pinctrl/mediatek/pinctrl-mt8173.c     |    2 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   13 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.h |    3 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h |  424 +++++++++++++++=
++++++++++
>  9 files changed, 527 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6397.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 09bc780..012c620 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -34,6 +34,9 @@ static const struct mfd_cell mt6397_devs[] =3D {
>  	}, {
>  		.name =3D "mt6397-clk",
>  		.of_compatible =3D "mediatek,mt6397-clk",
> +	}, {
> +		.name =3D "mediatek-mt6397-pinctrl",
> +		.of_compatible =3D "mediatek,mt6397-pinctrl",
>  	},
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
