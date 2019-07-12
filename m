Return-Path: <SRS0=Hfcl=VJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:22332 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726266AbfGLPZc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 12 Jul 2019 11:25:32 -0400
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 2/3] arm64: dts: Stratix10: Include regs in SDRAM ECC node
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
 <1562711090-900-3-git-send-email-thor.thayer@linux.intel.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <31193266-7b1c-6b25-bba7-33a76f3a79de@linux.intel.com>
Date: Fri, 12 Jul 2019 10:27:47 -0500
MIME-Version: 1.0
In-Reply-To: <1562711090-900-3-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 7/9/19 5:24 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Include the regs directly in the SDRAM node instead of using
> a syscon. The Stratix10 SDRAM ECC registers are partitioned
> away from other Sys Manager registers so the syscon is no
> longer needed for Stratix10.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 4b0f674df849..a1e9545de3d3 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -517,11 +517,6 @@
>   			status = "disabled";
>   		};
>   
> -		sdr: sdr@f8011100 {
> -			compatible = "altr,sdr-ctl", "syscon";
> -			reg = <0xf8011100 0xc0>;
> -		};
> -
>   		eccmgr {
>   			compatible = "altr,socfpga-s10-ecc-manager",
>   				     "altr,socfpga-a10-ecc-manager";
> @@ -533,9 +528,9 @@
>   			#interrupt-cells = <2>;
>   			ranges;
>   
> -			sdramedac {
> +			sdramedac@0xf8011100 {
>   				compatible = "altr,sdram-edac-s10";
> -				altr,sdr-syscon = <&sdr>;
> +				reg = <0xf8011100 0xc0>;
>   				interrupts = <16 4>;
>   			};
>   
> 
Please disregard this patch, there is a simpler solution that I will 
submit shortly.
