From: Joe Shmo <spamreceptor-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: RE: Help with SPI node
Date: Fri, 2 Oct 2009 07:48:35 -0700 (PDT)
Message-ID: <579971.60179.qm@web30106.mail.mud.yahoo.com>
References: <0784665f-ccdf-40b6-bd59-ea89687f56da@SG2EHSMHS018.ehs.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023109061860459076=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <0784665f-ccdf-40b6-bd59-ea89687f56da-RaUQJvECHivmSZWoU+LsGrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============2023109061860459076==
Content-Type: multipart/alternative; boundary="0-1198297764-1254494915=:60179"

--0-1198297764-1254494915=:60179
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I hope I am replying correctly.
Our big problem is that, though we have a device tree node for SPI defined,=
 we do not see a /dev/spidev when we boot. =A0We have no device we can open=
. =A0If we could open our SPI master, then we can figure probably figure ou=
t everything else.=A0
Note we had not trouble opening I2C which is similarly defined.

--- On Thu, 10/1/09, John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

From: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Help with SPI node
To: "Joe Shmo" <spamreceptor-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY8sQ00jmICUQ@public.gmane.org=
g
Date: Thursday, October 1, 2009, 11:28 AM

I'm no expert, but here's what I do. For my testing in our system, I put a =
device on the bus in the device tree.

In this case I use the at25 eeprom driver and it doesn't yet support the de=
vice tree so it had to be patched to handle that.

Good luck,
John=20


xps_spi_0: xps-spi@84000000 {
=A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "xlnx,xps-spi-2.00.b";
=A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&xps_intc_0>;
=A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D < 0 2 >;
=A0 =A0 =A0 =A0 =A0 =A0 reg =3D < 0x84000000 0x1000 >;
=A0 =A0 =A0 =A0 =A0 =A0 xlnx,family =3D "virtex4";
=A0 =A0 =A0 =A0 =A0 =A0 xlnx,fifo-exist =3D <0x1>;
=A0 =A0 =A0 =A0 =A0 =A0 xlnx,num-ss-bits =3D <0x1>;
=A0 =A0 =A0 =A0 =A0 =A0 xlnx,num-transfer-bits =3D <0x8>;
=A0 =A0 =A0 =A0 =A0 =A0 xlnx,sck-ratio =3D <0x20>;
=A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
=A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <0>;

=A0 =A0 =A0 =A0 =A0 =A0 eeprom@0 {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "at,at25";
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi-max-frequency =3D <100000000>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr-size =3D <2>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 page-size =3D <32>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eeprom-size =3D <1024>;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eeprom-name =3D "johnsat25";
=A0 =A0 =A0 =A0 =A0 =A0 };
=A0 =A0 =A0 =A0 } ;

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
=A0 =A0 =A0 .name =3D "at25080",
=A0 =A0 =A0 .byte_len =3D 1024,
=A0 =A0 =A0 .page_size =3D 32,
=A0 =A0 =A0 .flags =3D EE_ADDR2,=A0=A0=A0 /* 16 bit address */
};

static struct spi_board_info myspi_board_info[] __initdata =3D {
=A0=A0=A0{
=A0 =A0 =A0 /* EEPROM */
=A0 =A0 =A0 .modalias=A0 =A0 =A0 =3D "at25",
=A0 =A0 =A0 .max_speed_hz=A0 =3D 100000000,
=A0 =A0 =A0 .platform_data =3D &eeprom,
=A0=A0=A0},
};

/* The Xilinx SPI driver doesn't assign a bus number such that the
 * SPI subsystem assigns one dynamically and this it the one that
 * happens. The only way I found to find this was to put the eeprom
 * on the SPI bus in the device tree then look in sys.
 */

#define XILINX_SPI_BUS 32766

void register_eeprom(void)
{
=A0=A0=A0 struct spi_master *ptr;

=A0=A0=A0 /* from the bus number we can get to the SPI master controller
=A0=A0=A0=A0=A0* which then lets us add a new device on the bus, the eeprom
=A0=A0=A0=A0=A0*/
=A0=A0=A0 ptr =3D spi_busnum_to_master(XILINX_SPI_BUS);
=A0=A0=A0 if (ptr)
=A0=A0=A0 =A0 =A0 =A0 =A0 spi_new_device(ptr, myspi_board_info);
=A0=A0=A0 else
=A0=A0=A0 =A0=A0=A0 printk("Error: bad bus number for SPI\n");
}

static int __init spi_eeprom_test_init(void)
{
=A0=A0=A0 register_eeprom();

=A0 =A0 =A0 =A0 return 0;
}

static void __exit spi_eeprom_test_exit(void)
{
=A0 =A0 =A0 =A0 printk("Stopping SPI EEPROM test\n");
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
> =A0 =A0=20
> =A0 =A0 fsl_m25p80@0 {
> =A0 =A0=A0=A0compatible =3D "fsl,spi";
> =A0 =A0=A0=A0reg =3D <0>;
> =A0 =A0=A0=A0voltage-ranges =3D <3300
> 3300>;
> =A0 =A0=A0=A0spi-max-frequency =3D
> <6000000>;
> =A0 =A0 };=A0=20
> =A0=A0=A0};=20
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
> =A0=A0=A0};=A0 =A0=20
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
>=20
>=20
>=20
> =A0 =A0 =A0=20
>=20


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


=0A=0A=0A      
--0-1198297764-1254494915=:60179
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">I hope I am replying correctly.<div><br></div=
><div>Our big problem is that, though we have a device tree node for SPI de=
fined, we do not see a /dev/spidev when we boot. &nbsp;We have no device we=
 can open. &nbsp;If we could open our SPI master, then we can figure probab=
