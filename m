From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv2 11/11] ARM: dts: Add Altera Arria10 L2 Cache EDAC
 devicetree entry
Date: Tue, 8 Mar 2016 08:50:22 -0600
Message-ID: <56DEE6AE.100@opensource.altera.com>
References: <1457379787-8327-1-git-send-email-tthayer@opensource.altera.com>
 <1457379787-8327-12-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1457379787-8327-12-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org



On 03/07/2016 01:43 PM, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree entries needed to support the Altera L2
> cache EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2 Match register value (l2-ecc@ffd06010)
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
> index cce9e50..44aeb3f 100644
> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
> @@ -599,6 +599,20 @@
>  			reg = <0xffe00000 0x40000>;
>  		};
>  
> +		eccmgr: eccmgr@ffd06090 {
> +			compatible = "altr,socfpga-ecc-manager";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			l2-ecc@ffd06010 {
> +				compatible = "altr,socfpga-a10-l2-ecc";
> +				reg = <0xffd06010 0x4>;
> +				interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>,
> +					     <0 0 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +

Just checking if these addresses are correct. The eccmgr is at
0xffd06090, but the l2-ecc is at 0xffd06010? I would have thought from
the placement the l2-ecc address would be inside the eccmgr's address?

Dinh
