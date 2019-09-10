From: "Milton Miller II" <miltonm@us.ibm.com>
Subject: Re:  [PATCH v2 2/2] hwrng: npcm: add NPCM RNG driver
Date: Tue, 10 Sep 2019 20:53:13 +0000
Message-ID: <OFDC101E51.54765CB8-ON00258471.006F34B7-00258471.0072BCA7@notes.na.collabserv.com>
References: <20190909123840.154745-3-tmaimon77@gmail.com>,<20190909123840.154745-1-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909123840.154745-3-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de, joel@jms.id.au, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On September 9, 2019 around 7:40AM in somet timezone, Tomer Maimon wrote:
>+#define NPCM_RNG_TIMEOUT_USEC	20000
>+#define NPCM_RNG_POLL_USEC	1000

...

>+static int npcm_rng_init(struct hwrng *rng)
>+{
>+	struct npcm_rng *priv = to_npcm_rng(rng);
>+	u32 val;
>+
>+	val = readl(priv->base + NPCM_RNGCS_REG);
>+	val |= NPCM_RNG_ENABLE;
>+	writel(val, priv->base + NPCM_RNGCS_REG);
>+
>+	return 0;
>+}
>+
>+static void npcm_rng_cleanup(struct hwrng *rng)
>+{
>+	struct npcm_rng *priv = to_npcm_rng(rng);
>+	u32 val;
>+
>+	val = readl(priv->base + NPCM_RNGCS_REG);
>+	val &= ~NPCM_RNG_ENABLE;
>+	writel(val, priv->base + NPCM_RNGCS_REG);
>+}
>+
>+static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max,
>bool wait)
>+{
>+	struct npcm_rng *priv = to_npcm_rng(rng);
>+	int retval = 0;
>+	int ready;
>+
>+	pm_runtime_get_sync((struct device *)priv->rng.priv);
>+
>+	while (max >= sizeof(u32)) {
>+		ready = readl(priv->base + NPCM_RNGCS_REG) &
>+			NPCM_RNG_DATA_VALID;
>+		if (!ready) {
>+			if (wait) {
>+				if (readl_poll_timeout(priv->base + NPCM_RNGCS_REG,
>+						       ready,
>+						       ready & NPCM_RNG_DATA_VALID,
>+						       NPCM_RNG_POLL_USEC,
>+						       NPCM_RNG_TIMEOUT_USEC))
>+					break;
>+			} else {
>+				break;

This break is too far from the condition and deeply nested to follow.

And looking further, readl_poll_timeout will read and check the condition before
calling usleep, so the the initial readl and check is redundant

Rearrange to make wait determine if you call readl_poll_timeout or 
readl / compare / break.

>+			}
>+		}
>+
>+		*(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
>+		retval += sizeof(u32);
>+		buf += sizeof(u32);
>+		max -= sizeof(u32);
>+	}
>+
>+	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
>+	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
>+
>+	return retval || !wait ? retval : -EIO;
>+}
>+
>+static int npcm_rng_probe(struct platform_device *pdev)
>+{
>+	struct npcm_rng *priv;
>+	struct resource *res;
>+	bool pm_dis = false;
>+	u32 quality;
>+	int ret;
>+
>+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+
>+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>+	priv->base = devm_ioremap_resource(&pdev->dev, res);
>+	if (IS_ERR(priv->base))
>+		return PTR_ERR(priv->base);
>+
>+	priv->rng.name = pdev->name;
>+#ifndef CONFIG_PM
>+	pm_dis = true;
>+	priv->rng.init = npcm_rng_init;
>+	priv->rng.cleanup = npcm_rng_cleanup;
>+#endif

if you move this down you can use one if (ENABLED_CONFIG_PM) {}

>+	priv->rng.read = npcm_rng_read;
>+	priv->rng.priv = (unsigned long)&pdev->dev;
>+	if (of_property_read_u32(pdev->dev.of_node, "quality", &quality))
>+		priv->rng.quality = 1000;
>+	else
>+		priv->rng.quality = quality;
>+
>+	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
>+	if (pm_dis)
>+		writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
>+	else
>+		writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
>+		       priv->base + NPCM_RNGCS_REG);

wait ... if we know the whole value here, why read/modify/write the value
in the init and cleanup hook?   Save the io read and write the known value
 ... define the value to be written for clarity between enable/disable if
needed



>+
>+	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
>+	if (ret) {
>+		dev_err(&pdev->dev, "Failed to register rng device: %d\n",
>+			ret);

need to disable if CONFIG_PM ?

>+		return ret;
>+	}
>+
>+	dev_set_drvdata(&pdev->dev, priv);

This should probably be before the register.

>+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);

So every 100ms power off, and if userspace does a read we
will poll every 1ms for upto 20ms.

If userspace says try once a second with -ENODELAY so no wait,
it never gets data.


Oh, and yes, rngd sets non-blocking, polls the descriptors,
and falls back to slow expensive software if no hardware
says it has data ready.

>+	pm_runtime_use_autosuspend(&pdev->dev);
>+	pm_runtime_enable(&pdev->dev);
>+
>+	return 0;
>+}
>+
>+static int npcm_rng_remove(struct platform_device *pdev)
>+{
>+	struct npcm_rng *priv = platform_get_drvdata(pdev);
>+
>+	hwrng_unregister(&priv->rng);

you did devm register, but call unregister directly?

>+	pm_runtime_disable(&pdev->dev);
>+	pm_runtime_set_suspended(&pdev->dev);
>+
>+	return 0;
>+}
>+
>+#ifdef CONFIG_PM
>+static int npcm_rng_runtime_suspend(struct device *dev)
>+{
>+	struct npcm_rng *priv = dev_get_drvdata(dev);
>+
>+	npcm_rng_cleanup(&priv->rng);
>+
>+	return 0;
>+}
>+
>+static int npcm_rng_runtime_resume(struct device *dev)
>+{
>+	struct npcm_rng *priv = dev_get_drvdata(dev);
>+
>+	return npcm_rng_init(&priv->rng);
>+}
>+#endif
>+
>+static const struct dev_pm_ops npcm_rng_pm_ops = {
>+	SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
>+			   npcm_rng_runtime_resume, NULL)
>+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>+				pm_runtime_force_resume)
>+};
>+
>+static const struct of_device_id rng_dt_id[] = {
>+	{ .compatible = "nuvoton,npcm750-rng",  },
>+	{},
>+};
>+MODULE_DEVICE_TABLE(of, rng_dt_id);
>+
>+static struct platform_driver npcm_rng_driver = {
>+	.driver = {
>+		.name		= "npcm-rng",
>+		.pm		= &npcm_rng_pm_ops,
>+		.owner		= THIS_MODULE,

module_platform_driver will set owner, remove it here.

>+		.of_match_table = of_match_ptr(rng_dt_id),
>+	},
>+	.probe		= npcm_rng_probe,
>+	.remove		= npcm_rng_remove,
>+};
>+
>+module_platform_driver(npcm_rng_driver);
>+
>+MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
>+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
>+MODULE_LICENSE("GPL v2");
>-- 
>2.18.0
>
>

milton
