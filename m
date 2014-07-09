From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH] hwmon: pwm-fan: Add pwm-fan driver
Date: Wed, 9 Jul 2014 19:49:39 +0200
Message-ID: <20140709174939.GE27655@distanz.ch>
References: <1404917600-4430-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1404917600-4430-1-git-send-email-k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-07-09 at 16:53:20 +0200, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> The pwm-fan driver enables control of fans connected to PWM lines.
> This driver uses the PWM framework, so it is compatible with all
> PWM devices that provide drivers through the PWM framework.
> 
> Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/hwmon/pwm-fan.txt          |   12 ++
>  drivers/hwmon/Kconfig                              |    9 +
>  drivers/hwmon/Makefile                             |    1 +
>  drivers/hwmon/pwm-fan.c                            |  199 ++++++++++++++++++++
>  4 files changed, 221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pwm-fan.txt
>  create mode 100644 drivers/hwmon/pwm-fan.c

[...]

> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> new file mode 100644
> index 0000000..78fa627
> --- /dev/null
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -0,0 +1,199 @@

[...]

> +#ifdef CONFIG_PM_SLEEP
> +static int pwm_fan_suspend(struct device *dev)
> +{
> +	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> +
> +	return pwm_config(ctx->pwm, 0, ctx->pwm->period);
> +}
> +
> +static int pwm_fan_resume(struct device *dev)
> +{
> +	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> +
> +	return pwm_config(ctx->pwm, ctx->duty_cycle, ctx->pwm->period);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(pwm_fan_pm, pwm_fan_suspend, pwm_fan_resume);

If you move this out of #ifdef CONFIG_PM_SLEEP, you won't need the
#ifdef around driver.pm below [1]. SIMPLE_DEV_PM_OPS will just define an
empty struct dev_pm_os if CONFIG_PM_LSEEP is not defined.

> +#endif
> +
> +
> +
> +static struct of_device_id of_pwm_fan_match[] = {
> +	{ .compatible = "pwm-fan", },
> +	{},
> +};
> +
> +static struct platform_driver pwm_fan_driver = {
> +	.probe		= pwm_fan_probe,
> +	.remove		= pwm_fan_remove,
> +	.driver	= {
> +		.name		= "pwm-fan",
> +#ifdef CONFIG_PM_SLEEP
> +		.pm		= &pwm_fan_pm,
> +#endif

[1] #ifdef CONFIG_PM_SLEEP not needed with the above change.

> +		.of_match_table	= of_match_ptr(of_pwm_fan_match),
> +	},
> +};
> +
> +module_platform_driver(pwm_fan_driver);
> +
> +MODULE_AUTHOR("Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_ALIAS("platform:pwm-fan");
> +MODULE_DESCRIPTION("PWM FAN driver");
> +MODULE_LICENSE("GPL");
> -- 
> 1.7.9.5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
