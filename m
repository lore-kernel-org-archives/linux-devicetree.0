From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 6/6] cpufreq: probe the Integrator cpufreq driver from
 DT
Date: Tue, 8 Oct 2013 11:00:44 +0100
Message-ID: <20131008100044.GF28972@e106331-lin.cambridge.arm.com>
References: <1380816238-3255-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380816238-3255-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[adding devicetree to Cc]

Hi Linus,

[...]

> +static int __init integrator_cpufreq_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	cm_base = of_iomap(np, 0);
> +	if (!cm_base)
> +		return -ENODEV;
>  	return cpufreq_register_driver(&integrator_driver);

If we fail to register the driver we could unmap cm_base, no?

>  }
>  
> -static void __exit integrator_cpu_exit(void)
> +static void __exit integrator_cpufreq_remove(struct platform_device *pdev)
>  {
>  	cpufreq_unregister_driver(&integrator_driver);

Unmap here?

>  }
>  
> +static const struct of_device_id integrator_cpufreq_match[] = {
> +	{ .compatible = "arm,core-module-integrator"},
> +	{ },
> +};

It feels a little scary that this also got handled by some other code in
the previous patch. Is no arbitrarion required between the two when
accessing the core module registers?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
