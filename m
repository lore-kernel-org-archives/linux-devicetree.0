From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] ARM: imx: mach-imx6ul: add imx6ull support
Date: Tue, 1 Nov 2016 08:29:56 -0200
Message-ID: <CAOMZO5AsF8s9Ff2NHQ+j2_xSBNEzGY6bGLK-kgvx-aST+K2PNQ@mail.gmail.com>
References: <1477969343-19887-1-git-send-email-peter.chen@nxp.com> <1477969343-19887-3-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1477969343-19887-3-git-send-email-peter.chen@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 1, 2016 at 1:02 AM, Peter Chen <peter.chen@nxp.com> wrote:
> imx6ull is derived SoC from imx6ul.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  arch/arm/mach-imx/mach-imx6ul.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-imx/mach-imx6ul.c b/arch/arm/mach-imx/mach-imx6ul.c
> index 58a2b88..0b24630 100644
> --- a/arch/arm/mach-imx/mach-imx6ul.c
> +++ b/arch/arm/mach-imx/mach-imx6ul.c
> @@ -89,10 +89,11 @@ static void __init imx6ul_init_late(void)
>
>  static const char * const imx6ul_dt_compat[] __initconst = {
>         "fsl,imx6ul",
> +       "fsl,imx6ull",
>         NULL,
>  };
>
> -DT_MACHINE_START(IMX6UL, "Freescale i.MX6 Ultralite (Device Tree)")
> +DT_MACHINE_START(IMX6UL, "Freescale i.MX6 UltraLite (Device Tree)")

Is this change really needed?
