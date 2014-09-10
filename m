From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Wed, 10 Sep 2014 14:11:19 -0500
Message-ID: <alpine.DEB.2.02.1409101353500.2790@atx-linux-37>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com> <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, 9 Sep 2014, Weike Chen wrote:

> The Synopsys DesignWare APB GPIO driver only supports open firmware devices.
> But, like Intel Quark X1000 SOC, which has a single PCI function exporting
> a GPIO and an I2C controller, it is a Multifunction device. This patch is
> to enable the current Synopsys DesignWare APB GPIO driver to support the
> Multifunction device which exports the designware GPIO controller.
> 
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
> Signed-off-by: Weike Chen <alvin.chen@intel.com>

Hi Alvin,

I did a quick test and this looks like it works for me (with device tree).
I had a couple of small fixes below.

Alan

>  
> -	port->bgc.gc.ngpio = ngpio;
> -	port->bgc.gc.of_node = port_np;
> +#ifdef CONFIG_OF_GPIO
> +	port->bgc.gc.of_node = pp->node;
> +#endif

Please use 'if (IS_ENABLED(CONFIG_OF_GPIO)) as a conditional as you do
elsewhere.

>  static int dwapb_gpio_probe(struct platform_device *pdev)
>  {
> +	int i;
>  	struct resource *res;
>  	struct dwapb_gpio *gpio;
> -	struct device_node *np;
>  	int err;
> -	unsigned int offs = 0;
> +	struct device *dev = &pdev->dev;
> +	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
> +	bool is_pdata_alloc = !pdata;

Please combine the int's in one line (int err, i;) and put them as
the last one on this list.  It looks the same to the compiler of
course, but more uniform for human eyes :)
