From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Wed, 4 Jan 2017 15:52:07 +0100
Message-ID: <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
 <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
 <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
 <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Cedric,

Le 21/12/2016 à 17:47, Cédric Le Goater a écrit :
> Hello Cyrille,
> 
>>>> all aspeed_smc_[read|write]_[reg|user]() functions call
>>>> aspeed_smc_[start|stop]_user(), so this driver always selects the "USER"
>>>> mode and configures the control register based on chip->ctrl_val[smc_base].
>>>
>>> yes. 
>>>
>>> Maybe you think it is too early to prepare ground for the other 
>>> mode ? Is that really confusing in the code ? Do you think I should
>>> remove it for the initial support in the driver and stick to 'User' 
>>> mode.
>>>
>>
>> I think it is not a big deal, at least technically. This is more a
>> psychological aspect of the review: the bigger patches, the more scarier.
>> I mean it requires more time and courage to dig into the source code hence
>> to understand what the driver actually does.
>> Sometime, it's better to split a big patch into many incremental and
>> smaller patches so it's more easy for reviewers to understand each part as
>> an independent feature. It also reveals the driver evolution during the
>> development process hence it helps to understand where it goes and what are
>> the next improvements to come.
> 
> I fully agree. It is just that we have been sitting on the code for more 
> than a year, using it in production and we should send to mainline
> much sooner. that was a mistake of us ...
> 
>> Anyway, since the review is done now, on my side I won't ask you to remove
>> or split the support of the 'Command' mode in a separated patch.
>> I let you do as you want, if it help you to introduce some part of the
>> support of this 'Command' mode now even if not completed yet, no problem on
>> my side :)
>>
>> I was just giving you some pieces of advice for the next time if you want
>> to speed up the review of another patch introducing new features.
>>
>> However, I will just ask you one more version handling the dummy cycles
>> properly as it would help us for the global maintenance of the spi-nor
>> subsystem. This is the only mandatory modification I ask you, after that I
>> think it would be ok for me and since Marek has already reviewed your
>> driver, it would be ready to be merged into the spi-nor tree.
> 
> Sending a v5 which should address your comments. 
> 
> I have removed the label property and will start a new thread in the 
> topic. Any hints on which binding we could add this label prop ?  
>

Here I will provide just few thoughts about this new DT property. I don't
pretend this is what should be done. I still think other mtd maintainers
should be involved to discuss this topic.

First the DT property name "label" sounds good to me: it is consistent with
"label" DT property used to name mtd partitions. However, I don't think it
should be documented in jedec,spi-nor.txt but *maybe* in partition.txt as
the purpose of this new DT property seems very close to the "label"
property of partition nodes: let's think about some hard-disk device
(/dev/sda) and its partition devices (/dev/sdaX).

Besides, the concept of this memory label is not limited to SPI NOR but
could also apply to NAND memories or any other MTD handled memories.
Hence the DT property might be handled by drivers/mtd/ofpart.c instead of
being handled by spi-nor.c or by each SPI NOR memory controller driver.

Finally, I guess we should take time to discuss and all agree what should
be done precisely before introducing a new DT property because one general
rule with DTB files is that users should be able to update their kernel
image (zImage, uImage, ...) without changing their DTB: device trees should
be backward compatible. Hence if we make a wrong choice today, we are
likely to have to live with it and keep supporting that bad choice.

Anyway, maybe you could describe a little bit your use case; what you
intend to do with this label from you userspace application.

Best regards,

Cyrille

