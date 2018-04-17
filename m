Return-Path: <SRS0=pf7g=HG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51410 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751907AbeDQJ3f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Apr 2018 05:29:35 -0400
Date: Tue, 17 Apr 2018 10:29:24 +0100
From: Russell King <rmk@armlinux.org.uk>
Subject: Re: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
Message-ID: <20180417092924.GB20335@flint.armlinux.org.uk>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-13-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523956215-28154-13-git-send-email-t-kristo@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com, wmills@ti.com, tony@atomide.com, trini@konsulko.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 12:10:14PM +0300, Tero Kristo wrote:
> Add FIT image description file for dra71-evm, and the available
> configurations for it.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  arch/arm/boot/dts/ti/dra71-evm.its | 62 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 arch/arm/boot/dts/ti/dra71-evm.its
> 
> diff --git a/arch/arm/boot/dts/ti/dra71-evm.its b/arch/arm/boot/dts/ti/dra71-evm.its
> new file mode 100644
> index 0000000..8dc53cb
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/dra71-evm.its
> @@ -0,0 +1,62 @@
> +/dts-v1/;
> +
> +/ {
> +	description = "DRA71x-evm";
> +	#address-cells = <1>;
> +
> +	images {
> +		kernel@1 {
> +			description = "Linux kernel";
> +			data = /incbin/("../../zImage");
> +			type = "kernel";
> +			arch = "arm";
> +			os = "linux";
> +			compression = "none";
> +			load = <0x82000000>;
> +			entry = <0x82000000>;
> +		};
> +		fdt@1 {
> +			description = "DRA71x-evm";
> +			data = /incbin/("dra71-evm.dtb");
> +			type = "flat_dt";
> +			arch = "arm";
> +			compression = "none";
> +			load = <0x83000000>;
> +		};
> +		fdt@2 {
> +			description = "DRA71x-evm LCD";
> +			data = /incbin/("dra71-evm-lcd-auo-g101evn01.0.dtbo");
> +			type = "flat_dt";
> +			arch = "arm";
> +			compression = "none";
> +			load = <0x83100000>;
> +		};
> +		fdt@3 {
> +			description = "DRA71x-evm NAND";
> +			data = /incbin/("dra71-evm-nand.dtbo");
> +			type = "flat_dt";
> +			arch = "arm";
> +			compression = "none";
> +			load = <0x83200000>;
> +		};
> +	};
> +
> +	configurations {
> +		default = "dra71-evm";
> +		dra71-evm {
> +			description = "DRA71x-evm";
> +			kernel = "kernel@1";
> +			fdt = "fdt@1";
> +		};
> +		dra71-evm-lcd-auo-g101evn01.0 {
> +			description = "DRA71x-evm with LCD overlay";
> +			kernel = "kernel@1";
> +			fdt = "fdt@1", "fdt@2";
> +		};
> +		dra71-evm-nand {
> +			description = "DRA71x-evm with NAND overlay";
> +			kernel = "kernel@1";
> +			fdt = "fdt@1", "fdt@3";
> +		};

This strikes me as really horrid and inflexible.

Consider a platform where you have multiple choices, each one
independent - for example, you may have the selection of two base
DT files depending on the SoC.  Then you may have four board-level
DT overlays to choose from.  Then you may have a selection of
overlays depending on what hardware is connected (eg, whether a
camera is connected and what type of camera, whether a LVDS panel
is connected and what it is, etc.)

Before considering the optional hardware, you already have 8
different combinations, and that multiplies up each time there
is another variable to consider.

Exhaustively listing each combination of kernel, base dtb and
overlays is not practical in such a scenario, and if this is what
FIT requires, FIT is not fit for purpose.

-- 
Russell King
