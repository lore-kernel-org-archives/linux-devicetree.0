From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [[PATCH v2] 2/2] Altera Modular ADC driver support
Date: Fri, 4 Sep 2015 17:51:21 +0530
Message-ID: <CAKfKVtH1_wb2MLEgw0uf61tcoC7P2Uz6hC_GmP8vRakLnArB=A@mail.gmail.com>
References: <1441144199-20231-1-git-send-email-cnphoon@altera.com>
	<1441144199-20231-3-git-send-email-cnphoon@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441144199-20231-3-git-send-email-cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chee Nouk Phoo <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, cnphoon.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +static int alt_modular_adc_probe(struct platform_device *pdev)
> +{
> +       struct altera_adc *adc;
> +       struct device_node *np = pdev->dev.of_node;
> +       struct iio_dev *indio_dev;
> +       struct resource *mem;
> +       int ret;
> +
> +       if (!np)
> +               return -ENODEV;
> +
> +       indio_dev = iio_device_alloc(sizeof(struct altera_adc));
> +       if (!indio_dev) {
> +               dev_err(&pdev->dev, "failed allocating iio device\n");
> +               return -ENOMEM;
> +       }
> +
> +       adc = iio_priv(indio_dev);
> +
> +       mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +               "sequencer_csr");
> +       adc->seq_regs = devm_ioremap_resource(&pdev->dev, mem);
> +       if (IS_ERR(adc->seq_regs)) {
> +               ret = PTR_ERR(adc->seq_regs);
> +               goto err_iio;
> +       }
> +
> +       mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +               "sample_store_csr");
> +       adc->sample_regs = devm_ioremap_resource(&pdev->dev, mem);
> +       if (IS_ERR(adc->sample_regs)) {
> +               ret = PTR_ERR(adc->sample_regs);
> +               goto err_iio;
> +       }
> +
> +       ret = alt_modular_adc_parse_dt(indio_dev, &pdev->dev);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed to parse device tree\n");
> +               goto err_iio;
> +       }
> +
> +       ret = alt_modular_adc_channel_init(indio_dev);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "failed initialize ADC channels\n");
> +               goto err_iio;
> +       }
> +
> +       platform_set_drvdata(pdev, indio_dev);
> +
> +       indio_dev->name = dev_name(&pdev->dev);
> +       indio_dev->dev.parent = &pdev->dev;
> +       indio_dev->dev.of_node = pdev->dev.of_node;
> +       indio_dev->info = &adc_iio_info;
> +       indio_dev->modes = INDIO_DIRECT_MODE;
> +       indio_dev->num_channels = adc->slot_count;
> +
> +       ret = iio_device_register(indio_dev);
> +       if (ret)
> +               goto err_iio;
> +
> +       /* Disable Interrupt */
> +       writel_relaxed(0, (adc->sample_regs + ADC_IER_REG));

Why disable interrupts?

> +
> +       /* Start Continuous Sampling */
> +       writel_relaxed((ADC_RUN_MSK), (adc->seq_regs + ADC_CMD_REG));
> +
> +       return 0;
> +
> +
> +err_iio:
> +       iio_device_free(indio_dev);
> +       return ret;
> +}
> +
> +static int alt_modular_adc_remove(struct platform_device *pdev)
> +{
> +       struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +       struct altera_adc *adc = iio_priv(indio_dev);
> +
> +       /* Stop ADC */
> +       writel((ADC_STOP_MSK), (adc->seq_regs + ADC_CMD_REG));
> +
> +       /* Unregister ADC */
> +       iio_device_unregister(indio_dev);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver altr_modular_adc_driver = {
> +       .probe          = alt_modular_adc_probe,
> +       .remove         = alt_modular_adc_remove,
> +       .driver         = {
> +               .name   = "alt-modular-adc",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = alt_modular_adc_match,
> +       },
> +};
> +
> +
> +module_platform_driver(altr_modular_adc_driver);
> +
> +MODULE_DESCRIPTION("Altera Modular ADC Driver");
> +MODULE_AUTHOR("Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
