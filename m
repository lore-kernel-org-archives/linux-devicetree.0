Return-Path: <dinguyen@kernel.org>
Subject: Re: [PATCHv2 4/4] arm64: dts: stratix10: Add OCRAM EDAC node
References: <1548179287-21760-1-git-send-email-thor.thayer@linux.intel.com>
 <1548179287-21760-5-git-send-email-thor.thayer@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <4763af33-0cae-bc82-8963-41554ee56ea5@kernel.org>
Date: Wed, 23 Jan 2019 10:56:55 -0600
MIME-Version: 1.0
In-Reply-To: <1548179287-21760-5-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: thor.thayer@linux.intel.com, bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, james.morse@arm.com
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 1/22/19 11:48 AM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add the OCRAM ECC node following the Arria10 format.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2  No changes
> ---
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 8253a1a9e985..a625dc472b91 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -494,6 +494,13 @@
>  				interrupts = <16 4>, <48 4>;
>  			};
>  
> +			ocram-ecc@ff8cc000 {
> +				compatible = "altr,socfpga-a10-ocram-ecc";

Are you absolutely sure there are no differences in the Stratix10 versus
A10? I wonder if it would be safer to have a platform specific binding
for Stratix10 rather than re-using A10. It would prevent from having to
change bindings later.

Dinh
