From: Kent Yoder <key@linux.vnet.ibm.com>
Subject: Re: [PATCH] TPM: Provide a tpm_tis OF driver
Date: Mon, 1 Oct 2012 11:00:31 -0500
Message-ID: <20121001160029.GB3478@ennui.austin.ibm.com>
References: <20120930233156.GI30637@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120930233156.GI30637@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: linux-kernel@vger.kernel.org, tpmdd-devel@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

> +/* irq == 0 -> autoprobe, -1 ->forced no interrupt,
> +   others -> irq line to use */
>  static int tpm_tis_init(struct device *dev, resource_size_t start,
> -			resource_size_t len, unsigned int irq)
> +			resource_size_t len, int irq)
>  {
>  	u32 vendor, intfcaps, intmask;
>  	int rc, i, irq_s, irq_e, probe;
> @@ -605,9 +610,11 @@ static int tpm_tis_init(struct device *dev, resource_size_t start,
>  	iowrite32(intmask,
>  		  chip->vendor.iobase +
>  		  TPM_INT_ENABLE(chip->vendor.locality));
> -	if (interrupts)
> +	if (!interrupts)
> +		irq = -1;
> +	if (irq != -1)
>  		chip->vendor.irq = irq;
> -	if (interrupts && !chip->vendor.irq) {
> +	if (irq == 0) {

  This logic took me awhile to understand and figure out if it actually
worked. How about a flag for the interrupts and/or irq values that makes
things more explicit?

Kent

>  		irq_s =
>  		    ioread8(chip->vendor.iobase +
>  			    TPM_INT_VECTOR(chip->vendor.locality));
> @@ -821,12 +828,53 @@ static int tpm_tis_resume(struct device *dev)
> 
>  static SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
> 
> +#ifdef CONFIG_OF
> +static struct of_device_id tis_of_platform_match[] = {
> +	{.compatible = "tcg,tpm_tis"},
> +	{},
> +};
> +static int __devinit tis_of_init_one(struct platform_device *pdev)
> +{
> +	struct resource res;
> +	int ret;
> +	int irq;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	ret = of_address_to_resource(pdev->dev.of_node, 0, &res);
> +	if (ret)
> +		return ret;
> +
> +	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	if (irq == NO_IRQ)
> +		irq = -1;
> +	return tpm_tis_init(&pdev->dev, res.start, res.end - res.start + 1,
> +			    irq);
> +}
> +
> +static int __devexit tis_of_remove_one(struct platform_device *odev)
> +{
> +	struct tpm_chip *chip = dev_get_drvdata(&odev->dev);
> +	tpm_dev_vendor_release(chip);
> +	kfree(chip);
> +	return 0;
> +}
> +#endif
> +
>  static struct platform_driver tis_drv = {
>  	.driver = {
>  		.name = "tpm_tis",
>  		.owner		= THIS_MODULE,
>  		.pm		= &tpm_tis_pm,
> +#ifdef CONFIG_OF
> +		.of_match_table = tis_of_platform_match,
> +#endif
>  	},
> +#ifdef CONFIG_OF
> +	.probe = tis_of_init_one,
> +	.remove = __devexit_p(tis_of_remove_one)
> +#endif
>  };
> 
>  static struct platform_device *pdev;
> @@ -849,7 +897,9 @@ static int __init init_tis(void)
>  		return PTR_ERR(pdev);
>  	if((rc=tpm_tis_init(&pdev->dev, TIS_MEM_BASE, TIS_MEM_LEN, 0)) != 0) {
>  		platform_device_unregister(pdev);
> +#ifndef CONFIG_OF
>  		platform_driver_unregister(&tis_drv);
> +#endif
>  	}
>  	return rc;
>  }
> -- 
> 1.7.4.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
