From: Joe Shmo <spamreceptor-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Help with SPI node
Date: Fri, 25 Sep 2009 08:17:08 -0700 (PDT)
Message-ID: <731619.65639.qm@web30107.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I'm attempting to get SPI to work on my embedded design that is based on the mpc8313erbd reference board wiht a 2.6.27 kernel.  I cannot open the SPI device.  Tracing through the kernel code, it looks like the device is not being found in the DTB file.  However there is a SPI node in there already described.  Our boards is a SPI master, and the device we will attach is a SPI slave.  Could someone elaborate on what is needed in the DTS file to have our SPI driver work and respond to an open() call?

I've attached our latest attempt at modifying the DTS file.


 
/*
 * MPC8313E RDB Device Tree Source
 *
 * Copyright 2005, 2006, 2007 Freescale Semiconductor Inc.
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 */
/dts-v1/;
/ {
 model = "MPC8313ERDB";
 compatible = "MPC8313ERDB", "MPC831xRDB", "MPC83xxRDB";
 #address-cells = <1>;
 #size-cells = <1>;
 aliases {
  ethernet0 = &enet0;
  ethernet1 = &enet1;
  serial0 = &serial0;
  serial1 = &serial1;
  pci0 = &pci0;
 };
 cpus {
  #address-cells = <1>;
  #size-cells = <0>;
  PowerPC,8313@0 {
   device_type = "cpu";
   reg = <0x0>;
   d-cache-line-size = <32>;
   i-cache-line-size = <32>;
   d-cache-size = <16384>;
   i-cache-size = <16384>;
   timebase-frequency = <0>; // from bootloader
   bus-frequency = <0>;  // from bootloader
   clock-frequency = <0>;  // from bootloader
  };
 };
 memory {
  device_type = "memory";
  reg = <0x00000000 0x08000000>; // 128MB at 0
 };
 localbus@e0005000 {
  #address-cells = <2>;
  #size-cells = <1>;
  compatible = "fsl,mpc8313-elbc", "fsl,elbc", "simple-bus";
  reg = <0xe0005000 0x1000>;
  interrupts = <77 0x8>;
  interrupt-parent = <&ipic>;
  // CS0 and CS1 are swapped when
  // booting from nand, but the
  // addresses are the same.
  ranges = <0x0 0x0 0xfe000000 0x00200000
            0x1 0x0 0xc0000000 0x02000000
            0x2 0x0 0xf0000000 0x00020000
            0x3 0x0 0xfa000000 0x00008000>;
  /* remapped for our part */
  flash@0,0 {
   #address-cells = <1>;
   #size-cells = <1>;
   compatible = "cfi-flash";
   reg = <0x0 0x0 0x200000>;
   bank-width = <2>;
   device-width = <1>;
   
   u-boot@0 {
    reg = <0x0 0x40000>;
   };
   u-boot-env@40000 {
    reg = <0x40000 0x10000>;
   };
   kernel@50000 {
    reg = <0x50000 0x1A0000>;
   };
   dtb@1F0000 {
    reg = <0x1f0000 0x10000>;
   };
  };
  /* DCC - remapped for our part */
  nand@1,0 {
   #address-cells = <1>;
   #size-cells = <1>;
   compatible = "fsl,mpc8313-fcm-nand",
                "fsl,elbc-fcm-nand";
   reg = <0x1 0x0 0x02000000>;
   fs1@0 {
    reg = <0x0 0x10000000>;
   };
   fs2@10000000 {
    reg = <0x10000000 0x10000000>;
   };
  };
 };
 soc8313@e0000000 {
  #address-cells = <1>;
  #size-cells = <1>;
  device_type = "soc";
  compatible = "simple-bus";
  ranges = <0x0 0xe0000000 0x00100000>;
  reg = <0xe0000000 0x00000200>;
  bus-frequency = <0>;
  wdt@200 {
   device_type = "watchdog";
   compatible = "mpc83xx_wdt";
   reg = <0x200 0x100>;
  };
  /*
  *  FPGA-TNG device
  * used 4 external interrupts
  * IRQ0  - magnetec stripe image writer/reader
  * IRQ1  - picture image writer
  * IRQ2  - RFID reader  -
  * IRQ3 - MiniPCI?
  * IRQ4 - motion devices
  */
  fpga-tng@f0000000 {
   #address-cells = <1>;
   #size-cells = <1>;
   compatible = "fpga-tng";
   ranges;
   /* IRQ 0 level */
   magstripe@00 {
    device_type = "magstripe";
    compatible = "ms_tng";
    reg = <0x00 0x4>;
    interrupts = <48 0x8>;
    interrupt-parent = < &ipic >;
   };
   /* IRQ 1 level */
   tph@5e {
    device_type = "tph";
    compatible = "tph_tng";
    reg = <0x5e 0x4>;
    interrupts = <17 0x8>;
    interrupt-parent = < &ipic >;
   };
   motion@8e {
    device_type = "motion";
    compatible = "motion_tng";
    reg = <0x8e 0x4>;
    interrupts = <20 0x8>;
    interrupt-parent = < &ipic >;
   };
  };
  sleep-nexus {
   #address-cells = <1>;
   #size-cells = <1>;
   compatible = "simple-bus";
   sleep = <&pmc 0x03000000>;
   ranges;
   pit@400 {
    device_type = "pit";
    compatible = "mpc_pit";
    reg = <0x400 0x100>;
    interrupts = <65 0x8>;
    interrupt-parent = < &ipic >;
    clock-frequency = <133333330>;
   };
   i2c@3000 {
    #address-cells = <1>;
    #size-cells = <0>;
    cell-index = <0>;
    compatible = "fsl-i2c";
    reg = <0x3000 0x100>;
    interrupts = <14 0x8>;
    interrupt-parent = <&ipic>;
    dfsrr;
    sensor@48 {
     compatible = "national,lm75";
     reg = <0x48>;
    };
    rtc@68 {
     compatible = "dallas,ds1339";
     reg = <0x68>;
    };
       
   };
   spi@7000 {
    device_type = "spi";
    cell-index = <0>;
    compatible = "fsl,spi","fsl,mpc83xx-spi","fsl,mpc83xx_spi";
    reg = <0x7000 0x1000>;
    interrupts = <21 0x8>;
    interrupt-parent = <&ipic>;
    mode = "cpu";
    
    fsl_m25p80@0 {
     compatible = "fsl,spi";
     reg = <0>;
     voltage-ranges = <3300 3300>;
     spi-max-frequency = <6000000>;
    };  
   }; 
   crypto@30000 {
    compatible = "fsl,sec2.2", "fsl,sec2.1",
                 "fsl,sec2.0";
    reg = <0x30000 0x10000>;
    interrupts = <11 0x8>;
    interrupt-parent = <&ipic>;
    fsl,num-channels = <1>;
    fsl,channel-fifo-len = <24>;
    fsl,exec-units-mask = <0x4c>;
    fsl,descriptor-types-mask = <0x0122003f>;
   };
  };
  i2c@3100 {
   #address-cells = <1>;
   #size-cells = <0>;
   cell-index = <1>;
   compatible = "fsl-i2c";
   reg = <0x3100 0x100>;
   interrupts = <15 0x8>;
   interrupt-parent = <&ipic>;
   dfsrr;
  };
  spi@7000 {
   device_type = "spi";
   cell-index = <0>;
   compatible = "fsl,spi","fsl,mpc83xx_spi";
   reg = <0x7000 0x1000>;
   interrupts = <16 0x8>;
   interrupt-parent = <&ipic>;
   mode = "cpu";
   
   mp85p20@0 {
     compatible = "fsl,spi";
     reg = <0>;
     voltage-ranges = <3300 3300>;
     spi-max-frequency = <6000000>;
   };    
  };
  dma@82a8 {
   #address-cells = <1>;
   #size-cells = <1>;
   compatible = "fsl,mpc8313-dma", "fsl,elo-dma";
   reg = <0x82a8 4>;
   ranges = <0 0x8100 0x1a8>;
   interrupt-parent = <&ipic>;
   interrupts = <71 8>;
   cell-index = <0>;
   dma-channel@0 {
    compatible = "fsl,mpc8313-dma-channel", "fsl,elo-dma-channel";
    reg = <0 0x80>;
    interrupt-parent = <&ipic>;
    interrupts = <71 8>;
   };
   dma-channel@80 {
    compatible = "fsl,mpc8313-dma-channel", "fsl,elo-dma-channel";
    reg = <0x80 0x80>;
    interrupt-parent = <&ipic>;
    interrupts = <71 8>;
   };
   dma-channel@100 {
    compatible = "fsl,mpc8313-dma-channel", "fsl,elo-dma-channel";
    reg = <0x100 0x80>;
    interrupt-parent = <&ipic>;
    interrupts = <71 8>;
   };
   dma-channel@180 {
    compatible = "fsl,mpc8313-dma-channel", "fsl,elo-dma-channel";
    reg = <0x180 0x28>;
    interrupt-parent = <&ipic>;
    interrupts = <71 8>;
   };
  };
  /* phy type (ULPI, UTMI, UTMI_WIDE, SERIAL) */
  usb@23000 {
   compatible = "fsl-usb2-dr";
   reg = <0x23000 0x1000>;
   #address-cells = <1>;
   #size-cells = <0>;
   interrupt-parent = <&ipic>;
   interrupts = <38 0x8>;
   phy_type = "utmi_wide";
   dr_mode = "peripheral";
   sleep = <&pmc 0x00300000>;
  };
  enet0: ethernet@24000 {
   #address-cells = <1>;
   #size-cells = <1>;
   sleep = <&pmc 0x20000000>;
   ranges;
   cell-index = <0>;
   device_type = "network";
   model = "eTSEC";
   compatible = "gianfar", "simple-bus";
   reg = <0x24000 0x1000>;
   local-mac-address = [ 00 00 00 00 00 00 ];
   interrupts = <32 0x8 33 0x8 34 0x8>;
   interrupt-parent = <&ipic>;
   phy-handle = < &phy3 >;
   fsl,magic-packet;
   mdio@24520 {
    #address-cells = <1>;
    #size-cells = <0>;
    compatible = "fsl,gianfar-mdio";
    reg = <0x24520 0x20>;
    phy3: ethernet-phy@3 {
     interrupt-parent = <&ipic>;
     reg = <0x3>;
     device_type = "ethernet-phy";
    };
    phy1: ethernet-phy@1 {
     interrupt-parent = <&ipic>;
     reg = <0x1>;
     device_type = "ethernet-phy";
    };
   };
  };
  enet1: ethernet@25000 {
   cell-index = <1>;
   device_type = "network";
   model = "eTSEC";
   compatible = "gianfar";
   reg = <0x25000 0x1000>;
   local-mac-address = [ 00 00 00 00 00 00 ];
   interrupts = <35 0x8 36 0x8 37 0x8>;
   interrupt-parent = <&ipic>;
   phy-handle = < &phy1 >;
   sleep = <&pmc 0x10000000>;
   fsl,magic-packet;
  };
  serial0: serial@4500 {
   cell-index = <0>;
   device_type = "serial";
   compatible = "ns16550";
   reg = <0x4500 0x100>;
   clock-frequency = <0>;
   interrupts = <9 0x8>;
   interrupt-parent = <&ipic>;
  };
  serial1: serial@4600 {
   cell-index = <1>;
   device_type = "serial";
   compatible = "ns16550";
   reg = <0x4600 0x100>;
   clock-frequency = <0>;
   interrupts = <10 0x8>;
   interrupt-parent = <&ipic>;
  };
  /* IPIC
   * interrupts cell = <intr #, sense>
   * sense values match linux IORESOURCE_IRQ_* defines:
   * sense == 8: Level, low assertion
   * sense == 2: Edge, high-to-low change
   */
  ipic: pic@700 {
   interrupt-controller;
   #address-cells = <0>;
   #interrupt-cells = <2>;
   reg = <0x700 0x100>;
   device_type = "ipic";
  };
  pmc: power@b00 {
   compatible = "fsl,mpc8313-pmc", "fsl,mpc8349-pmc";
   reg = <0xb00 0x100 0xa00 0x100>;
   interrupts = <80 8>;
   interrupt-parent = <&ipic>;
   fsl,mpc8313-wakeup-timer = <&gtm1>;
   /* Remove this (or change to "okay") if you have
    * a REVA3 or later board, if you apply one of the
    * workarounds listed in section 8.5 of the board
    * manual, or if you are adapting this device tree
    * to a different board.
    */
   status = "fail";
  };
  gtm1: timer@500 {
   compatible = "fsl,mpc8313-gtm", "fsl,gtm";
   reg = <0x500 0x100>;
   interrupts = <90 8 78 8 84 8 72 8>;
   interrupt-parent = <&ipic>;
  };
  timer@600 {
   compatible = "fsl,mpc8313-gtm", "fsl,gtm";
   reg = <0x600 0x100>;
   interrupts = <91 8 79 8 85 8 73 8>;
   interrupt-parent = <&ipic>;
  };
 };
 sleep-nexus {
  #address-cells = <1>;
  #size-cells = <1>;
  compatible = "simple-bus";
  sleep = <&pmc 0x00010000>;
  ranges;
  pci0: pci@e0008500 {
   cell-index = <1>;
   interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
   interrupt-map = <
     /* IDSEL 0x0E -mini PCI */
      0x7000 0x0 0x0 0x1 &ipic 18 0x8
      0x7000 0x0 0x0 0x2 &ipic 18 0x8
      0x7000 0x0 0x0 0x3 &ipic 18 0x8
      0x7000 0x0 0x0 0x4 &ipic 18 0x8
     /* IDSEL 0x0F - PCI slot */
      0x7800 0x0 0x0 0x1 &ipic 17 0x8
      0x7800 0x0 0x0 0x2 &ipic 18 0x8
      0x7800 0x0 0x0 0x3 &ipic 17 0x8
      0x7800 0x0 0x0 0x4 &ipic 18 0x8>;
   interrupt-parent = <&ipic>;
   interrupts = <66 0x8>;
   bus-range = <0x0 0x0>;
   ranges = <0x02000000 0x0 0x90000000 0x90000000 0x0 0x10000000
      0x42000000 0x0 0x80000000 0x80000000 0x0 0x10000000
      0x01000000 0x0 0x00000000 0xe2000000 0x0 0x00100000>;
   clock-frequency = <66666666>;
   #interrupt-cells = <1>;
   #size-cells = <2>;
   #address-cells = <3>;
   reg = <0xe0008500 0x100>;
   compatible = "fsl,mpc8349-pci";
   device_type = "pci";
  };
 };
};
