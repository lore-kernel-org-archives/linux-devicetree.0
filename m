From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] firmware: of: populate /firmware/ node during init
Date: Fri, 11 Aug 2017 17:54:16 +0200
Message-ID: <CAK8P3a3=8D5Mz54TYbfyrPC7yyKY-m7=H1OfS9JVKTdC0h-tHw@mail.gmail.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
 <1502458237-1683-2-git-send-email-sudeep.holla@arm.com> <CAK8P3a1p8xS4u5EQ9auqgcmhXaybhDdsa6ah3G-7TeEf+ko9kA@mail.gmail.com>
 <CABGGisyQKfre_qMqnngOiKbqUaHF0KWKtZyYPJ47iPwgL5t6xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABGGisyQKfre_qMqnngOiKbqUaHF0KWKtZyYPJ47iPwgL5t6xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 11, 2017 at 5:05 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Aug 11, 2017 at 9:37 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Fri, Aug 11, 2017 at 3:30 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>> Since "/firmware" does not have its own "compatible" property as it's
>>> just collection of nodes representing firmware interface, it's sub-nodes
>>> are not populated during system initialization.
>>>
>>> Currently different firmware drivers search the /firmware/ node and
>>> populate the sub-node devices selectively. Instead we can populate
>>> the /firmware/ node during init to avoid more drivers continuing to
>>> populate the devices selectively.
>>>
>>> This patch adds initcall to achieve the same.
>>
>> Hmm, I'm a bit skeptical whether representing anything under /firmware
>> as a platform device is a good idea. Having a more structured way to
>> probe those seems like a good idea, but maybe a different subsystem
>> would be more appropriate.
>>
>> I do realize that a 'platform_device' has become a rather generic abstraction
>> for almost anything, but at some point we might want to draw the line
>> of what is a platform_device.
>
> I guess the question how are they different? Most of what's under
> drivers/firmware/ are platform drivers. I think they are mostly either
> smc calls or mailbox interfaces. Would there be any advantage to
> creating an smc bus or mailbox bus?

I guess one difference I see is between things that are purely software
based (smc, efi runtime, rtas,  ...) and those that talk to some
hardware other than the CPU running some firmware.

The first category seems like a good fit for /firmware in DT and
for /sys/firmware in sysfs, while the second category would be
represented elsewhere in both DT and sysfs.

drivers/base/firmware.c currently is extremely rudimentary but this
is where /sys/firmware objects hook into. How about extending
this with a firmware_device that gets populated from /firmware
in DT? Not using platform_device obviously means we lose
all of the automatic probing of reg/interrupts/... resources, but
then again that is sort of the idea of firmware-only nodes.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
