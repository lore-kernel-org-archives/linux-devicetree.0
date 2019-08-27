From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 07/13] dt-bindings: interrupt-controller: Add Loongson-3
 HTINTC
Date: Tue, 27 Aug 2019 22:08:49 +0800
Message-ID: <e4b0c346-928e-380c-02f7-11c9d4e7864b@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-8-jiaxun.yang@flygoat.com>
 <CAL_JsqJzkKDVm_DBpp4_w5YZQkg0yo9TJtvxzN5beTf45gtohw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJzkKDVm_DBpp4_w5YZQkg0yo9TJtvxzN5beTf45gtohw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>, Paul Burton <paul.burton@mips.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 2019/8/27 下午8:49, Rob Herring wrote:
> On Tue, Aug 27, 2019 at 3:59 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> Document Loongson-3 HyperTransport Interrupt controller.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   .../loongson,ls3-htintc.yaml                  | 53 +++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>> new file mode 100644
>> index 000000000000..c1bc0faca656
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-htintc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Loongson-3 HyperTransport Interrupt Controller
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +description: |
>> +  This interrupt controller is found in the Loongson-3 family of chips to transfer
>> +  interrupts from PCH connected on HyperTransport bus.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - loongson,ls3-htintc
> Can be simplified to:
>
> compatible
>    const: loongson,ls3-htintc
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 4
> Need to list out what each of the 4 are.

Hi Rob

These 4 interrupts a just delivered randomly, So it's hard to give out a 
name.

Should I add a description for this?

Thanks,

--

Jiaxun Yang
