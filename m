From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCH] arm64: dts: stratix10: Correct System Manager register
 size
Date: Fri, 26 Oct 2018 15:15:32 -0500
Message-ID: <ecd3e018-758a-3fd6-3524-379f84b67030@linux.intel.com>
References: <1537889512-586-1-git-send-email-thor.thayer@linux.intel.com>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1537889512-586-1-git-send-email-thor.thayer@linux.intel.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Gentle ping...

On 9/25/18 10:31 AM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Correct the register size of the System Manager node.
> 
> Cc: stable@vger.kernel.org
> Fixes: 78cd6a9d8e154 ("arm64: dts: Add base stratix 10 dtsi")
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 67dac595dc72..3989876ab699 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -327,7 +327,7 @@
>   
>   		sysmgr: sysmgr@ffd12000 {
>   			compatible = "altr,sys-mgr", "syscon";
> -			reg = <0xffd12000 0x1000>;
> +			reg = <0xffd12000 0x228>;
>   		};
>   
>   		/* Local timer */
> 
