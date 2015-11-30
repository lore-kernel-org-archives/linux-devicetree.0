From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] clk: hi3519: add CRG driver for hisilicon hi3519 soc
Date: Mon, 30 Nov 2015 14:35:21 -0600
Message-ID: <20151130203521.GA16224@rob-hp-laptop>
References: <1448694806-31226-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448694806-31226-1-git-send-email-xuejiancheng@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@linaro.org, sboyd@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxarm@huawei.com, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Sat, Nov 28, 2015 at 03:13:26PM +0800, Jiancheng Xue wrote:
> The CRG(Clock and Reset Generator) module provides
> clock and reset signals for other modules in hi3519 soc.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
>  .../devicetree/bindings/clock/hi3519-clock.txt     |  46 +++++++
>  drivers/clk/hisilicon/Makefile                     |   1 +
>  drivers/clk/hisilicon/clk-hi3519.c                 | 130 ++++++++++++++++++
>  drivers/clk/hisilicon/reset.c                      | 149 +++++++++++++++++++++
>  drivers/clk/hisilicon/reset.h                      |  25 ++++
>  include/dt-bindings/clock/hi3519-clock.h           |  78 +++++++++++

It is preferred to put binding doc and header in separate patch.

>  6 files changed, 429 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/hi3519-clock.txt
>  create mode 100644 drivers/clk/hisilicon/clk-hi3519.c
>  create mode 100644 drivers/clk/hisilicon/reset.c
>  create mode 100644 drivers/clk/hisilicon/reset.h
>  create mode 100644 include/dt-bindings/clock/hi3519-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/hi3519-clock.txt b/Documentation/devicetree/bindings/clock/hi3519-clock.txt
> new file mode 100644
> index 0000000..9fea878
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/hi3519-clock.txt
> @@ -0,0 +1,46 @@
> +* Hisilicon Hi3519 Clock and Reset Generator(CRG)
> +
> +The Hi3519 CRG module provides clock and reset signals to various
> +controllers within the SoC.
> +
> +This binding uses the following bindings:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +    Documentation/devicetree/bindings/reset/reset.txt
> +
> +Required Properties:
> +
> +- compatible: should be one of the following.
> +  - "hisilicon,hi3519-clock" - controller compatible with Hi3519 SoC.

Use -crg rather than -clock if that is the block name.

> +
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +
> +- #clock-cells: should be 1.
> +
> +Each clock is assigned an identifier and client nodes use this identifier
> +to specify the clock which they consume.
> +
> +All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
> +
> +- #reset-cells: should be 2.
> +
> +A reset signal can be controlled by writing a bit register in the CRG module.
> +The reset specifier consists of two cells. The first cell represents the
> +register offset relative to the base address. The second cell represents the
> +bit index in the register.
> +
> +Example: CRG nodes
> +CRG: clock-reset-controller {
> +	compatible = "hisilicon,hi3519-clock";
> +        reg = <0x12010000 0x10000>;
> +        #clock-cells = <1>;
> +        #reset-cells = <2>;
> +};
> +
> +Example: consumer nodes
> +i2c0: i2c@0x12110000 {
> +	compatible = "hisilicon,hi3519-i2c";
> +        reg = <0x12110000 0x1000>;
> +        clocks = <&CRG HI3519_I2C0_RST>;*/
> +        resets = <&CRG 0xE4 0>;
> +};


> diff --git a/drivers/clk/hisilicon/reset.h b/drivers/clk/hisilicon/reset.h
> new file mode 100644
> index 0000000..74bea4e
> --- /dev/null
> +++ b/drivers/clk/hisilicon/reset.h
> @@ -0,0 +1,25 @@
> +/*
> + * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef	__HISI_RESET_H
> +#define	__HISI_RESET_H
> +
> +#include <linux/of.h>
> +
> +int __init hisi_reset_init(struct device_node *np, int nr_rsts);
> +
> +#endif	/* __HISI_RESET_H */
> diff --git a/include/dt-bindings/clock/hi3519-clock.h b/include/dt-bindings/clock/hi3519-clock.h
> new file mode 100644
> index 0000000..2e08666
> --- /dev/null
> +++ b/include/dt-bindings/clock/hi3519-clock.h
> @@ -0,0 +1,78 @@
> +/*
> + * Copyright (c) 2015 HiSilicon Technologies Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __DTS_HI3519_CLOCK_H
> +#define __DTS_HI3519_CLOCK_H
> +
> +/* fixed rate */
> +#define HI3519_FIXED_2376M		1
> +#define HI3519_FIXED_1188M		2
> +#define HI3519_FIXED_594M		3
> +#define HI3519_FIXED_297M		4
> +#define HI3519_FIXED_148P5M		5
> +#define HI3519_FIXED_74P25M		6
> +#define HI3519_FIXED_792M		7
> +#define HI3519_FIXED_475M		8
> +#define HI3519_FIXED_340M		9
> +#define HI3519_FIXED_72M		10
> +#define HI3519_FIXED_400M		11
> +#define HI3519_FIXED_200M		12
> +#define HI3519_FIXED_54M		13
> +#define HI3519_FIXED_27M		14
> +#define HI3519_FIXED_37P125M		15
> +#define HI3519_FIXED_3000M		16
> +#define HI3519_FIXED_1500M		17
> +#define HI3519_FIXED_500M		18
> +#define HI3519_FIXED_250M		19
> +#define HI3519_FIXED_125M		20
> +#define HI3519_FIXED_1000M		21
> +#define HI3519_FIXED_600M		22
> +#define HI3519_FIXED_750M		23
> +#define HI3519_FIXED_150M		24
> +#define HI3519_FIXED_75M		25
> +#define HI3519_FIXED_300M		26
> +#define HI3519_FIXED_60M		27
> +#define HI3519_FIXED_214M		28
> +#define HI3519_FIXED_107M		29
> +#define HI3519_FIXED_100M		30
> +#define HI3519_FIXED_50M		31
> +#define HI3519_FIXED_25M		32
> +#define HI3519_FIXED_24M		33
> +#define HI3519_FIXED_3M			34

All these are really fixed frequency, not just fixed until the s/w 
support is written? 

You only need to include clocks which are externally accessible from the 
CRG.
