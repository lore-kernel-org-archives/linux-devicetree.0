From: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Help with SPI node
Date: Thu, 1 Oct 2009 10:28:06 -0600
Message-ID: <0784665f-ccdf-40b6-bd59-ea89687f56da@SG2EHSMHS018.ehs.local>
References: <132676.44242.qm@web30102.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <132676.44242.qm-bEaypHPvYmavuULXzWHTWIglqE1Y4D90QQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Joe Shmo <spamreceptor-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I'm no expert, but here's what I do. For my testing in our system, I put a =
device on the bus in the device tree.

In this case I use the at25 eeprom driver and it doesn't yet support the de=
vice tree so it had to be patched to handle that.

Good luck,
John =



xps_spi_0: xps-spi@84000000 {
            compatible =3D "xlnx,xps-spi-2.00.b";
            interrupt-parent =3D <&xps_intc_0>;
            interrupts =3D < 0 2 >;
            reg =3D < 0x84000000 0x1000 >;
            xlnx,family =3D "virtex4";
            xlnx,fifo-exist =3D <0x1>;
            xlnx,num-ss-bits =3D <0x1>;
            xlnx,num-transfer-bits =3D <0x8>;
            xlnx,sck-ratio =3D <0x20>;
            #address-cells =3D <1>;
            #size-cells =3D <0>;

            eeprom@0 {
                compatible =3D "at,at25";
                spi-max-frequency =3D <100000000>;
                reg =3D <0>;
                addr-size =3D <2>;
                page-size =3D <32>;
                eeprom-size =3D <1024>;
                eeprom-name =3D "johnsat25";
            };
        } ;

I also run a kernel module that adds the EEPROM on the bus to allow testing=
 since the AT25 driver didn't support device tree yet.


#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/stat.h>

#include <linux/spi/spi.h>
#include <linux/spi/eeprom.h>


MODULE_LICENSE("GPL");
MODULE_AUTHOR("John Linn");

static struct spi_eeprom eeprom =3D {
      .name =3D "at25080",
      .byte_len =3D 1024,
      .page_size =3D 32,
      .flags =3D EE_ADDR2,	/* 16 bit address */
};

static struct spi_board_info myspi_board_info[] __initdata =3D {
   {
      /* EEPROM */
      .modalias      =3D "at25",
      .max_speed_hz  =3D 100000000,
      .platform_data =3D &eeprom,
   },
};

/* The Xilinx SPI driver doesn't assign a bus number such that the
 * SPI subsystem assigns one dynamically and this it the one that
 * happens. The only way I found to find this was to put the eeprom
 * on the SPI bus in the device tree then look in sys.
 */

#define XILINX_SPI_BUS 32766

void register_eeprom(void)
{
	struct spi_master *ptr;

	/* from the bus number we can get to the SPI master controller
	 * which then lets us add a new device on the bus, the eeprom
	 */
	ptr =3D spi_busnum_to_master(XILINX_SPI_BUS);
	if (ptr)
	        spi_new_device(ptr, myspi_board_info);
	else
		printk("Error: bad bus number for SPI\n");
}

static int __init spi_eeprom_test_init(void)
{
	register_eeprom();

        return 0;
}

static void __exit spi_eeprom_test_exit(void)
{
        printk("Stopping SPI EEPROM test\n");
}

module_init(spi_eeprom_test_init);
module_exit(spi_eeprom_test_exit);

________________________________________
From: devicetree-discuss-bounces+john.linn=3Dxilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org [m=
ailto:devicetree-discuss-bounces+john.linn=3Dxilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] O=
n Behalf Of Joe Shmo
Sent: Thursday, October 01, 2009 10:20 AM
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Subject: Help with SPI node



