From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v3 1/1] ARM: dts: AM33XX: Add LCDC info into am335x-evm
Date: Tue, 3 Sep 2013 09:55:39 -0500
Message-ID: <20130903145516.GA30867@uda0270506>
References: <1377274436-3890-1-git-send-email-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1377274436-3890-1-git-send-email-bparrot@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: devicetree@vger.kernel.org
Cc: tony@atomide.com, dri-devel@lists.freedesktop.org, bcousson@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi,

I have not received any feedback on this patch.
It has been pending since the end of June (first post).
Can I get an estimate when it will be included/accepted?

Thanks,
Benoit


On Fri, Aug 23, 2013 at 11:13:56AM -0500, Benoit Parrot wrote:
> Add LCDC device node in DT for am33xx
> Add LCDC and Panel info in DT for am335x-evm
> 
> Changes in v3:
> - rebase to 3.11-rc6
> 
> Changes in v2:
> - remove redundant/unnecessary SoC specific setting in the board dts
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  arch/arm/boot/dts/am335x-evm.dts |   72 ++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/am33xx.dtsi    |    9 +++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index 3aee1a4..b0703f1 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -149,6 +149,40 @@
>  				0x14c (PIN_INPUT_PULLDOWN | MUX_MODE7)
>  			>;
>  		};
> +
> +		lcd_pins_s0: lcd_pins_s0 {
> +			pinctrl-single,pins = <
> +				0x20 0x01	/* gpmc_ad8.lcd_data16, OUTPUT | MODE1 */
> +				0x24 0x01	/* gpmc_ad9.lcd_data17, OUTPUT | MODE1 */
> +				0x28 0x01	/* gpmc_ad10.lcd_data18, OUTPUT | MODE1 */
> +				0x2c 0x01	/* gpmc_ad11.lcd_data19, OUTPUT | MODE1 */
> +				0x30 0x01	/* gpmc_ad12.lcd_data20, OUTPUT | MODE1 */
> +				0x34 0x01	/* gpmc_ad13.lcd_data21, OUTPUT | MODE1 */
> +				0x38 0x01	/* gpmc_ad14.lcd_data22, OUTPUT | MODE1 */
> +				0x3c 0x01	/* gpmc_ad15.lcd_data23, OUTPUT | MODE1 */
> +				0xa0 0x00	/* lcd_data0.lcd_data0, OUTPUT | MODE0 */
> +				0xa4 0x00	/* lcd_data1.lcd_data1, OUTPUT | MODE0 */
> +				0xa8 0x00	/* lcd_data2.lcd_data2, OUTPUT | MODE0 */
> +				0xac 0x00	/* lcd_data3.lcd_data3, OUTPUT | MODE0 */
> +				0xb0 0x00	/* lcd_data4.lcd_data4, OUTPUT | MODE0 */
> +				0xb4 0x00	/* lcd_data5.lcd_data5, OUTPUT | MODE0 */
> +				0xb8 0x00	/* lcd_data6.lcd_data6, OUTPUT | MODE0 */
> +				0xbc 0x00	/* lcd_data7.lcd_data7, OUTPUT | MODE0 */
> +				0xc0 0x00	/* lcd_data8.lcd_data8, OUTPUT | MODE0 */
> +				0xc4 0x00	/* lcd_data9.lcd_data9, OUTPUT | MODE0 */
> +				0xc8 0x00	/* lcd_data10.lcd_data10, OUTPUT | MODE0 */
> +				0xcc 0x00	/* lcd_data11.lcd_data11, OUTPUT | MODE0 */
> +				0xd0 0x00	/* lcd_data12.lcd_data12, OUTPUT | MODE0 */
> +				0xd4 0x00	/* lcd_data13.lcd_data13, OUTPUT | MODE0 */
> +				0xd8 0x00	/* lcd_data14.lcd_data14, OUTPUT | MODE0 */
> +				0xdc 0x00	/* lcd_data15.lcd_data15, OUTPUT | MODE0 */
> +				0xe0 0x00	/* lcd_vsync.lcd_vsync, OUTPUT | MODE0 */
> +				0xe4 0x00	/* lcd_hsync.lcd_hsync, OUTPUT | MODE0 */
> +				0xe8 0x00	/* lcd_pclk.lcd_pclk, OUTPUT | MODE0 */
> +				0xec 0x00	/* lcd_ac_bias_en.lcd_ac_bias_en, OUTPUT | MODE0 */
> +			>;
> +		};
> +
>  	};
>  
>  	ocp {
> @@ -311,6 +345,10 @@
>  				};
>  			};
>  		};
> +
> +		lcdc: lcdc@4830e000 {
> +			status = "okay";
> +		};
>  	};
>  
>  	vbat: fixedregulator@0 {
> @@ -374,6 +412,40 @@
>  		brightness-levels = <0 51 53 56 62 75 101 152 255>;
>  		default-brightness-level = <8>;
>  	};
> +
> +	panel {
> +		compatible = "ti,tilcdc,panel";
> +		status = "okay";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lcd_pins_s0>;
> +		panel-info {
> +			ac-bias           = <255>;
> +			ac-bias-intrpt    = <0>;
> +			dma-burst-sz      = <16>;
> +			bpp               = <32>;
> +			fdd               = <0x80>;
> +			sync-edge         = <0>;
> +			sync-ctrl         = <1>;
> +			raster-order      = <0>;
> +			fifo-th           = <0>;
> +		};
> +
> +		display-timings {
> +			800x480p62 {
> +				clock-frequency = <30000000>;
> +				hactive = <800>;
> +				vactive = <480>;
> +				hfront-porch = <39>;
> +				hback-porch = <39>;
> +				hsync-len = <47>;
> +				vback-porch = <29>;
> +				vfront-porch = <13>;
> +				vsync-len = <2>;
> +				hsync-active = <1>;
> +				vsync-active = <1>;
> +			};
> +		};
> +	};
>  };
>  
>  #include "tps65910.dtsi"
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index 38b446b..a302fd6 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -530,5 +530,14 @@
>  			#size-cells = <1>;
>  			status = "disabled";
>  		};
> +
> +		lcdc: lcdc@4830e000 {
> +			compatible = "ti,am33xx-tilcdc";
> +			reg = <0x4830e000 0x1000>;
> +			interrupt-parent = <&intc>;
> +			interrupts = <36>;
> +			ti,hwmods = "lcdc";
> +			status = "disabled";
> +		};
>  	};
>  };
> -- 
> 1.7.9.5
> 
