From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Fri, 2 Nov 2018 13:53:51 -0700
Message-ID: <0c94f752-cc18-ae0c-36e7-7e0dd6b1d307@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <20181102133100.GA13130@e107155-lin>
 <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
 <20181102155038.GA21067@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102155038.GA21067@e107155-lin>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alankao@andestech.com" <alankao@andestech.com>, Zong Li <zong@andestech.com>
List-Id: devicetree@vger.kernel.org

On 11/2/18 8:50 AM, Sudeep Holla wrote:
> On Fri, Nov 02, 2018 at 10:11:38AM -0500, Rob Herring wrote:
>> On Fri, Nov 2, 2018 at 8:31 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>>>
>>> On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
>>>> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>>>>>
>>>>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
>>>>> But it doesn't need a separate thread node for defining SMT systems.
>>>>> Multiple cpu phandle properties can be parsed to identify the sibling
>>>>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
>>>>> So package is a better word choice than cluster for RISC-V.
>>>>
>>>> There was a proposal to add package info for ARM recently. Not sure
>>>> what happened to that, but we don't need 2 different ways.
>>>>
>>>
>>> We still need that, I can brush it up and post what Lorenzo had previously
>>> proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.
>>
>> Frankly, I don't care what the ACPI story is. I care whether each cpu
> 
> Sorry I meant feature parity with ACPI and didn't refer to the mechanics.
> 
>> arch does its own thing in DT or not. If a package prop works for
>> RISC-V folks and that happens to align with ACPI, then okay. Though I
>> tend to prefer a package represented as a node rather than a property
>> as I think that's more consistent.
>>
> 
> Sounds good. One of the reason for making it *optional* property is for
> backward compatibility. But we should be able to deal with that even with
> node.
> 

If you are introducing a package node, can we make cluster node 
optional? I feel it is a redundant node for use cases where one doesn't 
have a different grouped cpus in a package.

We may have some architecture that requires cluster, it can be added to 
the DT at that time, I believe.

>> Any comments on the thread aspect (whether it has ever been used)?
>> Though I think thread as a node level is more consistent with each
>> topology level being a node (same with package).
>>
> Not 100% sure, the only multi threaded core in the market I know is
> Cavium TX2 which is ACPI.
> 

Any advantages of keeping thread node if it's not being used. If I am 
not wrong, we can always use multiple cpuN phandles to represent SMT 
nodes. It will result in less code and DT documentation as well.


Regards,
Atish
> --
> Regards,
> Sudeep
> 
