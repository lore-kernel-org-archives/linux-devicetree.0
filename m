From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add YAML schemas for the Intel
 Reset controller
Date: Fri, 23 Aug 2019 13:22:00 +0800
Message-ID: <8e302ef7-4d3a-d160-7d9a-81ebceffbb99@linux.intel.com>
References: <c909a3a19a1c06ac3ed9e1c42da3193ff8e43b7a.1566454535.git.eswara.kota@linux.intel.com>
 <CAL_JsqKpbXEw63PszfKX+DL-j1itfzpXNqwcJmijpo758dYZuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKpbXEw63PszfKX+DL-j1itfzpXNqwcJmijpo758dYZuw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 8/23/2019 1:54 AM, Rob Herring wrote:
> On Thu, Aug 22, 2019 at 2:32 AM Dilip Kota <eswara.kota@linux.intel.com> wrote:
>> Add YAML schemas for the reset controller on Intel
>> Lightening Mountain (LGM) SoC.
>>
>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>> ---
>>   .../bindings/reset/intel,syscon-reset.yaml         | 50 ++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
>> new file mode 100644
>> index 000000000000..298c60085486
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/reset/intel,syscon-reset.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel Lightening Mountain SoC System Reset Controller
>> +
>> +maintainers:
>> +  - Dilip Kota <eswara.kota@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    allOf:
>> +      - items:
>> +          - enum:
>> +              - intel,rcu-lgm
>> +              - syscon
> compatible:
>    items:
>      - const: intel,rcu-lgm
>      - const: syscon
Sure, will update it.
>> +
>> +  reg:
>> +    description: Reset controller register base address and size
>> +
>> +  intel,global-reset:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: Global reset register offset and bit offset.
>> +
>> +  "#reset-cells":
>> +    const: 2
> Add a description with what each cell contains.
Sure, will add the description.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - intel,global-reset
>> +  - "#reset-cells"
> Add a:
>
> additionalProperties: false

Ok, will add it.

Thanks for the review comments.
Regards,
Dilip

>
>> +
>> +examples:
>> +  - |
>> +    rcu0: reset-controller@00000000 {
>> +        compatible = "intel,rcu-lgm", "syscon";
>> +        reg = <0x000000 0x80000>;
>> +        intel,global-reset = <0x10 30>;
>> +        #reset-cells = <2>;
>> +    };
>> +
>> +    pcie_phy0: pciephy@... {
>> +        ...
>> +        /* address offset: 0x10, bit offset: 12 */
>> +        resets = <&rcu0 0x10 12>;
>> +        ...
>> +    };
>> --
>> 2.11.0
>>
