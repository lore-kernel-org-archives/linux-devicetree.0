Return-Path: <SRS0=tMPn=GD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-co1nam03on0087.outbound.protection.outlook.com ([104.47.40.87]:22784
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750860AbeCMMro (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 13 Mar 2018 08:47:44 -0400
Subject: Re: [PATCHv2] arm: dts: zynq: Add support for Z-turn board
References: <d61e039f-36c9-5da9-1471-d1bf83e0e578@xilinx.com>
 <20180312200508.14084-1-tossel@gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <0862624f-9eb6-5529-a37d-4dbd4a55b444@xilinx.com>
Date: Tue, 13 Mar 2018 13:47:29 +0100
MIME-Version: 1.0
In-Reply-To: <20180312200508.14084-1-tossel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: tossel@gmail.com, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, michal.simek@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On 12.3.2018 21:05, tossel@gmail.com wrote:
> From: Anton Gerasimov <tossel@gmail.com>
> 
> Add a DTS for MYIR Z-turn board and the respective target in the
> Makefile.
> 
> Signed-off-by: Anton Gerasimov <tossel@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile       |   1 +
>  arch/arm/boot/dts/zynq-zturn.dts | 115 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 arch/arm/boot/dts/zynq-zturn.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ade7a38543dc..4daa7d5d4db4 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1067,6 +1067,7 @@ dtb-$(CONFIG_ARCH_ZYNQ) += \
>  	zynq-zc702.dtb \
>  	zynq-zc706.dtb \
>  	zynq-zed.dtb \
> +	zynq-zturn.dtb \
>  	zynq-zybo.dtb
>  dtb-$(CONFIG_MACH_ARMADA_370) += \
>  	armada-370-db.dtb \
> diff --git a/arch/arm/boot/dts/zynq-zturn.dts b/arch/arm/boot/dts/zynq-zturn.dts
> new file mode 100644
> index 000000000000..713d91fc3917
> --- /dev/null
> +++ b/arch/arm/boot/dts/zynq-zturn.dts
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright (C) 2015 Andrea Merello <adnrea.merello@gmail.com>
> + *
> + *  Based on zynq-zed.dts which is:
> + *  Copyright (C) 2011 - 2014 Xilinx
> + *  Copyright (C) 2012 National Instruments Corp.
> + *
> + */
> +
> +/dts-v1/;
> +/include/ "zynq-7000.dtsi"
> +
> +/ {
> +	model = "Zynq Z-Turn MYIR Board";
> +	compatible = "myir,zynq-zturn", "xlnx,zynq-7000";
> +
> +	aliases {
> +		ethernet0 = &gem0;
> +		serial0 = &uart1;
> +		serial1 = &uart0;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait";
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		usr-led1 {
> +			label = "usr-led1";
> +			gpios = <&gpio0 0x0 0x1>;
> +			default-state = "off";
> +		};
> +
> +		usr-led2 {
> +			label = "usr-led2";
> +			gpios = <&gpio0 0x9 0x1>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		autorepeat;
> +		K1 {
> +			label = "K1";
> +			gpios = <&gpio0 0x32 0x1>;
> +			linux,code = <0x66>;
> +			gpio-key,wakeup;
> +			autorepeat;
> +		};
> +	};
> +};
> +
> +&clkc {
> +	ps-clk-frequency = <33333333>;
> +};
> +
> +&gem0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy>;
> +
> +	ethernet_phy: ethernet-phy@0 {
> +		reg = <0x0>;
> +	};
> +};
> +
> +&sdhci0 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	status = "okay";
> +	dr_mode = "host";
> +};
> +
> +&can0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	stlm75@49 {
> +		status = "okay";
> +		compatible = "lm75";
> +		reg = <0x49>;
> +	};
> +
> +	accelerometer@53 {
> +		compatible = "adi,adxl345", "adxl345";
> +		reg = <0x53>;
> +		interrupt-parent = <&intc>;
> +		interrupts = <0x0 0x1e 0x4>;
> +	};
> +};
> +
> 

Nit: Here is empty line at the end of file which I have removed.

I can't see any issue with this dts file.
Rob: I have added it to my zynq/dts branch. If you see any issue please
let us know.

https://github.com/Xilinx/linux-xlnx/tree/zynq/dt

Anton: Will be also good to update u-boot dts file with this one.

Thanks,
Michal
