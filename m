From: Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: Add platform support for Fujitsu MB86S7X SoCs
Date: Wed, 16 Jul 2014 13:52:15 +0800
Message-ID: <CAAfg0W5vRKamkpz0mJhVWg0Y_bnVG==TWhPEmziqFdkm1irJ5A@mail.gmail.com>
References: <1405232911-4569-1-git-send-email-mollie.wu@linaro.org>
	<CAL_JsqKvwxjEDZPVwL646PhPKr7oemBzxr6cZ+X=uJQ2u_XZ8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKvwxjEDZPVwL646PhPKr7oemBzxr6cZ+X=uJQ2u_XZ8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jaswinder Singh <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15 July 2014 23:11, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> +               interrupts = <0 324 4>,
>> +                            <0 325 4>;
>> +               clocks = <&clk_alw_6_8>;
>> +       };
>
> No arch timer?

As Jassi said he'll solve the rest of the issues you found, but about
the arch / localtimers... mb86s70 is a sort of initial demonstrator
for the new technologies in this series for Fujitsu.  As such it has
some errata and one of them is the localtimers are not workable, the
clocksource has to be provided instead by sp804.  If we define the
localtimers, the kernel will prefer them and we will fail to boot due
to the hardware errata.  So, they should not be defined for this
particular SoC.

Later variants fix this errata like mb86s73 (also introduced in this
patch series) and the Device Tree for that has the arch localtimers as
you would expect.

-Andy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
