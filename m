From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for MAX77620/MAX20024
Date: Wed, 27 Apr 2016 23:57:54 +0530
Message-ID: <572104AA.7080500@nvidia.com>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com> <1459348188-11726-3-git-send-email-ldewangan@nvidia.com> <20160427151947.GD4892@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160427151947.GD4892@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Wednesday 27 April 2016 08:49 PM, Lee Jones wrote:
> On Wed, 30 Mar 2016, Laxman Dewangan wrote:
>
>> +#define MAX77620_MFD_CELL_RES(_name, _res)			\
>> +	{							\
>> +		.name = (_name),				\
>> +		.resources = (_res),				\
>> +		.num_resources = ARRAY_SIZE((_res)),		\
>> +	}
> I'm *still* not accepting this.
>
>> +
>> +static struct mfd_cell max20024_children[] = {
>> +	MAX77620_MFD_CELL_NAME("max20024-pinctrl"),
>> +	MAX77620_MFD_CELL_RES("max20024-gpio", gpio_resources),
>> +	MAX77620_MFD_CELL_NAME("max20024-pmic"),
>> +	MAX77620_MFD_CELL_RES("max77620-rtc", rtc_resources),
>> +	MAX77620_MFD_CELL_RES("max20024-power", power_resources),
>> +	MAX77620_MFD_CELL_NAME("max20024-watchdog"),
>> +	MAX77620_MFD_CELL_NAME("max20024-clock"),
>> +};
> If you want this submission to be accepted this cycle, you're going to
> have to convert this to the traditional way of defining MFD children.

Yaah, I want to have this in current cycle.
Will it be fine as follows? (To have quick agreement)

static const struct mfd_cell max77620_children[] = {
         {
                 .name = "max77620-pinctrl",
         }, {
                 .name = "max77620-gpio",
                 .resource = gpio_resources,
                 .num_resources = ARRAY_SIZE(gpio_resources),
         }, {
         /* and so on */
         },
};


>
>> +		if (x >= tperiod)
>> +			return i;
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static int max77620_config_fps(struct max77620_chip *chip,
>> +			       struct device_node *fps_np)
> Lots of mention of 'FPS' here, but noting to so what that is?
>
> What does FPS stand for and what does the FPS do?

FPS is Flexible Power Sequence. It is explained in DT binding doc.

However, I will document the function to make it more clear in next 
revision.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
