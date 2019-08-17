From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 5/6] clk: imx8mn: Add necessary frequency support for ARM PLL table
Date: Fri, 16 Aug 2019 20:52:19 -0700
Message-ID: <20190817035220.268F32173B@mail.kernel.org>
References: <1565866783-19672-1-git-send-email-Anson.Huang@nxp.com> <1565866783-19672-5-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565866783-19672-5-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, festevam@gmail.com, kernel@pengutronix.de, leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, rjw@rjwysocki.net, robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, viresh.kumar@linaro.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Quoting Anson.Huang@nxp.com (2019-08-15 03:59:42)
> diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
> index ecd1062..3f1239a 100644
> --- a/drivers/clk/imx/clk-imx8mn.c
> +++ b/drivers/clk/imx/clk-imx8mn.c
> @@ -82,6 +84,7 @@ static struct imx_pll14xx_clk imx8mn_dram_pll =3D {
>  static struct imx_pll14xx_clk imx8mn_arm_pll =3D {
>                 .type =3D PLL_1416X,
>                 .rate_table =3D imx8mn_pll1416x_tbl,
> +               .rate_count =3D ARRAY_SIZE(imx8mn_pll1416x_tbl),

Why is rate_count added? That's not described in the commit text.
