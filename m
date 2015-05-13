From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Wed, 13 May 2015 18:09:20 +0100
Message-ID: <55538540.1010505@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>	<1430134846-24320-2-git-send-email-sudeep.holla@arm.com> <CABb+yY1KcrDNrhCHae=B7D+9jv2MEOqwF0VhDRKnZu7ATGfv2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY1KcrDNrhCHae=B7D+9jv2MEOqwF0VhDRKnZu7ATGfv2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 13/05/15 17:52, Jassi Brar wrote:
> On Mon, Apr 27, 2015 at 5:10 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> This patch adds support for System Control and Power Interface (SCPI)
>> Message Protocol used between the Application Cores(AP) and the System
>> Control Processor(SCP). The MHU peripheral provides a mechanism for
>> inter-processor communication between SCP's M3 processor and AP.
>>
>> SCP offers control and management of the core/cluster power states,
>> various power domain DVFS including the core/cluster, certain system
>> clocks configuration, thermal sensors and many others.
>>
>> This protocol driver provides interface for all the client drivers using
>> SCPI to make use of the features offered by the SCP.
>>
> Is the SCPI specification available somewhere to look into?
>

Yes sorry posted the link separately(as reply to Tixy in the cover
letter) since it was not available when I posted the patches.
You can grab the protocol @[1] or [2]

>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> CC: Jassi Brar <jassisinghbrar@gmail.com>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>>   .../devicetree/bindings/mailbox/arm,scpi.txt       | 121 ++++
>>   drivers/mailbox/Kconfig                            |  19 +
>>   drivers/mailbox/Makefile                           |   2 +
>>   drivers/mailbox/scpi_protocol.c                    | 694 +++++++++++++++++++++
>>
> Why in drivers/mailbox/ ? This is a 'consumer' driver and seems
> Juno(ARM) specific.
>

Not just JUNO alone though it's first one to use, it will used in next
few platforms(foreseeable future) from ARM Ltd.

I have put that in drivers/mailbox for 2 reasons:
1. It's mailbox protocol :)
2. ARM64 doesn't have platform code like ARM32 and moreover it's
    strictly not specific to JUNO or any single platform. It may
    get reused on other platforms.

Regards,
Sudeep

[1] 
http://community.arm.com/servlet/JiveServlet/download/8401-40-18262/DUI0922A_scp_message_interface.pdf
[2] 
https://wiki.linaro.org/ARM/Juno?action=AttachFile&do=get&target=DUI0922A_scp_message_interface.pdf
