From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] ARM: at91/dt: Disable SPI on at91sam9x5ek to allow MCI1
 to work.
Date: Mon, 20 Feb 2017 11:20:04 +0100
Message-ID: <95353208-6734-aec5-a41b-e62d28dd747c@microchip.com>
References: <1487265388-29390-1-git-send-email-cristian.birsan@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487265388-29390-1-git-send-email-cristian.birsan@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cristian.birsan@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: cyrille.pitchen@atmel.com, boris.brezillon@free-electrons.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 16/02/2017 à 18:16, cristian.birsan@microchip.com a écrit :
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> The A13 hardware line is shared by SPI and MCI1 controller.This patch
> disables the SPI controller so that the MCI1 (the big MMC card slot) can
> be used.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>  arch/arm/boot/dts/at91sam9x5ek.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dts/at91sam9x5ek.dtsi
> index 696b8ba..9d2bbc4 100644
> --- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
> @@ -116,7 +116,7 @@
>  			};
>  
>  			spi0: spi@f0000000 {
> -				status = "okay";
> +				status = "disabled"; /* conflicts with mmc1 */
>  				cs-gpios = <&pioA 14 0>, <0>, <0>, <0>;
>  				m25p80@0 {
>  					compatible = "atmel,at25df321a";
> 


-- 
Nicolas Ferre
