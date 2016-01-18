From: Hou Zhiqiang <B48286@freescale.com>
Subject: Re: [PATCH v2 2/2] ARM64: dts: add LS1043a-QDS board support
Date: Mon, 18 Jan 2016 03:46:05 +0000
Message-ID: <CY1PR0301MB0780B2B2A47B36BEFE92A5688BC00@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1450948298-33238-1-git-send-email-Zhiqiang.Hou@freescale.com>,
 <1450948298-33238-2-git-send-email-Zhiqiang.Hou@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1450948298-33238-2-git-send-email-Zhiqiang.Hou@freescale.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Scott Wood <scottwood@freescale.com>, Hu Vincent <Mingkai.Hu@freescale.com>, Shaohui Xie <Shaohui.Xie@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi,

Any comments?

> From: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
> Sent: Thursday, December 24, 2015 5:11 PM
> To: devicetree@vger.kernel.org; robh+dt@kernel.org; mark.rutland@arm.com; pawel.moll@arm.com; ijc+devicetree@hellion.org.uk; galak@codeaurora.org; linux-arm-kernel@lists.infradead.org; catalin.marinas@arm.com; will.deacon@arm.com
> Cc: Wood Scott-B07421; Hu Mingkai-B21284; Xie Shaohui-B21989; Hou Zhiqiang
> Subject: [PATCH v2 2/2] ARM64: dts: add LS1043a-QDS board support
> 
> From: Shaohui Xie <Shaohui.Xie@freescale.com>
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie@freescale.com>
> Signed-off-by: Mingkai Hu <Mingkai.Hu@freescale.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
> --- 
> v2: 
>  - add root node compatible property
> 
>  arch/arm64/boot/dts/freescale/Makefile            |   1 + 
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 168 ++++++++++++++++++++++
>  2 files changed, 169 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f3c2516..1423fa4 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-rdb.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-qds.dtb
> 
>  always         := $(dtb-y)
>  subdir-y       := $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> new file mode 100644
> index 0000000..d7aae69
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> @@ -0,0 +1,168 @@
> +/* 
> + * Device Tree Include file for Freescale Layerscape-1043A family SoC.
> + * 
> + * Copyright 2014-2015, Freescale Semiconductor
> + * 
> + * Mingkai Hu <Mingkai.hu@freescale.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPLv2 or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This library is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This library is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +/include/ "fsl-ls1043a.dtsi"
> +
> +/ {
> +       model = "LS1043A QDS Board";
> +       compatible = "fsl,ls1043a-qds", "fsl,ls1043a";
> +
> +       aliases {
> +               serial0 = &lpuart0;
> +               serial1 = &lpuart1;
> +               serial2 = &lpuart2;
> +               serial3 = &lpuart3;
> +               serial4 = &lpuart4;
> +               serial5 = &lpuart5;
> +
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +       };
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +       pca9547@77 {
> +               compatible = "philips,pca9547";
> +               reg = <0x77>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0>;
> +
> +                       rtc@68 {
> +                               compatible = "dallas,ds3232";
> +                               reg = <0x68>;
> +                               /* IRQ10_B */
> +                               interrupts = <0 150 0x4>;
> +                       };
> +               };
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x2>;
> +
> +                       ina220@40 {
> +                               compatible = "ti,ina220";
> +                               reg = <0x40>;
> +                               shunt-resistor = <1000>;
> +                       };
> +
> +                       ina220@41 {
> +                               compatible = "ti,ina220";
> +                               reg = <0x41>;
> +                               shunt-resistor = <1000>;
> +                       };
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x3>;
> +
> +                       eeprom@56 {
> +                               compatible = "at24,24c512";
> +                               reg = <0x56>;
> +                       };
> +
> +                       eeprom@57 {
> +                               compatible = "at24,24c512";
> +                               reg = <0x57>;
> +                       };
> +
> +                       adt7461a@4c {
> +                               compatible = "adt7461a";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +       };
> +};
> +
> +&ifc {
> +       status = "okay";
> +       #address-cells = <2>;
> +       #size-cells = <1>;
> +       /* NOR, NAND Flashes and FPGA on board */
> +       ranges = <0x0 0x0 0x0 0x60000000 0x08000000
> +                 0x1 0x0 0x0 0x7e800000 0x00010000
> +                 0x2 0x0 0x0 0x7fb00000 0x00000100>;
> +
> +       nor@0,0 {
> +               compatible = "cfi-flash";
> +               reg = <0x0 0x0 0x8000000>;
> +               bank-width = <2>;
> +               device-width = <1>;
> +       };
> +
> +       nand@1,0 {
> +               compatible = "fsl,ifc-nand";
> +               reg = <0x1 0x0 0x10000>;
> +       };
> +
> +       fpga: board-control@2,0 {
> +               compatible = "fsl,ls1043aqds-fpga", "fsl,fpga-qixis";
> +               reg = <0x2 0x0 0x0000100>;
> +       };
> +};
> +
> +&lpuart0 {
> +       status = "okay";
> +};
> +
> +&duart0 {
> +       status = "okay";
> +};
> +
> +&duart1 {
> +       status = "okay";
> +};
> --
> 2.1.0.27.g96db324

Thanks,
Zhiqiang
