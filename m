From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/8] Implement a new DTS Source Language
Date: Wed, 24 Sep 2008 13:48:55 -0500
Message-ID: <1222282135.12705.4.camel@ld0161-tx32>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>
	<097BFF8D-317F-4E85-AC2A-4C0A8D6C608B@kernel.crashing.org>
	<1222275105.11692.9.camel@ld0161-tx32>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222275105.11692.9.camel@ld0161-tx32>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2008-09-24 at 11:51 -0500, Jon Loeliger wrote:
> On Tue, 2008-09-23 at 21:34 -0500, Kumar Gala wrote:
> 
> > Any examples/tests of all the cool new features?
> > 
> > - k
> 
> Here is a QAD example based on the MPC8641 DTS file
> as found in the arch/powerpc/boot/dts directory today.
> It is maybe not the best example, but it shows the
> flavor of what can be done.
> 
> Enjoy,
> jdl


Also, here is the same refactoring done on the
mpc8572ds.dts file too.

And, perhaps more important than doing this work
on this one file, it shows that the first section
of both this 8572 DTS file and the 8641 DTS file
are almost identical throughout the /define/ section.
Minor refactoring needed in the 8641 variant.
The only "real" difference is 8641 says "TSEC" and
the 8572 says "eTSEC", and one weird interrupt thing
in the serial node.  Dunno.

Enjoy,
jdl




/*
 * MPC8572 DS Device Tree Source
 *
 * Copyright 2007, 2008 Freescale Semiconductor Inc.
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 */

/dts-v1/;

/define/ make_cpu(\part, \cpu)
{
	"PowerPC," % \part % "@" % \cpu {
		device_type = "cpu";
		reg = < (\cpu) >;
		d-cache-line-size = <32>;
		i-cache-line-size = <32>;
		d-cache-size = <32768>;		// L1
		i-cache-size = <32768>;		// L1
		timebase-frequency = <0>;	// From uboot
		bus-frequency = <0>;		// From uboot
		clock-frequency = <0>;		// From uboot
		next-level-cache = <&L2>;
	};
}

/define/ make_i2c(\id)
{
	\addr := 0x3000 + \id * 0x100;

	"i2c@" % \hexstr(\addr) {
		#address-cells = <1>;
		#size-cells = <0>;
		cell-index = <\id>;
		compatible = "fsl-i2c";
		reg = < (\addr) 0x100>;
		interrupts = <43 2>;
		interrupt-parent = <&mpic>;
		dfsrr;
	};
}

/define/ make_dma_channel(\part, \id, \intr_base)
{
	"dma-channel@" % hexstr(\id * 0x80) {
		compatible = < ("fsl,mpc" % \part % "-dma-channel")
				("fsl,eloplus-dma-channel") >;
		reg = < (0x80 * \id) 0x80>;
		cell-index = < (\id) >;
		interrupt-parent = <&mpic>;
		interrupts = < (\intr_base + \id) 2>;
	};
}

/define/ make_dma_controller(\part, \ctrl)
{
	\addr := 0x21300 - \ctrl * 0x15000;
	\intr_base := \ctrl * 56 + 20;

	"dma@" % hexstr(\addr) {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = < ("fsl,mpc" % \part % "-dma")
				 ("fsl,eloplus-dma") >;
		reg = < (\addr) 0x4>;
		ranges = <0x0 (\addr - 0x200) 0x200>;
		cell-index = < (\ctrl) >;

		for \c in 0 .. 3 {
			make_dma_channel(\part, \c, \intr_base);
		}
	};
}

/define/ make_ethernet_phy(\id)
{
	"phy" % \id : "ethernet-phy@" % \id {
		interrupt-parent = <&mpic>;
		interrupts = <10 1>;
		reg = < (\id) >;
	};
}

/define/ make_ethernet(\id)
{
	\addr := 0x24000 + \id * 0x1000;

	"enet" % \id : "ethernet@" % \hexstr(\addr) {
		cell-index = <\id>;
		device_type = "network";
		model = "eTSEC";
		compatible = "gianfar";
		reg = < (\addr) 0x1000>;
		local-mac-address = [ 00 00 00 00 00 00 ];
		if (\id == 0) {
			interrupts = <29 2 30 2 34 2>;
		}
		if (\id == 1) {
			interrupts = <35 2 36 2 40 2>;
		}
		if (\id == 2) {
			interrupts = <31 2 32 2 33 2>;
		}
		if (\id == 3) {
			interrupts = <37 2 38 2 39 2>;
		}
		interrupt-parent = <&mpic>;
		phy-handle = <&("phy" % \id)>;
		phy-connection-type = "rgmii-id";
	};
}

