From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 08/11] mfd: mediatek: Add GPIO sub module support into
 mfd.
Date: Tue, 19 May 2015 10:34:26 +0100
Message-ID: <20150519093426.GS22418@x1>
References: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
 <1432015882-8646-9-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432015882-8646-9-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com, eddie.huang@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 18 May 2015, Hongzhou Yang wrote:

> Register pinctrl subnode into 6397 mfd cell.
>=20
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c |    3 +++
>  1 file changed, 3 insertions(+)
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

I think the "mediatek-" part should be removed, no?

> +		.of_compatible =3D "mediatek,mt6397-pinctrl",
>  	},
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
