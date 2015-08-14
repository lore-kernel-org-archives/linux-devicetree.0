From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller.
Date: Fri, 14 Aug 2015 05:32:34 +0200
Message-ID: <201508140532.34935.marex@denx.de>
References: <1439522892-7524-1-git-send-email-marex@denx.de> <1439522892-7524-2-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439522892-7524-2-git-send-email-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday, August 14, 2015 at 05:28:12 AM, Marek Vasut wrote:
> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.
> 
> Signed-off-by: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: Vikas MANOCHA <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> Cc: Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

[...]

> +	/* Get flash device data */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		unsigned int cs;
> +		struct cqspi_flash_pdata *f_pdata;
> +
> +		if (of_property_read_u32(np, "reg", &cs)) {
> +			dev_err(dev, "couldn't determine chip select\n");
> +			return -ENXIO;
> +		}
> +
> +		if (cs >= CQSPI_MAX_CHIPSELECT) {
> +			dev_err(dev, "chip select %d out of range\n", cs);
> +			return -ENXIO;
> +		}
> +
> +		f_pdata = &cqspi->f_pdata[cs];
> +		f_pdata->cqspi = cqspi;
> +		f_pdata->cs = cs;
> +
> +		ret = cqspi_of_get_flash_pdata(pdev, f_pdata, np);
> +		if (ret)
> +			goto probe_failed;
> +
> +		nor = &f_pdata->nor;
> +		mtd = &f_pdata->mtd;
> +
> +		nor->mtd = mtd;
> +		nor->dev = dev;
> +		nor->priv = f_pdata;
> +		mtd->priv = nor;
> +
> +		nor->read_reg = cqspi_read_reg;
> +		nor->write_reg = cqspi_write_reg;
> +		nor->read = cqspi_read;
> +		nor->write = cqspi_write;
> +		nor->erase = cqspi_erase;
> +		nor->set_protocol = cqspi_set_protocol;
> +
> +		nor->prepare = cqspi_prep;
> +

--->8---

> +		/*
> +		 * Here is a 'nasty hack' from Marek Vasut to pick
> +		 * up OF properties from flash device subnode.
> +		 */
> +		nor->dev->of_node = np;
> +
> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		if (ret)
> +			goto probe_failed;

The only bizzare thing is this stuff above ^ . If I want to pass for example 
"m25p,fast-read" to the SPI NOR connected to this controller, I have to set
up the nor->dev->of_node, otherwise the of_node would point to the controller.
I am positive this is wrong, but I'm not quite sure how to repair this.
Brian, can you please comment on this one bit ?

[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
