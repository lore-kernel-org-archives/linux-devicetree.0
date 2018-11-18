Return-Path: <SRS0=sbJT=N5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:50230 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbeKSDAG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 18 Nov 2018 22:00:06 -0500
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [RFC] C64 DTS
Date: Sun, 18 Nov 2018 17:39:09 +0100
Message-Id: <20181118163909.9202-1-geert@linux-m68k.org>
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Matt Porter <mporter@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

	Hi all,

Sometimes it's just fun to apply modern practices to old hardware.

Hence below is an attempt to write a DTS for the Commodore 64.
DT binding documentation is not yet included.

Thanks for your comments ;-)

---8<-------------------------------------------------------------------
/dts-v1/;

#include <dt-bindings/gpio/gpio.h>

/* FIXME <dt-bindings/6502.h> */
#define CPU_IRQ		0
#define CPU_NMI		1

/ {
	model = "Commodore 64";
	compatible = "cbm,c64";
	#address-cells = <1>;
	#size-cells = <1>;
	interrupt-parent = <&cpu>;

	color_clock: color_clock {
		compatible = "fixed-clock";
		#clock-cells = <0>;
		clock-frequency = <17734472>;		// PAL
	};

	dot_clock: dot_clock {
		compatible = "fixed-factor-clock";
		#clock-cells = <0>;
		clock-div = <9>;
		clock-mul = <4>;
		clocks = <&color_clock>;
	};

	phi0: phi0_clock {
		compatible = "fixed-factor-clock";
		#clock-cells = <0>;
		clock-div = <8>;
		clock-mul = <1>;
		clocks = <&dot_clock>;
	};

	phi2: phi2_clock {
		compatible = "fixed-factor-clock";
		#clock-cells = <0>;
		clock-div = <1>;
		clock-mul = <1>;
		clocks = <&phi0>;
	};

	ps_freq: ps_freq {
		compatible = "fixed-clock";
		#clock-cells = <0>;
		clock-frequency = <50>;
	};

	cpus {
		#address-cells = <0>;
		#size-cells = <0>;

		cpu: cpu {
			device_type = "cpu";
			compatible = "cbm,6510", "mos,6502";
			clock-frequency = <985000>;
			gpio-controller;
			#gpio-cells = <2>;
			interrupt-controller;
			#interrupt-cells = <1>;
		};
	};

	// FIXME sub-node with ranges to describe bank switching
	// cbm,loram-gpios = <&cpu 0 GPIO_ACTIVE_LOW>,
	// cbm,hiram-gpios = <&cpu 1 GPIO_ACTIVE_LOW>,
	// cbm,charen-gpios = <&cpu 2 GPIO_ACTIVE_LOW>,

	ram: memory@0 {
		device_type = "memory";
		reg = <0 0x10000>;
	};

	basic_rom: memory@a000 {
		reg = <0xa000 0x2000>;
		// FIXME ROM, reserved
	};

	character_rom: memory@d000 {
		reg = <0xd000 0x1000>;
		// FIXME ROM, reserved
	};

	vic: video-controller@d000 {
		reg = <0xd000 0x400>;
		compatible = "cbm,6569", "cbm,vic-ii";	// PAL
		clocks = <&color_clock>, <&dot_clock>;
		clock-names = "color", "dot";
		interrupts = <CPU_IRQ>;

		cbm,vic-bank-gpios = <&cia2 0 GPIO_ACTIVE_HIGH>,
				     <&cia2 1 GPIO_ACTIVE_HIGH>;
	};

	sid: sound@d400 {
		reg = <0xd400 0x400>;
		compatible = "cbm,6581", "cbm,sid";
	};

	color_ram: memory@d800 {
		reg = <0xd800 0x400>;
		// FIXME Nibble RAM, reserved
	};

	cia1: system-controller@dc00 {
		reg = <0xdc00 0x100>;
		compatible = "cbm,6526", "mos,cia";
		#clock-cells = <0>;			// CNT
		gpio-controller;
		#gpio-cells = <2>;
		interrupt-controller;
		#interrupt-cells = <1>;
		clocks = <&phi2>, <&ps_freq>;
		clock-names = "phi2", "tod";
		interrupts = <CPU_IRQ>;
	};

	cia2: system-controller@dd00 {
		reg = <0xdd00 0x100>;
		compatible = "cbm,6526", "mos,cia";
		#clock-cells = <0>;			// CNT
		gpio-controller;
		#gpio-cells = <2>;
		interrupt-controller;
		#interrupt-cells = <1>;
		clocks = <&phi2>, <&ps_freq>;
		clock-names = "phi2", "tod";
		interrupts = <CPU_IRQ>;
	};

	kernal_rom: memory@e000 {
		reg = <0xe000 0x2000>;
		// FIXME ROM, reserved
	};

	keyboard {
		compatible = "cbm,c64-keyboard", "gpio-matrix-keypad";

		col-gpios = <&cia1 0 GPIO_ACTIVE_HIGH>,
			    <&cia1 1 GPIO_ACTIVE_HIGH>,
			    <&cia1 2 GPIO_ACTIVE_HIGH>,
			    <&cia1 3 GPIO_ACTIVE_HIGH>,
			    <&cia1 4 GPIO_ACTIVE_HIGH>,
			    <&cia1 5 GPIO_ACTIVE_HIGH>,
			    <&cia1 6 GPIO_ACTIVE_HIGH>,
			    <&cia1 7 GPIO_ACTIVE_HIGH>;
		row-gpios = <&cia1 8 GPIO_ACTIVE_HIGH>,
			    <&cia1 9 GPIO_ACTIVE_HIGH>,
			    <&cia1 10 GPIO_ACTIVE_HIGH>,
			    <&cia1 11 GPIO_ACTIVE_HIGH>,
			    <&cia1 12 GPIO_ACTIVE_HIGH>,
			    <&cia1 13 GPIO_ACTIVE_HIGH>,
			    <&cia1 14 GPIO_ACTIVE_HIGH>,
			    <&cia1 15 GPIO_ACTIVE_HIGH>;

		interrupts = <CPU_NMI>;
		linux,keymap = <0 /* FIXME */>;
	};

	iec {
		compatible = "cbm,c64-iec-bus";

		cbm,atn-gpios = <&cia2 3 GPIO_ACTIVE_LOW>;
		cbm,clock-out-gpios = <&cia2 4 GPIO_ACTIVE_LOW>;
		cbm,data-out-gpios = <&cia2 5 GPIO_ACTIVE_LOW>;
		cbm,clock-in-gpios = <&cia2 6 GPIO_ACTIVE_LOW>;
		cbm,data-in-gpios = <&cia2 7 GPIO_ACTIVE_LOW>;
	};
};
------------------------------------------------------------------->8---

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
