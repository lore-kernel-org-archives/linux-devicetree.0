Return-Path: <SRS0=7qzT=QB=nvidia.com=jonathanh@kernel.org>
Subject: Re: [PATCH V3 3/4] firmware: tegra: add bpmp driver for Tegra210
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
 <1548349435-1086-4-git-send-email-talho@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <0b1c1877-0208-a4e2-8160-d3cf98d4ff76@nvidia.com>
Date: Fri, 25 Jan 2019 13:34:35 +0000
MIME-Version: 1.0
In-Reply-To: <1548349435-1086-4-git-send-email-talho@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Timo Alho <talho@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 24/01/2019 17:03, Timo Alho wrote:
> This patch adds driver for Tegra210 BPMP firmware.
> 
> The BPMP is a specific processor in Tegra210 chip, which runs firmware
> for assisting in entering deep low power states (suspend to ram), and
> offloading DRAM memory clock scaling on some platforms.
> 
> Based on work by Sivaram Nair <sivaramn@nvidia.com>
> 
> Signed-off-by: Timo Alho <talho@nvidia.com>
> ---
>  drivers/firmware/tegra/Makefile       |   1 +
>  drivers/firmware/tegra/bpmp-private.h |   1 +
>  drivers/firmware/tegra/bpmp-t210.c    | 245 ++++++++++++++++++++++++++++++++++
>  drivers/firmware/tegra/bpmp.c         |  46 +++++--
>  include/soc/tegra/bpmp.h              |   1 +
>  5 files changed, 285 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/firmware/tegra/bpmp-t210.c
> 
> diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
> index 367d482..dc41d6f 100644
> --- a/drivers/firmware/tegra/Makefile
> +++ b/drivers/firmware/tegra/Makefile
> @@ -1,5 +1,6 @@
>  tegra-bpmp-y			= bpmp.o
>  tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-t186.o
> +tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-t210.o
>  tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
>  obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
>  obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
> diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
> index 2354337..5132234 100644
> --- a/drivers/firmware/tegra/bpmp-private.h
> +++ b/drivers/firmware/tegra/bpmp-private.h
> @@ -24,5 +24,6 @@ struct tegra_bpmp_ops {
>  };
>  
>  extern struct tegra_bpmp_ops tegra186_bpmp_ops;
> +extern struct tegra_bpmp_ops tegra210_bpmp_ops;
>  
>  #endif
> diff --git a/drivers/firmware/tegra/bpmp-t210.c b/drivers/firmware/tegra/bpmp-t210.c
> new file mode 100644
> index 0000000..cc56682
> --- /dev/null
> +++ b/drivers/firmware/tegra/bpmp-t210.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <soc/tegra/bpmp.h>
> +
> +#include "bpmp-private.h"
> +
> +#define TRIGGER_OFFSET		0x000
> +#define RESULT_OFFSET(id)	(0xc00 + id * 4)
> +#define TRIGGER_ID_SHIFT	16
> +#define TRIGGER_CMD_GET		4
> +
> +#define STA_OFFSET		0
> +#define SET_OFFSET		4
> +#define CLR_OFFSET		8
> +
> +#define CH_MASK(ch)	(0x3 << ((ch) * 2))
> +#define SL_SIGL(ch)	(0x0 << ((ch) * 2))
> +#define SL_QUED(ch)	(0x1 << ((ch) * 2))
> +#define MA_FREE(ch)	(0x2 << ((ch) * 2))
> +#define MA_ACKD(ch)	(0x3 << ((ch) * 2))
> +
> +struct tegra210_bpmp {
> +	void __iomem *atomics;
> +	void __iomem *arb_sema;
> +	struct irq_data *tx_irq_data;
> +};
> +
> +static uint32_t bpmp_ch_sta(struct tegra_bpmp *bpmp, int ch)
> +{
> +	struct tegra210_bpmp *priv = bpmp->priv;
> +
> +	return __raw_readl(priv->arb_sema + STA_OFFSET) & CH_MASK(ch);
> +}
> +
> +static bool tegra210_bpmp_is_resp_ready(struct tegra_bpmp_channel *channel)
> +{
> +	int nr = channel->nr;
> +
> +	return bpmp_ch_sta(channel->bpmp, nr) == MA_ACKD(nr);
> +}
> +
> +static bool tegra210_bpmp_is_req_ready(struct tegra_bpmp_channel *channel)
> +{
> +	int nr = channel->nr;
> +
> +	return bpmp_ch_sta(channel->bpmp, nr) == SL_SIGL(nr);
> +}
> +
> +static bool tegra210_bpmp_is_req_channel_free(
> +	struct tegra_bpmp_channel *channel)
> +{
> +	int nr = channel->nr;
> +
> +	return bpmp_ch_sta(channel->bpmp, nr) == MA_FREE(nr);
> +}
> +
> +static bool tegra210_bpmp_is_resp_channel_free(
> +	struct tegra_bpmp_channel *channel)
> +{
> +	int nr = channel->nr;
> +
> +	return bpmp_ch_sta(channel->bpmp, nr) == SL_QUED(nr);
> +}
> +
> +static int tegra210_bpmp_post_req(struct tegra_bpmp_channel *channel)
> +{
> +	struct tegra210_bpmp *priv = channel->bpmp->priv;
> +	int nr = channel->nr;
> +
> +	__raw_writel(CH_MASK(nr), priv->arb_sema + CLR_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int tegra210_bpmp_post_resp(struct tegra_bpmp_channel *channel)
> +{
> +	struct tegra210_bpmp *priv = channel->bpmp->priv;
> +	int nr = channel->nr;
> +
> +	__raw_writel(MA_ACKD(nr), priv->arb_sema + SET_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int tegra210_bpmp_ack_resp(struct tegra_bpmp_channel *channel)
> +{
> +	struct tegra210_bpmp *priv = channel->bpmp->priv;
> +	int nr = channel->nr;
> +
> +	__raw_writel(MA_ACKD(nr) ^ MA_FREE(nr),
> +		     priv->arb_sema + CLR_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int tegra210_bpmp_ack_req(struct tegra_bpmp_channel *channel)
> +{
> +	struct tegra210_bpmp *priv = channel->bpmp->priv;
> +	int nr = channel->nr;
> +
> +	__raw_writel(SL_QUED(nr), priv->arb_sema + SET_OFFSET);
> +
> +	return 0;
> +}
> +
> +static int tegra210_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
> +{
> +	struct tegra210_bpmp *priv = bpmp->priv;
> +	struct irq_data *irq_data = priv->tx_irq_data;
> +
> +	/* Tegra Legacy Interrupt Controller (LIC) is used to notify
> +	 * BPMP of available messages
> +	 */
> +	if (!irq_data->chip->irq_retrigger)
> +		return -EINVAL;
> +	else
> +		return irq_data->chip->irq_retrigger(irq_data);
> +}

This check could also be handled in probe as there does not seem to be
much pointer registering the device if this irq_retrigger is not supported.

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
