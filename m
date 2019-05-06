From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: stratix10: Add SDMMC EDAC node
Date: Mon, 6 May 2019 10:17:54 -0500
Message-ID: <bfbc2ce8-675e-fba0-5d01-cc0c9e76895d@kernel.org>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
 <1556030197-24534-5-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556030197-24534-5-git-send-email-thor.thayer@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 4/23/19 9:36 AM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the Stratix10 SDMMC EDAC node.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> index 2e3863ee12b3..91fed85cf8e5 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
> @@ -67,6 +67,17 @@
>  				clock-frequency = <25000000>;
>  			};
>  		};
> +
> +		eccmgr {
> +			sdmmca-ecc@ff8c8c00 {
> +				compatible = "altr,socfpga-s10-sdmmc-ecc",
> +					     "altr,socfpga-sdmmc-ecc";
> +				reg = <0xff8c8c00 0x100>;
> +				altr,ecc-parent = <&mmc>;
> +				interrupts = <14 4>,
> +					     <15 4>;
> +			};
> +		};
>  	};
>  };
>  
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
