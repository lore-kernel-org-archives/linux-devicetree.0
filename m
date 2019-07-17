From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] clk: imx8: Add DSP related clocks
Date: Wed, 17 Jul 2019 23:17:19 +0300
Message-ID: <CAEnQRZB23GLVXp459+JieeqQdAKXBRyeTc=hxnovFZwje-tgCw@mail.gmail.com>
References: <20190702152007.12190-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702152007.12190-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, weiyongjun1@huawei.com, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>
List-Id: devicetree@vger.kernel.org

Aisheng/Jacky,

Can you help with review on this?

On Tue, Jul 2, 2019 at 6:22 PM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> i.MX8QXP contains Hifi4 DSP. There are four clocks
> associated with DSP:
>   * dsp_lpcg_core_clk
>   * dsp_lpcg_ipg_clk
>   * dsp_lpcg_adb_aclk
>   * ocram_lpcg_ipg_clk
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c     | 5 +++++
>  include/dt-bindings/clock/imx8-clock.h | 6 +++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index fb6edf1b8aa2..c0aff7ca6374 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -72,6 +72,11 @@ static const struct imx8qxp_lpcg_data imx8qxp_lpcg_adma[] = {
>         { IMX_ADMA_LPCG_I2C2_CLK, "i2c2_lpcg_clk", "i2c2_clk", 0, ADMA_LPI2C_2_LPCG, 0, 0, },
>         { IMX_ADMA_LPCG_I2C3_IPG_CLK, "i2c3_lpcg_ipg_clk", "dma_ipg_clk_root", 0, ADMA_LPI2C_3_LPCG, 16, 0, },
>         { IMX_ADMA_LPCG_I2C3_CLK, "i2c3_lpcg_clk", "i2c3_clk", 0, ADMA_LPI2C_3_LPCG, 0, 0, },
> +
> +       { IMX_ADMA_LPCG_DSP_CORE_CLK, "dsp_lpcg_core_clk", "dma_ipg_clk_root", 0, ADMA_HIFI_LPCG, 28, 0, },
> +       { IMX_ADMA_LPCG_DSP_IPG_CLK, "dsp_lpcg_ipg_clk", "dma_ipg_clk_root", 0, ADMA_HIFI_LPCG, 20, 0, },
> +       { IMX_ADMA_LPCG_DSP_ADB_CLK, "dsp_lpcg_adb_clk", "dma_ipg_clk_root", 0, ADMA_HIFI_LPCG, 16, 0, },
> +       { IMX_ADMA_LPCG_OCRAM_IPG_CLK, "ocram_lpcg_ipg_clk", "dma_ipg_clk_root", 0, ADMA_OCRAM_LPCG, 16, 0, },
>  };
>
>  static const struct imx8qxp_ss_lpcg imx8qxp_ss_adma = {
> diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
> index 4236818e3be5..673a8c662340 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -283,7 +283,11 @@
>  #define IMX_ADMA_LPCG_PWM_IPG_CLK                      38
>  #define IMX_ADMA_LPCG_LCD_PIX_CLK                      39
>  #define IMX_ADMA_LPCG_LCD_APB_CLK                      40
> +#define IMX_ADMA_LPCG_DSP_ADB_CLK                      41
> +#define IMX_ADMA_LPCG_DSP_IPG_CLK                      42
> +#define IMX_ADMA_LPCG_DSP_CORE_CLK                     43
> +#define IMX_ADMA_LPCG_OCRAM_IPG_CLK                    44
>
> -#define IMX_ADMA_LPCG_CLK_END                          41
> +#define IMX_ADMA_LPCG_CLK_END                          45
>
>  #endif /* __DT_BINDINGS_CLOCK_IMX_H */
> --
> 2.17.1
>
