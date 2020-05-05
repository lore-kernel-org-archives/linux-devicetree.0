Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03027C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB769206E6
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbgEERSX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 13:18:23 -0400
Received: from foss.arm.com ([217.140.110.172]:46154 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729199AbgEERSX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 13:18:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DD2A31B;
        Tue,  5 May 2020 10:18:22 -0700 (PDT)
Received: from [10.57.39.240] (unknown [10.57.39.240])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6AE33F305;
        Tue,  5 May 2020 10:18:19 -0700 (PDT)
Subject: Re: [PATCH 04/16] arm64: dts: arm: Fix node address fields
To:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-5-andre.przywara@arm.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <347cdcba-a1cf-d308-1cc2-6c2194f40d19@arm.com>
Date:   Tue, 5 May 2020 18:18:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505165212.76466-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-05-05 5:52 pm, Andre Przywara wrote:
> The Arm Ltd. boards were using an outdated address convention in the DT
> node names, by separating the high from the low 32-bits of an address by
> a comma.

I thought that historically that was deliberate, since the actual thing 
being encoded is <chip select>,<address>, rather than just cosmetically 
splitting a 64-bit address value?

Or maybe I'm thinking too far back and things have already changed in 
the meantime :/

Robin.

> Remove the comma from the node name suffix to be DT spec compliant.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   arch/arm/boot/dts/vexpress-v2m-rs1.dtsi              | 10 +++++-----
>   arch/arm64/boot/dts/arm/foundation-v8.dtsi           |  4 ++--
>   arch/arm64/boot/dts/arm/juno-motherboard.dtsi        |  6 +++---
>   arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi |  2 +-
>   arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi     |  6 +++---
>   5 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> index 5c183483ec3b..8010cdcdb37a 100644
> --- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> +++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> @@ -31,7 +31,7 @@
>   			#interrupt-cells = <1>;
>   			ranges;
>   
> -			nor_flash: flash@0,00000000 {
> +			nor_flash: flash@0 {
>   				compatible = "arm,vexpress-flash", "cfi-flash";
>   				reg = <0 0x00000000 0x04000000>,
>   				      <4 0x00000000 0x04000000>;
> @@ -41,13 +41,13 @@
>   				};
>   			};
>   
> -			psram@1,00000000 {
> +			psram@100000000 {
>   				compatible = "arm,vexpress-psram", "mtd-ram";
>   				reg = <1 0x00000000 0x02000000>;
>   				bank-width = <4>;
>   			};
>   
> -			ethernet@2,02000000 {
> +			ethernet@202000000 {
>   				compatible = "smsc,lan9118", "smsc,lan9115";
>   				reg = <2 0x02000000 0x10000>;
>   				interrupts = <15>;
> @@ -59,14 +59,14 @@
>   				vddvario-supply = <&v2m_fixed_3v3>;
>   			};
>   
> -			usb@2,03000000 {
> +			usb@203000000 {
>   				compatible = "nxp,usb-isp1761";
>   				reg = <2 0x03000000 0x20000>;
>   				interrupts = <16>;
>   				port1-otg;
>   			};
>   
> -			iofpga@3,00000000 {
> +			iofpga@300000000 {
>   				compatible = "simple-bus";
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
> index 12f039fa3dad..e26b492795c5 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
> +++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
> @@ -151,7 +151,7 @@
>   				<0 0 41 &gic 0 0 GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
>   				<0 0 42 &gic 0 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>   
> -		ethernet@2,02000000 {
> +		ethernet@202000000 {
>   			compatible = "smsc,lan91c111";
>   			reg = <2 0x02000000 0x10000>;
>   			interrupts = <15>;
> @@ -178,7 +178,7 @@
>   			clock-output-names = "v2m:refclk32khz";
>   		};
>   
> -		iofpga@3,00000000 {
> +		iofpga@300000000 {
>   			compatible = "simple-bus";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> index e3983ded3c3c..d5cefddde08c 100644
> --- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> @@ -103,7 +103,7 @@
>   				};
>   			};
>   
> -			flash@0,00000000 {
> +			flash@0 {
>   				/* 2 * 32MiB NOR Flash memory mounted on CS0 */
>   				compatible = "arm,vexpress-flash", "cfi-flash";
>   				reg = <0 0x00000000 0x04000000>;
> @@ -120,7 +120,7 @@
>   				};
>   			};
>   
> -			ethernet@2,00000000 {
> +			ethernet@200000000 {
>   				compatible = "smsc,lan9118", "smsc,lan9115";
>   				reg = <2 0x00000000 0x10000>;
>   				interrupts = <3>;
> @@ -133,7 +133,7 @@
>   				vddvario-supply = <&mb_fixed_3v3>;
>   			};
>   
> -			iofpga@3,00000000 {
> +			iofpga@300000000 {
>   				compatible = "simple-bus";
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi
> index 60703b5763c6..350cbf17e8b4 100644
> --- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi
> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi
> @@ -9,7 +9,7 @@
>   		motherboard {
>   			arm,v2m-memory-map = "rs2";
>   
> -			iofpga@3,00000000 {
> +			iofpga@300000000 {
>   				virtio-p9@140000 {
>   					compatible = "virtio,mmio";
>   					reg = <0x140000 0x200>;
> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
> index e333c8d2d0e4..d1bfa62ca073 100644
> --- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
> @@ -17,14 +17,14 @@
>   			#interrupt-cells = <1>;
>   			ranges;
>   
> -			flash@0,00000000 {
> +			flash@0 {
>   				compatible = "arm,vexpress-flash", "cfi-flash";
>   				reg = <0 0x00000000 0x04000000>,
>   				      <4 0x00000000 0x04000000>;
>   				bank-width = <4>;
>   			};
>   
> -			ethernet@2,02000000 {
> +			ethernet@202000000 {
>   				compatible = "smsc,lan91c111";
>   				reg = <2 0x02000000 0x10000>;
>   				interrupts = <15>;
> @@ -51,7 +51,7 @@
>   				clock-output-names = "v2m:refclk32khz";
>   			};
>   
> -			iofpga@3,00000000 {
> +			iofpga@300000000 {
>   				compatible = "simple-bus";
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> 
