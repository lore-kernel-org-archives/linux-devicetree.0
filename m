From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/6] usb: host: ehci-st: Add EHCI support for ST STB devices
Date: Wed, 6 Aug 2014 23:07:18 +0200
Message-ID: <201408062307.18851.arnd@arndb.de>
References: <1407344589-24863-1-git-send-email-peter.griffin@linaro.org> <1407344589-24863-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407344589-24863-3-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 06 August 2014, Peter Griffin wrote:

> +static int st_ehci_platform_reset(struct usb_hcd *hcd)
> +{
> +	struct platform_device *pdev = to_platform_device(hcd->self.controller);
> +	struct usb_ehci_pdata *pdata = dev_get_platdata(&pdev->dev);
> +	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
> +	int retval;
> +
> +	if (pdata->pre_setup) {
> +		retval = pdata->pre_setup(hcd);
> +		if (retval < 0)
> +			return retval;
> +	}

What is the point in going through a platform data function pointer here?
Can't you just open-code st_ehci_configure_bus() here?

> +static int st_ehci_platform_probe(struct platform_device *dev)
> +{
> +	struct usb_hcd *hcd;
> +	struct resource *res_mem;
> +	struct usb_ehci_pdata *pdata = dev_get_platdata(&dev->dev);
> +	struct st_platform_priv *priv;
> +	struct ehci_hcd *ehci;
> +	int err, irq, clk = 0;
> +
> +	if (usb_disabled())
> +		return -ENODEV;
> +
> +	/*
> +	 * Use reasonable defaults so platforms don't have to provide these
> +	 * with DT probing on ARM.
> +	 */
> +	if (!pdata)
> +		pdata = &ehci_platform_defaults;

How would you ever get here with pdata set?

> +	err = dma_coerce_mask_and_coherent(&dev->dev, DMA_BIT_MASK(32));
> +	if (err)
> +		return err;

Remove this here, and rely on the correct mask to be set from the DT scan.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