>> Anyway, thanks for taking time to explain us how your driver work :)
> 
> Thanks for the review !
> 
> C. 
> 
> 
>> Best regards,
>>
>> Cyrille
>>
>>
>>
>>>>> +static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>>>> +				  struct device_node *np, struct resource *r)
>>>>> +{
>>>>> +	const struct aspeed_smc_info *info = controller->info;
>>>>> +	struct device *dev = controller->dev;
>>>>> +	struct device_node *child;
>>>>> +	unsigned int cs;
>>>>> +	int ret = -ENODEV;
>>>>> +
>>>>> +	for_each_available_child_of_node(np, child) {
>>>>> +		struct aspeed_smc_chip *chip;
>>>>> +		struct spi_nor *nor;
>>>>> +		struct mtd_info *mtd;
>>>>> +
>>>>> +		/* This driver does not support NAND or NOR flash devices. */
>>>>> +		if (!of_device_is_compatible(child, "jedec,spi-nor"))
>>>>> +			continue;
>>>>> +
>>>>> +		ret = of_property_read_u32(child, "reg", &cs);
>>>>> +		if (ret) {
>>>>> +			dev_err(dev, "Couldn't not read chip select.\n");
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		if (cs >= info->nce) {
>>>>> +			dev_err(dev, "Chip select %d out of range.\n",
>>>>> +				cs);
>>>>> +			ret = -ERANGE;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		if (controller->chips[cs]) {
>>>>> +			dev_err(dev, "Chip select %d already in use by %s\n",
>>>>> +				cs, dev_name(controller->chips[cs]->nor.dev));
>>>>> +			ret = -EBUSY;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		chip = devm_kzalloc(controller->dev, sizeof(*chip), GFP_KERNEL);
>>>>> +		if (!chip) {
>>>>> +			ret = -ENOMEM;
>>>>> +			break;
>>>>> +		}
>>>>> +
>>>>> +		chip->controller = controller;
>>>>> +		chip->ctl = controller->regs + info->ctl0 + cs * 4;
>>>>> +		chip->cs = cs;
>>>>> +
>>>>> +		nor = &chip->nor;
>>>>> +		mtd = &nor->mtd;
>>>>> +
>>>>> +		nor->dev = dev;
>>>>> +		nor->priv = chip;
>>>>> +		spi_nor_set_flash_node(nor, child);
>>>>> +		nor->read = aspeed_smc_read_user;
>>>>> +		nor->write = aspeed_smc_write_user;
>>>>> +		nor->read_reg = aspeed_smc_read_reg;
>>>>> +		nor->write_reg = aspeed_smc_write_reg;
>>>>> +		nor->prepare = aspeed_smc_prep;
>>>>> +		nor->unprepare = aspeed_smc_unprep;
>>>>> +
>>>>> +		mtd->name = of_get_property(child, "label", NULL);
>>>>
>>>> This new "label" DT property should be removed from this patch and send
>>>> in a dedicated patch to be discussed separately. However I agree with
>>>> Marek: it looks generic so maybe it could be managed directly from
>>>> mtd_device_register() since setting such as name could also be done when
>>>> using a NAND flash. Anyway, I don't see the link between this name and
>>>> spi-nor. Hence I don't think the DT property should be documented in
>>>> jedec,spi-nor.txt.
>>>
>>> OK. I will remove it in the next version. 
>>>
>>>> Be patient because I expect such a topic to be discussed quite a long
>>>> time before we all agree, even if this is "just" a new DT property ;)
>>>
>>> yeah. I expected that also :) But it is quite pratical to give user
>>> space a hint on the flash nature. Systems can have up to 4 different
>>> ones. So there is need for it IMO.
>>>
>>> How should I proceed then ? Shall I start a discussion with a single
>>> patch changing mtd_device_register() ? but I need to know which binding
>>> would be the more consensual for such a prop.
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>>>
>>>> Best regards,
>>>>
>>>> Cyrille
>>>>
>>>>
>>>>> +
>>>>> +		ret = aspeed_smc_chip_setup_init(chip, r);
>>>>> +		if (ret)
>>>>> +			break;
>>>>> +
>>>>> +		/*
>>>>> +		 * TODO: Add support for SPI_NOR_QUAD and SPI_NOR_DUAL
>>>>> +		 * attach when board support is present as determined
>>>>> +		 * by of property.
>>>>> +		 */
>>>>> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_NORMAL);
>>>>> +		if (ret)
>>>>> +			break;
>>>>> +
>>>>> +		ret = aspeed_smc_chip_setup_finish(chip);
>>>>> +		if (ret)
>>>>> +			break;
>>>>> +
>>>>> +		ret = mtd_device_register(mtd, NULL, 0);
>>>>> +		if (ret)
>>>>> +			break;
>>>>> +
>>>>> +		controller->chips[cs] = chip;
>>>>> +	}
>>>>> +
>>>>> +	if (ret)
>>>>> +		aspeed_smc_unregister(controller);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int aspeed_smc_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	struct device_node *np = pdev->dev.of_node;
>>>>> +	struct device *dev = &pdev->dev;
>>>>> +	struct aspeed_smc_controller *controller;
>>>>> +	const struct of_device_id *match;
>>>>> +	const struct aspeed_smc_info *info;
>>>>> +	struct resource *res;
>>>>> +	int ret;
>>>>> +
>>>>> +	match = of_match_device(aspeed_smc_matches, &pdev->dev);
>>>>> +	if (!match || !match->data)
>>>>> +		return -ENODEV;
>>>>> +	info = match->data;
>>>>> +
>>>>> +	controller = devm_kzalloc(&pdev->dev, sizeof(*controller) +
>>>>> +		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
>>>>> +	if (!controller)
>>>>> +		return -ENOMEM;
>>>>> +	controller->info = info;
>>>>> +	controller->dev = dev;
>>>>> +
>>>>> +	mutex_init(&controller->mutex);
>>>>> +	platform_set_drvdata(pdev, controller);
>>>>> +
>>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>> +	controller->regs = devm_ioremap_resource(dev, res);
>>>>> +	if (IS_ERR(controller->regs)) {
>>>>> +		dev_err(dev, "Cannot remap controller address.\n");
>>>>> +		return PTR_ERR(controller->regs);
>>>>> +	}
>>>>> +
>>>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>>>> +	controller->ahb_base = devm_ioremap_resource(dev, res);
>>>>> +	if (IS_ERR(controller->ahb_base)) {
>>>>> +		dev_err(dev, "Cannot remap controller address.\n");
>>>>> +		return PTR_ERR(controller->ahb_base);
>>>>> +	}
>>>>> +
>>>>> +	ret = aspeed_smc_setup_flash(controller, np, res);
>>>>> +	if (ret)
>>>>> +		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static struct platform_driver aspeed_smc_driver = {
>>>>> +	.probe = aspeed_smc_probe,
>>>>> +	.remove = aspeed_smc_remove,
>>>>> +	.driver = {
>>>>> +		.name = DEVICE_NAME,
>>>>> +		.of_match_table = aspeed_smc_matches,
>>>>> +	}
>>>>> +};
>>>>> +
>>>>> +module_platform_driver(aspeed_smc_driver);
>>>>> +
>>>>> +MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
>>>>> +MODULE_AUTHOR("Cedric Le Goater <clg-Bxea+6Xhats@public.gmane.org>");
>>>>> +MODULE_LICENSE("GPL v2");
>>>>>
>>>>
>>>
>>>
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
