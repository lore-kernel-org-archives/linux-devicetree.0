From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 2/2] ARM: dts: at91: at91sam9x5cm: fix addressable nand
 flash size
Date: Tue, 2 Oct 2018 13:55:35 +0200
Message-ID: <20181002115535.nxemqzfmkfdzbffp@M43218.corp.atmel.com>
References: <20181002112949.22961-1-tudor.ambarus@microchip.com>
 <20181002112949.22961-2-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181002112949.22961-2-tudor.ambarus@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 02, 2018 at 02:29:49PM +0300, Tudor Ambarus wrote:
> at91sam9x5cm comes with a 2Gb NAND flash. Fix the rootfs size to
> match this limit.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks
> ---
>  arch/arm/boot/dts/at91sam9x5cm.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9x5cm.dtsi b/arch/arm/boot/dts/at91sam9x5cm.dtsi
> index 4908ee07e628..993eabe1cf7a 100644
> --- a/arch/arm/boot/dts/at91sam9x5cm.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5cm.dtsi
> @@ -100,7 +100,7 @@
>  
>  						rootfs@800000 {
>  							label = "rootfs";
> -							reg = <0x800000 0x1f800000>;
> +							reg = <0x800000 0x0f800000>;
>  						};
>  					};
>  				};
> -- 
> 2.9.4
> 
