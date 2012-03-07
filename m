From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 1/9 v2] ARM: at91: usb ohci add dt support
Date: Wed, 7 Mar 2012 09:34:46 +0000
Message-ID: <20120307093446.GN17370@n2100.arm.linux.org.uk>
References: <20120307084924.GK21255@game.jcrosoft.org> <1331111746-21393-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331111746-21393-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2012 at 10:15:38AM +0100, Jean-Christophe PLAGNIOL-VILLARD wrote:
> +static u64 at91_ohci_dma_mask = DMA_BIT_MASK(32);
> +
> +static int __devinit ohci_at91_of_init(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	int i, ret, gpio;
> +	enum of_gpio_flags flags;
> +	struct at91_usbh_data	*pdata;
> +	u32 ports;
> +
> +	if (!np)
> +		return 0;
> +
> +	/* Right now device-tree probed devices don't get dma_mask set.
> +	 * Since shared usb code relies on it, set it here for now.
> +	 * Once we have dma capability bindings this can go away.
> +	 */
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &at91_ohci_dma_mask;

That sounds like a rather big omission from DT - what's happening to
address this (before we end up with lots of drivers with this).  Pretty
much any device which does DMA needs both this and the coherent DMA mask
set properly.

We really don't want this kind of workaround scattered in every driver
which has been converted to DT.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
