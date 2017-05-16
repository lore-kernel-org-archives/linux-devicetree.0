From: Anup Patel <anup.patel@broadcom.com>
Subject: Re: [PATCH v2 04/11] arm64: dts: Initial DTS files for Broadcom
 Stingray SOC
Date: Tue, 16 May 2017 16:17:58 +0530
Message-ID: <CAALAos8W72yntS746Q2JE_6qwSBJV65acwapUR_3H7nf6skcFQ@mail.gmail.com>
References: <1494849741-21294-1-git-send-email-anup.patel@broadcom.com>
 <1494849741-21294-5-git-send-email-anup.patel@broadcom.com> <20170515131334.GE17776@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515131334.GE17776@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, Device Tree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 15, 2017 at 6:43 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> Hi,
>
> On Mon, May 15, 2017 at 05:32:14PM +0530, Anup Patel wrote:
>> +/ {
>> +     chosen { /* Default kernel args */
>> +             bootargs = "root=/dev/ram rw rootwait \
>> +                         earlycon=uart8250,mmio32,0x68a10000 \
>> +                         pci=pcie_bus_safe cma=64M";
>
> Why do we need all of these?

Yes, we don't need bootargs here. This were just for reference.

I will remove default bootargs because its responsibility of
bootloader to add it.

>
>> +             linux,stdout-path = "serial0:115200n8";
>
> Please drop the 'linux,' prefix here.

Sure, will do.

>
> [...]
>
>> +     memory: memory@80000000 {
>> +             device_type = "memory";
>> +             reg = <0x00000000 0x80000000 0 0x40000000>;
>> +     };
>> +
>> +     psci {
>> +             compatible = "arm,psci-0.2";
>> +             method = "smc";
>> +     };
>> +
>> +     pmu {
>> +             compatible = "arm,armv8-pmuv3";
>> +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +     };
>> +
>> +     timer {
>> +             compatible = "arm,armv8-timer";
>> +             interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) |
>> +                           IRQ_TYPE_LEVEL_LOW)>,
>> +                          <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) |
>> +                           IRQ_TYPE_LEVEL_LOW)>,
>> +                          <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) |
>> +                           IRQ_TYPE_LEVEL_LOW)>,
>> +                          <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) |
>> +                           IRQ_TYPE_LEVEL_LOW)>;
>
> GICv3 PPIs don't have a mask. See
>
> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>
> Please remove the GIC_CPU_MASK_*() uses here and in this dts. They
> shouldn't be there.

Thanks for catching.

We had taken care of this in PMU DT node but did not cleanup timer
DT node.

Thanks,
Anup
