From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: kirkwood: convert orion-wdt to fdt.
Date: Thu, 1 Mar 2012 19:48:51 +0000
Message-ID: <201203011948.51642.arnd@arndb.de>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <2f29e88b98b2bcff0c241996e6d7216a60995d2d.1330625878.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <2f29e88b98b2bcff0c241996e6d7216a60995d2d.1330625878.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 01 March 2012, Jason Cooper wrote:
>  static int heartbeat = -1;             /* module parameter (seconds) */
>  static unsigned int wdt_max_duration;  /* (seconds) */
>  static unsigned int wdt_tclk;
> +static unsigned int wdt_reg;
>  static unsigned long wdt_status;
> static DEFINE_SPINLOCK(wdt_lock);

This variable needs to be a 'void __iomem *', not an int.

> +       wdt_reg = TIMER_VIRT_BASE;
> +
> +       of_property_read_u32(np, "reg", &wdt_reg);
> +
>         if (orion_wdt_miscdev.parent)
>                 return -EBUSY;
>         orion_wdt_miscdev.parent = &pdev->dev;

Don't just read a reg property, but use the resource instead and ioremap it.

This driver still uses hardcoded virtual addresses for its registers, which
we're trying to get rid of. The best solution would be to always put the
register address into the platform device resources, either hardcoded for
classic boards or automatic through the device tree.

A reg property is special in that it's not just a number but is relative
to the "ranges" property of the parent device and can be multiple 32 bit
values for the address, which get turned into a CPU physical address using
of_translate_address().

	Arnd
