Return-Path: <SRS0=6Z5N=VJ=linux.intel.com=thor.thayer@kernel.org>
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH 1/3] Documentation: dt: edac: Add reg to S10 SDRAM node
References: <1562711090-900-1-git-send-email-thor.thayer@linux.intel.com>
 <1562711090-900-2-git-send-email-thor.thayer@linux.intel.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <803a63f8-c096-f1ec-7a80-c54d6c1f6281@linux.intel.com>
Date: Fri, 12 Jul 2019 10:27:37 -0500
MIME-Version: 1.0
In-Reply-To: <1562711090-900-2-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 7/9/19 5:24 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Include the register offset and size in the Stratix10 SDRAM node
> to be consistent with other ECC modules.
> Previously had to follow the phandle to get the register size/offset.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>   Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
> index 8f52206cfd2a..dd6ba6c020a7 100644
> --- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
> +++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
> @@ -256,6 +256,7 @@ Subcomponents:
>   SDRAM ECC
>   Required Properties:
>   - compatible : Should be "altr,sdram-edac-s10"
> +- reg        : Address and size for ECC block registers.
>   - interrupts : Should be single bit error interrupt.
>   
>   On-Chip RAM ECC
> @@ -313,8 +314,9 @@ Example:
>   		#interrupt-cells = <2>;
>   		ranges;
>   
> -		sdramedac {
> +		sdramedac@0xf8011100 {
>   			compatible = "altr,sdram-edac-s10";
> +			reg = <0xf8011100 0xc0>;
>   			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> 
Please disregard this patch, there is a simpler solution that I will 
submit shortly.
