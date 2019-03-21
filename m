Return-Path: <SRS0=Xkv+=RY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42124 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbfCUQhl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Mar 2019 12:37:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id p1so5030456lfk.9
        for <devicetree@vger.kernel.org>; Thu, 21 Mar 2019 09:37:39 -0700 (PDT)
Date: Thu, 21 Mar 2019 17:37:38 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] ARM: dts: ape6evm: Add NOR FLASH
Message-ID: <20190321163737.GD25993@bigcity.dyn.berto.se>
References: <20190320194522.15053-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190320194522.15053-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

Thanks for your work, you are a life saver :-)

On 2019-03-20 20:45:22 +0100, Geert Uytterhoeven wrote:
> Describe the 128 MiB CFI NOR FLASH, which contains the boot loader and
> its environment.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a73a4-ape6evm.dts | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> index 5c691e79e2b6e5fc..fa01de098dbcc0ac 100644
> --- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> +++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
> @@ -173,6 +173,33 @@
>  };
>  
>  &bsc {
> +	flash@0 {
> +		compatible = "cfi-flash", "mtd-rom";
> +		reg = <0x0 0x08000000>;
> +		bank-width = <2>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "uboot";
> +				reg = <0x00000000 0x00040000>;
> +				read-only;
> +			};
> +			partition@40000 {
> +				label = "uboot-env";
> +				reg = <0x00040000 0x00040000>;
> +				read-only;
> +			};
> +			partition@80000 {
> +				label = "flash";
> +				reg = <0x00080000 0x07f80000>;
> +			};
> +		};
> +	};
> +
>  	ethernet@8000000 {
>  		compatible = "smsc,lan9220", "smsc,lan9115";
>  		reg = <0x08000000 0x1000>;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
