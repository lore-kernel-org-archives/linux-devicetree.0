From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
Date: Thu, 29 Aug 2019 11:47:21 +0100
Message-ID: <20190829104721.tnjk3bqt3cq6iagr@holly.lan>
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-3-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828162617.237398-3-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/char/hw_random/Kconfig    |  13 ++
>  drivers/char/hw_random/Makefile   |   1 +
>  drivers/char/hw_random/npcm-rng.c | 207 ++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/char/hw_random/npcm-rng.c
> 
> diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
> new file mode 100644
> index 000000000000..5b4b1b6cb362
> --- /dev/null
> +++ b/drivers/char/hw_random/npcm-rng.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology corporation.
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/init.h>
> +#include <linux/random.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/hw_random.h>
> +#include <linux/delay.h>
> +#include <linux/of_irq.h>
> +#include <linux/pm_runtime.h>
> +
> +#define NPCM_RNGCS_REG		0x00	/* Control and status register */
> +#define NPCM_RNGD_REG		0x04	/* Data register */
> +#define NPCM_RNGMODE_REG	0x08	/* Mode register */
> +
> +#define NPCM_RNG_CLK_SET_25MHZ	GENMASK(4, 3) /* 20-25 MHz */
> +#define NPCM_RNG_DATA_VALID	BIT(1)
> +#define NPCM_RNG_ENABLE		BIT(0)
> +#define NPCM_RNG_M1ROSEL	BIT(1)
> +
> +#define NPCM_RNG_TIMEOUT_POLL	20

Might be better to define this in real-world units (such as
milliseconds) since the timeout is effectively the longest time the
hardware can take to generate 4 bytes.

> +
> +#define to_npcm_rng(p)	container_of(p, struct npcm_rng, rng)
> +
> +struct npcm_rng {
> +	void __iomem *base;
> +	struct hwrng rng;
> +};
> +
> +static int npcm_rng_init(struct hwrng *rng)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +	u32 val;
> +
> +	val = readl(priv->base + NPCM_RNGCS_REG);
> +	val |= NPCM_RNG_ENABLE;
> +	writel(val, priv->base + NPCM_RNGCS_REG);
> +
> +	return 0;
> +}
> +
> +static void npcm_rng_cleanup(struct hwrng *rng)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +	u32 val;
> +
> +	val = readl(priv->base + NPCM_RNGCS_REG);
> +	val &= ~NPCM_RNG_ENABLE;
> +	writel(val, priv->base + NPCM_RNGCS_REG);
> +}
> +
> +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +	int timeout_cnt = 0;
> +	int ready;
> +
> +	ready = readl(priv->base + NPCM_RNGCS_REG) & NPCM_RNG_DATA_VALID;
> +	while ((ready == 0) && (timeout_cnt < NPCM_RNG_TIMEOUT_POLL)) {
> +		usleep_range(500, 1000);
> +		ready = readl(priv->base + NPCM_RNGCS_REG) &
> +			NPCM_RNG_DATA_VALID;
> +		timeout_cnt++;
> +	}
> +
> +	return !!ready;
> +}

This looks like an open-coded version of readl_poll_timeout()... better
to use the library function.

Also the sleep looks a bit long to me. What is the generation rate of
the peripheral? Most RNG drivers have short intervals between data
generation so they use delays rather than sleeps (a.k.a.
readl_poll_timeout_atomic() ).


> +
> +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +	int retval = 0;
> +
> +	pm_runtime_get_sync((struct device *)priv->rng.priv);
> +
> +	while (max >= sizeof(u32)) {
> +		if (!npcm_rng_wait_ready(rng, wait))
> +			break;

The code as currently written does not honour the wait parameter (e.g.
it sleeps even when wait is false).


> +
> +		*(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> +		retval += sizeof(u32);
> +		buf += sizeof(u32);
> +		max -= sizeof(u32);
> +	}
> +
> +	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> +	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
> +
> +	return retval || !wait ? retval : -EIO;
> +}
> +
> +static int npcm_rng_probe(struct platform_device *pdev)
> +{
> +	struct npcm_rng *priv;
> +	struct resource *res;
> +	u32 quality;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->rng.name = pdev->name;
> +#ifndef CONFIG_PM
> +	priv->rng.init = npcm_rng_init;
> +	priv->rng.cleanup = npcm_rng_cleanup;
> +#endif
> +	priv->rng.read = npcm_rng_read;
> +	priv->rng.priv = (unsigned long)&pdev->dev;
> +	if (of_property_read_u32(pdev->dev.of_node, "quality", &quality))
> +		priv->rng.quality = 1000;
> +	else
> +		priv->rng.quality = quality;
> +
> +	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> +#ifndef CONFIG_PM
> +	writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> +#else
> +	writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> +	       priv->base + NPCM_RNGCS_REG);
> +#endif

If this initialization was moved to npcm_rng_init() then there would be
no need for the additional ifdefing. It would also get rid of the
(potentially slow) readl calls on the PM wakeup path.


> +
> +	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register rng device: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, priv);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	dev_info(&pdev->dev, "Random Number Generator Probed\n");

Does the user need to know this every time we boot? There are lots of
debug tools we can bring to bear if they are worried the device
isn't probing.


Daniel.


> +
> +	return 0;
> +}
> +
> +static int npcm_rng_remove(struct platform_device *pdev)
> +{
> +	struct npcm_rng *priv = platform_get_drvdata(pdev);
> +
> +	hwrng_unregister(&priv->rng);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int npcm_rng_runtime_suspend(struct device *dev)
> +{
> +	struct npcm_rng *priv = dev_get_drvdata(dev);
> +
> +	npcm_rng_cleanup(&priv->rng);
> +
> +	return 0;
> +}
> +
> +static int npcm_rng_runtime_resume(struct device *dev)
> +{
> +	struct npcm_rng *priv = dev_get_drvdata(dev);
> +
> +	return npcm_rng_init(&priv->rng);
> +}
> +#endif
> +
> +static const struct dev_pm_ops npcm_rng_pm_ops = {
> +	SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
> +			   npcm_rng_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};
> +
> +static const struct of_device_id rng_dt_id[] = {
> +	{ .compatible = "nuvoton,npcm750-rng",  },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rng_dt_id);
> +
> +static struct platform_driver npcm_rng_driver = {
> +	.driver = {
> +		.name		= "npcm-rng",
> +		.pm		= &npcm_rng_pm_ops,
> +		.owner		= THIS_MODULE,
> +		.of_match_table = of_match_ptr(rng_dt_id),
> +	},
> +	.probe		= npcm_rng_probe,
> +	.remove		= npcm_rng_remove,
> +};
> +
> +module_platform_driver(npcm_rng_driver);
> +
> +MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.18.0
> 
