From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] serial/imx: parse from device tree support
Date: Fri, 18 Feb 2011 09:34:46 +0100
Message-ID: <201102180934.46557.arnd@arndb.de>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-4-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1298016730-22761-4-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

The patch looks good, but I noticed a few details that can be improved.

On Friday 18 February 2011, Jason Liu wrote:
> index dfcf4b1..3388599
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -52,6 +52,10 @@
>  #include <asm/irq.h>
>  #include <mach/hardware.h>
>  #include <mach/imx-uart.h>
> +#ifdef CONFIG_OF
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#endif /* CONFIG_OF */
>  
>  /* Register definitions */
>  #define URXD0 0x0  /* Receiver Register */

There is generally no need to enclose any header incudes in #ifdef.
If there is a problem in the header when included without CONFIG_OF set,
that should be fixed in the header.

> @@ -1224,6 +1228,54 @@ static int serial_imx_resume(struct platform_device *dev)
>         return 0;
>  }
>  
> +#ifdef CONFIG_OF
> +static int serial_imx_probe_dt(struct imx_port *sport,
> +               struct platform_device *pdev)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       static int line;
> +
> +       if (!node)
> +               return -ENODEV;
> +
> +       if (of_get_property(node, "rts-cts", NULL))
> +               sport->have_rtscts = 1;
> +
> +#ifdef CONFIG_IRDA
> +       if (of_get_property(node, "irda", NULL))
> +               sport->use_irda = 1;
> +#endif
> +       sport->port.line = line++;
> +
> +       return 0;
> +}
> +#else
> +static int serial_imx_probe_dt(struct imx_port *sport,
> +               struct platform_device *pdev)
> +{
> +       return -ENODEV;
> +}
> +#endif

Similarly, there is no need to have the #ifdef CONFIG_IRDA here.
This one takes up a few bytes of probe code, but otherwise makes
the code more readable.

	Arnd
