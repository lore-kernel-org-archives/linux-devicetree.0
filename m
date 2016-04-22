From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 1/9] clk: mediatek: Refine the makefile to support
 multiple clock drivers
Date: Fri, 22 Apr 2016 11:02:49 +0200
Message-ID: <5719E8B9.4030908@gmail.com>
References: <1460621514-65191-1-git-send-email-jamesjj.liao@mediatek.com>
 <1460621514-65191-2-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1460621514-65191-2-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: John Crispin <blogic@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Shunli Wang <shunli.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org



On 14/04/16 10:11, James Liao wrote:
> Add a Kconfig to define clock configuration for each SoC, and
> modify the Makefile to build drivers that only selected in config.
>
> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> Tested-by: John Crispin <blogic@openwrt.org>
> ---

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   drivers/clk/Kconfig           |  1 +
>   drivers/clk/mediatek/Kconfig  | 23 +++++++++++++++++++++++
>   drivers/clk/mediatek/Makefile |  6 +++---
>   3 files changed, 27 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/clk/mediatek/Kconfig
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 16f7d33..d94302e 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -199,6 +199,7 @@ config COMMON_CLK_PXA
>
>   source "drivers/clk/bcm/Kconfig"
>   source "drivers/clk/hisilicon/Kconfig"
> +source "drivers/clk/mediatek/Kconfig"
>   source "drivers/clk/mvebu/Kconfig"
>   source "drivers/clk/qcom/Kconfig"
>   source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> new file mode 100644
> index 0000000..dc224e6
> --- /dev/null
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -0,0 +1,23 @@
> +#
> +# MediaTek SoC drivers
> +#
> +config COMMON_CLK_MEDIATEK
> +	bool
> +	---help---
> +	  Mediatek SoCs' clock support.
> +
> +config COMMON_CLK_MT8135
> +	bool "Clock driver for Mediatek MT8135"
> +	depends on COMMON_CLK
> +	select COMMON_CLK_MEDIATEK
> +	default ARCH_MEDIATEK
> +	---help---
> +	  This driver supports Mediatek MT8135 clocks.
> +
> +config COMMON_CLK_MT8173
> +	bool "Clock driver for Mediatek MT8173"
> +	depends on COMMON_CLK
> +	select COMMON_CLK_MEDIATEK
> +	default ARCH_MEDIATEK
> +	---help---
> +	  This driver supports Mediatek MT8173 clocks.
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 95fdfac..32e7222 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -1,4 +1,4 @@
> -obj-y += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o
> +obj-$(CONFIG_COMMON_CLK_MEDIATEK) += clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o
>   obj-$(CONFIG_RESET_CONTROLLER) += reset.o
> -obj-y += clk-mt8135.o
> -obj-y += clk-mt8173.o
> +obj-$(CONFIG_COMMON_CLK_MT8135) += clk-mt8135.o
> +obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173.o
>
