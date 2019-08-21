From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: PCI: intel: Add YAML schemas for the
 PCIe RC controller
Date: Wed, 21 Aug 2019 17:56:24 +0800
Message-ID: <cf47e8e8-9fbe-dfcb-60f3-76c48728328f@linux.intel.com>
References: <cover.1566208109.git.eswara.kota@linux.intel.com>
 <5e6ee1245ee53a7726103a8de7c11a37ad99fbd6.1566208109.git.eswara.kota@linux.intel.com>
 <CAL_Jsq+pvKHtw-ARRbNW-xReQ2MVNan8z3tfJbx4taGDCvEr5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+pvKHtw-ARRbNW-xReQ2MVNan8z3tfJbx4taGDCvEr5g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org


On 8/20/2019 9:42 PM, Rob Herring wrote:
> On Tue, Aug 20, 2019 at 4:40 AM Dilip Kota <eswara.kota@linux.intel.com> wrote:
>> The Intel PCIe RC controller is Synopsys Designware
>> based PCIe core. Add YAML schemas for PCIe in RC mode
>> present in Intel Universal Gateway soc.
> Run 'make dt_binding_check' and fix all the warnings.
Sure, will run and fix them. Sorry for missing it.
>
>> Signed-off-by: Dilip Kota <eswara.kota@linux.intel.com>
>> ---
>>   .../devicetree/bindings/pci/intel-pcie.yaml        | 133 +++++++++++++++++++++
>>   1 file changed, 133 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/intel-pcie.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/intel-pcie.yaml b/Documentation/devicetree/bindings/pci/intel-pcie.yaml
>> new file mode 100644
>> index 000000000000..80caaaba5e2c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/intel-pcie.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: GPL-2.0
> (GPL-2.0-only OR BSD-2-Clause) is preferred for new bindings.
Sure, will update it.
>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/intel-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel AXI bus based PCI express root complex
>> +
>> +maintainers:
>> +  - Dilip Kota <eswara.kota@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-pcie
>> +
>> +  device_type:
>> +    const: pci
>> +
>> +  "#address-cells":
>> +    const: 3
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  reg:
>> +    items:
>> +      - description: Controller control and status registers.
>> +      - description: PCIe configuration registers.
>> +      - description: Controller application registers.
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: config
>> +      - const: app
>> +
>> +  ranges:
>> +    description: Ranges for the PCI memory and I/O regions.
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: PCIe registers interface clock.
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    const: phy
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  num-lanes:
>> +    description: Number of lanes to use for this port.
>> +
>> +  linux,pci-domain:
>> +    description: PCI domain ID.
>> +
>> +  interrupts:
>> +    description: PCIe core integrated miscellaneous interrupt.
>> +
>> +  interrupt-map-mask:
>> +    description: Standard PCI IRQ mapping properties.
>> +
>> +  interrupt-map:
>> +    description: Standard PCI IRQ mapping properties.
>> +
>> +  max-link-speed:
>> +    description: Specify PCI Gen for link capability.
>> +
>> +  bus-range:
>> +    description: Range of bus numbers associated with this controller.
>> +
>> +  intel,rst-interval:
> Use 'reset-assert-us'

Sure.
I am thinking of 'reset-assert-ms' to remain in Milli seconds.
Please let me know your view.

>
>> +    description: |
>> +      Device reset interval in ms. Some devices need an interval upto 500ms.
>> +      By default it is 100ms.
>> +
>> +required:
>> +  - compatible
>> +  - device_type
>> +  - reg
>> +  - reg-names
>> +  - ranges
>> +  - resets
>> +  - clocks
>> +  - phys
>> +  - phy-names
>> +  - reset-gpios
>> +  - num-lanes
>> +  - linux,pci-domain
>> +  - interrupts
>> +  - interrupt-map
>> +  - interrupt-map-mask
>> +
>> +examples:
>> +  - |
>> +    pcie10:pcie@d0e00000 {
>> +      compatible = "intel,lgm-pcie";
>> +      device_type = "pci";
>> +      #address-cells = <3>;
>> +      #size-cells = <2>;
>> +      reg = <
>> +            0xd0e00000 0x1000
>> +            0xd2000000 0x800000
>> +            0xd0a41000 0x1000
>> +            >;
>> +      reg-names = "dbi", "config", "app";
>> +      linux,pci-domain = <0>;
>> +      max-link-speed = <4>;
>> +      bus-range = <0x00 0x08>;
>> +      interrupt-parent = <&ioapic1>;
>> +      interrupts = <67 1>;
>> +      interrupt-map-mask = <0 0 0 0x7>;
>> +      interrupt-map = <0 0 0 1 &ioapic1 27 1>,
>> +                      <0 0 0 2 &ioapic1 28 1>,
>> +                      <0 0 0 3 &ioapic1 29 1>,
>> +                      <0 0 0 4 &ioapic1 30 1>;
>> +      ranges = <0x02000000 0 0xd4000000 0xd4000000 0 0x04000000>;
>> +      resets = <&rcu0 0x50 0>;
>> +      clocks = <&cgu0 LGM_GCLK_PCIE10>;
>> +      phys = <&cb0phy0>;
>> +      phy-names = "phy";
>> +    };
>> +
>> +    &pcie10 {
> Don't show this soc/board split in examples. Just combine to one node.

Sure, will combine.

Thanks for the review comments.

Regards,
Dilip

>
>> +      status = "okay";
>> +      intel,rst-interval = <100>;
>> +      reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
>> +      num-lanes = <2>;
>> +    };
>> --
>> 2.11.0
>>
