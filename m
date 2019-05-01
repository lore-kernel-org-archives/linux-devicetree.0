From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v8 00/14] Add support for TISCI Interrupt controller
 drivers
Date: Wed, 1 May 2019 15:31:06 +0100
Message-ID: <29a47f10-00cc-877b-8f65-1dea7342049b@arm.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com>
 <30f5c877-a4dc-8ad9-0ad0-c172a60dc853@arm.com>
 <7edd8582-ce51-60a0-24e1-c45fe6725705@ti.com>
 <86pnp29tlv.wl-marc.zyngier@arm.com> <20190501140422.GJ8007@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501140422.GJ8007@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, linus.walleij@linaro.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01/05/2019 15:04, Tony Lindgren wrote:
> * Marc Zyngier <marc.zyngier@arm.com> [190501 13:45]:
>> On Wed, 01 May 2019 14:23:41 +0100,
>> Lokesh Vutla <lokeshvutla@ti.com> wrote:
>>>
>>> Hi Marc,
>>
>> [...]
>>
>>>> Lokesh,
>>>>
>>>> Thanks for having respun this quickly.
>>>>
>>>> I've applied the first 13 patches to irqchip-next (after tidying up some
>>>> of the commit messages). I've left the last patch for armsoc to take,
>>>> unless you guys insist on me taking it.
>>>
>>> I prefer if everything goes as a single bundle, unless arm-soc maintainers
>>> object. Want to start posting DT nodes.
>>
>> Santosh, Tony: what do you prefer? I don't care either way, but I need
>> a word from either of you.
> 
> Best to keep the series together IMO, and it's a tiny patch unlikely
> to conflict with anything. Here's an ack from me for patch 14 from me:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Cheers Tony. Applied and pushed out.

	M.
-- 
Jazz is not dead. It just smells funny...