ly figure out everything else.&nbsp;</div><div><br></div><div>Note we had n=
ot trouble opening I2C which is similarly defined.<br><div><br>--- On <b>Th=
u, 10/1/09, John Linn <i>&lt;John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org&gt;</i></b> wrote:<br><bl=
ockquote style=3D"border-left: 2px solid rgb(16, 16, 255); margin-left: 5px=
; padding-left: 5px;"><br>From: John Linn &lt;John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org&gt;<br>S=
ubject: RE: Help with SPI node<br>To: "Joe Shmo" &lt;spamreceptor-/E1597aS9LQAvxtiuMwx3w@public.gmane.org=
&gt;, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org<br>Date: Thursday, October 1, 200=
9, 11:28 AM<br><br><div class=3D"plainMail">I'm no expert, but here's what =
I do.
 For my testing in our system, I put a device on the bus in the device tree=
.<br><br>In this case I use the at25 eeprom driver and it doesn't yet suppo=
rt the device tree so it had to be patched to handle that.<br><br>Good luck=
,<br>John <br><br><br>xps_spi_0: xps-spi@84000000 {<br>&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; compatible =3D "xlnx,xps-spi-2.00.b";<br>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; interrupt-parent =3D &lt;&amp;xps_intc_0&gt;;=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interrupts =3D &lt; 0 2 &gt;;=
<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =3D &lt; 0x84000000 0x100=
0 &gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xlnx,family =3D "virte=
x4";<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xlnx,fifo-exist =3D &lt;0=
x1&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xlnx,num-ss-bits =3D &=
lt;0x1&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xlnx,num-transfer-=
bits =3D &lt;0x8&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xlnx,sck=
-ratio =3D
 &lt;0x20&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #address-cells =
=3D &lt;1&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #size-cells =3D=
 &lt;0&gt;;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eeprom@0 {<br>=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D "at,=
at25";<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; spi-max-f=
requency =3D &lt;100000000&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; reg =3D &lt;0&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; addr-size =3D &lt;2&gt;;<br>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; page-size =3D &lt;32&gt;;<br>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eeprom-size =3D &lt;1024&gt;;<br>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eeprom-name =3D "johnsa=
t25";<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>&nbsp; &nbsp; &nbs=
p; &nbsp; } ;<br><br>I also run a kernel module that adds the EEPROM on the=
 bus to
 allow testing since the AT25 driver didn't support device tree yet.<br><br=
><br>#include &lt;linux/module.h&gt;<br>#include &lt;linux/moduleparam.h&gt=
;<br>#include &lt;linux/kernel.h&gt;<br>#include &lt;linux/init.h&gt;<br>#i=
nclude &lt;linux/stat.h&gt;<br><br>#include &lt;linux/spi/spi.h&gt;<br>#inc=
lude &lt;linux/spi/eeprom.h&gt;<br><br><br>MODULE_LICENSE("GPL");<br>MODULE=
_AUTHOR("John Linn");<br><br>static struct spi_eeprom eeprom =3D {<br>&nbsp=
; &nbsp; &nbsp; .name =3D "at25080",<br>&nbsp; &nbsp; &nbsp; .byte_len =3D =
1024,<br>&nbsp; &nbsp; &nbsp; .page_size =3D 32,<br>&nbsp; &nbsp; &nbsp; .f=
lags =3D EE_ADDR2,&nbsp;&nbsp;&nbsp; /* 16 bit address */<br>};<br><br>stat=
ic struct spi_board_info myspi_board_info[] __initdata =3D {<br>&nbsp;&nbsp=
;&nbsp;{<br>&nbsp; &nbsp; &nbsp; /* EEPROM */<br>&nbsp; &nbsp; &nbsp; .moda=
lias&nbsp; &nbsp; &nbsp; =3D "at25",<br>&nbsp; &nbsp; &nbsp; .max_speed_hz&=
nbsp; =3D 100000000,<br>&nbsp; &nbsp; &nbsp; .platform_data =3D
 &amp;eeprom,<br>&nbsp;&nbsp;&nbsp;},<br>};<br><br>/* The Xilinx SPI driver=
 doesn't assign a bus number such that the<br> * SPI subsystem assigns one =
dynamically and this it the one that<br> * happens. The only way I found to=
 find this was to put the eeprom<br> * on the SPI bus in the device tree th=
en look in sys.<br> */<br><br>#define XILINX_SPI_BUS 32766<br><br>void regi=
ster_eeprom(void)<br>{<br>&nbsp;&nbsp;&nbsp; struct spi_master *ptr;<br><br=
>&nbsp;&nbsp;&nbsp; /* from the bus number we can get to the SPI master con=
troller<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* which then lets us add a new dev=
ice on the bus, the eeprom<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br>&nbsp;&nb=
sp;&nbsp; ptr =3D spi_busnum_to_master(XILINX_SPI_BUS);<br>&nbsp;&nbsp;&nbs=
p; if (ptr)<br>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; spi_new_devic=
e(ptr, myspi_board_info);<br>&nbsp;&nbsp;&nbsp; else<br>&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; printk("Error: bad bus number for
 SPI\n");<br>}<br><br>static int __init spi_eeprom_test_init(void)<br>{<br>=
&nbsp;&nbsp;&nbsp; register_eeprom();<br><br>&nbsp; &nbsp; &nbsp; &nbsp; re=
turn 0;<br>}<br><br>static void __exit spi_eeprom_test_exit(void)<br>{<br>&=
nbsp; &nbsp; &nbsp; &nbsp; printk("Stopping SPI EEPROM test\n");<br>}<br><b=
r>module_init(spi_eeprom_test_init);<br>module_exit(spi_eeprom_test_exit);<=
br><br>________________________________________<br>From: devicetree-discuss=
-bounces+john.linn=3D<a ymailto=3D"mailto:xilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" href=
=3D"/mc/compose?to=3Dxilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">xilinx.com-uLR06cmDAlYrcfao8yub6A@public.gmane.org=
rg</a> [mailto:devicetree-discuss-bounces+john.linn=3D<a ymailto=3D"mailto:=
xilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" href=3D"/mc/compose?to=3Dxilinx.com-uLR06cmDAlatORQsKGg5Ig@public.gmane.org=
bs.org">xilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a>] On Behalf Of Joe Shmo<br>Sent: Thu=
rsday, October 01, 2009 10:20 AM<br>To: <a ymailto=3D"mailto:devicetree-dis=
cuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org"
 href=3D"/mc/compose?to=3Ddevicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-d=
iscuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a><br>Subject: Help with SPI node<br><br><br><br>&=
nbsp;<br>&nbsp;I'm attempting to get SPI to work on my embedded design<br>&=
nbsp;that is based on the mpc8313erbd reference board wiht a<br>&nbsp;2.6.2=
7 kernel.&nbsp; I cannot open the SPI device.&nbsp;<br>&nbsp;Tracing throug=
h the kernel code, it looks like the device is<br>&nbsp;not being found in =
the DTB file.&nbsp; However there is a<br>&nbsp;SPI node in there already d=
escribed.&nbsp; Our boards is a<br>&nbsp;SPI master, and the device we will=
 attach is a SPI<br>&nbsp;slave.&nbsp; Could someone elaborate on what is n=
eeded in<br>&nbsp;the DTS file to have our SPI driver work and respond to a=
n<br>&nbsp;open() call?<br>&nbsp;<br>&nbsp;I've attached our latest attempt=
 at modifying the DTS<br>&nbsp;file.<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&gt; =
/*<br>&gt; * MPC8313E RDB Device Tree Source<br>&gt; *<br>&gt; *
 Copyright 2005, 2006, 2007 Freescale Semiconductor Inc.<br>&gt; *<br>&gt; =
* This program is free software; you can<br>&gt; redistribute&nbsp; it and/=
or modify it<br>&gt; * under&nbsp; the terms of&nbsp; the GNU General&nbsp;=
<br>&gt; Public License as published by the<br>&gt; * Free Software Foundat=
ion;&nbsp; either version 2 of<br>&gt; the&nbsp; License, or (at your<br>&g=
t; * option) any later version.<br>&gt; */<br>&gt; /dts-v1/;<br>&gt; / {<br=
>&gt; model =3D "MPC8313ERDB";<br>&gt; compatible =3D "MPC8313ERDB", "MPC83=
1xRDB", "MPC83xxRDB";<br>&gt; #address-cells =3D &lt;1&gt;;<br>&gt; #size-c=
ells =3D &lt;1&gt;;<br>&gt; aliases {<br>&gt; &nbsp; ethernet0 =3D &amp;ene=
t0;<br>&gt; &nbsp; ethernet1 =3D &amp;enet1;<br>&gt; &nbsp; serial0 =3D &am=
p;serial0;<br>&gt; &nbsp; serial1 =3D &amp;serial1;<br>&gt; &nbsp; pci0 =3D=
 &amp;pci0;<br>&gt; };<br>&gt; cpus {<br>&gt; &nbsp; #address-cells =3D &lt=
;1&gt;;<br>&gt; &nbsp; #size-cells =3D &lt;0&gt;;<br>&gt; &nbsp; PowerPC,83=
13@0 {<br>&gt;
 &nbsp;&nbsp;&nbsp;device_type =3D "cpu";<br>&gt; &nbsp;&nbsp;&nbsp;reg =3D=
 &lt;0x0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;d-cache-line-size =3D &lt;32&gt;;<b=
r>&gt; &nbsp;&nbsp;&nbsp;i-cache-line-size =3D &lt;32&gt;;<br>&gt; &nbsp;&n=
bsp;&nbsp;d-cache-size =3D &lt;16384&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;i-cache=
-size =3D &lt;16384&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;timebase-frequency =3D &=
lt;0&gt;; // from<br>&gt; bootloader<br>&gt; &nbsp;&nbsp;&nbsp;bus-frequenc=
y =3D &lt;0&gt;;&nbsp; // from<br>&gt; bootloader<br>&gt; &nbsp;&nbsp;&nbsp=
;clock-frequency =3D &lt;0&gt;;&nbsp; //<br>&gt; from bootloader<br>&gt; &n=
bsp; };<br>&gt; };<br>&gt; memory {<br>&gt; &nbsp; device_type =3D "memory"=
;<br>&gt; &nbsp; reg =3D &lt;0x00000000 0x08000000&gt;; // 128MB at 0<br>&g=
t; };<br>&gt; localbus@e0005000 {<br>&gt; &nbsp; #address-cells =3D &lt;2&g=
t;;<br>&gt; &nbsp; #size-cells =3D &lt;1&gt;;<br>&gt; &nbsp; compatible =3D=
 "fsl,mpc8313-elbc", "fsl,elbc",<br>&gt; "simple-bus";<br>&gt; &nbsp; reg =
=3D &lt;0xe0005000
 0x1000&gt;;<br>&gt; &nbsp; interrupts =3D &lt;77 0x8&gt;;<br>&gt; &nbsp; i=
nterrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; // CS0 and CS1 are sw=
apped when<br>&gt; &nbsp; // booting from nand, but the<br>&gt; &nbsp; // a=
ddresses are the same.<br>&gt; &nbsp; ranges =3D &lt;0x0 0x0 0xfe000000 0x0=
0200000<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x1 0x0<br>&gt; 0=
xc0000000 0x02000000<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x2 =
0x0<br>&gt; 0xf0000000 0x00020000<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 0x3 0x0<br>&gt; 0xfa000000 0x00008000&gt;;<br>&gt; &nbsp; /* remap=
ped for our part */<br>&gt; &nbsp; flash@0,0 {<br>&gt; &nbsp;&nbsp;&nbsp;#a=
ddress-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;#size-cells =3D &lt;1=
&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "cfi-flash";<br>&gt; &nbsp;&=
nbsp;&nbsp;reg =3D &lt;0x0 0x0 0x200000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;bank=
-width =3D &lt;2&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;device-width =3D &lt;1&gt;;=
<br>&gt;
 &nbsp;&nbsp;&nbsp;<br>&gt; &nbsp;&nbsp;&nbsp;u-boot@0 {<br>&gt; &nbsp; &nb=
sp; reg =3D &lt;0x0 0x40000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp=
;&nbsp;&nbsp;u-boot-env@40000 {<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x40000 0=
x10000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp;&nbsp;&nbsp;kernel@5=
0000 {<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x50000 0x1A0000&gt;;<br>&gt; &nbs=
p;&nbsp;&nbsp;};<br>&gt; &nbsp;&nbsp;&nbsp;dtb@1F0000 {<br>&gt; &nbsp; &nbs=
p; reg =3D &lt;0x1f0000 0x10000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &=
nbsp; };<br>&gt; &nbsp; /* DCC - remapped for our part */<br>&gt; &nbsp; na=
nd@1,0 {<br>&gt; &nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<br>&gt; &n=
bsp;&nbsp;&nbsp;#size-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;compat=
ible =3D "fsl,mpc8313-fcm-nand",<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;<br>&gt; "fsl,elbc-fcm-nand";<br>&gt; &nbsp;&nbsp;&nbs=
p;reg =3D &lt;0x1 0x0 0x02000000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;fs1@0 {<br>=
&gt;
 &nbsp; &nbsp; reg =3D &lt;0x0 0x10000000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};=
<br>&gt; &nbsp;&nbsp;&nbsp;fs2@10000000 {<br>&gt; &nbsp; &nbsp; reg =3D &lt=
;0x10000000 0x10000000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp; };<=
br>&gt; };<br>&gt; soc8313@e0000000 {<br>&gt; &nbsp; #address-cells =3D &lt=
;1&gt;;<br>&gt; &nbsp; #size-cells =3D &lt;1&gt;;<br>&gt; &nbsp; device_typ=
e =3D "soc";<br>&gt; &nbsp; compatible =3D "simple-bus";<br>&gt; &nbsp; ran=
ges =3D &lt;0x0 0xe0000000 0x00100000&gt;;<br>&gt; &nbsp; reg =3D &lt;0xe00=
00000 0x00000200&gt;;<br>&gt; &nbsp; bus-frequency =3D &lt;0&gt;;<br>&gt; &=
nbsp; wdt@200 {<br>&gt; &nbsp;&nbsp;&nbsp;device_type =3D "watchdog";<br>&g=
t; &nbsp;&nbsp;&nbsp;compatible =3D "mpc83xx_wdt";<br>&gt; &nbsp;&nbsp;&nbs=
p;reg =3D &lt;0x200 0x100&gt;;<br>&gt; &nbsp; };<br>&gt; &nbsp; /*<br>&gt; =
&nbsp; *&nbsp; FPGA-TNG device<br>&gt; &nbsp; * used 4 external interrupts<=
br>&gt; &nbsp; * IRQ0&nbsp; - magnetec stripe image writer/reader<br>&gt; &=
nbsp; *
 IRQ1&nbsp; - picture image writer<br>&gt; &nbsp; * IRQ2&nbsp; - RFID reade=
r&nbsp; -<br>&gt; &nbsp; * IRQ3 - MiniPCI?<br>&gt; &nbsp; * IRQ4 - motion d=
evices<br>&gt; &nbsp; */<br>&gt; &nbsp; fpga-tng@f0000000 {<br>&gt; &nbsp;&=
nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;#size-ce=
lls =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "fpga-tng";<br>=
&gt; &nbsp;&nbsp;&nbsp;ranges;<br>&gt; &nbsp;&nbsp;&nbsp;/* IRQ 0 level */<=
br>&gt; &nbsp;&nbsp;&nbsp;magstripe@00 {<br>&gt; &nbsp; &nbsp; device_type =
=3D "magstripe";<br>&gt; &nbsp; &nbsp; compatible =3D "ms_tng";<br>&gt; &nb=
sp; &nbsp; reg =3D &lt;0x00 0x4&gt;;<br>&gt; &nbsp; &nbsp; interrupts =3D &=
lt;48 0x8&gt;;<br>&gt; &nbsp; &nbsp; interrupt-parent =3D &lt; &amp;ipic &g=
t;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp;&nbsp;&nbsp;/* IRQ 1 level *=
/<br>&gt; &nbsp;&nbsp;&nbsp;tph@5e {<br>&gt; &nbsp; &nbsp; device_type =3D =
"tph";<br>&gt; &nbsp; &nbsp; compatible =3D "tph_tng";<br>&gt; &nbsp; &nbsp=
; reg =3D
 &lt;0x5e 0x4&gt;;<br>&gt; &nbsp; &nbsp; interrupts =3D &lt;17 0x8&gt;;<br>=
&gt; &nbsp; &nbsp; interrupt-parent =3D &lt; &amp;ipic &gt;;<br>&gt; &nbsp;=
&nbsp;&nbsp;};<br>&gt; &nbsp;&nbsp;&nbsp;motion@8e {<br>&gt; &nbsp; &nbsp; =
device_type =3D "motion";<br>&gt; &nbsp; &nbsp; compatible =3D "motion_tng"=
;<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x8e 0x4&gt;;<br>&gt; &nbsp; &nbsp; int=
errupts =3D &lt;20 0x8&gt;;<br>&gt; &nbsp; &nbsp; interrupt-parent =3D &lt;=
 &amp;ipic &gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp; };<br>&gt; &nb=
sp; sleep-nexus {<br>&gt; &nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<b=
r>&gt; &nbsp;&nbsp;&nbsp;#size-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nb=
sp;compatible =3D "simple-bus";<br>&gt; &nbsp;&nbsp;&nbsp;sleep =3D &lt;&am=
p;pmc 0x03000000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;ranges;<br>&gt; &nbsp;&nbsp=
;&nbsp;pit@400 {<br>&gt; &nbsp; &nbsp; device_type =3D "pit";<br>&gt; &nbsp=
; &nbsp; compatible =3D "mpc_pit";<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x400 =
0x100&gt;;<br>&gt;
 &nbsp; &nbsp; interrupts =3D &lt;65 0x8&gt;;<br>&gt; &nbsp; &nbsp; interru=
pt-parent =3D &lt; &amp;ipic &gt;;<br>&gt; &nbsp; &nbsp; clock-frequency =
=3D &lt;133333330&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp;&nbsp;&nb=
sp;i2c@3000 {<br>&gt; &nbsp; &nbsp; #address-cells =3D &lt;1&gt;;<br>&gt; &=
nbsp; &nbsp; #size-cells =3D &lt;0&gt;;<br>&gt; &nbsp; &nbsp; cell-index =
=3D &lt;0&gt;;<br>&gt; &nbsp; &nbsp; compatible =3D "fsl-i2c";<br>&gt; &nbs=
p; &nbsp; reg =3D &lt;0x3000 0x100&gt;;<br>&gt; &nbsp; &nbsp; interrupts =
=3D &lt;14 0x8&gt;;<br>&gt; &nbsp; &nbsp; interrupt-parent =3D &lt;&amp;ipi=
c&gt;;<br>&gt; &nbsp; &nbsp; dfsrr;<br>&gt; &nbsp; &nbsp; sensor@48 {<br>&g=
t; &nbsp; &nbsp;&nbsp;&nbsp;compatible =3D "national,lm75";<br>&gt; &nbsp; =
&nbsp;&nbsp;&nbsp;reg =3D &lt;0x48&gt;;<br>&gt; &nbsp; &nbsp; };<br>&gt; &n=
bsp; &nbsp; rtc@68 {<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;compatible =3D "dalla=
s,ds1339";<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;reg =3D &lt;0x68&gt;;<br>&gt; &=
nbsp; &nbsp; };<br>&gt;
 &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbs=
p;&nbsp;&nbsp;spi@7000 {<br>&gt; &nbsp; &nbsp; device_type =3D "spi";<br>&g=
t; &nbsp; &nbsp; cell-index =3D &lt;0&gt;;<br>&gt; &nbsp; &nbsp; compatible=
 =3D<br>&gt; "fsl,spi","fsl,mpc83xx-spi","fsl,mpc83xx_spi";<br>&gt; &nbsp; =
&nbsp; reg =3D &lt;0x7000 0x1000&gt;;<br>&gt; &nbsp; &nbsp; interrupts =3D =
&lt;21 0x8&gt;;<br>&gt; &nbsp; &nbsp; interrupt-parent =3D &lt;&amp;ipic&gt=
;;<br>&gt; &nbsp; &nbsp; mode =3D "cpu";<br>&gt; &nbsp; &nbsp; <br>&gt; &nb=
sp; &nbsp; fsl_m25p80@0 {<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;compatible =3D "=
fsl,spi";<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;reg =3D &lt;0&gt;;<br>&gt; &nbsp=
; &nbsp;&nbsp;&nbsp;voltage-ranges =3D &lt;3300<br>&gt; 3300&gt;;<br>&gt; &=
nbsp; &nbsp;&nbsp;&nbsp;spi-max-frequency =3D<br>&gt; &lt;6000000&gt;;<br>&=
gt; &nbsp; &nbsp; };&nbsp; <br>&gt; &nbsp;&nbsp;&nbsp;}; <br>&gt; &nbsp;&nb=
sp;&nbsp;crypto@30000 {<br>&gt; &nbsp; &nbsp; compatible =3D "fsl,sec2.2",
 "fsl,sec2.1",<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>=
&gt; &nbsp;&nbsp;&nbsp;"fsl,sec2.0";<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x30=
000 0x10000&gt;;<br>&gt; &nbsp; &nbsp; interrupts =3D &lt;11 0x8&gt;;<br>&g=
t; &nbsp; &nbsp; interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; &nb=
sp; fsl,num-channels =3D &lt;1&gt;;<br>&gt; &nbsp; &nbsp; fsl,channel-fifo-=
len =3D &lt;24&gt;;<br>&gt; &nbsp; &nbsp; fsl,exec-units-mask =3D &lt;0x4c&=
gt;;<br>&gt; &nbsp; &nbsp; fsl,descriptor-types-mask =3D<br>&gt; &lt;0x0122=
003f&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp; };<br>&gt; &nbsp; i2c=
@3100 {<br>&gt; &nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<br>&gt; &nb=
sp;&nbsp;&nbsp;#size-cells =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;cell-in=
dex =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "fsl-i2c";<br>&=
gt; &nbsp;&nbsp;&nbsp;reg =3D &lt;0x3100 0x100&gt;;<br>&gt; &nbsp;&nbsp;&nb=
sp;interrupts =3D &lt;15 0x8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-paren=
t =3D
 &lt;&amp;ipic&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;dfsrr;<br>&gt; &nbsp; };<br>&=
gt; &nbsp; spi@7000 {<br>&gt; &nbsp;&nbsp;&nbsp;device_type =3D "spi";<br>&=
gt; &nbsp;&nbsp;&nbsp;cell-index =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;c=
ompatible =3D<br>&gt; "fsl,spi","fsl,mpc83xx_spi";<br>&gt; &nbsp;&nbsp;&nbs=
p;reg =3D &lt;0x7000 0x1000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &=
lt;16 0x8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;ipic=
&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;mode =3D "cpu";<br>&gt; &nbsp;&nbsp;&nbsp;<=
br>&gt; &nbsp;&nbsp;&nbsp;mp85p20@0 {<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;comp=
atible =3D "fsl,spi";<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;reg =3D &lt;0&gt;;<b=
r>&gt; &nbsp; &nbsp;&nbsp;&nbsp;voltage-ranges =3D &lt;3300<br>&gt; 3300&gt=
;;<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;spi-max-frequency =3D<br>&gt; &lt;60000=
00&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};&nbsp; &nbsp; <br>&gt; &nbsp; };<br>&gt=
; &nbsp; dma@82a8 {<br>&gt; &nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;=
<br>&gt;
 &nbsp;&nbsp;&nbsp;#size-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;com=
patible =3D "fsl,mpc8313-dma",<br>&gt; "fsl,elo-dma";<br>&gt; &nbsp;&nbsp;&=
nbsp;reg =3D &lt;0x82a8 4&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;ranges =3D &lt;0 0=
x8100 0x1a8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;ip=
ic&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;71 8&gt;;<br>&gt; &nbs=
p;&nbsp;&nbsp;cell-index =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;dma-chann=
el@0 {<br>&gt; &nbsp; &nbsp; compatible =3D "fsl,mpc8313-dma-channel",<br>&=
gt; "fsl,elo-dma-channel";<br>&gt; &nbsp; &nbsp; reg =3D &lt;0 0x80&gt;;<br=
>&gt; &nbsp; &nbsp; interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; =
&nbsp; interrupts =3D &lt;71 8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &n=
bsp;&nbsp;&nbsp;dma-channel@80 {<br>&gt; &nbsp; &nbsp; compatible =3D "fsl,=
mpc8313-dma-channel",<br>&gt; "fsl,elo-dma-channel";<br>&gt; &nbsp; &nbsp; =
reg =3D &lt;0x80 0x80&gt;;<br>&gt; &nbsp; &nbsp; interrupt-parent =3D &lt;&=
amp;ipic&gt;;<br>&gt;
 &nbsp; &nbsp; interrupts =3D &lt;71 8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br=
>&gt; &nbsp;&nbsp;&nbsp;dma-channel@100 {<br>&gt; &nbsp; &nbsp; compatible =
=3D "fsl,mpc8313-dma-channel",<br>&gt; "fsl,elo-dma-channel";<br>&gt; &nbsp=
; &nbsp; reg =3D &lt;0x100 0x80&gt;;<br>&gt; &nbsp; &nbsp; interrupt-parent=
 =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; &nbsp; interrupts =3D &lt;71 8&gt;;<=
br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp;&nbsp;&nbsp;dma-channel@180 {<br=
>&gt; &nbsp; &nbsp; compatible =3D "fsl,mpc8313-dma-channel",<br>&gt; "fsl,=
elo-dma-channel";<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x180 0x28&gt;;<br>&gt;=
 &nbsp; &nbsp; interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; &nbsp=
; interrupts =3D &lt;71 8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp; =
};<br>&gt; &nbsp; /* phy type (ULPI, UTMI, UTMI_WIDE, SERIAL) */<br>&gt; &n=
bsp; usb@23000 {<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "fsl-usb2-dr";<br=
>&gt; &nbsp;&nbsp;&nbsp;reg =3D &lt;0x23000 0x1000&gt;;<br>&gt;
 &nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;=
#size-cells =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D &=
lt;&amp;ipic&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;38 0x8&gt;;<=
br>&gt; &nbsp;&nbsp;&nbsp;phy_type =3D "utmi_wide";<br>&gt; &nbsp;&nbsp;&nb=
sp;dr_mode =3D "peripheral";<br>&gt; &nbsp;&nbsp;&nbsp;sleep =3D &lt;&amp;p=
mc 0x00300000&gt;;<br>&gt; &nbsp; };<br>&gt; &nbsp; enet0: ethernet@24000 {=
<br>&gt; &nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbs=
p;&nbsp;#size-cells =3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;sleep =3D &lt;=
&amp;pmc 0x20000000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;ranges;<br>&gt; &nbsp;&n=
bsp;&nbsp;cell-index =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;device_type =
=3D "network";<br>&gt; &nbsp;&nbsp;&nbsp;model =3D "eTSEC";<br>&gt; &nbsp;&=
nbsp;&nbsp;compatible =3D "gianfar", "simple-bus";<br>&gt; &nbsp;&nbsp;&nbs=
p;reg =3D &lt;0x24000 0x1000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;local-mac-addre=
ss =3D [ 00 00 00 00 00
 00<br>&gt; ];<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;32 0x8 33 0x8 3=
4<br>&gt; 0x8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;=
ipic&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;phy-handle =3D &lt; &amp;phy3 &gt;;<br>=
&gt; &nbsp;&nbsp;&nbsp;fsl,magic-packet;<br>&gt; &nbsp;&nbsp;&nbsp;mdio@245=
20 {<br>&gt; &nbsp; &nbsp; #address-cells =3D &lt;1&gt;;<br>&gt; &nbsp; &nb=
sp; #size-cells =3D &lt;0&gt;;<br>&gt; &nbsp; &nbsp; compatible =3D "fsl,gi=
anfar-mdio";<br>&gt; &nbsp; &nbsp; reg =3D &lt;0x24520 0x20&gt;;<br>&gt; &n=
bsp; &nbsp; phy3: ethernet-phy@3 {<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;interru=
pt-parent =3D<br>&gt; &lt;&amp;ipic&gt;;<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;r=
eg =3D &lt;0x3&gt;;<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;device_type =3D "ether=
net-phy";<br>&gt; &nbsp; &nbsp; };<br>&gt; &nbsp; &nbsp; phy1: ethernet-phy=
@1 {<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;interrupt-parent =3D<br>&gt; &lt;&amp=
;ipic&gt;;<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;reg =3D &lt;0x1&gt;;<br>&gt; &n=
bsp;
 &nbsp;&nbsp;&nbsp;device_type =3D "ethernet-phy";<br>&gt; &nbsp; &nbsp; };=
<br>&gt; &nbsp;&nbsp;&nbsp;};<br>&gt; &nbsp; };<br>&gt; &nbsp; enet1: ether=
net@25000 {<br>&gt; &nbsp;&nbsp;&nbsp;cell-index =3D &lt;1&gt;;<br>&gt; &nb=
sp;&nbsp;&nbsp;device_type =3D "network";<br>&gt; &nbsp;&nbsp;&nbsp;model =
=3D "eTSEC";<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "gianfar";<br>&gt; &n=
bsp;&nbsp;&nbsp;reg =3D &lt;0x25000 0x1000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;l=
ocal-mac-address =3D [ 00 00 00 00 00 00<br>&gt; ];<br>&gt; &nbsp;&nbsp;&nb=
sp;interrupts =3D &lt;35 0x8 36 0x8 37<br>&gt; 0x8&gt;;<br>&gt; &nbsp;&nbsp=
;&nbsp;interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;ph=
y-handle =3D &lt; &amp;phy1 &gt;;<br>&gt; &nbsp;&nbsp;&nbsp;sleep =3D &lt;&=
amp;pmc 0x10000000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;fsl,magic-packet;<br>&gt;=
 &nbsp; };<br>&gt; &nbsp; serial0: serial@4500 {<br>&gt; &nbsp;&nbsp;&nbsp;=
cell-index =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;device_type =3D "serial=
";<br>&gt;
 &nbsp;&nbsp;&nbsp;compatible =3D "ns16550";<br>&gt; &nbsp;&nbsp;&nbsp;reg =
=3D &lt;0x4500 0x100&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;clock-frequency =3D &lt=
;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;9 0x8&gt;;<br>&gt; &nb=
sp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; };<br=
>&gt; &nbsp; serial1: serial@4600 {<br>&gt; &nbsp;&nbsp;&nbsp;cell-index =
=3D &lt;1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;device_type =3D "serial";<br>&gt; =
&nbsp;&nbsp;&nbsp;compatible =3D "ns16550";<br>&gt; &nbsp;&nbsp;&nbsp;reg =
=3D &lt;0x4600 0x100&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;clock-frequency =3D &lt=
;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;10 0x8&gt;;<br>&gt; &n=
bsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp; };<b=
r>&gt; &nbsp; /* IPIC<br>&gt; &nbsp;&nbsp;&nbsp;* interrupts cell =3D &lt;i=
ntr #,<br>&gt; sense&gt;<br>&gt; &nbsp;&nbsp;&nbsp;* sense values match lin=
ux<br>&gt; IORESOURCE_IRQ_* defines:<br>&gt; &nbsp;&nbsp;&nbsp;* sense =3D=
=3D 8: Level, low
 assertion<br>&gt; &nbsp;&nbsp;&nbsp;* sense =3D=3D 2: Edge, high-to-low ch=
ange<br>&gt; &nbsp;&nbsp;&nbsp;*/<br>&gt; &nbsp; ipic: pic@700 {<br>&gt; &n=
bsp;&nbsp;&nbsp;interrupt-controller;<br>&gt; &nbsp;&nbsp;&nbsp;#address-ce=
lls =3D &lt;0&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;#interrupt-cells =3D &lt;2&gt;=
;<br>&gt; &nbsp;&nbsp;&nbsp;reg =3D &lt;0x700 0x100&gt;;<br>&gt; &nbsp;&nbs=
p;&nbsp;device_type =3D "ipic";<br>&gt; &nbsp; };<br>&gt; &nbsp; pmc: power=
@b00 {<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "fsl,mpc8313-pmc",<br>&gt; =
"fsl,mpc8349-pmc";<br>&gt; &nbsp;&nbsp;&nbsp;reg =3D &lt;0xb00 0x100 0xa00 =
0x100&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;80 8&gt;;<br>&gt; &=
nbsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;ipic&gt;;<br>&gt; &nbsp;&nbs=
p;&nbsp;fsl,mpc8313-wakeup-timer =3D<br>&gt; &lt;&amp;gtm1&gt;;<br>&gt; &nb=
sp;&nbsp;&nbsp;/* Remove this (or change to "okay") if<br>&gt; you have<br>=
&gt; &nbsp; &nbsp; * a REVA3 or later board, if you apply one of<br>&gt; th=
e<br>&gt;
 &nbsp; &nbsp; * workarounds listed in section 8.5 of the<br>&gt; board<br>=
&gt; &nbsp; &nbsp; * manual, or if you are adapting this device<br>&gt; tre=
e<br>&gt; &nbsp; &nbsp; * to a different board.<br>&gt; &nbsp; &nbsp; */<br=
>&gt; &nbsp;&nbsp;&nbsp;status =3D "fail";<br>&gt; &nbsp; };<br>&gt; &nbsp;=
 gtm1: timer@500 {<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "fsl,mpc8313-gt=
m",<br>&gt; "fsl,gtm";<br>&gt; &nbsp;&nbsp;&nbsp;reg =3D &lt;0x500 0x100&gt=
;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;90 8 78 8 84 8 72<br>&gt; 8=
&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&amp;ipic&gt;;<br>=
&gt; &nbsp; };<br>&gt; &nbsp; timer@600 {<br>&gt; &nbsp;&nbsp;&nbsp;compati=
ble =3D "fsl,mpc8313-gtm",<br>&gt; "fsl,gtm";<br>&gt; &nbsp;&nbsp;&nbsp;reg=
 =3D &lt;0x600 0x100&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;91 8=
 79 8 85 8 73<br>&gt; 8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D=
 &lt;&amp;ipic&gt;;<br>&gt; &nbsp; };<br>&gt; };<br>&gt; sleep-nexus {<br>&=
gt; &nbsp;
 #address-cells =3D &lt;1&gt;;<br>&gt; &nbsp; #size-cells =3D &lt;1&gt;;<br=
>&gt; &nbsp; compatible =3D "simple-bus";<br>&gt; &nbsp; sleep =3D &lt;&amp=
;pmc 0x00010000&gt;;<br>&gt; &nbsp; ranges;<br>&gt; &nbsp; pci0: pci@e00085=
00 {<br>&gt; &nbsp;&nbsp;&nbsp;cell-index =3D &lt;1&gt;;<br>&gt; &nbsp;&nbs=
p;&nbsp;interrupt-map-mask =3D &lt;0xf800 0x0 0x0<br>&gt; 0x7&gt;;<br>&gt; =
&nbsp;&nbsp;&nbsp;interrupt-map =3D &lt;<br>&gt; &nbsp; &nbsp;&nbsp;&nbsp;/=
* IDSEL 0x0E -mini PCI */<br>&gt; &nbsp; &nbsp; &nbsp; 0x7000 0x0 0x0 0x1 &=
amp;ipic 18 0x8<br>&gt; &nbsp; &nbsp; &nbsp; 0x7000 0x0 0x0 0x2 &amp;ipic 1=
8 0x8<br>&gt; &nbsp; &nbsp; &nbsp; 0x7000 0x0 0x0 0x3 &amp;ipic 18 0x8<br>&=
gt; &nbsp; &nbsp; &nbsp; 0x7000 0x0 0x0 0x4 &amp;ipic 18 0x8<br>&gt; &nbsp;=
 &nbsp;&nbsp;&nbsp;/* IDSEL 0x0F - PCI slot */<br>&gt; &nbsp; &nbsp; &nbsp;=
 0x7800 0x0 0x0 0x1 &amp;ipic 17 0x8<br>&gt; &nbsp; &nbsp; &nbsp; 0x7800 0x=
0 0x0 0x2 &amp;ipic 18 0x8<br>&gt; &nbsp; &nbsp; &nbsp; 0x7800 0x0 0x0 0x3
 &amp;ipic 17 0x8<br>&gt; &nbsp; &nbsp; &nbsp; 0x7800 0x0 0x0 0x4 &amp;ipic=
 18<br>&gt; 0x8&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupt-parent =3D &lt;&am=
p;ipic&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;interrupts =3D &lt;66 0x8&gt;;<br>&gt=
; &nbsp;&nbsp;&nbsp;bus-range =3D &lt;0x0 0x0&gt;;<br>&gt; &nbsp;&nbsp;&nbs=
p;ranges =3D &lt;0x02000000 0x0 0x90000000<br>&gt; 0x90000000 0x0 0x1000000=
0<br>&gt; &nbsp; &nbsp; &nbsp; 0x42000000 0x0 0x80000000 0x80000000<br>&gt;=
 0x0 0x10000000<br>&gt; &nbsp; &nbsp; &nbsp; 0x01000000 0x0 0x00000000 0xe2=
000000<br>&gt; 0x0 0x00100000&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;clock-frequenc=
y =3D &lt;66666666&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;#interrupt-cells =3D &lt;=
1&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;#size-cells =3D &lt;2&gt;;<br>&gt; &nbsp;&=
nbsp;&nbsp;#address-cells =3D &lt;3&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;reg =3D =
&lt;0xe0008500 0x100&gt;;<br>&gt; &nbsp;&nbsp;&nbsp;compatible =3D "fsl,mpc=
8349-pci";<br>&gt; &nbsp;&nbsp;&nbsp;device_type =3D "pci";<br>&gt; &nbsp; =
};<br>&gt;
 };<br>&gt; };<br>&gt; <br>&gt; <br>&gt; <br>&gt; &nbsp; &nbsp; &nbsp; <br>=
&gt; <br><br><br>This email and any attachments are intended for the sole u=
se of the named recipient(s) and contain(s) confidential information that m=
ay be proprietary, privileged or copyrighted under applicable law. If you a=
re not the intended recipient, do not read, copy, or forward this email mes=
sage or any attachments. Delete this email message and any attachments imme=
diately.<br><br><br></div></blockquote></div></div></td></tr></table><br>=
=0A=0A      
--0-1198297764-1254494915=:60179--

--===============2023109061860459076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2023109061860459076==--
