From: Michal Bachraty <michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>
Subject: drm/tilcdc: LCD panels clocks initialization and earlier backlight
 initialization
Date: Thu, 28 Mar 2013 18:32:07 +0100
Message-ID: <1552838.0ugGbIv7sQ@ganymedes>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I'm trying to use tilcdc driver for KWH050TG08 LCD panel connected to AM335x 
processor (3.9 rc1 kernel). I have prepared DT bindings for that (listed 
bellow). I see fb0 device but I have no clocks going from cpu to LCD.  My 
clocks for LCD seems not properly to be set ...

virt_25000000_ck               1           1            25000000  
    sys_clkin_ck                8           19           25000000  
       dpll_disp_ck             0           1            25000000  
          dpll_disp_m2_ck       0           1            25000000  
             lcd_gclk           0           1            25000000   

and tilcdc_crtc is not called. I also set lcd_gclk to 300MHz, but I got same 
result. The question is there any way how to properly set clocks for LCD?

There is also one issue with backlight panel driver initialization in tilcdc 
driver. This problem seems to depend on DT and I2c driver deferried 
initialization and then also tps65217-bl driver.  Therefore tilcdc is 
initialized earlier than backlight driver. The question is: is there any way 
to switch order for loading drivers and how can be that done?

My short dmesg listing is as follows:
...
[    3.330046] pinctrl-single 44e10800.pinmux: request pin 41 (44e108a4) for 
lcd_panel.15
[    3.338390] pinctrl-single 44e10800.pinmux: request pin 40 (44e108a0) for 
lcd_panel.15
[    3.346707] pinctrl-single 44e10800.pinmux: enabling pinmux_lcd_pins 
function6
[    3.354387] panel lcd_panel.15: obtain a copy of previously claimed pinctrl
[    3.368248] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    3.375202] [drm] No driver support for vblank timestamp query.
[    3.386253] tilcdc 4830e000.fb: fb0:  frame buffer device
[    3.392015] tilcdc 4830e000.fb: registered panic notifier
[    3.397781] [drm] Initialized tilcdc 1.0.0 20121205 on minor 0
[    3.405347] pinctrl core: add 1 pinmux maps
[    3.409879] pinctrl-single 44e10800.pinmux: found group selector 7 for 
pinmux_i2c1_pins
[    3.418347] pinctrl-single 44e10800.pinmux: request pin 98 (44e10988) for 
44e0b000.i2c
[    3.426662] pinctrl-single 44e10800.pinmux: request pin 99 (44e1098c) for 
44e0b000.i2c
[    3.435014] pinctrl-single 44e10800.pinmux: enabling pinmux_i2c1_pins 
function7
[    3.442900] omap_i2c 44e0b000.i2c: obtain a copy of previously claimed 
pinctrl
[    3.453107] omap_i2c 44e0b000.i2c: bus 1 rev0.11 at 400 kHz
[    3.462980] tps65217-pmic tps65217-pmic: no of_node; not parsing pinctrl DT
[    3.473866] DCDC1: 925 <--> 1800 mV at 1800 mV 
[    3.480899] vdd_mpu: 925 <--> 1325 mV at 1100 mV 
[    3.487935] vdd_core: 925 <--> 1150 mV at 1100 mV 
[    3.494958] LDO1: 1000 <--> 3300 mV at 1800 mV 
[    3.501814] LDO2: 900 <--> 3300 mV at 3300 mV 
[    3.508447] LDO3: 1800 <--> 3300 mV at 3300 mV 
[    3.515238] LDO4: 1800 <--> 3300 mV at 3300 mV 
[    3.521270] tps65217-bl tps65217-bl: no of_node; not parsing pinctrl DT
[    3.531348] tps65217 1-0024: TPS65217 ID 0xf version 1.1


With older version of kernel (3.7 ) I uses to use da8xx driver (with some 
patches for DT support and hack for proper clock setup)  and this  
configuration works fine. 


