From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] of_pci_irq: Silence bogus "of_irq_parse_pci() failed
 ..." messages.
Date: Thu, 17 Sep 2015 14:53:44 -0500
Message-ID: <55FB1A48.6000205@kernel.org>
References: <1441839479-19298-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441839479-19298-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On 09/09/2015 05:57 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> It is perfectly legitimate for a PCI device to have an
> PCI_INTERRUPT_PIN value of zero.  This happens if the device doesn't
> use interrupts, or on PCIe devices, where only MSI/MSI-X are
> supported.
> 
> Silence the annoying "of_irq_parse_pci() failed with rc=-19" error
> messages by moving the printing code into of_irq_parse_pci(), and only
> emitting the message for cases where PCI_INTERRUPT_PIN == 0 is not the
> cause for an early exit.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

Applied, thanks.

Rob

> ---
> 
> Changes in v3: Also print the message for failures in
> of_irq_parse_raw() (also suggested by Frank Rowand).
> 
> Changes in v2: Move the print function in to of_irq_parse_pci() at a
> common error exit point (as suggested by Frank Rowand).
> 
> 
>  drivers/of/of_pci_irq.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
> index 1710d9d..2306313 100644
> --- a/drivers/of/of_pci_irq.c
> +++ b/drivers/of/of_pci_irq.c
> @@ -38,8 +38,8 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
>  	 */
>  	rc = pci_read_config_byte(pdev, PCI_INTERRUPT_PIN, &pin);
>  	if (rc != 0)
> -		return rc;
> -	/* No pin, exit */
> +		goto err;
> +	/* No pin, exit with no error message. */
>  	if (pin == 0)
>  		return -ENODEV;
>  
> @@ -53,8 +53,10 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
>  			ppnode = pci_bus_to_OF_node(pdev->bus);
>  
>  			/* No node for host bridge ? give up */
> -			if (ppnode == NULL)
> -				return -EINVAL;
> +			if (ppnode == NULL) {
> +				rc = -EINVAL;
> +				goto err;
> +			}
>  		} else {
>  			/* We found a P2P bridge, check if it has a node */
>  			ppnode = pci_device_to_OF_node(ppdev);
> @@ -86,7 +88,13 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
>  	out_irq->args[0] = pin;
>  	laddr[0] = cpu_to_be32((pdev->bus->number << 16) | (pdev->devfn << 8));
>  	laddr[1] = laddr[2] = cpu_to_be32(0);
> -	return of_irq_parse_raw(laddr, out_irq);
> +	rc = of_irq_parse_raw(laddr, out_irq);
> +	if (rc)
> +		goto err;
> +	return 0;
> +err:
> +	dev_err(&pdev->dev, "of_irq_parse_pci() failed with rc=%d\n", rc);
> +	return rc;
>  }
>  EXPORT_SYMBOL_GPL(of_irq_parse_pci);
>  
> @@ -105,10 +113,8 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>  	int ret;
>  
>  	ret = of_irq_parse_pci(dev, &oirq);
> -	if (ret) {
> -		dev_err(&dev->dev, "of_irq_parse_pci() failed with rc=%d\n", ret);
> +	if (ret)
>  		return 0; /* Proper return code 0 == NO_IRQ */
> -	}
>  
>  	return irq_create_of_mapping(&oirq);
>  }
> 
