From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 4/5] clk: imx: add imx composite clock
Date: Fri, 17 Aug 2018 09:25:44 +0200
Message-ID: <20180817072544.izryvqlqpaihs7kl@pengutronix.de>
References: <1534433236-8925-1-git-send-email-abel.vesa@nxp.com>
 <1534433236-8925-5-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534433236-8925-5-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@linux.com>, linux-gpio@vger.kernel.org, linux-imx@nxp.com, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Abel,

On Thu, Aug 16, 2018 at 06:27:15PM +0300, Abel Vesa wrote:
> Since a lot of clocks on imx8 are formed by a mux, gate, predivider and
> divider, the idea here is to combine all of those into one more complex
> clock type, therefore moving the complexity inside the composite clock and
> outside of the SoC specific clock driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  drivers/clk/imx/Makefile        |   1 +
>  drivers/clk/imx/clk-composite.c | 471 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk.h           |   9 +
>  3 files changed, 481 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-composite.c
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index b87513c..4fabb0a 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -3,6 +3,7 @@
>  obj-y += \
>  	clk.o \
>  	clk-busy.o \
> +	clk-composite.o \
>  	clk-cpu.o \
>  	clk-fixup-div.o \
>  	clk-fixup-mux.o \
> diff --git a/drivers/clk/imx/clk-composite.c b/drivers/clk/imx/clk-composite.c

You nearly duplicate drivers/clk/clk-composite.c. This seems necessary
because in the hardware we have two dividers instead of a single one as
the generic composite clock type support.

Instead of duplicating the composite clk code you could create your own
clk_ops for the divider which handles both dividers in a single
callback. You could then use the generic composite clk.

When I made the suggestion that we should a create a composite clk I had
assumed you'd come up with a patch which has a single private struct clk_ops
filled in with the gate/mux/rate callbacks which are then open coded in
your driver. I am not convinced this splitting up in three different
(gate/mux/rate) struct clk_ops brings us anything. For example the open
coded gate code is really trivial compared to all this boilerplate code
we need for the generic composite clk. But maybe the maintainers have a
different opinion?

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
