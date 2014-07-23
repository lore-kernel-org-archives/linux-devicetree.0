From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v1] gpio: keystone: add dsp gpio controller driver
Date: Wed, 23 Jul 2014 11:25:56 -0400
Message-ID: <53CFD404.7070704@ti.com>
References: <1405507426-18992-1-git-send-email-grygorii.strashko@ti.com> <CACRpkdYY_a_9G-VLBbv2a22Cg4j0t3Wv4W1h0n6-ccCXgVJXsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYY_a_9G-VLBbv2a22Cg4j0t3Wv4W1h0n6-ccCXgVJXsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Jaswinder Singh <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ivan.khoronzhuk-l0cyMroinI0@public.gmane.org, Muralidharan Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 23 July 2014 11:10 AM, Linus Walleij wrote:
> On Wed, Jul 16, 2014 at 12:43 PM, Grygorii Strashko
> <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
> 
>> From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>>
>> On Keystone SOCs, ARM host can send interrupts to DSP cores using the
>> DSP GPIO controller IP. Each DSP GPIO controller provides 28 IRQ signals for
>> each DSP core. This is one of the component used by the IPC mechanism used
>> on Keystone SOCs.
>>
>> Keystone 2 DSP GPIO controller has specific features:
>> - each GPIO can be configured only as output pin;
>> - setting GPIO value to 1 causes IRQ generation on target DSP core;
>> - reading pin value returns 0 - if IRQ was handled or 1 - IRQ is still
>>   pending.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> 
> Pardon me. How is this GENERAL PURPOSE Input/Output?
> 
> It seems very very much SPECIAL PURPOSE to me, it's like
> you're just shoehorning some IPC mechanism into the GPIO
> subsystem, and this may be because the datasheet calls it
> GPIO when it's not.
>
> What other stuff than DSP is connected to these lines, and is it
> really even external lines? Aren't these just polysilicon rails
> pretty much hammered to be used by the DSP and nothing else.
>
> What is the difference between this and a mailbox IRQ line
> and the kind of stuff handled by drivers/mailbox?
>
I will try to answer this. This IP is indeed a GPIO block
but the IO's are used just OUTPUT lines from Linux
HOST perspective. These IOs are connected to the DSPs
as input/IRQ lines. The DSP-ARM host IPC mechanism used on
Keystone is Linux user-space based and it does as one of the
component.

Its not mailbox since there is no payload etc attached to it.
GPIO lib does expose the IO's to userspace and thats what is
being the case here. I think it is a legitimate usecase.

Sometimes the sending signals to another co-processor might
appear like shoehorning or odd but it just uses standard
GPIO library and its capabilities as is.

Regards,
Santosh






--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
