From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 09/11] RISC-V: Support per-hart timebase-frequency
Date: Tue, 7 Aug 2018 23:47:13 -0700
Message-ID: <b4ddcb20-6109-22ac-4691-c2c012ea112a@wdc.com>
References: <mhng-d315d8a6-c4db-4ec8-927b-fc9f1d8e7872@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-d315d8a6-c4db-4ec8-927b-fc9f1d8e7872@palmer-si-x1c4>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@dabbelt.com>, Christoph Hellwig <hch@lst.de>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "shorne@gmail.com" <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On 8/6/18 1:34 PM, Palmer Dabbelt wrote:
> On Fri, 03 Aug 2018 05:33:57 PDT (-0700), Christoph Hellwig wrote:
>> On Thu, Aug 02, 2018 at 03:19:49PM -0700, Atish Patra wrote:
>>> On 8/2/18 4:50 AM, Christoph Hellwig wrote:
>>>> From: Palmer Dabbelt <palmer@sifive.com>
>>>>
>>>> Follow the updated DT specs and read the timebase-frequency from the
>>>> CPU 0 node.
>>>>
>>>
>>> However, the DT in the HighFive Unleashed has the entry at the wrong place.
>>>
>>> Even the example in github also at wrong place.
>>> https://github.com/riscv/riscv-device-tree-doc/pull/8/commits/2461d481329c55005fcbe684f0d6bdb3b7f0a432
>>>
>>> DT should be consistent between Documentation and the one in the hardware.
>>> I can fix them in bbl & submit a bbl patch. But I am not sure if that's an
>>> acceptable way to do it.
>>
>> I'll need to have comments from Palmer and/or someone else at SiFive
>> here.  Personally I really don't care where we document the timebase,
>> as this patch supports both locations anywhere.  For now I'll just update
>> the commit log to state that more explicitly.
> 
> You're welcome to submit a BBL patch to make this all match, but from my
> understanding of the device tree spec putting timebase-frequency in either
> place should be legal so it's not a critical fix.  That said, it's better to
> have them match than not match.
> 

ok. I will add it my TODO list as a low priority task. Following DT 
entries can be fixed for now.

1. timebase-frequency
2. next-level-cache

Regards,
Atish
