From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 5/7 v2] ARM: kirkwood: convert uart0 to devicetree.
Date: Tue, 13 Mar 2012 09:18:07 -0400
Message-ID: <20120313131807.GH5050@titan.lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1331601448.git.jason@lakedaemon.net>
 <970083c931bbd5c58be3aa982a66fddc48ceb534.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <970083c931bbd5c58be3aa982a66fddc48ceb534.1331601448.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 01:57:47AM +0000, Jason Cooper wrote:
> This uart is the primary console for the dreamplug.  Removed
> kirkwood_uart0_init() call from board-dreamplug.c.
> 
> There are two uarts on the kirkwood SoC, all or none of them may be
> enabled, and the clock-frequency is board-dependant.  So, enabling and
> clock-frequency are left to the board dts.
> 
> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> ---
> 
> Changes from v1:
> 
> * moved on-chip peripherals (uart's here) in kirkwood.dtsi and used ranges to
>   simplify addressing
> * disable uarts by default as not all boards enable them.  Can be enabled in
>   board file
> * specify clock-frequency in board file as it is board specific.  of_serial
>   prints an error message if it isn't specified (view with earlyprintk)
> * removed previous versions Reviewed-By's and Acked-By's as this is
>   significantly different from the previous version.
> 
>  arch/arm/boot/dts/kirkwood-dreamplug.dts |    7 +++++++
>  arch/arm/boot/dts/kirkwood.dtsi          |   26 +++++++++++++++++++++++++-
>  arch/arm/mach-kirkwood/board-dreamplug.c |    2 --
>  3 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> index 9946d01..a5376b8 100644
> --- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
> +++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> @@ -14,4 +14,11 @@
>  	chosen {
>  		bootargs = "console=ttyS0,115200n8 earlyprintk";
>  	};
> +
> +	ocp@f1000000 {
> +		serial@12000 {
> +			clock-frequency = <200000000>;
> +			status = "ok";
> +		};
> +	};

While this works on my board (I see console messages without
earlyprintk), I get the following:

Serial: 8250/16550 driver, 2 ports, IRQ sharing disabled
f1012000.serial: ttyS0 at MMIO 0xf1012000 (irq = 0) is a 16550A

Obviously, the interrupt should be 33.  Is this a bug?  Or, do I need to
re-specify all of the attributes when enabling a driver which was
/included/?

This could be an artifact of interrupt-controller not being defined in
the dt, yet.  I'll dig into it more.

thx,

Jason.

>  };
> diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
> index 702b955..825310b 100644
> --- a/arch/arm/boot/dts/kirkwood.dtsi
> +++ b/arch/arm/boot/dts/kirkwood.dtsi
> @@ -2,5 +2,29 @@
>  
>  / {
>  	compatible = "mrvl,kirkwood";
> -};
>  
> +	ocp@f1000000 {
> +		compatible = "simple-bus";
> +		ranges = <0 0xf1000000 0x1000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		serial@12000 {
> +			compatible = "ns16550a";
> +			reg = <0x12000 0x100>;
> +			reg-shift = <2>;
> +			interrupts = <33>;
> +			/* set clock-frequency in board dts */
> +			status = "disabled";
> +		};
> +
> +		serial@12100 {
> +			compatible = "ns16550a";
> +			reg = <0x12100 0x100>;
> +			reg-shift = <2>;
> +			interrupts = <34>;
> +			/* set clock-frequency in board dts */
> +			status = "disabled";
> +		};
> +	};
> +};
> diff --git a/arch/arm/mach-kirkwood/board-dreamplug.c b/arch/arm/mach-kirkwood/board-dreamplug.c
> index 3b37315..3fbfb7d 100644
> --- a/arch/arm/mach-kirkwood/board-dreamplug.c
> +++ b/arch/arm/mach-kirkwood/board-dreamplug.c
> @@ -135,8 +135,6 @@ void __init dreamplug_init(void)
>  	 */
>  	kirkwood_mpp_conf(dreamplug_mpp_config);
>  
> -	kirkwood_uart0_init();
> -
>  	spi_register_board_info(dreamplug_spi_slave_info,
>  				ARRAY_SIZE(dreamplug_spi_slave_info));
>  	kirkwood_spi_init();
> -- 
> 1.7.3.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
