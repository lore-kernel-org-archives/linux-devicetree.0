From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Date: Wed, 28 Aug 2019 08:15:38 +0800
Message-ID: <63304ddd-eb24-31a4-d905-ce8e37ec5cb9@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-12-jiaxun.yang@flygoat.com>
 <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
 <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com>
 <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827204105.7nyt4pi7lvxse5ij@pburton-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On 2019/8/28 上午4:41, Paul Burton wrote:
> Hi guys,
>
> On Tue, Aug 27, 2019 at 10:18:46PM +0800, Jiaxun Yang wrote:
>> On 2019/8/27 下午8:45, Rob Herring wrote:
>>> On Tue, Aug 27, 2019 at 3:55 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>>> diff --git a/Documentation/devicetree/bindings/mips/loongson/cpus.yaml b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>>>> new file mode 100644
>>>> index 000000000000..410d896a0078
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>>>> @@ -0,0 +1,38 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>> Dual license for new bindings please:
>>>
>>> (GPL-2.0-only OR BSD-2-Clause)
>>>
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mips/loongson/cpus.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Loongson CPUs bindings
>>>> +
>>>> +maintainers:
>>>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> +
>>>> +description: |+
>>>> +  The device tree allows to describe the layout of CPUs in a system through
>>>> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
>>>> +  defining properties for every cpu.
>>>> +
>>>> +  Bindings for CPU nodes follow the Devicetree Specification, available from:
>>>> +
>>>> +  https://www.devicetree.org/specifications/
>>>> +
>>>> +properties:
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description: |
>>>> +      Physical ID of a CPU, Can be read from CP0 EBase.CPUNum.
>>> Is this definition specific to Loongson CPUs or all MIPS?
>> Currently it's specific to Loongson CPU only, as other processors may using
>> different method to express CPU map.
>>
>> Different from Arm, MIPS family of processors seems less uniform and have
>> their own designs.
>>
>> For this point, we'd better ask Paul's opinion.
> In general on MIPS we detect CPU properties at runtime from coprocessor
> 0 registers & similar sources of information, so there's not really a
> need to specify anything about the CPU in devicetree. For example here
> you say yourself that the value for this property can be read from
> EBase.CPUNum - so why specify it in DT?
Hi Paul,

CPU itself doesn't have to expressed by DT, but other nodes (like NUMA) 
will use CPU Node to determine the physical core.

Also CPU Node can be used to express the total number of CPUs. We need 
this property to bind a CPU Node to a fixed core.

Or we'd better describe "reg" as "Physical Core ID" rather than specify 
"EBase.CPUNum"?

--

Jiaxun Yang

>
> Thanks,
>      Paul