/define/ make_serial(\id)
{
	\addr := 0x4500 + \id * 0x100;

	"serial" % \id : "serial@" % hexstr(\addr) {
		cell-index = < (\id) >;
		device_type = "serial";
		compatible = "ns16550";
		reg = < (\addr) 0x100>;
		clock-frequency = <0>;
		interrupts = <42 2>;
		interrupt-parent = <&mpic>;
	};
}

/define/ make_memory_controller(\id)
{
	\addr := 0x2000 + \id * 0x4000;

	"memory-controller@" % hexstr(\addr) {
		compatible = "fsl,mpc8572-memory-controller";
		reg = < (\addr) 0x1000>;
		interrupt-parent = <&mpic>;
		interrupts = <18 2>;
	};
}


/ {
	model = "fsl,MPC8572DS";
	compatible = "fsl,MPC8572DS";
	#address-cells = <1>;
	#size-cells = <1>;

	aliases {
		ethernet0 = &enet0;
		ethernet1 = &enet1;
		ethernet2 = &enet2;
		ethernet3 = &enet3;
		serial0 = &serial0;
		serial1 = &serial1;
		pci0 = &pci0;
		pci1 = &pci1;
		pci2 = &pci2;
	};

	cpus {
		#address-cells = <1>;
		#size-cells = <0>;

		make_cpu("8572", 0);
		make_cpu("8572", 1);
	};

	memory {
		device_type = "memory";
		reg = <0x0 0x0>;	// Filled by U-Boot
	};

	soc8572@ffe00000 {
		#address-cells = <1>;
		#size-cells = <1>;
		device_type = "soc";
		compatible = "simple-bus";
		ranges = <0x0 0xffe00000 0x100000>;
		reg = <0xffe00000 0x1000>;	// CCSRBAR & soc regs, remove once parse code for immrbase fixed
		bus-frequency = <0>;		// Filled out by uboot.

		make_memory_controller(0);
		make_memory_controller(1);

		L2: l2-cache-controller@20000 {
			compatible = "fsl,mpc8572-l2-cache-controller";
			reg = <0x20000 0x1000>;
			cache-line-size = <32>;	// 32 bytes
			cache-size = <0x80000>;	// L2, 512K
			interrupt-parent = <&mpic>;
			interrupts = <16 2>;
		};

		make_i2c(0);
		make_i2c(1);

		make_dma_controller("8572", 1);
		make_dma_controller("8572", 0);

		mdio@24520 {
			#address-cells = <1>;
			#size-cells = <0>;
			compatible = "fsl,gianfar-mdio";
			reg = <0x24520 0x20>;

			for \phy in 0 .. 3 {
				make_ethernet_phy(\phy);
			}
		};

		for \id in 0 .. 3 {
			make_ethernet(\id);
		}

		make_serial(0);
		make_serial(1);

		global-utilities@e0000 {	//global utilities block
			compatible = "fsl,mpc8572-guts";
			reg = <0xe0000 0x1000>;
			fsl,has-rstcr;
		};

		msi@41600 {
			compatible = "fsl,mpc8572-msi", "fsl,mpic-msi";
			reg = <0x41600 0x80>;
			msi-available-ranges = <0 0x100>;
			interrupts = <
				0xe0 0
				0xe1 0
				0xe2 0
				0xe3 0
				0xe4 0
				0xe5 0
				0xe6 0
				0xe7 0>;
			interrupt-parent = <&mpic>;
		};

		crypto@30000 {
			compatible = "fsl,sec3.0", "fsl,sec2.4", "fsl,sec2.2",
				     "fsl,sec2.1", "fsl,sec2.0";
			reg = <0x30000 0x10000>;
			interrupts = <45 2 58 2>;
			interrupt-parent = <&mpic>;
			fsl,num-channels = <4>;
			fsl,channel-fifo-len = <24>;
			fsl,exec-units-mask = <0x9fe>;
			fsl,descriptor-types-mask = <0x3ab0ebf>;
		};

		mpic: pic@40000 {
			interrupt-controller;
			#address-cells = <0>;
			#interrupt-cells = <2>;
			reg = <0x40000 0x40000>;
			compatible = "chrp,open-pic";
			device_type = "open-pic";
		};
	};

	pci0: pcie@ffe08000 {
		cell-index = <0>;
		compatible = "fsl,mpc8548-pcie";
		device_type = "pci";
		#interrupt-cells = <1>;
		#size-cells = <2>;
		#address-cells = <3>;
		reg = <0xffe08000 0x1000>;
		bus-range = <0 255>;
		ranges = <0x2000000 0x0 0x80000000 0x80000000 0x0 0x20000000
			  0x1000000 0x0 0x0 0xffc00000 0x0 0x10000>;
		clock-frequency = <33333333>;
		interrupt-parent = <&mpic>;
		interrupts = <24 2>;
		interrupt-map-mask = <0xff00 0x0 0x0 0x7>;
		interrupt-map = <
			/* IDSEL 0x11 func 0 - PCI slot 1 */
			0x8800 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8800 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8800 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8800 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 1 - PCI slot 1 */
			0x8900 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8900 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8900 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8900 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 2 - PCI slot 1 */
			0x8a00 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8a00 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8a00 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8a00 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 3 - PCI slot 1 */
			0x8b00 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8b00 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8b00 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8b00 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 4 - PCI slot 1 */
			0x8c00 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8c00 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8c00 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8c00 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 5 - PCI slot 1 */
			0x8d00 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8d00 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8d00 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8d00 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 6 - PCI slot 1 */
			0x8e00 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8e00 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8e00 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8e00 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x11 func 7 - PCI slot 1 */
			0x8f00 0x0 0x0 0x1 &mpic 0x2 0x1
			0x8f00 0x0 0x0 0x2 &mpic 0x3 0x1
			0x8f00 0x0 0x0 0x3 &mpic 0x4 0x1
			0x8f00 0x0 0x0 0x4 &mpic 0x1 0x1

			/* IDSEL 0x12 func 0 - PCI slot 2 */
			0x9000 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9000 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9000 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9000 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 1 - PCI slot 2 */
			0x9100 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9100 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9100 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9100 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 2 - PCI slot 2 */
			0x9200 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9200 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9200 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9200 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 3 - PCI slot 2 */
			0x9300 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9300 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9300 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9300 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 4 - PCI slot 2 */
			0x9400 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9400 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9400 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9400 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 5 - PCI slot 2 */
			0x9500 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9500 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9500 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9500 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 6 - PCI slot 2 */
			0x9600 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9600 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9600 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9600 0x0 0x0 0x4 &mpic 0x2 0x1

			/* IDSEL 0x12 func 7 - PCI slot 2 */
			0x9700 0x0 0x0 0x1 &mpic 0x3 0x1
			0x9700 0x0 0x0 0x2 &mpic 0x4 0x1
			0x9700 0x0 0x0 0x3 &mpic 0x1 0x1
			0x9700 0x0 0x0 0x4 &mpic 0x2 0x1

			// IDSEL 0x1c  USB
			0xe000 0x0 0x0 0x1 &i8259 0xc 0x2
			0xe100 0x0 0x0 0x2 &i8259 0x9 0x2
			0xe200 0x0 0x0 0x3 &i8259 0xa 0x2
			0xe300 0x0 0x0 0x4 &i8259 0xb 0x2

			// IDSEL 0x1d  Audio
			0xe800 0x0 0x0 0x1 &i8259 0x6 0x2

			// IDSEL 0x1e Legacy
			0xf000 0x0 0x0 0x1 &i8259 0x7 0x2
			0xf100 0x0 0x0 0x1 &i8259 0x7 0x2

			// IDSEL 0x1f IDE/SATA
			0xf800 0x0 0x0 0x1 &i8259 0xe 0x2
			0xf900 0x0 0x0 0x1 &i8259 0x5 0x2

			>;

		pcie@0 {
			reg = <0x0 0x0 0x0 0x0 0x0>;
			#size-cells = <2>;
			#address-cells = <3>;
			device_type = "pci";
			ranges = <0x2000000 0x0 0x80000000
				  0x2000000 0x0 0x80000000
				  0x0 0x20000000

				  0x1000000 0x0 0x0
				  0x1000000 0x0 0x0
				  0x0 0x100000>;
			uli1575@0 {
				reg = <0x0 0x0 0x0 0x0 0x0>;
				#size-cells = <2>;
				#address-cells = <3>;
				ranges = <0x2000000 0x0 0x80000000
					  0x2000000 0x0 0x80000000
					  0x0 0x20000000

					  0x1000000 0x0 0x0
					  0x1000000 0x0 0x0
					  0x0 0x100000>;
				isa@1e {
					device_type = "isa";
					#interrupt-cells = <2>;
					#size-cells = <1>;
					#address-cells = <2>;
					reg = <0xf000 0x0 0x0 0x0 0x0>;
					ranges = <0x1 0x0 0x1000000 0x0 0x0
						  0x1000>;
					interrupt-parent = <&i8259>;

					i8259: interrupt-controller@20 {
						reg = <0x1 0x20 0x2
						       0x1 0xa0 0x2
						       0x1 0x4d0 0x2>;
						interrupt-controller;
						device_type = "interrupt-controller";
						#address-cells = <0>;
						#interrupt-cells = <2>;
						compatible = "chrp,iic";
						interrupts = <9 2>;
						interrupt-parent = <&mpic>;
					};

					i8042@60 {
						#size-cells = <0>;
						#address-cells = <1>;
						reg = <0x1 0x60 0x1 0x1 0x64 0x1>;
						interrupts = <1 3 12 3>;
						interrupt-parent =
							<&i8259>;

						keyboard@0 {
							reg = <0x0>;
							compatible = "pnpPNP,303";
						};

						mouse@1 {
							reg = <0x1>;
							compatible = "pnpPNP,f03";
						};
					};

					rtc@70 {
						compatible = "pnpPNP,b00";
						reg = <0x1 0x70 0x2>;
					};

					gpio@400 {
						reg = <0x1 0x400 0x80>;
					};
				};
			};
		};

	};

	pci1: pcie@ffe09000 {
		cell-index = <1>;
		compatible = "fsl,mpc8548-pcie";
		device_type = "pci";
		#interrupt-cells = <1>;
		#size-cells = <2>;
		#address-cells = <3>;
		reg = <0xffe09000 0x1000>;
		bus-range = <0 255>;
		ranges = <0x2000000 0x0 0xa0000000 0xa0000000 0x0 0x20000000
			  0x1000000 0x0 0x0 0xffc10000 0x0 0x10000>;
		clock-frequency = <33333333>;
		interrupt-parent = <&mpic>;
		interrupts = <26 2>;
		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
		interrupt-map = <
			/* IDSEL 0x0 */
			0000 0x0 0x0 0x1 &mpic 0x4 0x1
			0000 0x0 0x0 0x2 &mpic 0x5 0x1
			0000 0x0 0x0 0x3 &mpic 0x6 0x1
			0000 0x0 0x0 0x4 &mpic 0x7 0x1
			>;
		pcie@0 {
			reg = <0x0 0x0 0x0 0x0 0x0>;
			#size-cells = <2>;
			#address-cells = <3>;
			device_type = "pci";
			ranges = <0x2000000 0x0 0xa0000000
				  0x2000000 0x0 0xa0000000
				  0x0 0x20000000

				  0x1000000 0x0 0x0
				  0x1000000 0x0 0x0
				  0x0 0x100000>;
		};
	};

	pci2: pcie@ffe0a000 {
		cell-index = <2>;
		compatible = "fsl,mpc8548-pcie";
		device_type = "pci";
		#interrupt-cells = <1>;
		#size-cells = <2>;
		#address-cells = <3>;
		reg = <0xffe0a000 0x1000>;
		bus-range = <0 255>;
		ranges = <0x2000000 0x0 0xc0000000 0xc0000000 0x0 0x20000000
			  0x1000000 0x0 0x0 0xffc20000 0x0 0x10000>;
		clock-frequency = <33333333>;
		interrupt-parent = <&mpic>;
		interrupts = <27 2>;
		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
		interrupt-map = <
			/* IDSEL 0x0 */
			0000 0x0 0x0 0x1 &mpic 0x0 0x1
			0000 0x0 0x0 0x2 &mpic 0x1 0x1
			0000 0x0 0x0 0x3 &mpic 0x2 0x1
			0000 0x0 0x0 0x4 &mpic 0x3 0x1
			>;
		pcie@0 {
			reg = <0x0 0x0 0x0 0x0 0x0>;
			#size-cells = <2>;
			#address-cells = <3>;
			device_type = "pci";
			ranges = <0x2000000 0x0 0xc0000000
				  0x2000000 0x0 0xc0000000
				  0x0 0x20000000

				  0x1000000 0x0 0x0
				  0x1000000 0x0 0x0
				  0x0 0x100000>;
		};
	};
};
