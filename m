From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [lm-sensors] [PATCH] hwmon: pwm-fan: Add pwm-fan driver
Date: Thu, 10 Jul 2014 09:17:13 -0700
Message-ID: <53BEBC89.8080205@roeck-us.net>
References: <1404917600-4430-1-git-send-email-k.debski@samsung.com> <20140709165817.GA24842@roeck-us.net> <107401cf9c52$1fe0a0e0$5fa1e2a0$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <107401cf9c52$1fe0a0e0$5fa1e2a0$%debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kamil,

On 07/10/2014 08:17 AM, Kamil Debski wrote:
>
>>
>>> +	}
>>> +
>>> +	dev_set_drvdata(&pdev->dev, ctx);
>>> +	platform_set_drvdata(pdev, ctx);
>>> +
>>> +	/* Set duty cycle to maximum allowed */
>>> +	ctx->duty_cycle = ctx->pwm->period - 1;
>>> +	ctx->pwm_value = MAX_PWM;
>>> +	pwm_config(ctx->pwm, ctx->duty_cycle, ctx->pwm->period);
>
> Guenter, I have a question regarding this. I see that gpio-fan reads
> the state of gpios and uses this as the initial setting.
> Led-pwm on init sets the brightness to LED_OFF.
>
> What should be the default state after init? Should the fan be off or
> at full power? I am thinking about adding an optional node to device
> tree that could be used to set this. But the question remains - what
> should be the default setting?
>

Trick question ... I can not really answer it. you can try the devicetree
option, but be prepared to have it rejected - the usual argument is that
dt shall only describe the HW but not its configuration.

Ultimately, either way is fine with me.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
