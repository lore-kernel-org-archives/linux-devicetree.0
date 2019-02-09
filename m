Return-Path: <SRS0=eUQR=QQ=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
In-Reply-To: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Feb 2019 10:11:54 -0200
Message-ID: <CAOMZO5Dch0MPwJuW-uGgwbD-uen0j8_swvdWDt1NEMnzUaqRnQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drivers/perf: imx_ddr: Add ddr performance counter support
Content-Type: text/plain; charset="UTF-8"
To: Frank Li <frank.li@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lznuaa@gmail.com" <lznuaa@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi Frank,

On Fri, Feb 8, 2019 at 4:32 PM Frank Li <frank.li@nxp.com> wrote:

> +config FSL_IMX8_DDR_PERF
> +       tristate "Freescale i.MX8 DDR perf monitor"
> +       depends on ARCH_MXC
> +         help
> +         Provides support for ddr perfomance monitor in i.MX8QX. Provide memory

Since it supports i.MX8/i.MX8M, maybe you can put "in i.MX8" instead.

> --- /dev/null
> +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> @@ -0,0 +1,532 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2017 NXP
> + * Copyright 2016 Freescale Semiconductor, Inc.
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * http://www.gnu.org/copyleft/gpl.html

Since you use the SPDX tag you can simply remove this paragraph.

> +static int ddr_perf_probe(struct platform_device *pdev)
> +{
> +       struct ddr_pmu *pmu;
> +       struct device_node *np;
> +       void __iomem *base;
> +       struct resource *iomem;
> +       char *name;
> +       int num;
> +       int ret;
> +       u32 irq;
> +       const struct of_device_id *of_id =
> +               of_match_device(imx_ddr_pmu_dt_ids, &pdev->dev);
> +
> +       iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(&pdev->dev, iomem);
> +       if (IS_ERR(base)) {
> +               ret = PTR_ERR(base);

You could simply return directly here: return PTR_ERR(base);

> +               return ret;
> +       }
> +
> +       np = pdev->dev.of_node;
> +
> +       pmu = kzalloc(sizeof(*pmu), GFP_KERNEL);

Using devm_kzalloc() here would make the error handling simpler.

> +       if (!pmu)
> +               return -ENOMEM;
> +
> +       num = ddr_perf_init(pmu, base, &pdev->dev);
> +       name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ddr%d", num);
> +
> +       pmu->devtype = (struct fsl_ddr_devtype_data *)of_id->data;
> +
> +       cpumask_set_cpu(smp_processor_id(), &pmu->cpu);
> +       ret = perf_pmu_register(&(pmu->pmu), name, -1);
> +       if (ret)
> +               goto ddr_perf_err;
> +
> +       /* Request irq */
> +       irq = of_irq_get(np, 0);
> +       if (irq < 0) {
> +               pr_err("Failed to get irq: %d", irq);

Please use dev_err() instead.

Also, there is a bug here. You need to make:

ret = irq;

Otherwise you will return success on failure.

> +               goto ddr_perf_err;
> +       }
> +
> +       ret = devm_request_threaded_irq(&pdev->dev, irq,
> +                                       ddr_perf_irq_handler, NULL,
> +                                       IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +                                       DDR_PERF_DEV_NAME,
> +                                       pmu);
> +       if (ret < 0) {
> +               pr_err("Request irq failed: %d", ret);

dev_err()

> +               goto ddr_perf_irq_err;
> +       }
> +
> +       return 0;
> +
> +ddr_perf_irq_err:
> +       perf_pmu_unregister(&(pmu->pmu));
> +ddr_perf_err:
> +       pr_warn("i.MX8 DDR Perf PMU failed (%d), disabled\n", ret);

dev_err()

> +       kfree(pmu);
> +       return ret;
> +}
> +
> +

No need for two empty lines.

> +static int ddr_perf_remove(struct platform_device *pdev)
> +{
> +       struct ddr_pmu *pmu = platform_get_drvdata(pdev);
> +
> +       perf_pmu_unregister(&pmu->pmu);
> +       kfree(pmu);

If you use devm_kzalloc() then you don't need to call kfree().
