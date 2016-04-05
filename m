From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/10] irqchip: lpc32xx: add LPC32xx irqchip driver
Date: Tue, 5 Apr 2016 04:24:27 +0300
Message-ID: <570313CB.5090204@mleia.com>
References: <1447982925-30138-1-git-send-email-vz@mleia.com>
 <loom.20160210T204046-649@post.gmane.org>
 <1459791432.25564.15.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459791432.25564.15.camel@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On 04.04.2016 20:37, Sylvain Lemieux wrote:
> Hi Vladimir,
> 
> On Wed, 2016-02-10 at 19:45 +0000, Sylvain Lemieux wrote:
>> Vladimir Zapolskiy <vz@...> writes:
>>>
>>> The change adds wakeup controller platform driver and irqchip driver
>>> for NXP LPC32xx boards.
>>  
>> Hi Vladimir,
>>
>> Just to let you know that we did some testing using this changeset;
>> I tested the change on 4.5-rc1 with patch 4 to 7, 10 & 11 from:
>> http://permalink.gmane.org/gmane.linux.drivers.devicetree/144671
>>
>> I was able to run our software (I2C SIC1 interrupt enable)
>> without any problem on a custom LPC32xx board.
>>
>>> Vladimir Zapolskiy (10):
>>>   dt-bindings: create arm/nxp folder and move LPC32xx SoC description to it
>>>   dt-bindings: nxp: add description of wakeup controller on LPC32xx
>>>   dt-bindings: interrupt-controllers: add description of SIC1 and SIC2
>>>   arm: lpc32xx: add wakeup platform driver
>>>   arm: dts: lpc32xx: assign interrupt types
>>>   arm: dts: lpc32xx: add description of IC wakeup controllers
>>>   arm: dts: lpc32xx: reparent SIC1 and SIC2 interrupts from MIC
>>>   irqchip: add LPC32xx interrupt controller driver
>>>   irqchip: lpc32xx: add option to wakeup from an interrupt
>>>   arm: dts: lpc32xx: enable SIC1 and SIC2 by default
>>
> 
> As per the feedback you gave in the following message:
> http://article.gmane.org/gmane.linux.ports.arm.kernel/483540
> 
> are you planning to send a version 2 of this patch for v4.7?
> 

definitely, I plan to find enough time this week to rebase and submit v2.
FWIW 2 changes from the series are found in v4.6.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
