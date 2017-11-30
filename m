From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] mfd: syscon: Add hardware spinlock support
Date: Thu, 30 Nov 2017 10:04:13 +0800
Message-ID: <CAMz4kuJTjjF=iHFxinm74H9JeeMBHGgN0rwhCGyZr1PC-aa6Ag@mail.gmail.com>
References: <e6b3e6532abf42e6e13919e65d79908cd5e02137.1511159909.git.baolin.wang@linaro.org>
 <CAK8P3a2SDgPEfg4PvefSrh0cBneNcbM66ogbuBFxoxqrS82cTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a2SDgPEfg4PvefSrh0cBneNcbM66ogbuBFxoxqrS82cTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 29 November 2017 at 18:07, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Mon, Nov 20, 2017 at 7:54 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Some system control registers need hardware spinlock to synchronize
>> between the multiple subsystems, so we should add hardware spinlock
>> support for syscon.
>>
>
>> @@ -87,6 +88,12 @@ static struct syscon *of_syscon_register(struct device_node *np)
>>         if (ret)
>>                 reg_io_width = 4;
>>
>> +       ret = of_hwspin_lock_get_id(np, 0);
>> +       if (ret > 0) {
>> +               syscon_config.hwlock_id = ret;
>> +               syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
>> +       }
>
> Hi Baolin,
>
> The error handling here seems insufficient, I think we have to treat
> the following cases separately:
>
> - ret>0 (this is fine)
> - no spinlock in DT: of_hwspin_lock_get_id currently returns -EINVAL,
>   we probably want to use a different return code (maybe -ESRCH ?)
>   here so we can tell the difference beween no spinlock, and an
>   invalid spinlock
> - deferred probing: if the spinlock is there but the driver is not
>   yet available, we may need to propagate the -EPROBE_DEFER
>   here
> - other error: this would probably be a fatal condition here, and
>   we should print a warning and clean up.

You are correct and I will add some error handling. Thanks for your comments.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