=A0
=A0I'm attempting to get SPI to work on my embedded design
=A0that is based on the mpc8313erbd reference board wiht a
=A02.6.27 kernel.=A0 I cannot open the SPI device.=A0
=A0Tracing through the kernel code, it looks like the device is
=A0not being found in the DTB file.=A0 However there is a
=A0SPI node in there already described.=A0 Our boards is a
=A0SPI master, and the device we will attach is a SPI
=A0slave.=A0 Could someone elaborate on what is needed in
=A0the DTS file to have our SPI driver work and respond to an
=A0open() call?
=A0
=A0I've attached our latest attempt at modifying the DTS
=A0file.
=A0
=A0
=A0
> /*
> * MPC8313E RDB Device Tree Source
> *
> * Copyright 2005, 2006, 2007 Freescale Semiconductor Inc.
> *
> * This program is free software; you can
> redistribute=A0 it and/or modify it
> * under=A0 the terms of=A0 the GNU General=A0
> Public License as published by the
> * Free Software Foundation;=A0 either version 2 of
> the=A0 License, or (at your
> * option) any later version.
> */
> /dts-v1/;
> / {
> model =3D "MPC8313ERDB";
> compatible =3D "MPC8313ERDB", "MPC831xRDB", "MPC83xxRDB";
> #address-cells =3D <1>;
> #size-cells =3D <1>;
> aliases {
> =A0 ethernet0 =3D &enet0;
> =A0 ethernet1 =3D &enet1;
> =A0 serial0 =3D &serial0;
> =A0 serial1 =3D &serial1;
> =A0 pci0 =3D &pci0;
> };
> cpus {
> =A0 #address-cells =3D <1>;
> =A0 #size-cells =3D <0>;
> =A0 PowerPC,8313@0 {
> =A0=A0=A0device_type =3D "cpu";
> =A0=A0=A0reg =3D <0x0>;
> =A0=A0=A0d-cache-line-size =3D <32>;
> =A0=A0=A0i-cache-line-size =3D <32>;
> =A0=A0=A0d-cache-size =3D <16384>;
> =A0=A0=A0i-cache-size =3D <16384>;
> =A0=A0=A0timebase-frequency =3D <0>; // from
> bootloader
> =A0=A0=A0bus-frequency =3D <0>;=A0 // from
> bootloader
> =A0=A0=A0clock-frequency =3D <0>;=A0 //
> from bootloader
> =A0 };
> };
> memory {
> =A0 device_type =3D "memory";
> =A0 reg =3D <0x00000000 0x08000000>; // 128MB at 0
> };
> localbus@e0005000 {
> =A0 #address-cells =3D <2>;
> =A0 #size-cells =3D <1>;
> =A0 compatible =3D "fsl,mpc8313-elbc", "fsl,elbc",
> "simple-bus";
> =A0 reg =3D <0xe0005000 0x1000>;
> =A0 interrupts =3D <77 0x8>;
> =A0 interrupt-parent =3D <&ipic>;
> =A0 // CS0 and CS1 are swapped when
> =A0 // booting from nand, but the
> =A0 // addresses are the same.
> =A0 ranges =3D <0x0 0x0 0xfe000000 0x00200000
> =A0 =A0 =A0 =A0 =A0 =A0 0x1 0x0
> 0xc0000000 0x02000000
> =A0 =A0 =A0 =A0 =A0 =A0 0x2 0x0
> 0xf0000000 0x00020000
> =A0 =A0 =A0 =A0 =A0 =A0 0x3 0x0
> 0xfa000000 0x00008000>;
> =A0 /* remapped for our part */
> =A0 flash@0,0 {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <1>;
> =A0=A0=A0compatible =3D "cfi-flash";
> =A0=A0=A0reg =3D <0x0 0x0 0x200000>;
> =A0=A0=A0bank-width =3D <2>;
> =A0=A0=A0device-width =3D <1>;
> =A0=A0=A0
> =A0=A0=A0u-boot@0 {
> =A0 =A0 reg =3D <0x0 0x40000>;
> =A0=A0=A0};
> =A0=A0=A0u-boot-env@40000 {
> =A0 =A0 reg =3D <0x40000 0x10000>;
> =A0=A0=A0};
> =A0=A0=A0kernel@50000 {
> =A0 =A0 reg =3D <0x50000 0x1A0000>;
> =A0=A0=A0};
> =A0=A0=A0dtb@1F0000 {
> =A0 =A0 reg =3D <0x1f0000 0x10000>;
> =A0=A0=A0};
> =A0 };
> =A0 /* DCC - remapped for our part */
> =A0 nand@1,0 {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <1>;
> =A0=A0=A0compatible =3D "fsl,mpc8313-fcm-nand",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0
> "fsl,elbc-fcm-nand";
> =A0=A0=A0reg =3D <0x1 0x0 0x02000000>;
> =A0=A0=A0fs1@0 {
> =A0 =A0 reg =3D <0x0 0x10000000>;
> =A0=A0=A0};
> =A0=A0=A0fs2@10000000 {
> =A0 =A0 reg =3D <0x10000000 0x10000000>;
> =A0=A0=A0};
> =A0 };
> };
> soc8313@e0000000 {
> =A0 #address-cells =3D <1>;
> =A0 #size-cells =3D <1>;
> =A0 device_type =3D "soc";
> =A0 compatible =3D "simple-bus";
> =A0 ranges =3D <0x0 0xe0000000 0x00100000>;
> =A0 reg =3D <0xe0000000 0x00000200>;
> =A0 bus-frequency =3D <0>;
> =A0 wdt@200 {
> =A0=A0=A0device_type =3D "watchdog";
> =A0=A0=A0compatible =3D "mpc83xx_wdt";
> =A0=A0=A0reg =3D <0x200 0x100>;
> =A0 };
> =A0 /*
> =A0 *=A0 FPGA-TNG device
> =A0 * used 4 external interrupts
> =A0 * IRQ0=A0 - magnetec stripe image writer/reader
> =A0 * IRQ1=A0 - picture image writer
> =A0 * IRQ2=A0 - RFID reader=A0 -
> =A0 * IRQ3 - MiniPCI?
> =A0 * IRQ4 - motion devices
> =A0 */
> =A0 fpga-tng@f0000000 {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <1>;
> =A0=A0=A0compatible =3D "fpga-tng";
> =A0=A0=A0ranges;
> =A0=A0=A0/* IRQ 0 level */
> =A0=A0=A0magstripe@00 {
> =A0 =A0 device_type =3D "magstripe";
> =A0 =A0 compatible =3D "ms_tng";
> =A0 =A0 reg =3D <0x00 0x4>;
> =A0 =A0 interrupts =3D <48 0x8>;
> =A0 =A0 interrupt-parent =3D < &ipic >;
> =A0=A0=A0};
> =A0=A0=A0/* IRQ 1 level */
> =A0=A0=A0tph@5e {
> =A0 =A0 device_type =3D "tph";
> =A0 =A0 compatible =3D "tph_tng";
> =A0 =A0 reg =3D <0x5e 0x4>;
> =A0 =A0 interrupts =3D <17 0x8>;
> =A0 =A0 interrupt-parent =3D < &ipic >;
> =A0=A0=A0};
> =A0=A0=A0motion@8e {
> =A0 =A0 device_type =3D "motion";
> =A0 =A0 compatible =3D "motion_tng";
> =A0 =A0 reg =3D <0x8e 0x4>;
> =A0 =A0 interrupts =3D <20 0x8>;
> =A0 =A0 interrupt-parent =3D < &ipic >;
> =A0=A0=A0};
> =A0 };
> =A0 sleep-nexus {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <1>;
> =A0=A0=A0compatible =3D "simple-bus";
> =A0=A0=A0sleep =3D <&pmc 0x03000000>;
> =A0=A0=A0ranges;
> =A0=A0=A0pit@400 {
> =A0 =A0 device_type =3D "pit";
> =A0 =A0 compatible =3D "mpc_pit";
> =A0 =A0 reg =3D <0x400 0x100>;
> =A0 =A0 interrupts =3D <65 0x8>;
> =A0 =A0 interrupt-parent =3D < &ipic >;
> =A0 =A0 clock-frequency =3D <133333330>;
> =A0=A0=A0};
> =A0=A0=A0i2c@3000 {
> =A0 =A0 #address-cells =3D <1>;
> =A0 =A0 #size-cells =3D <0>;
> =A0 =A0 cell-index =3D <0>;
> =A0 =A0 compatible =3D "fsl-i2c";
> =A0 =A0 reg =3D <0x3000 0x100>;
> =A0 =A0 interrupts =3D <14 0x8>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 dfsrr;
> =A0 =A0 sensor@48 {
> =A0 =A0=A0=A0compatible =3D "national,lm75";
> =A0 =A0=A0=A0reg =3D <0x48>;
> =A0 =A0 };
> =A0 =A0 rtc@68 {
> =A0 =A0=A0=A0compatible =3D "dallas,ds1339";
> =A0 =A0=A0=A0reg =3D <0x68>;
> =A0 =A0 };
> =A0 =A0 =A0=A0=A0
> =A0=A0=A0};
> =A0=A0=A0spi@7000 {
> =A0 =A0 device_type =3D "spi";
> =A0 =A0 cell-index =3D <0>;
> =A0 =A0 compatible =3D
> "fsl,spi","fsl,mpc83xx-spi","fsl,mpc83xx_spi";
> =A0 =A0 reg =3D <0x7000 0x1000>;
> =A0 =A0 interrupts =3D <21 0x8>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 mode =3D "cpu";
> =A0 =A0 =

> =A0 =A0 fsl_m25p80@0 {
> =A0 =A0=A0=A0compatible =3D "fsl,spi";
> =A0 =A0=A0=A0reg =3D <0>;
> =A0 =A0=A0=A0voltage-ranges =3D <3300
> 3300>;
> =A0 =A0=A0=A0spi-max-frequency =3D
> <6000000>;
> =A0 =A0 };=A0 =

> =A0=A0=A0}; =

> =A0=A0=A0crypto@30000 {
> =A0 =A0 compatible =3D "fsl,sec2.2", "fsl,sec2.1",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0
> =A0=A0=A0"fsl,sec2.0";
> =A0 =A0 reg =3D <0x30000 0x10000>;
> =A0 =A0 interrupts =3D <11 0x8>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 fsl,num-channels =3D <1>;
> =A0 =A0 fsl,channel-fifo-len =3D <24>;
> =A0 =A0 fsl,exec-units-mask =3D <0x4c>;
> =A0 =A0 fsl,descriptor-types-mask =3D
> <0x0122003f>;
> =A0=A0=A0};
> =A0 };
> =A0 i2c@3100 {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <0>;
> =A0=A0=A0cell-index =3D <1>;
> =A0=A0=A0compatible =3D "fsl-i2c";
> =A0=A0=A0reg =3D <0x3100 0x100>;
> =A0=A0=A0interrupts =3D <15 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0dfsrr;
> =A0 };
> =A0 spi@7000 {
> =A0=A0=A0device_type =3D "spi";
> =A0=A0=A0cell-index =3D <0>;
> =A0=A0=A0compatible =3D
> "fsl,spi","fsl,mpc83xx_spi";
> =A0=A0=A0reg =3D <0x7000 0x1000>;
> =A0=A0=A0interrupts =3D <16 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0mode =3D "cpu";
> =A0=A0=A0
> =A0=A0=A0mp85p20@0 {
> =A0 =A0=A0=A0compatible =3D "fsl,spi";
> =A0 =A0=A0=A0reg =3D <0>;
> =A0 =A0=A0=A0voltage-ranges =3D <3300
> 3300>;
> =A0 =A0=A0=A0spi-max-frequency =3D
> <6000000>;
> =A0=A0=A0};=A0 =A0 =

> =A0 };
> =A0 dma@82a8 {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <1>;
> =A0=A0=A0compatible =3D "fsl,mpc8313-dma",
> "fsl,elo-dma";
> =A0=A0=A0reg =3D <0x82a8 4>;
> =A0=A0=A0ranges =3D <0 0x8100 0x1a8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0interrupts =3D <71 8>;
> =A0=A0=A0cell-index =3D <0>;
> =A0=A0=A0dma-channel@0 {
> =A0 =A0 compatible =3D "fsl,mpc8313-dma-channel",
> "fsl,elo-dma-channel";
> =A0 =A0 reg =3D <0 0x80>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 interrupts =3D <71 8>;
> =A0=A0=A0};
> =A0=A0=A0dma-channel@80 {
> =A0 =A0 compatible =3D "fsl,mpc8313-dma-channel",
> "fsl,elo-dma-channel";
> =A0 =A0 reg =3D <0x80 0x80>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 interrupts =3D <71 8>;
> =A0=A0=A0};
> =A0=A0=A0dma-channel@100 {
> =A0 =A0 compatible =3D "fsl,mpc8313-dma-channel",
> "fsl,elo-dma-channel";
> =A0 =A0 reg =3D <0x100 0x80>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 interrupts =3D <71 8>;
> =A0=A0=A0};
> =A0=A0=A0dma-channel@180 {
> =A0 =A0 compatible =3D "fsl,mpc8313-dma-channel",
> "fsl,elo-dma-channel";
> =A0 =A0 reg =3D <0x180 0x28>;
> =A0 =A0 interrupt-parent =3D <&ipic>;
> =A0 =A0 interrupts =3D <71 8>;
> =A0=A0=A0};
> =A0 };
> =A0 /* phy type (ULPI, UTMI, UTMI_WIDE, SERIAL) */
> =A0 usb@23000 {
> =A0=A0=A0compatible =3D "fsl-usb2-dr";
> =A0=A0=A0reg =3D <0x23000 0x1000>;
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <0>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0interrupts =3D <38 0x8>;
> =A0=A0=A0phy_type =3D "utmi_wide";
> =A0=A0=A0dr_mode =3D "peripheral";
> =A0=A0=A0sleep =3D <&pmc 0x00300000>;
> =A0 };
> =A0 enet0: ethernet@24000 {
> =A0=A0=A0#address-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <1>;
> =A0=A0=A0sleep =3D <&pmc 0x20000000>;
> =A0=A0=A0ranges;
> =A0=A0=A0cell-index =3D <0>;
> =A0=A0=A0device_type =3D "network";
> =A0=A0=A0model =3D "eTSEC";
> =A0=A0=A0compatible =3D "gianfar", "simple-bus";
> =A0=A0=A0reg =3D <0x24000 0x1000>;
> =A0=A0=A0local-mac-address =3D [ 00 00 00 00 00 00
> ];
> =A0=A0=A0interrupts =3D <32 0x8 33 0x8 34
> 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0phy-handle =3D < &phy3 >;
> =A0=A0=A0fsl,magic-packet;
> =A0=A0=A0mdio@24520 {
> =A0 =A0 #address-cells =3D <1>;
> =A0 =A0 #size-cells =3D <0>;
> =A0 =A0 compatible =3D "fsl,gianfar-mdio";
> =A0 =A0 reg =3D <0x24520 0x20>;
> =A0 =A0 phy3: ethernet-phy@3 {
> =A0 =A0=A0=A0interrupt-parent =3D
> <&ipic>;
> =A0 =A0=A0=A0reg =3D <0x3>;
> =A0 =A0=A0=A0device_type =3D "ethernet-phy";
> =A0 =A0 };
> =A0 =A0 phy1: ethernet-phy@1 {
> =A0 =A0=A0=A0interrupt-parent =3D
> <&ipic>;
> =A0 =A0=A0=A0reg =3D <0x1>;
> =A0 =A0=A0=A0device_type =3D "ethernet-phy";
> =A0 =A0 };
> =A0=A0=A0};
> =A0 };
> =A0 enet1: ethernet@25000 {
> =A0=A0=A0cell-index =3D <1>;
> =A0=A0=A0device_type =3D "network";
> =A0=A0=A0model =3D "eTSEC";
> =A0=A0=A0compatible =3D "gianfar";
> =A0=A0=A0reg =3D <0x25000 0x1000>;
> =A0=A0=A0local-mac-address =3D [ 00 00 00 00 00 00
> ];
> =A0=A0=A0interrupts =3D <35 0x8 36 0x8 37
> 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0phy-handle =3D < &phy1 >;
> =A0=A0=A0sleep =3D <&pmc 0x10000000>;
> =A0=A0=A0fsl,magic-packet;
> =A0 };
> =A0 serial0: serial@4500 {
> =A0=A0=A0cell-index =3D <0>;
> =A0=A0=A0device_type =3D "serial";
> =A0=A0=A0compatible =3D "ns16550";
> =A0=A0=A0reg =3D <0x4500 0x100>;
> =A0=A0=A0clock-frequency =3D <0>;
> =A0=A0=A0interrupts =3D <9 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0 };
> =A0 serial1: serial@4600 {
> =A0=A0=A0cell-index =3D <1>;
> =A0=A0=A0device_type =3D "serial";
> =A0=A0=A0compatible =3D "ns16550";
> =A0=A0=A0reg =3D <0x4600 0x100>;
> =A0=A0=A0clock-frequency =3D <0>;
> =A0=A0=A0interrupts =3D <10 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0 };
> =A0 /* IPIC
> =A0=A0=A0* interrupts cell =3D <intr #,
> sense>
> =A0=A0=A0* sense values match linux
> IORESOURCE_IRQ_* defines:
> =A0=A0=A0* sense =3D=3D 8: Level, low assertion
> =A0=A0=A0* sense =3D=3D 2: Edge, high-to-low change
> =A0=A0=A0*/
> =A0 ipic: pic@700 {
> =A0=A0=A0interrupt-controller;
> =A0=A0=A0#address-cells =3D <0>;
> =A0=A0=A0#interrupt-cells =3D <2>;
> =A0=A0=A0reg =3D <0x700 0x100>;
> =A0=A0=A0device_type =3D "ipic";
> =A0 };
> =A0 pmc: power@b00 {
> =A0=A0=A0compatible =3D "fsl,mpc8313-pmc",
> "fsl,mpc8349-pmc";
> =A0=A0=A0reg =3D <0xb00 0x100 0xa00 0x100>;
> =A0=A0=A0interrupts =3D <80 8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0fsl,mpc8313-wakeup-timer =3D
> <&gtm1>;
> =A0=A0=A0/* Remove this (or change to "okay") if
> you have
> =A0 =A0 * a REVA3 or later board, if you apply one of
> the
> =A0 =A0 * workarounds listed in section 8.5 of the
> board
> =A0 =A0 * manual, or if you are adapting this device
> tree
> =A0 =A0 * to a different board.
> =A0 =A0 */
> =A0=A0=A0status =3D "fail";
> =A0 };
> =A0 gtm1: timer@500 {
> =A0=A0=A0compatible =3D "fsl,mpc8313-gtm",
> "fsl,gtm";
> =A0=A0=A0reg =3D <0x500 0x100>;
> =A0=A0=A0interrupts =3D <90 8 78 8 84 8 72
> 8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0 };
> =A0 timer@600 {
> =A0=A0=A0compatible =3D "fsl,mpc8313-gtm",
> "fsl,gtm";
> =A0=A0=A0reg =3D <0x600 0x100>;
> =A0=A0=A0interrupts =3D <91 8 79 8 85 8 73
> 8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0 };
> };
> sleep-nexus {
> =A0 #address-cells =3D <1>;
> =A0 #size-cells =3D <1>;
> =A0 compatible =3D "simple-bus";
> =A0 sleep =3D <&pmc 0x00010000>;
> =A0 ranges;
> =A0 pci0: pci@e0008500 {
> =A0=A0=A0cell-index =3D <1>;
> =A0=A0=A0interrupt-map-mask =3D <0xf800 0x0 0x0
> 0x7>;
> =A0=A0=A0interrupt-map =3D <
> =A0 =A0=A0=A0/* IDSEL 0x0E -mini PCI */
> =A0 =A0 =A0 0x7000 0x0 0x0 0x1 &ipic 18 0x8
> =A0 =A0 =A0 0x7000 0x0 0x0 0x2 &ipic 18 0x8
> =A0 =A0 =A0 0x7000 0x0 0x0 0x3 &ipic 18 0x8
> =A0 =A0 =A0 0x7000 0x0 0x0 0x4 &ipic 18 0x8
> =A0 =A0=A0=A0/* IDSEL 0x0F - PCI slot */
> =A0 =A0 =A0 0x7800 0x0 0x0 0x1 &ipic 17 0x8
> =A0 =A0 =A0 0x7800 0x0 0x0 0x2 &ipic 18 0x8
> =A0 =A0 =A0 0x7800 0x0 0x0 0x3 &ipic 17 0x8
> =A0 =A0 =A0 0x7800 0x0 0x0 0x4 &ipic 18
> 0x8>;
> =A0=A0=A0interrupt-parent =3D <&ipic>;
> =A0=A0=A0interrupts =3D <66 0x8>;
> =A0=A0=A0bus-range =3D <0x0 0x0>;
> =A0=A0=A0ranges =3D <0x02000000 0x0 0x90000000
> 0x90000000 0x0 0x10000000
> =A0 =A0 =A0 0x42000000 0x0 0x80000000 0x80000000
> 0x0 0x10000000
> =A0 =A0 =A0 0x01000000 0x0 0x00000000 0xe2000000
> 0x0 0x00100000>;
> =A0=A0=A0clock-frequency =3D <66666666>;
> =A0=A0=A0#interrupt-cells =3D <1>;
> =A0=A0=A0#size-cells =3D <2>;
> =A0=A0=A0#address-cells =3D <3>;
> =A0=A0=A0reg =3D <0xe0008500 0x100>;
> =A0=A0=A0compatible =3D "fsl,mpc8349-pci";
> =A0=A0=A0device_type =3D "pci";
> =A0 };
> };
> };
> =

> =

> =

> =A0 =A0 =A0 =

> =



This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
