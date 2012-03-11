From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: kirkwood: Convert orion-nand to fdt
Date: Sun, 11 Mar 2012 17:52:32 +0000
Message-ID: <201203111752.32497.arnd@arndb.de>
References: <1331476406-9844-1-git-send-email-jm@lentin.co.uk>
 <1331476406-9844-3-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331476406-9844-3-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 11 March 2012, Jamie Lentin wrote:
> The DNS-320 and 325 have a NAND partitioned to store uboot, uimage and root
> filesystem. Store this information in devicetree.

All the important parts  look good to me, just two small details:

> -	board = pdev->dev.platform_data;
> +	if (pdev->dev.of_node) {
> +		board = kzalloc(sizeof(struct orion_nand_data), GFP_KERNEL);
> +		if (!board) {
> +			printk(KERN_ERR "orion_nand: failed to allocate board structure.\n");
> +			ret = -ENOMEM;
> +			goto no_res;
> +		}
> +		if (!of_property_read_u32(pdev->dev.of_node, "cle", &val))
> +			board->cle = (u8)val;
> +		if (!of_property_read_u32(pdev->dev.of_node, "ale", &val))
> +			board->ale = (u8)val;
> +		if (!of_property_read_u32(pdev->dev.of_node, "width", &val))
> +			board->width = (u8)val;
> +		if (!of_property_read_u32(pdev->dev.of_node,
> +						"chip-delay", &val))
> +			board->chip_delay = (u8)val;
> +	} else
> +		board = pdev->dev.platform_data;

If you use devm_kzalloc, the memory will get freed automatically during cleanup.
  
> +#ifdef CONFIG_OF
> +static struct of_device_id orion_nand_of_match_table[] = {
> +	{ .compatible = "mrvl,orion-nand", },
> +	{},
> +};
> +#else
> +#define orion_nand_of_match_table NULL
> +#endif
> +
>  static struct platform_driver orion_nand_driver = {
>  	.remove		= __devexit_p(orion_nand_remove),
>  	.driver		= {
>  		.name	= "orion_nand",
>  		.owner	= THIS_MODULE,
> +		.of_match_table = of_match_ptr(orion_nand_of_match_table),
>  	},
>  };

When you use of_match_ptr(), you can leave out the "#else\n#define orion_nand_of_match_table NULL".

	Arnd
