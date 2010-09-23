From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 7/7] Samsung: Probe the serial driver using Device tree.
Date: Thu, 23 Sep 2010 14:11:13 -0600
Message-ID: <20100923201113.GG17400@angua.secretlab.ca>
References: <1284978018-30867-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284978018-30867-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 20, 2010 at 03:50:18PM +0530, Shaju Abraham wrote:
>  Added the match table for probing the serial devices from the device tree.
>  Serial/samsung.c file is modified to support OF probing .Get the platform data
>  from the static array as done in the case of  s3c24xx_serial_init_port.Also the
>  clock API (clk_get) might fail if platform  id remains at -1.Since the
>  struct device information is passed to the uart_add_one_port, get the struct device
>  from the platform_device passed to the probe routine by the device tree probing.
> 
> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/plat-samsung/init.c |    3 ++-
>  drivers/serial/s5pv210.c     |   16 ++++++++++++++--
>  drivers/serial/samsung.c     |   10 +++++++++-
>  3 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
> index 6790edf..2c58acd 100644
> --- a/arch/arm/plat-samsung/init.c
> +++ b/arch/arm/plat-samsung/init.c
> @@ -152,8 +152,9 @@ static int __init s3c_arch_init(void)
>  	ret = (cpu->init)();
>  	if (ret != 0)
>  		return ret;
> -
> +#ifndef CONFIG_USE_OF
>  	ret = platform_add_devices(s3c24xx_uart_devs, nr_uarts);
> +#endif /*CONFIG_USE_OF*/

Ditto to comment on previous patch; you don't want to break existing
platforms.  Instead, the code should be refactored so that static
devices are not registered in the dt-enabled machine description.

>  	return ret;
>  }
>  
> diff --git a/drivers/serial/s5pv210.c b/drivers/serial/s5pv210.c
> index 4a789e5..7f8bd18 100644
> --- a/drivers/serial/s5pv210.c
> +++ b/drivers/serial/s5pv210.c
> @@ -119,15 +119,27 @@ static int s5p_serial_probe(struct platform_device *pdev)
>  	return s3c24xx_serial_probe(pdev, s5p_uart_inf[pdev->id]);
>  }
>  
> +#ifdef CONFIG_USE_OF

#ifdef CONFIG_OF

> +static struct of_device_id s5p_uart_matches[] = {
> +	{	.compatible = "samsung,s5pv210-uart_sh"},
> +		{},
> +	};
> +#endif /*CONFIG_USE_OF*/
> +
>  static struct platform_driver s5p_serial_driver = {
>  	.probe		= s5p_serial_probe,
>  	.remove		= __devexit_p(s3c24xx_serial_remove),
>  	.driver		= {
> -		.name	= "s5pv210-uart",
> -		.owner	= THIS_MODULE,
> +	.name		= "s5pv210-uart",
> +	.owner		= THIS_MODULE,
> +#ifdef CONFIG_USE_OF
> +	.of_match_table	= s5p_uart_matches,

#ifdef CONFIG_OF

> +
> +#endif /*CONFIG_USE_OF */
>  	},
>  };
>  
> +
>  static int __init s5pv210_serial_console_init(void)
>  {
>  	return s3c24xx_serial_initconsole(&s5p_serial_driver, s5p_uart_inf);
> diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
> index 4c5eea0..317bd08 100644
> --- a/drivers/serial/samsung.c
> +++ b/drivers/serial/samsung.c
> @@ -1059,7 +1059,6 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
>  		return -ENODEV;
>  
>  	cfg = s3c24xx_dev_to_cfg(&platdev->dev);
> -
>  	if (port->mapbase != 0)

Unrelated whitespace change.

>  		return 0;
>  
> @@ -1145,6 +1144,15 @@ int s3c24xx_serial_probe(struct platform_device *dev,
>  	dbg("s3c24xx_serial_probe(%p, %p) %d\n", dev, info, probe_index);
>  
>  	ourport = &s3c24xx_serial_ports[probe_index];
> +
> +#ifdef CONFIG_USE_OF
> +	struct uart_port *port = &ourport->port;
> +	dev->id = probe_index;
> +	dev->dev.platform_data =
> +			s3c24xx_uart_devs[probe_index]->dev.platform_data;
> +	port->dev       = &dev->dev;
> +#endif /*CONFIG_USE_OF */

Several issues with this.  First, it breaks non-OF platforms.  Second,
device drivers are not allowed to write to the "dev.platform_data"
pointer.  If it is going to be locally overridden in the driver, then
the driver should maintain it's own copy of the pointer.  Otherwise an
unbind/rebind of the driver could result in the driver have a wrong or
invalid platform_data pointer.  Third; the configuration data
structure needs to be dynamically allocated and populated with data
from the device tree.  It should not be populated from a static table.

If you do need to pass in a specific platform_data pointer, then it
should be done at device registration time by using a bus notifier.
However, that is a very rare circumstance.

g.
