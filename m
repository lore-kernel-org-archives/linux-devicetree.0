From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V5 3/4] serial/imx: parse from device tree support
Date: Thu, 17 Mar 2011 10:43:31 -0600
Message-ID: <20110317164331.GD9597@angua.secretlab.ca>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
	<1300290701-9433-4-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1300290701-9433-4-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2011 at 11:51:40PM +0800, Jason Liu wrote:
> Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/tty/serial/fsl-imx-uart.txt           |   19 +++++
>  drivers/tty/serial/imx.c                           |   78 +++++++++++++++++---
>  2 files changed, 87 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/tty/serial/fsl-imx-uart.txt b/Documentation/devicetree/bindings/tty/serial/fsl-imx-uart.txt
> new file mode 100644
> index 0000000..b7ece32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tty/serial/fsl-imx-uart.txt
> @@ -0,0 +1,19 @@
> +* UART (Universal Asynchronous Receiver/Transmitter)
> +
> +Required properties:
> +- compatible : "fsl,imx51-uart".
> +- reg : Offset and length of the register set for the device.
> +- interrupts : should contain uart interrupt.
> +- fsl,has-rts-cts : indicate it has rts-cts.
> +- uart-clock : the uart clock input information.
> +
> +Example:
> +
> +imx-uart@bc000 {
> +	compatible = "fsl,imx51-uart";
> +	reg = <0xbc000 0x1000>;
> +	interrupts = <0x1f>;
> +	fsl,has-rts-cts;
> +	uart-clock = <&uart0_clk>, "uart";
> +};
> +
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index dfcf4b1..568550d 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -47,6 +47,8 @@
>  #include <linux/delay.h>
>  #include <linux/rational.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
>  
>  #include <asm/io.h>
>  #include <asm/irq.h>
> @@ -1224,6 +1226,53 @@ static int serial_imx_resume(struct platform_device *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_OF
> +static int serial_imx_probe_dt(struct imx_port *sport,
> +		struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	static int line;
> +
> +	if (!node)
> +		return -ENODEV;
> +
> +	if (of_get_property(node, "fsl,has-rts-cts", NULL))
> +		sport->have_rtscts = 1;
> +
> +	if (of_get_property(node, "fsl,irda-mode", NULL))
> +		sport->use_irda = 1;
> +
> +	sport->port.line = line++;
> +
> +	return 0;
> +}
> +#else
> +static int serial_imx_probe_dt(struct imx_port *sport,
> +		struct platform_device *pdev)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +
> +static int serial_imx_probe_pdata(struct imx_port *sport,
> +		struct platform_device *pdev)
> +{
> +	struct imxuart_platform_data *pdata = pdev->dev.platform_data;
> +
> +	if (!pdata)
> +		return 0;
> +
> +	if (pdata->flags & IMXUART_HAVE_RTSCTS)
> +		sport->have_rtscts = 1;
> +
> +#ifdef CONFIG_IRDA
> +	if (pdata->flags & IMXUART_IRDA)
> +		sport->use_irda = 1;
> +#endif
> +	sport->port.line = pdev->id;
> +
> +	return 0;
> +}
>  static int serial_imx_probe(struct platform_device *pdev)
>  {
>  	struct imx_port *sport;
> @@ -1236,6 +1285,12 @@ static int serial_imx_probe(struct platform_device *pdev)
>  	if (!sport)
>  		return -ENOMEM;
>  
> +	ret = serial_imx_probe_dt(sport, pdev);
> +	if (ret == -ENODEV)
> +		ret = serial_imx_probe_pdata(sport, pdev);
> +	if (ret)
> +		goto free;
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		ret = -ENODEV;
> @@ -1260,7 +1315,6 @@ static int serial_imx_probe(struct platform_device *pdev)
>  	sport->port.fifosize = 32;
>  	sport->port.ops = &imx_pops;
>  	sport->port.flags = UPF_BOOT_AUTOCONF;
> -	sport->port.line = pdev->id;
>  	init_timer(&sport->timer);
>  	sport->timer.function = imx_timeout;
>  	sport->timer.data     = (unsigned long)sport;
> @@ -1274,17 +1328,13 @@ static int serial_imx_probe(struct platform_device *pdev)
>  
>  	sport->port.uartclk = clk_get_rate(sport->clk);
>  
> -	imx_ports[pdev->id] = sport;
> +	if (imx_ports[sport->port.line]) {
> +		ret = -EBUSY;
> +		goto clkput;
> +	}
> +	imx_ports[sport->port.line] = sport;
>  
>  	pdata = pdev->dev.platform_data;
> -	if (pdata && (pdata->flags & IMXUART_HAVE_RTSCTS))
> -		sport->have_rtscts = 1;
> -
> -#ifdef CONFIG_IRDA
> -	if (pdata && (pdata->flags & IMXUART_IRDA))
> -		sport->use_irda = 1;
> -#endif
> -
>  	if (pdata && pdata->init) {
>  		ret = pdata->init(pdev);
>  		if (ret)
> @@ -1336,6 +1386,11 @@ static int serial_imx_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static struct of_device_id imx_uart_matches[] = {
> +	{ .compatible = "fsl,imx51-uart" },
> +	{},
> +};
> +
>  static struct platform_driver serial_imx_driver = {
>  	.probe		= serial_imx_probe,
>  	.remove		= serial_imx_remove,
> @@ -1345,6 +1400,9 @@ static struct platform_driver serial_imx_driver = {
>  	.driver		= {
>  		.name	= "imx-uart",
>  		.owner	= THIS_MODULE,
> +#if defined(CONFIG_OF)
> +		.of_match_table = imx_uart_matches,
> +#endif

This #if defined(CONFIG_OF) is no longer needed in my tree.  I removed
it when I committed this patch.

g.

>  	},
>  };
>  
> -- 
> 1.7.1
> 
