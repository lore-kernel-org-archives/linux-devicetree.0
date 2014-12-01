From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/3] arm: dts: zynq: Add Digilent ZYBO board
Date: Mon, 1 Dec 2014 09:10:23 +0100
Message-ID: <060b3df0d8ac4b20862fd4282a52e7f7@BY2FFO11FD034.protection.gbl>
References: <1417393550-6674-1-git-send-email-crosthwaite.peter@gmail.com>
 <1417393550-6674-3-git-send-email-crosthwaite.peter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417393550-6674-3-git-send-email-crosthwaite.peter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Crosthwaite <crosthwaitepeter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, steven.wang-PRfGYHLb4FmqndwCJWfcng@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/01/2014 01:25 AM, Peter Crosthwaite wrote:
> Add a DTS describing the Digilent ZYBO board. Similar to ZED but with
> a 50MHz crystal instead of 33MHz.
> 
> Acked-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> ---
> Changed since v1:
> Change compat vendor prefix from xlnx to digilent (Soren review)
> Alphabetise nodes
> ---
>  arch/arm/boot/dts/Makefile      |  3 ++-
>  arch/arm/boot/dts/zynq-zybo.dts | 52 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/zynq-zybo.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7cd36a7..be2e8ce 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -513,7 +513,8 @@ dtb-$(CONFIG_ARCH_ZYNQ) += \
>  	zynq-parallella.dtb \
>  	zynq-zc702.dtb \
>  	zynq-zc706.dtb \
> -	zynq-zed.dtb
> +	zynq-zed.dtb \
> +	zynq-zybo.dtb
>  dtb-$(CONFIG_MACH_ARMADA_370) += \
>  	armada-370-db.dtb \
>  	armada-370-mirabox.dtb \
> diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
> new file mode 100644
> index 0000000..a9a12ce
> --- /dev/null
> +++ b/arch/arm/boot/dts/zynq-zybo.dts
> @@ -0,0 +1,52 @@
> +/*
> + *  Copyright (C) 2011 - 2014 Xilinx
> + *  Copyright (C) 2012 National Instruments Corp.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +/dts-v1/;
> +/include/ "zynq-7000.dtsi"
> +
> +/ {
> +	model = "Zynq ZYBO Development Board";
> +	compatible = "digilent,zynq-zybo", "xlnx,zynq-7000";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x0 0x20000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyPS0,115200 earlyprintk";
> +	};
> +
> +};
> +
> +&clkc {
> +	ps-clk-frequency = <50000000>;
> +};
> +
> +&gem0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy>;
> +
> +	ethernet_phy: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +};
> +
> +&sdhci0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> 

Applied all to zynq/dt branch.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
