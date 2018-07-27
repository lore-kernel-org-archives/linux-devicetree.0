From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 9/9] clocksource: new RISC-V SBI timer driver
Date: Fri, 27 Jul 2018 10:44:05 -0700
Message-ID: <f0a5a2e0-7f08-13cd-1758-f53494c1e391@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-10-hch@lst.de>
 <972dacda-75d6-83cd-45e0-c7526a4e02ba@wdc.com>
 <20180727144148.GA29626@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727144148.GA29626@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "palmer@sifive.com" <palmer@sifive.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 7/27/18 7:38 AM, Christoph Hellwig wrote:
> On Thu, Jul 26, 2018 at 11:51:56AM -0700, Atish Patra wrote:
>> Should we follow the same prefix for these functions?
>> either timer_riscv* or riscv_timer* ?
>>
>> Apologies for overlooking this in my timer patch as wel
> 
> riscv_timer_* sounds saner to me, I can update that.
> 

Thanks.
>>> +	struct clock_event_device *evdev = this_cpu_ptr(&riscv_clock_event);
>>> +
>>
>> The comment about the purpose of clearing the interrupt in the original
>> patch is removed here. If that's intentional, it's fine.
>>
>> I thought having that comment helps understanding the distinction between
>> clearing the timer interrupt in SBI call & here.
> 
> Yes, that was intentional.  But given that I don't even understand why
> not using an ABI for architectural interrupt source enable/disable maybe
> I'm confused and should revisit that decision.
> 

I tried adding a new SBI call to disable the interrupts. However, I 
realized that it is not recommended to change the SBI unless absolutely 
required.

Here is the PR & following discussion.
https://github.com/riscv/riscv-pk/pull/108

Regards,
Atish
