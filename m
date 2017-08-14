From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: ARM: new DT warnings
Date: Mon, 14 Aug 2017 17:38:43 -0500
Message-ID: <20170814223843.oyezospd5knk62cl@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I'm working on some new dtc checks that check common binding phandle
lookups and cell sizes.

These are the new warnings produced. I haven't checked them all, but I
believe these are all actual errors from the ones I checked. This is a
trimmed list removing duplicates that get repeated for each board.

arch/arm/boot/dts/am335x-baltos-ir2110.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /ocp/usb@47400000/usb-phy@47401300 for /ocp/usb@47400000/usb@47401000
arch/arm/boot/dts/am335x-baltos-ir2110.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /ocp/usb@47400000/usb-phy@47401b00 for /ocp/usb@47400000/usb@47401800
arch/arm/boot/dts/am437x-cm-t43.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /ocp@44000000/mcasp@48038000
arch/arm/boot/dts/am437x-cm-t43.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /ocp@44000000/mcasp@4803C000
arch/arm/boot/dts/am437x-cm-t43.dtb: Warning (provider_cells_property): Missing #mbox-cells in provider /ocp@44000000/mailbox@480C8000/wkup_m3 for /ocp@44000000/l4_wkup@44c00000/scm@210000/wkup_m3_ipc@1324
arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
arch/arm/boot/dts/at91-sama5d2_xplained.dtb: Warning (provider_cells_property): Missing phandles in /ahb/apb/flexcom@fc018000/i2c@600:dmas
arch/arm/boot/dts/at91-sama5d3_xplained.dtb: Warning (provider_cells_property): Missing phandles in /ahb/apb/i2c@f801c000:dmas
arch/arm/boot/dts/at91-tse850-3.dtb: Warning (provider_cells_property): Missing phandles in /ahb/apb/serial@ffffee00:dmas
arch/arm/boot/dts/bcm2835-rpi-a.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /phy for /soc/usb@7e980000
arch/arm/boot/dts/dm8148-evm.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /ocp/l4ls@48000000/control@140000/usb-phy@1b00 for /ocp/usb@47400000/usb@47401800
arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/system-controller@10040000
arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: Warning (gpio_cells_property): cd-gpios property size (8) too small for cell size 2 in /soc/aips@53f00000/esdhc@53fb4000
arch/arm/boot/dts/imx50-evk.dtb: Warning (provider_cells_property): Missing #dma-cells in provider /soc/aips@60000000/sdma@63fb0000 for /soc/aips@50000000/spba@50000000/ssi@50014000
arch/arm/boot/dts/imx50-evk.dtb: Warning (provider_cells_property): Missing #dma-cells in provider /soc/aips@60000000/sdma@63fb0000 for /soc/aips@60000000/ssi@63fcc000
arch/arm/boot/dts/imx53-tx53-x03x.dtb: Warning (interrupts_property): interrupts size is (4), expected multiple of 8 in /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0
arch/arm/boot/dts/imx6ul-pico-hobbit.dtb: Warning (interrupts_property): interrupts size is (12), expected multiple of 8 in /soc/aips-bus@02000000/ethernet@020b4000/mdio/ethernet-phy@1
arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpio_cells_property): power-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/omap3-cm-t3517.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /hsusb1_phy for /ocp@68000000/usbhshost@48064000/ehci@48064800
arch/arm/boot/dts/omap4-droid4-xt894.dtb: Warning (interrupts_property): interrupts size is (4), expected multiple of 12 in /ocp/elm@48078000
arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dtb: Warning (interrupts_property): Missing interrupt-parent for /paxi/dmac@40000
arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dtb: Warning (interrupts_property): Missing interrupt-parent for /paxi/dmac@50000
arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dtb: Warning (interrupts_property): Missing interrupt-parent for /paxi/gem@30000
arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dtb: Warning (interrupts_property): Missing interrupt-parent for /rwid-axi/axi2pico@c0000000
arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /soc/dsi-phy@4700200 for /soc/mdss_dsi@4700000
arch/arm/boot/dts/qcom-apq8064-arrow-sd-600eval.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /soc/hdmi-phy@4a00400 for /soc/hdmi-tx@4a00000
arch/arm/boot/dts/s5pv210-aquila.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
arch/arm/boot/dts/sama5d31ek.dtb: Warning (provider_cells_property): Missing phandles in /ahb/apb/serial@f0020000:dmas
arch/arm/boot/dts/sama5d31ek.dtb: Warning (provider_cells_property): Missing phandles in /ahb/apb/spi@f0004000:dmas
arch/arm/boot/dts/spear320-hmi.dtb: Warning (gpio_cells_property): Missing phandles in /ahb/apb/i2c@d0180000/stmpe811@41:irq-over-gpio
arch/arm/boot/dts/spear600-evb.dtb: Warning (interrupts_property): Missing interrupt-parent for /ahb/apb/rtc@fc900000
arch/arm/boot/dts/ste-nomadik-nhk15.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
arch/arm/boot/dts/stih407-b2120.dtb: Warning (gpio_cells_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
arch/arm/boot/dts/tango4-vantage-1172.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/interrupt-controller@6e000
arch/arm/boot/dts/tango4-vantage-1172.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/interrupt-controller@6e000
arch/arm/boot/dts/tango4-vantage-1172.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/interrupt-controller@6e000
arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu
arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb: Warning (provider_cells_property): Missing #phy-cells in provider /phy for /soc/usb@7e980000
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (provider_cells_property): Missing #cooling-cells in provider /cpus/cpu@0 for /thermal-zones/cpu_thermal/cooling-maps/map@0
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (provider_cells_property): Missing #cooling-cells in provider /cpus/cpu@100 for /thermal-zones/cpu_thermal/cooling-maps/map@1
arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: Warning (provider_cells_property): Missing #power-domain-cells in provider /bpmp for /gpu@17000000

The updated dtc is here[1]. Adding "DTC=path/to/dtc" will use external
dtc in the kernel build.

Once the changes are in dtc upstream, I plan to sync kernel's copy. For
these, I don't plan to turn off by default (i.e. w/o W=1).

Thanks,
Rob

[1] https://github.com/robherring/dtc.git checks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
