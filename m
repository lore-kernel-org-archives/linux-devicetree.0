From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 01/10] mfd: Add TI LMU driver
Date: Wed, 19 Feb 2014 08:58:45 +0900
Message-ID: <5303F3B5.6050806@ti.com>
References: <1392359450-6890-1-git-send-email-milo.kim@ti.com> <20140217095734.GD17875@lee--X1> <53030F9C.8000605@ti.com> <20140218082127.GD20218@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140218082127.GD20218@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 02/18/2014 05:21 PM, Lee Jones wrote:
>>>> +	pdata->en_gpio = of_get_named_gpio(node, "ti,enable-gpio", 0);
>>>
>>> There is a global DT property for this already.
>>
>> I've not found it yet, but I agree it looks like general property.
>> So I'll replace "ti,enable-gpio" with "ti,lmu-en-gpio".
>
> Just re-use "gpio-enable". No need for it to be vendor specific.
>

Got it. Thanks!

This GPIO is used for enabling the device. So, "enable-gpio" is more 
appropriate name, isn't it?

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
