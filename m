From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v5 04/11] arm64: dts: Initial DTS files for Broadcom
 Stingray SOC
Date: Thu, 1 Jun 2017 22:37:47 -0700
Message-ID: <abeca9ac-487c-b6dc-1397-4134b0442909@gmail.com>
References: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
 <1495790704-2438-5-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1495790704-2438-5-git-send-email-anup.patel@broadcom.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 05/26/2017 02:24 AM, Anup Patel wrote:
> The Broadcom Stingray SoC is a new member in Broadcom iProc
> SoC family.
> 
> This patch adds initial DTS files for Broadcom Stingray SoC
> and two of its reference boards (bcm958742k and bcm958742t).
> 
> We have lot of reference boards and large number of devices
> in Broadcom Stingray SoC so eventually we will have quite
> a few DTS files for Stingray. To tackle, we have added a
> separate directory for Stingray DTS files.

So I was going to apply this, but...


> +	scr {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x61000000 0x05000000>;

So you corrected the ranges property here...

> +
> +		gic: interrupt-controller@63c00000 {

but you kept the original unit address here, which does not match the
reg property, could you fix that through your entire submission?

> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			interrupt-controller;
> +			reg = <0x02c00000 0x010000>, /* GICD */
> +			      <0x02e00000 0x600000>; /* GICR */

> +	hsls {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x68900000 0x17700000>;

Same here.

> +
> +		uart0: uart@68a00000 {
> +			device_type = "serial";
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x00100000 0x1000>;

and here and all other sub nodes
-- 
Florian
