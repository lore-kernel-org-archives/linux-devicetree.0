Return-Path: <SRS0=cJdl=SO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37947 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbfDLMA5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Apr 2019 08:00:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id u24so7295074lfg.5
        for <devicetree@vger.kernel.org>; Fri, 12 Apr 2019 05:00:55 -0700 (PDT)
Date: Fri, 12 Apr 2019 14:00:53 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77980: Add "renesas,id" to
 VIN
Message-ID: <20190412120053.GB1980@bigcity.dyn.berto.se>
References: <20190412113832.30075-1-jacopo+renesas@jmondi.org>
 <20190412113832.30075-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190412113832.30075-3-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, horms@verge.net.au, sergei.shtylyov@cogentembedded.com, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

Thanks for your patch.

On 2019-04-12 13:38:32 +0200, Jacopo Mondi wrote:
> Add the "renesas,id" property to VIN nodes in the R-Car V3H R8A77980
> device tree.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas S�derlund <niklas.soderlund@ragnatech.se>

> ---
> 
> I do not have a V3H board to test on, but I suspect VIN failed to probe
> on V3H before these 2 patches.
> 
> If that's the case, these patches would merit
> Fixes: 3182aa4e0bf4 ("arm64: dts: renesas: r8a77980: add CSI2/VIN support")
> 
> Sergei, do you still have a V3H board around? Could I have your Tested-by
> tag if things are fine now?
> 
> Thanks
>   j
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index 4081622d548a..a901a341dcf7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -865,6 +865,7 @@
>  			clocks = <&cpg CPG_MOD 811>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 811>;
> +			renesas,id = <0>;
>  			status = "disabled";
> 
>  			ports {
> @@ -892,6 +893,7 @@
>  			clocks = <&cpg CPG_MOD 810>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			status = "disabled";
> +			renesas,id = <1>;
>  			resets = <&cpg 810>;
> 
>  			ports {
> @@ -919,6 +921,7 @@
>  			clocks = <&cpg CPG_MOD 809>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 809>;
> +			renesas,id = <2>;
>  			status = "disabled";
> 
>  			ports {
> @@ -946,6 +949,7 @@
>  			clocks = <&cpg CPG_MOD 808>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 808>;
> +			renesas,id = <3>;
>  			status = "disabled";
> 
>  			ports {
> @@ -973,6 +977,7 @@
>  			clocks = <&cpg CPG_MOD 807>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 807>;
> +			renesas,id = <4>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1000,6 +1005,7 @@
>  			clocks = <&cpg CPG_MOD 806>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 806>;
> +			renesas,id = <5>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1027,6 +1033,7 @@
>  			clocks = <&cpg CPG_MOD 805>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 805>;
> +			renesas,id = <6>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1054,6 +1061,7 @@
>  			clocks = <&cpg CPG_MOD 804>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 804>;
> +			renesas,id = <7>;
>  			status = "disabled";
> 
>  			ports {
> @@ -1081,6 +1089,7 @@
>  			clocks = <&cpg CPG_MOD 628>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 628>;
> +			renesas,id = <8>;
>  			status = "disabled";
>  		};
> 
> @@ -1091,6 +1100,7 @@
>  			clocks = <&cpg CPG_MOD 627>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 627>;
> +			renesas,id = <9>;
>  			status = "disabled";
>  		};
> 
> @@ -1101,6 +1111,7 @@
>  			clocks = <&cpg CPG_MOD 625>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 625>;
> +			renesas,id = <10>;
>  			status = "disabled";
>  		};
> 
> @@ -1111,6 +1122,7 @@
>  			clocks = <&cpg CPG_MOD 618>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 618>;
> +			renesas,id = <11>;
>  			status = "disabled";
>  		};
> 
> @@ -1121,6 +1133,7 @@
>  			clocks = <&cpg CPG_MOD 612>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 612>;
> +			renesas,id = <12>;
>  			status = "disabled";
>  		};
> 
> @@ -1131,6 +1144,7 @@
>  			clocks = <&cpg CPG_MOD 608>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 608>;
> +			renesas,id = <13>;
>  			status = "disabled";
>  		};
> 
> @@ -1141,6 +1155,7 @@
>  			clocks = <&cpg CPG_MOD 605>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 605>;
> +			renesas,id = <14>;
>  			status = "disabled";
>  		};
> 
> @@ -1151,6 +1166,7 @@
>  			clocks = <&cpg CPG_MOD 604>;
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 604>;
> +			renesas,id = <15>;
>  			status = "disabled";
>  		};
> 
> --
> 2.21.0
> 

-- 
Regards,
Niklas S�derlund
