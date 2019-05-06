From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: stratix10: Add OCRAM EDAC node
Date: Mon, 6 May 2019 10:17:15 -0500
Message-ID: <f14ad8aa-04b6-0c30-6a54-97042881d138@kernel.org>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
 <1556030197-24534-3-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556030197-24534-3-git-send-email-thor.thayer@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 4/23/19 9:36 AM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the OCRAM ECC node with Stratix10 compatible string.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 41109995563c..c28310ff70a0 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -547,6 +547,14 @@
>  				interrupts = <16 4>;
>  			};
>  
> +			ocram-ecc@ff8cc000 {
> +				compatible = "altr,socfpga-s10-ocram-ecc",
> +					     "altr,socfpga-a10-ocram-ecc";
> +				reg = <0xff8cc000 0x100>;
> +				altr,ecc-parent = <&ocram>;
> +				interrupts = <1 4>;
> +			};
> +
>  			usb0-ecc@ff8c4000 {
>  				compatible = "altr,socfpga-s10-usb-ecc",
>  					     "altr,socfpga-usb-ecc";
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>
