Return-Path: <SRS0=bR7J=TU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:55079 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387513AbfETQIq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 May 2019 12:08:46 -0400
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 2/3] ARM: dts: arria10: Add stmmac ptp_ref clock
References: <20190515162058.32368-1-dalon.westergreen@linux.intel.com>
 <20190515162058.32368-2-dalon.westergreen@linux.intel.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <5de0520a-d29a-3994-5441-047060ad9aa9@linux.intel.com>
Date: Mon, 20 May 2019 11:10:55 -0500
MIME-Version: 1.0
In-Reply-To: <20190515162058.32368-2-dalon.westergreen@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dalon Westergreen <dalon.westergreen@linux.intel.com>, dinguyen@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 5/15/19 11:20 AM, Dalon Westergreen wrote:
> Add the default stmmac ptp_ref clock for arria10.  The stmmac
> driver defaults the ptp_ref clock to the main stmmac clock
> if the ptp_ref clock is not set in the devicetree.  This is inappropriate
> for the arria10 device.  The default ptp_ref clock is peri_emac_ptp_clk.
> 
> Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
> ---
>   arch/arm/boot/dts/socfpga_arria10.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index 0017bac7f96c..6591def7b225 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -426,8 +426,8 @@
>   			snps,perfect-filter-entries = <128>;
>   			tx-fifo-depth = <4096>;
>   			rx-fifo-depth = <16384>;
> -			clocks = <&l4_mp_clk>;
> -			clock-names = "stmmaceth";
> +			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
> +			clock-names = "stmmaceth", "ptp_ref";
>   			resets = <&rst EMAC0_RESET>;
>   			reset-names = "stmmaceth";
>   			snps,axi-config = <&socfpga_axi_setup>;
> @@ -446,8 +446,8 @@
>   			snps,perfect-filter-entries = <128>;
>   			tx-fifo-depth = <4096>;
>   			rx-fifo-depth = <16384>;
> -			clocks = <&l4_mp_clk>;
> -			clock-names = "stmmaceth";
> +			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
> +			clock-names = "stmmaceth", "ptp_ref";
>   			resets = <&rst EMAC1_RESET>;
>   			reset-names = "stmmaceth";
>   			snps,axi-config = <&socfpga_axi_setup>;
> @@ -466,8 +466,8 @@
>   			snps,perfect-filter-entries = <128>;
>   			tx-fifo-depth = <4096>;
>   			rx-fifo-depth = <16384>;
> -			clocks = <&l4_mp_clk>;
> -			clock-names = "stmmaceth";
> +			clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
> +			clock-names = "stmmaceth", "ptp_ref";
>   			snps,axi-config = <&socfpga_axi_setup>;
>   			status = "disabled";
>   		};
> 

Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
