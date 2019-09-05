From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: intel: Add YAML schemas for the
 PCIe RC controller
Date: Thu, 5 Sep 2019 22:31:29 +0200
Message-ID: <CAFBinCC5SH5OSUqOkLQhE2o7g5OhSuB_PBjsv93U2P=FNS5oPw@mail.gmail.com>
References: <cover.1567585181.git.eswara.kota@linux.intel.com> <fe9549470bc06ea0d0dfc80f46a579baa49b911a.1567585181.git.eswara.kota@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe9549470bc06ea0d0dfc80f46a579baa49b911a.1567585181.git.eswara.kota@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dilip Kota <eswara.kota@linux.intel.com>
Cc: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

Hi Dilip,

On Wed, Sep 4, 2019 at 12:11 PM Dilip Kota <eswara.kota@linux.intel.com> wrote:
[...]
> +properties:
> +  compatible:
> +    const: intel,lgm-pcie
should we add the "snps,dw-pcie" here (and in the example below) as well?
(this is what for example
Documentation/devicetree/bindings/pci/amlogic,meson-pcie.txt does)

[...]
> +  phy-names:
> +    const: pciephy
the most popular choice in Documentation/devicetree/bindings/pci/ is "pcie-phy"
if Rob is happy with "pciephy" (which is already part of two other
bindings) then I'm happy with "pciephy" as well

> +  num-lanes:
> +    description: Number of lanes to use for this port.
are there SoCs with more than 2 lanes?
you can list the allowed values in an enum so "num-lanes = <16>"
causes an error when someone accidentally has this in their .dts (and
runs the dt-bindings validation)

[...]
> +  reset-assert-ms:
maybe add:
  $ref: /schemas/types.yaml#/definitions/uint32

> +    description: |
> +      Device reset interval in ms.
> +      Some devices need an interval upto 500ms. By default it is 100ms.
> +
> +required:
> +  - compatible
> +  - device_type
> +  - reg
> +  - reg-names
> +  - ranges
> +  - resets
> +  - clocks
> +  - phys
> +  - phy-names
> +  - reset-gpios
> +  - num-lanes
> +  - linux,pci-domain
> +  - interrupts
> +  - interrupt-map
> +  - interrupt-map-mask
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie10:pcie@d0e00000 {
> +      compatible = "intel,lgm-pcie";
> +      device_type = "pci";
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +      reg = <
> +            0xd0e00000 0x1000
> +            0xd2000000 0x800000
> +            0xd0a41000 0x1000
> +            >;
> +      reg-names = "dbi", "config", "app";
> +      linux,pci-domain = <0>;
> +      max-link-speed = <4>;
> +      bus-range = <0x00 0x08>;
> +      interrupt-parent = <&ioapic1>;
> +      interrupts = <67 1>;
> +      #interrupt-cells = <1>;
> +      interrupt-map-mask = <0 0 0 0x7>;
> +      interrupt-map = <0 0 0 1 &ioapic1 27 1>,
> +                      <0 0 0 2 &ioapic1 28 1>,
> +                      <0 0 0 3 &ioapic1 29 1>,
> +                      <0 0 0 4 &ioapic1 30 1>;
is the "1" in the interrupts and interrupt-map properties IRQ_TYPE_EDGE_RISING?
you can use these macros in this example as well, see
Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml for
example


Martin
