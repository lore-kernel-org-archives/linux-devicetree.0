From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] MIPS: mscc: ocelot: fix length of memory address space
 for MIIM
Date: Wed, 25 Jul 2018 14:32:04 +0200
Message-ID: <20180725123204.GD3539@piout.net>
References: <20180725122132.31187-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725122132.31187-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On 25/07/2018 14:21:32+0200, Quentin Schulz wrote:
> The length of memory address space for MIIM0 is from 0x7107009c to
> 0x710700bf included which is 36 bytes long in decimal, or 0x24 bytes in
> hexadecimal and not 0x36.
> 
> Fixes: 49b031690abe ("MIPS: mscc: Add switch to ocelot")
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
> index 4f33dbc67348..7096915f26e0 100644
> --- a/arch/mips/boot/dts/mscc/ocelot.dtsi
> +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> @@ -184,7 +184,7 @@
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			compatible = "mscc,ocelot-miim";
> -			reg = <0x107009c 0x36>, <0x10700f0 0x8>;
> +			reg = <0x107009c 0x24>, <0x10700f0 0x8>;
>  			interrupts = <14>;
>  			status = "disabled";
>  
> -- 
> 2.14.1
> 

-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
