From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: intel: Add YAML schemas for the
 PCIe RC controller
Date: Fri, 6 Sep 2019 19:17:11 +0200
Message-ID: <CAFBinCABoe89Z9CiG=3Bz6+JoRCYcpxWJ6jzEqMo16SCCoXPmQ@mail.gmail.com>
References: <cover.1567585181.git.eswara.kota@linux.intel.com>
 <fe9549470bc06ea0d0dfc80f46a579baa49b911a.1567585181.git.eswara.kota@linux.intel.com>
 <CAFBinCC5SH5OSUqOkLQhE2o7g5OhSuB_PBjsv93U2P=FNS5oPw@mail.gmail.com> <ce4e04ee-9a8f-fbe1-0133-4a18c92dc136@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ce4e04ee-9a8f-fbe1-0133-4a18c92dc136@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chuan Hua, Lei" <chuanhua.lei@linux.intel.com>
Cc: Dilip Kota <eswara.kota@linux.intel.com>, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 6, 2019 at 5:22 AM Chuan Hua, Lei
<chuanhua.lei@linux.intel.com> wrote:
[...]
> >> +examples:
> >> +  - |
> >> +    pcie10:pcie@d0e00000 {
> >> +      compatible = "intel,lgm-pcie";
> >> +      device_type = "pci";
> >> +      #address-cells = <3>;
> >> +      #size-cells = <2>;
> >> +      reg = <
> >> +            0xd0e00000 0x1000
> >> +            0xd2000000 0x800000
> >> +            0xd0a41000 0x1000
> >> +            >;
> >> +      reg-names = "dbi", "config", "app";
> >> +      linux,pci-domain = <0>;
> >> +      max-link-speed = <4>;
> >> +      bus-range = <0x00 0x08>;
> >> +      interrupt-parent = <&ioapic1>;
> >> +      interrupts = <67 1>;
> >> +      #interrupt-cells = <1>;
> >> +      interrupt-map-mask = <0 0 0 0x7>;
> >> +      interrupt-map = <0 0 0 1 &ioapic1 27 1>,
> >> +                      <0 0 0 2 &ioapic1 28 1>,
> >> +                      <0 0 0 3 &ioapic1 29 1>,
> >> +                      <0 0 0 4 &ioapic1 30 1>;
> > is the "1" in the interrupts and interrupt-map properties IRQ_TYPE_EDGE_RISING?
> > you can use these macros in this example as well, see
> > Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml for
> > example
>
> No. 1 here means index from arch/x86/devicetree.c
>
> static struct of_ioapic_type of_ioapic_type[] =
> {
>      {
>          .out_type    = IRQ_TYPE_EDGE_RISING,
>          .trigger    = IOAPIC_EDGE,
>          .polarity    = 1,
>      },
>      {
>          .out_type    = IRQ_TYPE_LEVEL_LOW,
>          .trigger    = IOAPIC_LEVEL,
>          .polarity    = 0,
>      },
>      {
>          .out_type    = IRQ_TYPE_LEVEL_HIGH,
>          .trigger    = IOAPIC_LEVEL,
>          .polarity    = 1,
>      },
>      {
>          .out_type    = IRQ_TYPE_EDGE_FALLING,
>          .trigger    = IOAPIC_EDGE,
>          .polarity    = 0,
>      },
> };
>
> static int dt_irqdomain_alloc(struct irq_domain *domain, unsigned int virq,
>                    unsigned int nr_irqs, void *arg)
> {
>      struct irq_fwspec *fwspec = (struct irq_fwspec *)arg;
>      struct of_ioapic_type *it;
>      struct irq_alloc_info tmp;
>      int type_index;
>
>      if (WARN_ON(fwspec->param_count < 2))
>          return -EINVAL;
>
>      type_index = fwspec->param[1]; // index.
>      if (type_index >= ARRAY_SIZE(of_ioapic_type))
>          return -EINVAL;
>
> I would not see this definition is user-friendly. But it is how x86
> handles at the moment.
thank you for explaining this - I had no idea x86 is different from
all other platforms I know
the only upstream x86 .dts I could find
(arch/x86/platform/ce4100/falconfalls.dts) also uses the magic x86
numbers
so I'm fine with this until someone else knows a better solution


Martin
