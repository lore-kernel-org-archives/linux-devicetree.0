From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 4/6] gpio: davinci: add OF support
Date: Mon, 4 Nov 2013 20:28:34 +0200
Message-ID: <5277E752.8090005@ti.com>
References: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
	<1383406775-14902-5-git-send-email-prabhakar.csenng@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1383406775-14902-5-git-send-email-prabhakar.csenng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alex Elder <alex.elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Prabhakar Lad,

On 11/02/2013 05:39 PM, Lad, Prabhakar wrote:
> From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
>
> This patch adds OF parser support for davinci gpio
> driver and also appropriate documentation in gpio-davinci.txt
> located at Documentation/devicetree/bindings/gpio/.

I worry, do we need to have gpio_chip.of_xlate() callback implemented?
- From one side, Davinci GPIO controller in DT described by one entry
which defines number of supported GPIOs as "ti,ngpio = <144>;"

- From other side, on Linux level more than one gpio_chip objects are 
instantiated (one per each 32 GPIO).

How the standard GPIO biding will work in this case? .. And will they?

Linus, I'd very appreciate if you will be able to clarify this point.

>
> Signed-off-by: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
> [prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: simplified the OF code, removed
> 		unnecessary DT property and also simplified
> 		the commit message]
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   .../devicetree/bindings/gpio/gpio-davinci.txt      |   32 ++++++++++++
>   drivers/gpio/gpio-davinci.c                        |   54 ++++++++++++++++++--
>   2 files changed, 83 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> new file mode 100644
> index 0000000..55aae1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> @@ -0,0 +1,32 @@
> +Davinci GPIO controller bindings
> +
> +Required Properties:
> +- compatible: should be "ti,dm6441-gpio"
> +
> +- reg: Physical base address of the controller and the size of memory mapped
> +       registers.
> +
> +- gpio-controller : Marks the device node as a gpio controller.
> +
> +- interrupts: Array of GPIO interrupt number.

May be meaning of <interrupts> property need to be extended, because,
as of now, only banked or unbanked IRQs are supported - and not both.

> +
> +- ti,ngpio: The number of GPIO pins supported.
> +
> +- ti,davinci-gpio-unbanked: The number of GPIOs that have an individual interrupt
> +		             line to processor.

Should interrupt-controller; specifier be added here?

> +
> +Example:
> +
> +gpio: gpio@1e26000 {
> +	compatible = "ti,dm6441-gpio";
> +	gpio-controller;
> +	reg = <0x226000 0x1000>;
> +	interrupts = <42 IRQ_TYPE_EDGE_BOTH 43 IRQ_TYPE_EDGE_BOTH
> +		44 IRQ_TYPE_EDGE_BOTH 45 IRQ_TYPE_EDGE_BOTH
> +		46 IRQ_TYPE_EDGE_BOTH 47 IRQ_TYPE_EDGE_BOTH
> +		48 IRQ_TYPE_EDGE_BOTH 49 IRQ_TYPE_EDGE_BOTH
> +		50 IRQ_TYPE_EDGE_BOTH>;
> +	ti,ngpio = <144>;
> +	ti,davinci-gpio-irq-base = <101>;

         ^^ Is it still needed?

> +	ti,davinci-gpio-unbanked = <0>;
> +};
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index bcb6d8d..bb20a39 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -17,6 +17,9 @@
>   #include <linux/io.h>
>   #include <linux/irq.h>
>   #include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_data/gpio-davinci.h>
>
> @@ -134,6 +137,40 @@ davinci_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>   	__raw_writel((1 << offset), value ? &g->set_data : &g->clr_data);
>   }
>
> +static struct davinci_gpio_platform_data *
> +davinci_gpio_get_pdata(struct platform_device *pdev)
> +{
> +	struct device_node *dn = pdev->dev.of_node;
> +	struct davinci_gpio_platform_data *pdata;
> +	int ret;
> +	u32 val;
> +
> +	if (!IS_ENABLED(CONFIG_OF) || !pdev->dev.of_node)
> +		return pdev->dev.platform_data;
> +
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return NULL;
> +
> +	ret = of_property_read_u32(dn, "ti,ngpio", &val);
> +	if (ret)
> +		goto of_err;
> +
> +	pdata->ngpio = val;
> +
> +	ret = of_property_read_u32(dn, "ti,davinci-gpio-unbanked", &val);
> +	if (ret)
> +		goto of_err;
> +
> +	pdata->gpio_unbanked = val;
> +
> +	return pdata;
> +
> +of_err:
> +	dev_err(&pdev->dev, "Populating pdata from DT failed: err %d\n", ret);
> +	return NULL;
> +}
> +
>   static int davinci_gpio_probe(struct platform_device *pdev)
>   {
>   	int i, base;
> @@ -144,12 +181,14 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct resource *res;
>
> -	pdata = dev->platform_data;
> +	pdata = davinci_gpio_get_pdata(pdev);
>   	if (!pdata) {
>   		dev_err(dev, "No platform data found\n");
>   		return -EINVAL;
>   	}
>
> +	dev->platform_data = pdata;
> +
>   	/*
>   	 * The gpio banks conceptually expose a segmented bitmap,
>   	 * and "ngpio" is one more than the largest zero-based
> @@ -501,11 +540,20 @@ done:
>   	return 0;
>   }
>
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id davinci_gpio_ids[] = {
> +	{ .compatible = "ti,dm6441-gpio", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, davinci_gpio_ids);
> +#endif
> +
>   static struct platform_driver davinci_gpio_driver = {
>   	.probe		= davinci_gpio_probe,
>   	.driver		= {
> -		.name	= "davinci_gpio",
> -		.owner	= THIS_MODULE,
> +		.name		= "davinci_gpio",
> +		.owner		= THIS_MODULE,
> +		.of_match_table	= of_match_ptr(davinci_gpio_ids),
>   	},
>   };
>
>
Regards,
- Grygorii
