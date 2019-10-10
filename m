From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: edac: al-mc-edac: Amazon's Annapurna
 Labs Memory Controller EDAC
Date: Thu, 10 Oct 2019 13:18:03 +0300
Message-ID: <645f7af1-cefc-0af2-9fbd-e73e5305a268@amazon.com>
References: <1570103363-21486-1-git-send-email-talel@amazon.com>
 <1570103363-21486-2-git-send-email-talel@amazon.com>
 <20191009191625.GA8179@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009191625.GA8179@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org


On 10/9/2019 10:16 PM, Rob Herring wrote:
> On Thu, Oct 03, 2019 at 02:49:22PM +0300, Talel Shenhar wrote:
>> Document Amazon's Annapurna Labs Memory Controller EDAC SoC binding.
>>
>> Signed-off-by: Talel Shenhar <talel@amazon.com>
>> ---
>>   .../bindings/edac/amazon,al-mc-edac.yaml           | 40 ++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
>> new file mode 100644
>> index 0000000..33da051
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
>> @@ -0,0 +1,40 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/edac/amazon,al-mc-edac.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amazon's Annapurna Labs Memory Controller EDAC
>> +
>> +maintainers:
>> +  - Talel Shenhar <talel@amazon.com>
>> +  - Talel Shenhar <talelshenhar@gmail.com>
>> +
>> +description: |
>> +  EDAC node is defined to describe on-chip error detection and correction for
>> +  Amazon's Annapurna Labs Memory Controller.
>> +
>> +properties:
>> +
>> +  compatible:
>> +    - const: "amazon,al-mc-edac"
> Fails 'make dt_binding_check'. Drop the '-' as a property is not a list.
>
> The "" are also unnecessary.
ack, shall be part of v4
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +examples:
>> +  - |
>> +    edac@f0080000 {
>> +      compatible = "amazon,al-mc-edac";
>> +      reg = <0x0 0xf0080000 0x0 0x00010000>;
>> +      interrupt-parent = <&amazon_al_system_fabric>;
>> +      interrupt-names = "ue";
> Need to document the name or drop as -names on a single entry is
> pointless.

actually, there are 2 interrupts possible here. so will also fix the 
maxItems of interrupts. will also add the documentation.

shall be part of v4.

>
>> +      interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
>> +    };
>> -- 
>> 2.7.4
>>