Best regards,

Michal Bachraty

device tree:
am3358_pinmux: pinmux@44e10800 {

		lcdc_pins: pinmux_lcd_pins {
			pinctrl-single,pins = < /*  pin-name     -> function      (name)*/
				0xec  0x00		/* lcd_ac_bias_en ->lcd_ac_bias_en (LCD_EN)- out */
				0xe4  0x00 		/* lcd_hsync -> lcd_hsync (LCD_HSYNC) -out */
				0xe0  0x00 		/* lcd_vsync -> lcd_vsync (LCD_VSYNC) -out */
				0xe8  0x00 		/* lcd_pclk -> lcd_pclk (LCD_PCLK) -out */
				0xdc  0x00 		/* lcd_data15 -> lcd_data15 (LCD_DATA15) -out */
				0xd8  0x00 		/* lcd_data14 -> lcd_data14 (LCD_DATA14) -out */
				0xd4  0x00 		/* lcd_data13 -> lcd_data13 (LCD_DATA13) -out */
				0xd0  0x00 		/* lcd_data12 -> lcd_data12 (LCD_DATA12) -out */
				0xcc  0x00 		/* lcd_data11 -> lcd_data11 (LCD_DATA11) -out */
				0xc8  0x00 		/* lcd_data10 -> lcd_data10 (LCD_DATA10) -out */
				0xc4  0x00 		/* lcd_data9 -> lcd_data9 (LCD_DATA9) -out */
				0xc0  0x00 		/* lcd_data8 -> lcd_data8 (LCD_DATA8) -out */
				0xbc  0x00 		/* lcd_data7 -> lcd_data7 (LCD_DATA7) -out */
				0xb8  0x00 		/* lcd_data6 -> lcd_data6 (LCD_DATA6) -out */
				0xb4  0x00 		/* lcd_data5 -> lcd_data5 (LCD_DATA5) -out */
				0xb0  0x00 		/* lcd_data4 -> lcd_data4 (LCD_DATA4) -out */
				0xac  0x00 		/* lcd_data3 -> lcd_data3 (LCD_DATA3) -out */
				0xa8  0x00 		/* lcd_data2 -> lcd_data2 (LCD_DATA2) -out */
				0xa4  0x00 		/* lcd_data1 -> lcd_data1 (LCD_DATA1) -out */
				0xa0  0x00 		/* lcd_data0 -> lcd_data0 (LCD_DATA0) -out */
			>;
		};
	};
};

	fb: fb@4830e000 {
		compatible = "ti,am33xx-tilcdc";
		reg = <0x4830e000 0x1000>;
		interrupt-parent = <&intc>;
		interrupts = <36>;
		ti,hwmods = "lcdc";
	};

	lcd_panel {
		compatible = "ti,tilcdc,panel";
		pinctrl-names = "default";
		pinctrl-0 = <&lcdc_pins>;
		panel-info {
			ac-bias           = <255>;
			ac-bias-intrpt    = <0>;
			dma-burst-sz      = <16>;
			bpp               = <16>;
			fdd               = <0x80>;
			sync-edge         = <0>;
			sync-ctrl         = <1>;
			raster-order      = <0>;
			fifo-th           = <0>;
		};

		display-timings {
			native-mode = <&timing_0>;
			timing_0: 800x480px {
				/* 800x480 */
				clock-frequency = <50000000>;
				hactive = <800>;
				vactive = <480>;
				hfront-porch = <87>;
				hback-porch = <0>;
				hsync-len = <0>; 
				vback-porch = <0>;
				vfront-porch = <32>;
				vsync-len = <0>; 
				hsync-active = <0>;
				vsync-active = <0>;
			};
		};
	};

&tps {
	backlight {
		fdim = <100>; /* 100Hz,200Hz,500Hz,1000Hz */
		isel = <1>; /* 1 = TPS65217_BL_ISET1, 2 = TPS65217_BL_ISET2*/
	};
};
