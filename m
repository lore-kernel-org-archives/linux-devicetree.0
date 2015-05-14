From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Thu, 14 May 2015 12:32:55 +0530
Message-ID: <CABb+yY1083thUrtKfMKg1ZP2=d3Jr4hqRczqejpAkba+40UnkA@mail.gmail.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
	<1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
	<CABb+yY1KcrDNrhCHae=B7D+9jv2MEOqwF0VhDRKnZu7ATGfv2A@mail.gmail.com>
	<55538540.1010505@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55538540.1010505-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 13, 2015 at 10:39 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> On 13/05/15 17:52, Jassi Brar wrote:
>>
>>> This patch adds support for System Control and Power Interface (SCPI)
>>> Message Protocol used between the Application Cores(AP) and the System
>>> Control Processor(SCP). The MHU peripheral provides a mechanism for
>>> inter-processor communication between SCP's M3 processor and AP.
>>>
>>> SCP offers control and management of the core/cluster power states,
>>> various power domain DVFS including the core/cluster, certain system
>>> clocks configuration, thermal sensors and many others.
>>>
>>> This protocol driver provides interface for all the client drivers using
>>> SCPI to make use of the features offered by the SCP.
>>>
>> Is the SCPI specification available somewhere to look into?
>>
>
> Yes sorry posted the link separately(as reply to Tixy in the cover
> letter) since it was not available when I posted the patches.
> You can grab the protocol @[1] or [2]
>
Thanks for the link. I wish I had access to the spec earlier.

>>>   .../devicetree/bindings/mailbox/arm,scpi.txt       | 121 ++++
>>>   drivers/mailbox/Kconfig                            |  19 +
>>>   drivers/mailbox/Makefile                           |   2 +
>>>   drivers/mailbox/scpi_protocol.c                    | 694
>>> +++++++++++++++++++++
>>>
>> Why in drivers/mailbox/ ? This is a 'consumer' driver and seems
>> Juno(ARM) specific.
>>
>
> Not just JUNO alone though it's first one to use, it will used in next
> few platforms(foreseeable future) from ARM Ltd.
>
> I have put that in drivers/mailbox for 2 reasons:
> 1. It's mailbox protocol :)
>
client/protocol drivers don't usually reside with controller drivers.
drivers/firmware/ seems more appropriate.

> 2. ARM64 doesn't have platform code like ARM32 and moreover it's
>    strictly not specific to JUNO or any single platform. It may
>    get reused on other platforms.
>
drivers/firmware/ should do too.

BTW is scpi_protocol.c meant/tested to work over arm_mhu.c? The spec
says so but I don't see how because you pass 'struct scpi_xfer*' as
the message whereas arm_mhu.c expects u32*
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
