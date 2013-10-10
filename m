From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] cpufreq: probe the Integrator cpufreq driver from DT
Date: Thu, 10 Oct 2013 17:11:26 +0200
Message-ID: <CACRpkdY7kiuBzN=tYW-iGdW+LjvJ+oEg4WwOkxX_XnprOtZXVw@mail.gmail.com>
References: <1380816238-3255-1-git-send-email-linus.walleij@linaro.org>
	<20131008100044.GF28972@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008100044.GF28972-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 8, 2013 at 12:00 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

>> +static int __init integrator_cpufreq_probe(struct platform_device *pdev)
>>  {
>> +     struct device_node *np = pdev->dev.of_node;
>> +
>> +     cm_base = of_iomap(np, 0);
>> +     if (!cm_base)
>> +             return -ENODEV;
>>       return cpufreq_register_driver(&integrator_driver);
>
> If we fail to register the driver we could unmap cm_base, no?

Using devm_* is better so I'll revise it to do this.

>> -static void __exit integrator_cpu_exit(void)
>> +static void __exit integrator_cpufreq_remove(struct platform_device *pdev)
>>  {
>>       cpufreq_unregister_driver(&integrator_driver);
>
> Unmap here?

Dito. Check v2.

>> +static const struct of_device_id integrator_cpufreq_match[] = {
>> +     { .compatible = "arm,core-module-integrator"},
>> +     { },
>> +};
>
> It feels a little scary that this also got handled by some other code in
> the previous patch. Is no arbitrarion required between the two when
> accessing the core module registers?

They are using totally different registers, so it should not be an
issue. Inside the mach folder there is some arbitration for the
register that is actually accessed by several consumers.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
