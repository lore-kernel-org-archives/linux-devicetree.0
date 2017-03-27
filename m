From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: Add GPCv2 power gating driver
Date: Mon, 27 Mar 2017 11:42:51 -0700
Message-ID: <CAHQ1cqH4HnVsiAT6wxVJ=b-AJKWCK6L7kTxLZ7JFrZ4B-t2PQg@mail.gmail.com>
References: <20170321145004.21265-1-andrew.smirnov@gmail.com>
 <20170321145004.21265-2-andrew.smirnov@gmail.com>
 <20170324063216.GC12604@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170324063216.GC12604@b29396-OptiPlex-7040>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Andrey Yurovsky <yurovsky@gmail.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 11:32 PM, Dong Aisheng <dongas86@gmail.com> wrote:
> On Tue, Mar 21, 2017 at 07:50:03AM -0700, Andrey Smirnov wrote:
>> Add DT bindings for power domain driver for GPCv2 IP block found in
>> i.MX7 SoCs.
>>
>> Cc: yurovsky@gmail.com
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Fabio Estevam <fabio.estevam@nxp.com>
>> Cc: Dong Aisheng <dongas86@gmail.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  .../devicetree/bindings/power/fsl,imx-gpcv2.txt    | 71 ++++++++++++++++++++++
>>  include/dt-bindings/power/imx7-power.h             | 18 ++++++
>>  2 files changed, 89 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
>>  create mode 100644 include/dt-bindings/power/imx7-power.h
>>
>> diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
>> new file mode 100644
>> index 0000000..02f45c6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
>> @@ -0,0 +1,71 @@
>> +Freescale i.MX General Power Controller v2
>> +==========================================
>> +
>> +The i.MX7S/D General Power Control (GPC) block contains Power Gating
>> +Control (PGC) for various power domains.
>> +
>> +Required properties:
>> +
>> +- compatible: Should be "fsl,imx7d-gpc"
>> +
>> +- reg: should be register base and length as documented in the
>> +  datasheet
>> +
>> +- interrupts: Should contain GPC interrupt request 1
>> +
>> +Power domains contained within GPC node are generic power domain
>> +providers, documented in
>> +Documentation/devicetree/bindings/power/power_domain.txt, which are
>> +described as subnodes of the power gating controller 'pgc' node,
>> +which, in turn, is expected to contain the following:
>> +
>> +Required properties:
>> +
>> +- reg: Power domain index. Valid values are defined in
>> +  include/dt-bindings/power/imx7-power.h
>> +
>> +- #power-domain-cells: Should be 0
>> +
>> +Optional properties:
>> +
>> +- power-supply: Power supply used to power the domain
>> +
>> +Example:
>> +
>> +     gpc: gpc@303a0000 {
>> +             compatible = "fsl,imx7d-gpc";
>> +             reg = <0x303a0000 0x1000>;
>> +             interrupt-controller;
>> +             interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
>> +             #interrupt-cells = <3>;
>> +             interrupt-parent = <&intc>;
>> +
>> +             pgc {
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +
>> +                     pgc_pcie_phy: power-domain@3 {
>> +                             #power-domain-cells = <0>;
>> +
>> +                             reg = <IMX7_POWER_DOMAIN_PCIE_PHY>;
>> +                             power-supply = <&reg_1p0d>;
>> +                     };
>> +             };
>> +     };
>> +
>> +
>> +Specifying power domain for IP modules
>> +======================================
>> +
>> +IP cores belonging to a power domain should contain a 'power-domains'
>> +property that is a phandle for PGC node representing the domain.
>> +
>> +Example of a device that is part of the PCIE_PHY power domain:
>> +
>> +     pcie: pcie@33800000 {
>> +           reg = <0x33800000 0x4000>,
>> +                 <0x4ff00000 0x80000>;
>> +             /* ... */
>> +             power-domains = <&pgc_pcie_phy>;
>> +             /* ... */
>> +     };
>> diff --git a/include/dt-bindings/power/imx7-power.h b/include/dt-bindings/power/imx7-power.h
>> new file mode 100644
>> index 0000000..eb70023
>> --- /dev/null
>> +++ b/include/dt-bindings/power/imx7-power.h
>> @@ -0,0 +1,18 @@
>> +/*
>> + *  Copyright (C) 2017 Impinj
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_IMX7_POWER_H__
>> +#define __DT_BINDINGS_IMX7_POWER_H__
>> +
>> +#define IMX7_POWER_DOMAIN_USB_HSIC_PHY       0
>> +#define IMX7_POWER_DOMAIN_USB_OTG2_PHY       1
>> +#define IMX7_POWER_DOMAIN_USB_OTG1_PHY       2
>> +#define IMX7_POWER_DOMAIN_PCIE_PHY   3
>> +#define IMX7_POWER_DOMAIN_MIPI_PHY   4
>
> Nitpick: Probably better to define according to the reference manual
> defined order.
>
> 0x800 ~ 0x83F : PGC for A7 core0
> 0x840 ~ 0x87F: PGC for A7 core1
> 0x880 ~ 0x8BF: PGC for A7 SCU
> 0xA00 ~ 0xA3F: PGC for fastmix/megamix
> 0xC00 ~ 0xC3F: PGC for MIPI PHY
> 0xC40 ~ 0xC7F: PGC for PCIE_PHY
> 0xC80 ~ 0xCBF: Reserved
> 0xCC0 ~ 0xCFF: Reserved
> 0xD00 ~ 0xD3F: PGC for USB HSIC PHY
>
> You can drop A7 core/scu/fastmix/megamix as well.
>

Sure, will do.

Thanks,
Andrey Smirnov
