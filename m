From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Add YAML schemas for the Intel
 Reset controller
Date: Mon, 26 Aug 2019 17:52:52 +0800
Message-ID: <746ed130-a1ae-0cc2-5060-70de95cdf2fe@linux.intel.com>
References: <42039170811f798b8edc66bf85166aefe7dbc903.1566531960.git.eswara.kota@linux.intel.com>
 <CAL_JsqJxh5TzDb8kOFm+F5Gs4WXF6BP5uaNPLcyx+srtaDisMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJxh5TzDb8kOFm+F5Gs4WXF6BP5uaNPLcyx+srtaDisMw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 8/23/2019 8:25 PM, Rob Herring wrote:
> On Fri, Aug 23, 2019 at 12:28 AM Dilip Kota <eswara.kota@linux.intel.com> wrote:
>> Add YAML schemas for the reset controller on Intel
>> Lightening Mountain (LGM) SoC.
>>
>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>> ---
>> Changes on v2:
>>      Address review comments
>>        Update the compatible property definition
>>        Add description for reset-cells
>>        Add 'additionalProperties: false' property
>>
>>   .../bindings/reset/intel,syscon-reset.yaml         | 53 ++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
>> new file mode 100644
>> index 000000000000..3403a967190a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
>> @@ -0,0 +1,53 @@
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
>> +    items:
>> +      - const: intel,rcu-lgm
>> +      - const: syscon
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
>> +    description: |
>> +      The 1st cell is the register offset.
>> +      The 2nd cell is the bit offset in the register.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - intel,global-reset
>> +  - "#reset-cells"
>> +
>> +additionalProperties: false
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
> You need to run 'make dt_binding_check' and fix the warnings. The
> example has to be buildable and it is not.

Sure, i  will correct this pcie_phy0 node. But i didn't get any warnings 
for make dt_binding_check

   CHKDT Documentation/devicetree/bindings/reset/intel,syscon-reset.yaml
DTC Documentation/devicetree/bindings/arm/renesas.example.dt.yaml
FATAL ERROR: Unknown output format "yaml"

Will DTC report about the example node errors? But, DTC is failing with 
FATAL_ERROR.
I tried it even after installing libyaml and headers in my local 
directory and export the path, but no luck.(ref: 
https://lkml.org/lkml/2018/12/3/951)
Could you please let me know if i miss anything and help me to proceed 
further.

Regards,
Dilip
>
>> +        /* address offset: 0x10, bit offset: 12 */
>> +        resets = <&rcu0 0x10 12>;
>> +        ...
>> +    };
>> --
>> 2.11.0
>>
