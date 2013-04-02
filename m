From: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: drm/tilcdc: LCD panels clocks initialization and earlier
 backlight initialization
Date: Tue, 2 Apr 2013 09:59:54 -0400
Message-ID: <CAF6AEGsdoK=Cu5tmC4dmWEHVxTbzrb52Nnuu91GJaV=H4=hxRg@mail.gmail.com>
References: <1552838.0ugGbIv7sQ@ganymedes>
 <79CD15C6BA57404B839C016229A409A83EC3E861@DBDE01.ent.ti.com>
 <CAF6AEGur7yuduNs9-HqP980NcXSB24Wz=2g_P4uPmXC9fJ9-9w@mail.gmail.com>
 <4669375.gFxBLPqWg9@ganymedes>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4669375.gFxBLPqWg9@ganymedes>
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
To: Michal Bachraty <michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org" <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 2, 2013 at 4:45 AM, Michal Bachraty
<michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org> wrote:
> Hi Rob,
>
> On Monday, April 01, 2013 09:46:05 Rob Clark wrote:
>> On Mon, Apr 1, 2013 at 7:31 AM, Hiremath, Vaibhav <hvaibhav-l0cyMroinI0@public.gmane.org> wrote:
>> >> -----Original Message-----
>> >> From: devicetree-discuss [mailto:devicetree-discuss-
>> >> bounces+hvaibhav=ti.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On Behalf Of Michal Bachraty
>> >> Sent: Thursday, March 28, 2013 11:02 PM
>> >> To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; devicetree-
>> >> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> >> Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org
>> >> Subject: drm/tilcdc: LCD panels clocks initialization and earlier
>> >> backlight initialization
>> >>
>> >> Hi,
>> >>
>> >> I'm trying to use tilcdc driver for KWH050TG08 LCD panel connected to
>> >> AM335x
>> >> processor (3.9 rc1 kernel). I have prepared DT bindings for that
>> >> (listed
>> >> bellow). I see fb0 device but I have no clocks going from cpu to LCD.
>> >> My
>> >> clocks for LCD seems not properly to be set ...
>> >>
>> >> virt_25000000_ck               1           1            25000000
>> >>
>> >>     sys_clkin_ck                8           19           25000000
>> >>
>> >>        dpll_disp_ck             0           1            25000000
>> >>
>> >>           dpll_disp_m2_ck       0           1            25000000
>> >>
>> >>              lcd_gclk           0           1            25000000
>> >>
>> >> and tilcdc_crtc is not called. I also set lcd_gclk to 300MHz, but I got
>> >> same
>> >> result. The question is there any way how to properly set clocks for
>> >> LCD?
>> >
>> > Not sure  about the LCDC DRM driver, but I just tested clk_set_rate()
>> > For lcdc_gclk clock and it is working for me. I could able to set
>> > 300MHz freq on my BeagleBone platform, with below code -
>>
>> fwiw, tilcdc drm driver won't set clocks until you do modeset, as it
>> is setting them based on the requested pixel clock.  As opposed to
>> setting it once at boot time.
>>
>> Michal, you may want to add 'drm.debug=7' in your bootargs, and send
>> the bootlog.  That should set some light about whether it is even
>> trying to modeset but failing, or some other issue.
>>
>
> Yes, here it is:

Hmm, looks like tilcdc_crtc_update_clk() is not getting called.. and
in fact either tilcdc_crtc_mode_set() is not called or bails out early
(maybe _mode_valid() falis?)

I'd perhaps throw a few traces in tilcdc_crtc_mode_set() and see why
that is bailing out..

BR,
-R


>
> [    3.098732] platform audio.11: Driver snd-soc-am33xx-s800 requests probe
> deferral
> [ 3.107280] TCP: cubic registered
> [    3.110822] Initializing XFRM netlink socket
> [    3.115844] NET: Registered protocol family 10
> [    3.123212] NET: Registered protocol family 17
> [    3.128064] NET: Registered protocol family 15
> [    3.133176] Key type dns_resolver registered
> [    3.137846] VFP support v0.3: implementor 41 architecture 3 part 30 variant
> c rev 3
> [    3.146087] ThumbEE CPU extension supported.
> [    3.150659] Registering SWP/SWPB emulation handler
> [    3.160695] registered taskstats version 1
> [    3.166007] [drm:tilcdc_drm_init], init
> [    3.171117] pinctrl core: add 1 pinmux maps
> [    3.175564] pinctrl-single 44e10800.pinmux: found group selector 6 for
> pinmux_lcd_pins
> [    3.183957] pinctrl-single 44e10800.pinmux: request pin 59 (44e108ec) for
> lcd_panel.15
> [    3.192312] pinctrl-single 44e10800.pinmux: request pin 57 (44e108e4) for
> lcd_panel.15
> [    3.200662] pinctrl-single 44e10800.pinmux: request pin 56 (44e108e0) for
> lcd_panel.15
> [    3.209010] pinctrl-single 44e10800.pinmux: request pin 58 (44e108e8) for
> lcd_panel.15
> [    3.217321] pinctrl-single 44e10800.pinmux: request pin 55 (44e108dc) for
> lcd_panel.15
> [    3.225666] pinctrl-single 44e10800.pinmux: request pin 54 (44e108d8) for
> lcd_panel.15
> [    3.234012] pinctrl-single 44e10800.pinmux: request pin 53 (44e108d4) for
> lcd_panel.15
> [    3.242359] pinctrl-single 44e10800.pinmux: request pin 52 (44e108d0) for
> lcd_panel.15
> [    3.250708] pinctrl-single 44e10800.pinmux: request pin 51 (44e108cc) for
> lcd_panel.15
> [    3.259052] pinctrl-single 44e10800.pinmux: request pin 50 (44e108c8) for
> lcd_panel.15
> [    3.267362] pinctrl-single 44e10800.pinmux: request pin 49 (44e108c4) for
> lcd_panel.15
> [    3.275710] pinctrl-single 44e10800.pinmux: request pin 48 (44e108c0) for
> lcd_panel.15
> [    3.284057] pinctrl-single 44e10800.pinmux: request pin 47 (44e108bc) for
> lcd_panel.15
> [    3.292404] pinctrl-single 44e10800.pinmux: request pin 46 (44e108b8) for
> lcd_panel.15
> [    3.300748] pinctrl-single 44e10800.pinmux: request pin 45 (44e108b4) for
> lcd_panel.15
> [    3.309091] pinctrl-single 44e10800.pinmux: request pin 44 (44e108b0) for
> lcd_panel.15
> [    3.317404] pinctrl-single 44e10800.pinmux: request pin 43 (44e108ac) for
> lcd_panel.15
> [    3.325751] pinctrl-single 44e10800.pinmux: request pin 42 (44e108a8) for
> lcd_panel.15
> [    3.334098] pinctrl-single 44e10800.pinmux: request pin 41 (44e108a4) for
> lcd_panel.15
> [    3.342445] pinctrl-single 44e10800.pinmux: request pin 40 (44e108a0) for
> lcd_panel.15
> [    3.350794] pinctrl-single 44e10800.pinmux: enabling pinmux_lcd_pins
> function6
> [    3.358477] panel lcd_panel.15: obtain a copy of previously claimed pinctrl
> [    3.366365] [drm:drm_platform_init],
> [    3.370270] [drm:drm_get_platform_dev],
> [    3.374940] [drm:drm_get_minor],
> [    3.381143] [drm:drm_get_minor], new minor assigned 64
> [    3.386558] [drm:drm_get_minor],
> [    3.391333] [drm:drm_get_minor], new minor assigned 0
> [    3.397698] [drm:modeset_init], loading module: panel
> [    3.403141] [drm:drm_sysfs_connector_add], adding "LVDS-1" to sysfs
> [    3.410040] [drm:drm_sysfs_hotplug_event], generating hotplug event
> [    3.416678] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
> [    3.423662] [drm] No driver support for vblank timestamp query.
> [    3.429958] [drm:drm_irq_install], irq=52
> [    3.434354] [drm:drm_helper_probe_single_connector_modes],
> [CONNECTOR:5:LVDS-1]
> [    3.442160] [drm:drm_helper_probe_single_connector_modes],
> [CONNECTOR:5:LVDS-1] probed modes :
> [    3.451246] [drm:drm_mode_debug_printmodeline], Modeline 6:"800x480" 110
> 50000 800 887 887 887 480 512 512 51a
> [    3.462611] [drm:drm_setup_crtcs],
> [    3.466284] [drm:drm_enable_connectors], connector 5 enabled? yes
> [    3.472722] [drm:drm_target_preferred], looking for cmdline mode on
> connector 5
> [    3.480430] [drm:drm_target_preferred], looking for preferred mode on
> connector 5
> [    3.488320] [drm:drm_target_preferred], found mode 800x480
> [    3.494083] [drm:drm_setup_crtcs], picking CRTCs for 2048x2048 config
> [    3.500886] [drm:drm_setup_crtcs], desired mode 800x480 set on crtc 3
> [    3.507667] [drm:drm_fbdev_cma_create], surface width(800), height(480) and
> bpp(16)
> [    3.517992] [drm:drm_framebuffer_reference], FB ID: 8
> [    3.525610] tilcdc 4830e000.fb: fb0:  frame buffer device
> [    3.531352] tilcdc 4830e000.fb: registered panic notifier
> [    3.537123] [drm] Initialized tilcdc 1.0.0 20121205 on minor 0
> [    3.544706] pinctrl core: add 1 pinmux maps
> [    3.549234] pinctrl-single 44e10800.pinmux: found group selector 7 for
> pinmux_i2c1_pins
> [    3.557662] pinctrl-single 44e10800.pinmux: request pin 98 (44e10988) for
> 44e0b000.i2c
> [    3.566020] pinctrl-single 44e10800.pinmux: request pin 99 (44e1098c) for
> 44e0b000.i2c
> [    3.574373] pinctrl-single 44e10800.pinmux: enabling pinmux_i2c1_pins
> function7
> [    3.582257] omap_i2c 44e0b000.i2c: obtain a copy of previously claimed
> pinctrl
> [    3.592470] omap_i2c 44e0b000.i2c: bus 1 rev0.11 at 400 kHz
> [    3.602698] tps65217-pmic tps65217-pmic: no of_node; not parsing pinctrl DT
> [    3.613524] DCDC1: 925 <--> 1800 mV at 1800 mV
> [    3.620565] vdd_mpu: 925 <--> 1325 mV at 1100 mV
> [    3.627579] vdd_core: 925 <--> 1150 mV at 1100 mV
> [    3.634644] LDO1: 1000 <--> 3300 mV at 1800 mV
> [    3.641483] LDO2: 900 <--> 3300 mV at 3300 mV
> [    3.648293] LDO3: 1800 <--> 3300 mV at 3300 mV
> [    3.655102] LDO4: 1800 <--> 3300 mV at 3300 mV
> [    3.661130] tps65217-bl tps65217-bl: no of_node; not parsing pinctrl DT
> [    3.671184] tps65217 1-0024: TPS65217 ID 0xf version 1.1
> [    3.678824] dummy 1-0051: no of_node; not parsing pinctrl DT
> [    3.685255] dummy 1-0052: no of_node; not parsing pinctrl DT
> [    3.691691] dummy 1-0053: no of_node; not parsing pinctrl DT
> [    3.697774] at24 1-0050: 1024 byte 24c08 EEPROM, writable, 16 bytes/write
> [    3.710546] si5351 1-0060: si5351_pll_recalc_rate - plla: p1 = 3074, p2 =
> 116286, p3 = 390625, parent_rate = 8
>
> Seems drm mode is set [drm:drm_setup_crtcs], desired mode 800x480 set on crtc
> 3
> I have no clue, what is wrong.
>
> Thanks,
> Michal
>
