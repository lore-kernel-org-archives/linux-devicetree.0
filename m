From: "Ramuthevar, Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: intel-sdxc-phy: Add YAML schema
 for LGM SDXC PHY
Date: Thu, 29 Aug 2019 09:45:36 +0800
Message-ID: <d14411be-434c-ed02-6d85-f70d4a0acded@linux.intel.com>
References: <20190828124315.48448-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190828124315.48448-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <0DAF21CFE1B20740AE23D6AF6E54843F1FDDE99F@IRSMSX108.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0DAF21CFE1B20740AE23D6AF6E54843F1FDDE99F@IRSMSX108.ger.corp.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Langer, Thomas" <thomas.langer@intel.com>, "kishon@ti.com" <kishon@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Kim, Cheol Yong" <cheol.yong.kim@intel.com>, "Wu, Qiming" <qi-ming.wu@intel.com>, "Liem, Peter Harliman" <peter.harliman.liem@intel.com>
List-Id: devicetree@vger.kernel.org

Hi Langer,

Thank you for the review comments.

On 28/8/2019 11:37 PM, Langer, Thomas wrote:
> Hi Vadivel,
>
>> +...
>> diff --git a/Documentation/devicetree/bindings/phy/intel,syscon.yaml
>> b/Documentation/devicetree/bindings/phy/intel,syscon.yaml
>> new file mode 100644
>> index 000000000000..d0b78805e49f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/intel,syscon.yaml
>> @@ -0,0 +1,33 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/intel,syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Syscon for eMMC/SDXC PHY Device Tree Bindings
> This says the binding is for eMMC/SDXC
Agreed, fix it.
>> +
>> +maintainers:
>> +  - Ramuthevar Vadivel Murugan
>> <vadivel.muruganx.ramuthevar@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,syscon
> but this is a generic syscon, behind which are many registers, not only for
> eMMC/SDXC. Also, the registers will be different for each SoC and needed for
> many different drivers, that is why in your example it is called "chiptop"
> -> toplevel registers not belonging to a specific HW module.
>
> Rob: Do you also think this "intel,syscon" is too generic?
>       And the binding should be outside the "phy" folder?
>
> What is the way to support different SoCs with this?
> Must the driver referencing this syscon be aware of these differences?

[Vadivel] : most of the IP drivers are using syscon, please suggest me 
to keep in the right place since

it is common to all(w.r.t Intel's Lightning Mountain).

Best Regards
Vadivel
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#reset-cells":
>> +   const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#reset-cells"
>> +
>> +examples:
>> +  - |
>> +    sysconf: chiptop@e0020000 {
>> +       compatible = "intel,syscon", "syscon";
>> +       reg = <0xe0020000 0x100>;
>> +       #reset-cells = <1>;
>> +    };
>> --
>> 2.11.0
> Best regards,
> Thomas
