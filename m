From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: henninger: add QSPI DT support
Date: Sun, 11 May 2014 22:17:27 +0400
Message-ID: <536FBEB7.9080605@cogentembedded.com>
References: <201405060245.32952.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201405060245.32952.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 05/06/2014 02:45 AM, Sergei Shtylyov wrote:

> Define the Henninger board dependent part of the QSPI device node.
> Add device nodes for Spansion S25FL512S SPI flash and MTD partitions on it.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
> This patch is against 'renesas-devel-v3.15-rc3-20140502' tag of Simon Horman's
> 'renesas.git' repo and SDHI0/2 DT support patch posted last weekend.

>   arch/arm/boot/dts/r8a7791-henninger.dts |   38 ++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)

> Index: renesas/arch/arm/boot/dts/r8a7791-henninger.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7791-henninger.dts
> +++ renesas/arch/arm/boot/dts/r8a7791-henninger.dts
[...]
> @@ -158,3 +163,36 @@
>   	cd-gpios = <&gpio6 22 GPIO_ACTIVE_LOW>;
>   	status = "okay";
>   };
> +
> +&qspi {
> +	pinctrl-0 = <&qspi_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "spansion,s25fl512s";
> +		reg = <0>;
> +		spi-max-frequency = <30000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		m25p,fast-read;
> +
> +		partition@0 {
> +			label = "loader_prg";
> +			reg = <0x00000000 0x00040000>;
> +			read-only;
> +		};
> +		partition@40000 {
> +			label = "user_prg";
> +			reg = <0x00040000 0x00400000>;
> +			read-only;

    Oops, there shouldn't be "read-only" here, I forgot to refresh the patch 
as I'm now seeing... too bad it's too late to resend now. :-(

WBR, Sergei

