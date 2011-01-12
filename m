From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Add devicetree support to altera_jtaguart
Date: Wed, 12 Jan 2011 16:06:07 -0700
Message-ID: <20110112230607.GA31712@angua.secretlab.ca>
References: <4D2E287B.7000005@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D2E287B.7000005-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 12, 2011 at 11:17:31PM +0100, Walter Goossens wrote:
> This patch adds devicetree support to the altera_jtaguart driver.
> Tested on hardware on the nios2 architecture.
> 

Hi Walter, comments below...

> diff --git a/drivers/serial/altera_jtaguart.c b/drivers/serial/altera_jtaguart.c
> index f9b49b5..b71ba92 100644
> --- a/drivers/serial/altera_jtaguart.c
> +++ b/drivers/serial/altera_jtaguart.c
> @@ -431,21 +431,44 @@ static int __devinit altera_jtaguart_probe(struct platform_device *pdev)
>  {
>  	struct altera_jtaguart_platform_uart *platp = pdev->dev.platform_data;
>  	struct uart_port *port;
> -	int i;
> -
> -	for (i = 0; i < ALTERA_JTAGUART_MAXPORTS && platp[i].mapbase; i++) {
> -		port = &altera_jtaguart_ports[i].port;
> -
> -		port->line = i;
> -		port->type = PORT_ALTERA_JTAGUART;
> -		port->mapbase = platp[i].mapbase;
> -		port->membase = ioremap(port->mapbase, ALTERA_JTAGUART_SIZE);
> -		port->iotype = SERIAL_IO_MEM;
> -		port->irq = platp[i].irq;
> -		port->ops = &altera_jtaguart_ops;
> -		port->flags = ASYNC_BOOT_AUTOCONF;
> -
> -		uart_add_one_port(&altera_jtaguart_driver, port);
> +	if(platp) {
> +		int i;
> +		for (i = 0; i < ALTERA_JTAGUART_MAXPORTS && platp[i].mapbase; i++) {
> +			port = &altera_jtaguart_ports[i].port;
> +
> +			port->line = i;
> +			port->type = PORT_ALTERA_JTAGUART;
> +			port->mapbase = platp[i].mapbase;
> +			port->membase = ioremap(port->mapbase, ALTERA_JTAGUART_SIZE);
> +			port->iotype = SERIAL_IO_MEM;
> +			port->irq = platp[i].irq;
> +			port->ops = &altera_jtaguart_ops;
> +			port->flags = ASYNC_BOOT_AUTOCONF;
> +
> +			uart_add_one_port(&altera_jtaguart_driver, port);
> +		}
> +#ifdef CONFIG_OF
> +	} else {
> +		struct resource *res_irq;
> +		struct resource *res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if(res_mem)
> +		{
> +			res_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +			if(res_irq)
> +			{
> +				port = &altera_jtaguart_ports[0].port;
> +				port->line = 0;
> +				port->type = PORT_ALTERA_JTAGUART;
> +				port->mapbase = res_mem->start;
> +				port->membase = ioremap(port->mapbase, ALTERA_JTAGUART_SIZE);
> +				port->iotype = SERIAL_IO_MEM;
> +				port->irq = res_irq->start;
> +				port->ops = &altera_jtaguart_ops;
> +				port->flags = ASYNC_BOOT_AUTOCONF;
> +				uart_add_one_port(&altera_jtaguart_driver, port);
> +			}
> +		}
> +#endif

These two blocks are largely identical.  You should be able to
implement this with considerably less duplicated code between the two
drivers.  Since the scope of instantiating this particular device, I
recommend splitting it up so that there is only ever one device per
port, with the irq and register addresses stored in the resource table.
By making that change, exactly the same code would drive both OF and
non-OF use-cases.

Also, the way this is implemented precludes having more than
one instance of the device.  It would be better if the port structure
was dynamically allocated (but I do understand that the current driver
only handles one instance anyway, so it would make sense for that to
be a separate patch).

The rest of this patch look fine.

>  	}
>  
>  	return 0;
> @@ -464,6 +487,15 @@ static int __devexit altera_jtaguart_remove(struct platform_device *pdev)
>  
>  	return 0;
>  }
> +#ifdef CONFIG_OF
> +static struct of_device_id altera_jtaguart_match[] = {
> +	{ 
> +		.compatible = "altera,altera_juart",
> +	},
> +	{},
> +}
> +MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
> +#endif /* CONFIG_OF */
>  
>  static struct platform_driver altera_jtaguart_platform_driver = {
>  	.probe	= altera_jtaguart_probe,
> @@ -471,6 +503,9 @@ static struct platform_driver altera_jtaguart_platform_driver = {
>  	.driver	= {
>  		.name	= DRV_NAME,
>  		.owner	= THIS_MODULE,
> +#ifdef CONFIG_OF
> +		.of_match_table = altera_jtaguart_match,
> +#endif
>  	},
>  };
>  

> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
