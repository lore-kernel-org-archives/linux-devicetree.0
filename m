From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] pps-gpio: add device-tree binding and support
Date: Fri, 31 May 2013 21:15:19 +0200
Message-ID: <1588516.WvWWFWzAui@wuerfel>
References: <1370026015-9584-1-git-send-email-jlu@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370026015-9584-1-git-send-email-jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 31 May 2013 20:46:55 Jan Luebbe wrote:
> 
> +#ifdef CONFIG_OF
> +static const struct of_device_id pps_gpio_dt_ids[] = {
> +       { .compatible = "pps-gpio", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, pps_gpio_dt_ids);
> +
> +static struct pps_gpio_platform_data *
> +of_get_pps_gpio_pdata(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct pps_gpio_platform_data *pdata;
> +       int ret;
> +
> +       pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +       if (!pdata)
> +               return NULL;
> +
> +       ret = of_get_gpio(np, 0);
> +       if (ret < 0) {
> +               pr_err("failed to get GPIO from device tree\n");
> +               return NULL;
> +       }
> +
> +       pdata->gpio_pin = ret;
> +       pdata->gpio_label = PPS_GPIO_NAME;
> +
> +       if (of_get_property(np, "assert-falling-edge", NULL))
> +               pdata->assert_falling_edge = true;
> +
> +       return pdata;
> +}
> +#else
> +static struct pps_gpio_platform_data *
> +of_get_pps_gpio_pdata(struct platform_device *pdev)
> +{
> +       return NULL;
> +}
> +#endif

I don't think it's worth the effort of doing a dynamic
allocation if you just need to store two integers and a flag.
I would just put them all into pps_gpio_device_data, which also
gets rid of a couple of indirect pointer accesses and the #ifdef
above.

	Arnd
