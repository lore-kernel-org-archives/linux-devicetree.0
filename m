From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH V5 2/4] drivers/perf: imx_ddr: Add ddr performance counter
 support
Date: Wed, 24 Apr 2019 12:08:19 +0100
Message-ID: <dc519703-dcd8-7238-c50c-25f265f9a07b@arm.com>
References: <1555447156-28306-1-git-send-email-Frank.Li@nxp.com>
 <1555447156-28306-2-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1555447156-28306-2-git-send-email-Frank.Li@nxp.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Li <frank.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 16/04/2019 21:39, Frank Li wrote:
[...]
> +static int ddr_perf_probe(struct platform_device *pdev)
> +{
> +	struct ddr_pmu *pmu;
> +	struct device_node *np;
> +	void __iomem *base;
> +	struct resource *iomem;
> +	char *name;
> +	char *hpname;
> +	int num;
> +	int ret;
> +	u32 irq;
> +	const struct of_device_id *of_id =
> +		of_match_device(imx_ddr_pmu_dt_ids, &pdev->dev);
> +
> +	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(&pdev->dev, iomem);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	np = pdev->dev.of_node;
> +
> +	pmu = devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
> +	if (!pmu)
> +		return -ENOMEM;
> +
> +	num = ddr_perf_init(pmu, base, &pdev->dev);
> +
> +	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ddr%d", num);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	hpname = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +				"perf/imx/ddr%d:online", num);
> +	if (!hpname)
> +		return -ENOMEM;
> +
> +	pmu->flags = (uintptr_t) of_id->data;
> +
> +	cpumask_set_cpu(raw_smp_processor_id(), &pmu->cpu);
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, hpname, NULL,
> +					 ddr_perf_offline_cpu);
> +
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "cpuhp_setup_state_multi failed\n");
> +		goto ddr_perf_err;
> +	}

Since you don't seem to ever remove this state again, this looks like it 
would make subsequent loads of the module always fail after it's been 
loaded and unloaded once - have you tried that?

Robin.

> +
> +	pmu->cpuhp_state = ret;
> +
> +	/* Register the pmu instance for cpu hotplug */
> +	cpuhp_state_add_instance_nocalls(pmu->cpuhp_state, &pmu->node);
> +
> +	ret = perf_pmu_register(&(pmu->pmu), name, -1);
> +	if (ret)
> +		goto ddr_perf_err;
> +
> +	/* Request irq */
> +	irq = of_irq_get(np, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq: %d", irq);
> +		ret = irq;
> +		goto ddr_perf_irq_err;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, irq,
> +					ddr_perf_irq_handler,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					DDR_PERF_DEV_NAME,
> +					pmu);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Request irq failed: %d", ret);
> +		goto ddr_perf_irq_err;
> +	}
> +
> +	return 0;
> +
> +ddr_perf_irq_err:
> +	perf_pmu_unregister(&(pmu->pmu));
> +
> +ddr_perf_err:
> +	if (pmu->cpuhp_state)
> +		cpuhp_state_remove_instance_nocalls(pmu->cpuhp_state, &pmu->node);
> +
> +	dev_warn(&pdev->dev, "i.MX8 DDR Perf PMU failed (%d), disabled\n", ret);
> +	return ret;
> +}
> +
> +static int ddr_perf_remove(struct platform_device *pdev)
> +{
> +	struct ddr_pmu *pmu = platform_get_drvdata(pdev);
> +
> +	cpuhp_state_remove_instance_nocalls(pmu->cpuhp_state, &pmu->node);
> +	perf_pmu_unregister(&pmu->pmu);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver imx_ddr_pmu_driver = {
> +	.driver         = {
> +		.name   = "imx-ddr-pmu",
> +		.of_match_table = imx_ddr_pmu_dt_ids,
> +	},
> +	.probe          = ddr_perf_probe,
> +	.remove         = ddr_perf_remove,
> +};
> +
> +static int __init imx_ddr_pmu_init(void)
> +{
> +	return platform_driver_register(&imx_ddr_pmu_driver);
> +}
> +
> +module_init(imx_ddr_pmu_init);
> +
> 
