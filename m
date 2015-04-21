From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 07/11] ARM: imx: add msl support for imx7d
Date: Tue, 21 Apr 2015 15:22:49 -0500
Message-ID: <CAL_Jsq+NV5Ok-P6JGZzNyQCD=PdwXbDY39XmwzKB0U+vuyHxVA@mail.gmail.com>
References: <1429628007-8892-1-git-send-email-Frank.Li@freescale.com>
 <1429628007-8892-8-git-send-email-Frank.Li@freescale.com> <20150421173110.GG10164@leverpostej>
 <CAHrpEqRAEMammfaovi6QQxGJfW-LZsgwg5rX4-3Y=+m6qhqeTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHrpEqRAEMammfaovi6QQxGJfW-LZsgwg5rX4-3Y=+m6qhqeTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 21, 2015 at 1:51 PM, Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Apr 21, 2015 at 12:31 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>>> +static void __init imx_ca7_smp_init_cpus(void)
>>> +{
>>> +       int i, ncores;
>>> +       unsigned long val;
>>> +
>>> +       asm volatile("mrc p15, 1, %0, c9, c0, 2" : "=r" (val));
>>> +       ncores = ((val >> 24) & 0x3) + 1;
>>> +       if (setup_max_cpus < ncores)
>>> +               ncores = (setup_max_cpus) ? setup_max_cpus : 1;
>>> +
>>> +       for (i = ncores; i < NR_CPUS; i++)
>>> +               set_cpu_possible(i, false);
>>> +}
>>
>> NAK.
>>
>> The set of available CPUs should come from the DT, as with other
>> platforms.
>
> Can you give me a reference platform implement?

All of the ones with no smp_operations.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
