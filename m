From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM: dts: zynq: describe SLCR as simple-mfd rather than
 simple-bus
Date: Thu, 5 Nov 2015 13:10:54 +0100
Message-ID: <563B474E.2000106@xilinx.com>
References: <1446713167-29306-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446713167-29306-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/05/2015 09:46 AM, Masahiro Yamada wrote:
> The SLCR (System-Level Control Registers) block is an MFD (Multi
> Function Device) rather than a bus.
> 
> "simple-mfd" seems a more suitable compatible string than "simple-bus".
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm/boot/dts/zynq-7000.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> index 1a5220e..64ddd4d 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -238,7 +238,7 @@
>  		slcr: slcr@f8000000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			compatible = "xlnx,zynq-slcr", "syscon", "simple-bus";
> +			compatible = "xlnx,zynq-slcr", "syscon", "simple-mfd";
>  			reg = <0xF8000000 0x1000>;
>  			ranges;
>  			clkc: clkc@100 {
> 

Applied.

Thanks,
Michal
