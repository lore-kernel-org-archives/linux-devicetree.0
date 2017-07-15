Return-Path: <SRS0=c8EM=6S=wolf-entwicklungen.de=marcus.wolf@kernel.org>
Date: Sat, 15 Jul 2017 13:15:43 +0200 (CEST)
From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Message-ID: <197075499.65628.1500117344413@ox.hosteurope.de>
In-Reply-To: <20170712074305.GA20198@kroah.com>
References: <281067739.16216.1499788929736@ox.hosteurope.de>
 <20170712074305.GA20198@kroah.com>
Subject: Re: Submit of a driver for Pi433 - a radio module for Raspberry Pi
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_65627_1469814005.1500117343632"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, grant.likely@linaro.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

------=_Part_65627_1469814005.1500117343632
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Greg,
=20
thanks for your reply :-)
=20
Today I moved the documentation and header files to drivers/staging/pi433 a=
nd
fromated it as a single patch.
=20
Cheers,
=20
Marcus
=20
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 268d4e6..fdf060c 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -110,4 +110,6 @@ source "drivers/staging/ccree/Kconfig"
=20
 source "drivers/staging/typec/Kconfig"
=20
+source "drivers/staging/pi433/Kconfig"
+
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index b93e6f5..998f644 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -44,3 +44,4 @@ obj-$(CONFIG_KS7010)        +=3D ks7010/
 obj-$(CONFIG_GREYBUS)        +=3D greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)    +=3D vc04_services/
 obj-$(CONFIG_CRYPTO_DEV_CCREE)    +=3D ccree/
+obj-$(CONFIG_PI433)        +=3D pi433/
diff --git a/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.d=
ts
b/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
new file mode 100644
index 0000000..004b502
--- /dev/null
+++ b/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
@@ -0,0 +1,53 @@
+// Definitions for Pi433
+/dts-v1/;
+/plugin/;
+
+/ {
+        compatible =3D "bcm,bcm2835", "bcm,bcm2708", "bcm,bcm2709";
+
+        fragment@0 {
+                target =3D <&spi0>;
+                __overlay__ {
+                        status =3D "okay";
+
+                        spidev@0{
+                                status =3D "disabled";
+                        };
+
+                        spidev@1{
+                                status =3D "disabled";
+                        };
+                };
+        };
+
+    fragment@1 {
+        target =3D <&gpio>;
+        __overlay__ {
+            pi433_pins: pi433_pins {
+                brcm,pins =3D <7 25 24>;
+                brcm,function =3D <0 0 0>; // in in in
+            };
+        };
+    };
+
+    fragment@2 {
+        target =3D <&spi0>;
+        __overlay__ {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+            status =3D "okay";
+
+            pi433: pi433@0 {
+                compatible =3D "Smarthome-Wolf,pi433";
+                reg =3D <0>;
+                spi-max-frequency =3D <10000000>;
+                status =3D "okay";
+
+                pinctrl-0 =3D <&pi433_pins>;
+                DIO0-gpio =3D <&gpio 24 0>;
+                DIO1-gpio =3D <&gpio 25 0>;
+                DIO2-gpio =3D <&gpio  7 0>;
+            };
+        };
+    };
+};
diff --git a/drivers/staging/pi433/Documentation/devicetree/pi433.txt
b/drivers/staging/pi433/Documentation/devicetree/pi433.txt
new file mode 100644
index 0000000..14197c6
--- /dev/null
+++ b/drivers/staging/pi433/Documentation/devicetree/pi433.txt
@@ -0,0 +1,62 @@
+* Smarthome-Wolf Pi433 - a 433MHz radio module/shield for Raspberry Pi (se=
e
www.pi433.de)
+
+Required properties:
+- compatible: must be "Smarthome-Wolf,pi433"
+- reg: chip select of SPI Interface
+- DIOx-gpio must be dedicated to the GPIO, connected with DIOx of the RFM6=
9
module
+
+
+Example:
+
+With the following lines in gpio-section, the gpio pins, connected with pi=
433
are
+reserved/declared.
+
+&gpio{
+    [...]
+
+    pi433_pins: pi433_pins {
+        brcm,pins =3D <7 25 24>;
+        brcm,function =3D <0 0 0>; // in in in
+    };
+
+    [...]
+}
+
+With the following lines in spi section, the device pi433 is declared.
+It consists of the three gpio pins and an spi interface (here chip select =
0)
+
+&spi0{
+    [...]
+
+    pi433: pi433@0 {
+        compatible =3D "Smarthome-Wolf,pi433";
+        reg =3D <0>; /* CE 0 */
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        spi-max-frequency =3D <10000000>;
+
+        pinctrl-0 =3D <&pi433_pins>;
+        DIO0-gpio =3D <&gpio 24 0>;
+        DIO1-gpio =3D <&gpio 25 0>;
+        DIO2-gpio =3D <&gpio  7 0>;
+    };
+}
+
+
+
+For Raspbian users only
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Since Raspbian supports device tree overlays, you may use and overlay, ins=
tead
+of editing your boards device tree.
+For using the overlay, you need to compile the file pi433-overlay.dts you =
can
+find aside to this documentation.
+The file needs to be compiled - either manually or by integration in your
kernel
+source tree. For a manual compile, you may use a command line like the
following:
+'linux/scripts/dtc/dtc -@ -I dts -O dtb -o pi433.dtbo pi433-overlay.dts'
+
+For compiling inside of the kernel tree, you need to copy pi433-overlay.dt=
s to
+arch/arm/boot/dts/overlays and you need to add the file to the list of fil=
es
+in the Makefile over there. Execute 'make dtbs' in kernel tree root to mak=
e the
+kernel make files compile the device tree overlay for you.
+
+
diff --git a/drivers/staging/pi433/Documentation/pi433.txt
b/drivers/staging/pi433/Documentation/pi433.txt
new file mode 100644
index 0000000..860dd0f
--- /dev/null
+++ b/drivers/staging/pi433/Documentation/pi433.txt
@@ -0,0 +1,274 @@
+=3D=3D=3D=3D=3D
+Pi433
+=3D=3D=3D=3D=3D
+
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+This driver is for controlling pi433, a radio module for the Raspberry Pi
+(www.pi433.de). It supports transmission and reception. It can be opened
+by multiple applications for transmission and reception. While transmit
+jobs were queued and process automatically in the background, the first =
=20
+application asking for reception will block out all other applications =20
+until something gets received terminates the read request. =20
+The driver supports on the fly reloading of the hardware fifo of the rf
+chip, thus enabling for much longer telegrams then hardware fifo size.
+
+Discription of driver operation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+a) transmission
+
+Each transmission can take place with a different configuration of the rf
+module. Therfore each application can set its own set of parameters. The d=
river
+takes care, that each transmission takes place with the parameterset of th=
e
+application, that requests the transmission. To allow the transmission to =
take
+place in the background, a tx thread is introduced.
+The transfer of data from the main thread to the tx thread is realised by =
a
+kfifo. With each write request of an application, the passed in data and t=
he
+corresponding parameter set gets written to the kfifo. =20
+On the other "side" of the kfifo, the tx thread continuously checks, wheth=
er
the
+kfifo is empty. If not, it gets one set of config and data from the kfifo.=
 If =20
+there is no receive request or the receiver is still waiting for something=
 in
+the air, the rf module is set to standby, the parameters for transmission =
gets
+set, the hardware fifo of the rf chip gets preloaded and the transmission =
gets
+started. Upon hardware fifo threshold interrupt it gets reloaded, thus ena=
bling
+much longer telegrams then hardware fifo size. If the telegram is send and
there
+is more data available in the kfifo, the procedure is repeated. If not the
+transmission cycle ends.
+
+b) reception
+
+Since there is only one application allowed to receive data at a time, for
+reception there is only one configuration set.
+As soon as an application sets an request for receiving a telegram, the
reception
+configuration set is written to the rf module and it gets set into receivi=
ng
mode. =20
+Now the driver is waiting, that a predefined RSSI level (signal strength a=
t the
+receiver) is reached. Until this hasn't happened, the reception can be
+interrupted by the transmission thread at any time to insert a transmissio=
n
cycle.
+As soon as the predefined RSSI level is meat, a receiving cycle starts. Si=
milar
+as described for the transmission cycle the read out of the hardware fifo =
is
done
+dynamically. Upon each hardware fifo threshold interrupt, a portion of dat=
a
gets
+read. So also for reception it is possible to receive more data then the
hardware
+fifo can hold.
+
+
+Driver API
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The driver is currently implemented as a character device. Therefore it
supports
+the calls open, ioctl, read, write and close.
+
+
+params for ioctl
+----------------
+
+There are four options: =20
+PI433_IOC_RD_TX_CFG - get the transmission parameters from the driver
+PI433_IOC_WR_TX_CFG - set the transmission parameters
+PI433_IOC_RD_RX_CFG - get the receiving parameters from the driver
+PI433_IOC_WR_RX_CFG - set the receiving parameters =20
+
+The tx configuration is transfered via struct pi433_tx_cfg, the parameters=
et
for transmission. =20
+It is devided into two sections: rf parameters and packet format.
+
+rf params:
+    frequency
+        frequency used for transmission. =20
+        Allowed values: 433050000...434790000
+    bit_rate
+        bit rate used for transmission. =20
+        Allowed values: #####
+    dev_frequency
+        frequency deviation in case of FSK. =20
+        Allowed values: 600...500000
+    modulation
+        FSK - frequency shift key
+        OOK - On-Off-key
+    modShaping
+        shapingOff    - no shaping
+        shaping1_0    - gauss filter with BT 1 (FSK only)
+        shaping0_5    - gauss filter with BT 0.5 (FSK only)
+        shaping0_3    - gauss filter with BT 0.3 (FSK only)
+        shapingBR    - filter cut off at BR (OOK only)
+        shaping2BR    - filter cut off at 2*BR (OOK only)
+    paRamp (FSK only)
+        ramp3400    - amp ramps up in 3.4ms
+        ramp2000    - amp ramps up in 2.0ms
+        ramp1000    - amp ramps up in 1ms
+        ramp500        - amp ramps up in 500us
+        ramp250        - amp ramps up in 250us
+        ramp125        - amp ramps up in 125us
+        ramp100        - amp ramps up in 100us
+        ramp62        - amp ramps up in 62us
+        ramp50        - amp ramps up in 50us
+        ramp40        - amp ramps up in 40us
+        ramp31        - amp ramps up in 31us
+        ramp25        - amp ramps up in 25us
+        ramp20        - amp ramps up in 20us
+        ramp15        - amp ramps up in 15us
+        ramp12        - amp ramps up in 12us
+        ramp10        - amp ramps up in 10us
+    tx_start_condition
+        fifoLevel    - transmission starts, if fifo is filled to
+                  threshold level
+        fifoNotEmpty    - transmission starts, as soon as there is one
+                  byte in internal fifo
+    repetitions
+        This gives the option, to send a telegram multiple times. Default:=
 1
+
+packet format:
+    enable_preamble
+        optionOn    - a preamble will be automatically generated
+        optionOff    - no preamble will be generated
+    enable_sync
+        optionOn    - a sync word will be automatically added to
+                  the telegram after preamble
+        optionOff    - no sync word will be added
+        Attention: While possible to generate sync without preamble, the
+        receiver won't be able to detect the sync without preamble.
+    enable_length_byte
+        optionOn    - the length of the telegram will be automatically
+                  added to the telegram. It's part of the payload
+        optionOff    - no length information will be automatically added
+                  to the telegram.
+        Attention: For telegram length over 255 bytes, this option can't b=
e
used
+        Attention: should be used in combination with sync, only
+    enable_address_byte
+        optionOn    - the address byte will be automatically added to the
+                  telgram. It's part of the payload
+        optionOff    - the address byte will not be added to the telegram.
+        The address byte can be used for address filtering, so the receive=
r
+        will only receive telegrams with a given address byte.
+        Attention: should be used in combination with sync, only
+    enable_crc
+        optionOn    - an crc will be automatically calculated over the
+                  payload of the telegram and added to the telegram
+                  after payload.
+        optionOff    - no crc will be calculated       =20
+    preamble_length
+        length of the preamble. Allowed values: 0...65536
+    sync_length
+        length of the sync word. Allowed values: 0...8
+    fixed_message_length
+        length of the payload of the telegram. Will override the length
+        given by the buffer, passed in with the write command. Will be
+        ignored if set to zero.
+    sync_pattern[8]
+        contains up to eight values, that are used as the sync pattern
+        on sync option
+    address_byte
+        one byte, used as address byte on address byte option.
+
+
+The rx configuration is transfered via struct pi433_rx_cfg, the parameters=
et
for receiving. It is devided into two sections: rf parameters and packet fo=
rmat.
+
+rf params:
+    frequency
+        frequency used for transmission. =20
+        Allowed values: 433050000...434790000
+    bit_rate
+        bit rate used for transmission.
+        Allowed values: #####
+    dev_frequency
+        frequency deviation in case of FSK.
+        Allowed values: 600...500000
+    modulation
+        FSK - frequency shift key
+        OOK - on off key
+    rssi_threshold
+        threshold value for the signal strength on the receiver input.
+        If this value is exeeded, a reception cycle starts
+        Allowed values: 0...255
+    thresholdDecrement
+        in order to adapt to different levels of singnal strength, over
+        time the receiver gets more and more sensitive. This value =20
+        determs, how fast the sensitivity increases.
+        step_0_5db    - increase in 0,5dB steps
+        step_1_0db    - increase in 1 db steps
+        step_1_5db    - increase in 1,5dB steps
+        step_2_0db    - increase in 2 db steps
+        step_3_0db    - increase in 3 db steps
+        step_4_0db    - increase in 4 db steps
+        step_5_0db    - increase in 5 db steps
+        step_6_0db    - increase in 6 db steps
+    antennaImpedance
+        sets the electrical adoption of the antenna
+        fiftyOhm    - for antennas with an impedance of 50Ohm
+        twohundretOhm    - for antennas with an impedance of 200Ohm
+    lnaGain
+        sets the gain of the low noise amp
+        automatic    - lna gain is determed by an agc
+        max        - lna gain is set to maximum
+        maxMinus6    - lna gain is set to  6db below max
+        maxMinus12    - lna gain is set to 12db below max
+        maxMinus24    - lna gain is set to 24db below max
+        maxMinus36    - lna gain is set to 36db below max
+        maxMinus48    - lna gain is set to 48db below max
+    bw_mantisse
+        sets the bandwidth of the channel filter - part one: mantisse. =20
+        mantisse16    - mantisse is set to 16
+        mantisse20    - mantisse is set to 20
+        mantisse24    - mantisse is set to 24
+    bw_exponent
+        sets the bandwidth of the channel filter - part two: exponent. =20
+        Allowd values: 0...7
+    dagc;
+        operation mode of the digital automatic gain control
+        normalMode
+        improve
+        improve4LowModulationIndex
+
+ packet format:
+    enable_sync
+        optionOn  - sync detection is enabled. If configured sync pattern
+                isn't found, telegram will be internally discarded =20
+        optionOff - sync detection is disabled.
+    enable_length_byte
+        optionOn   - First byte of payload will be used as length byte, =
=20
+                 regardless of the amount of bytes that were requested =20
+                 by the read request.
+        optionOff  - Number of bytes to be read will be set according to
+                 amount of bytes that were requested by the read request.
+        Attention: should be used in combination with sync, only
+    enable_address_filtering;
+        filteringOff        - no adress filtering will take place
+        nodeAddress        - all telegrams, not matching the node =20
+                      address will be internally discarded
+        nodeOrBroadcastAddress    - all telegrams, neither matching the
+                      node, nor the broadcast address will
+                      be internally discarded
+        Attention: Sync option must be enabled in order to use this featur=
e
+    enable_crc
+        optionOn    - a crc will be calculated over the payload of
+                  the telegram, that was received. If the
+                  calculated crc doesn't match to two bytes,
+                  that follow the payload, the telegram will be
+                  internally discarded.
+        Attention: This option is only operational, if sync on and fixed l=
ength
+        or length byte is used
+    sync_length
+        Gives the length of the payload. =20
+        Attention: This setting must meet the setting of the transmitter,
+        if sync option is used.
+    fixed_message_length
+        Overrides the telegram length either given by the first byte of
+        payload or by the read request.
+    bytes_to_drop
+        gives the number of bytes, that will be dropped before transfering
+        data to the read buffer
+        This option is only usefull, if all packet helper are switched
+        off and the rf chip is used in raw receiving mode. This may be
+        needed, if a telegram of a third party device should be received,
+        using a protocol not compatible with the packet engine of the rf69
chip.
+    sync_pattern[8]
+        contains up to eight values, that are used as the sync pattern
+        on sync option.
+        This setting must meet the configuration of the transmitting devic=
e,
+        if sync option is enabled.
+    node_address
+        one byte, used as node address byte on address byte option.
+    broadcast_address
+        one byte, used as broadcast address byte on address byte option.
+       =20
+
diff --git a/drivers/staging/pi433/Kconfig b/drivers/staging/pi433/Kconfig
new file mode 100644
index 0000000..61b4b4e
--- /dev/null
+++ b/drivers/staging/pi433/Kconfig
@@ -0,0 +1,16 @@
+config PI433
+        tristate "Pi433 - a 433MHz radio module for Raspberry Pi"
+        default n
+        ---help---
+          This option allows you to enable support for the radio module Pi=
433.
+
+          Pi433 is a shield that fits onto the GPIO header of a Raspberry =
Pi
+          or compatible. It extends the Raspberry Pi with the option, to
+          send and receive data in the 433MHz ISM band - for example to
+          communicate between two systems without using ethernet or blueto=
oth
+          or for control or read sockets, actors, sensors, widely availabl=
e
+          for low price.
+
+          For details or the option to buy, please visit
https://pi433.de/en.html
+
+          If in doubt, say N here, but saying yes most probably won't hurt
diff --git a/drivers/staging/pi433/Makefile b/drivers/staging/pi433/Makefil=
e
new file mode 100644
index 0000000..417f3e4
--- /dev/null
+++ b/drivers/staging/pi433/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_PI433) +=3D pi433.o
+
+pi433-objs :=3D pi433_if.o rf69.o
diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433=
_if.c
new file mode 100644
index 0000000..57edf91
--- /dev/null
+++ b/drivers/staging/pi433/pi433_if.c
@@ -0,0 +1,1315 @@
+/*
+ * userspace interface for pi433 radio module
+ *
+ * Pi433 is a 433MHz radio module for the Raspberry Pi.
+ * It is based on the HopeRf Module RFM69CW. Therefore inside of this
+ * driver, you'll find an abstraction of the rf69 chip.
+ *
+ * If needed, this driver could be extended, to also support other
+ * devices, basing on HopeRfs rf69.
+ *
+ * The driver can also be extended, to support other modules of
+ * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *    Marcus Wolf <linux@wolf-entwicklungen.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#undef DEBUG
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/idr.h>
+#include <linux/ioctl.h>
+#include <linux/uaccess.h>
+#include <linux/fs.h>
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/err.h>
+#include <linux/kfifo.h>
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kthread.h>
+#include <linux/wait.h>
+#include <linux/spi/spi.h>
+#ifdef CONFIG_COMPAT
+#include <asm/compat.h>
+#endif
+
+#include "pi433_if.h"
+#include "rf69.h"
+
+
+#define N_PI433_MINORS            (1U << MINORBITS) /*32*/    /* ... up to=
 256
*/
+#define MAX_MSG_SIZE            900    /* min: FIFO_SIZE! */
+#define MSG_FIFO_SIZE            65536   /* 65536 =3D 2^16  */
+#define NUM_DIO                2
+
+static dev_t pi433_dev;
+static DEFINE_IDR(pi433_idr);
+static DEFINE_MUTEX(minor_lock); /* Protect idr accesses */
+
+static struct class *pi433_class; /* mainly for udev to create /dev/pi433 =
*/
+
+/* tx config is instance specific
+    so with each open a new tx config struct is needed */
+/* rx config is device specific
+    so we have just one rx config, ebedded in device struct */
+struct pi433_device {
+    /* device handling related values */
+    dev_t            devt;
+    int            minor;
+    struct device        *dev;
+    struct cdev        *cdev;
+    struct spi_device    *spi;
+    unsigned        users;
+
+    /* irq related values */
+    struct gpio_desc    *gpiod[NUM_DIO];
+    int            irq_num[NUM_DIO];
+    u8            irq_state[NUM_DIO];
+
+    /* tx related values */
+    STRUCT_KFIFO_REC_1(MSG_FIFO_SIZE) tx_fifo;
+    struct mutex        tx_fifo_lock; // TODO: check, whether necessary or
obsolete
+    struct task_struct    *tx_task_struct;
+    wait_queue_head_t    tx_wait_queue;
+    u8            free_in_fifo;
+
+    /* rx related values */
+    struct pi433_rx_cfg    rx_cfg;
+    u8            *rx_buffer;
+    unsigned int        rx_buffer_size;
+    u32            rx_bytes_to_drop;
+    u32            rx_bytes_dropped;
+    unsigned int        rx_position;
+    struct mutex        rx_lock;
+    wait_queue_head_t    rx_wait_queue;
+
+    /* fifo wait queue */
+    struct task_struct    *fifo_task_struct;
+    wait_queue_head_t    fifo_wait_queue;
+
+    /* flags */
+    bool            rx_active;
+    bool            tx_active;
+    bool            interrupt_rx_allowed;
+};
+
+struct pi433_instance {
+    struct pi433_device    *device;
+    struct pi433_tx_cfg    tx_cfg;
+};
+
+/*------------------------------------------------------------------------=
-*/
+
+/* macro for checked access of registers of radio module */
+#define SET_CHECKED(retval) \
+    if (retval < 0) \
+        return retval;
+
+/*------------------------------------------------------------------------=
-*/
+
+/* GPIO interrupt handlers */
+static irq_handler_t
+DIO0_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
+{
+    struct pi433_device *device =3D dev_id;
+
+    if      (device->irq_state[DIO0] =3D=3D DIO_PacketSent)
+    {
+        device->free_in_fifo =3D FIFO_SIZE;
+        printk("DIO0 irq: Packet sent\n"); // TODO: printk() should includ=
e
KERN_ facility level
+        wake_up_interruptible(&device->fifo_wait_queue);
+    }
+    else if (device->irq_state[DIO0] =3D=3D DIO_Rssi_DIO0)
+    {
+        printk("DIO0 irq: RSSI level over threshold\n");
+        wake_up_interruptible(&device->rx_wait_queue);
+    }
+    else if (device->irq_state[DIO0] =3D=3D DIO_PayloadReady)
+    {
+        printk("DIO0 irq: PayloadReady\n");
+        device->free_in_fifo =3D 0;
+        wake_up_interruptible(&device->fifo_wait_queue);
+    }
+
+    return (irq_handler_t) IRQ_HANDLED;
+}
+
+static irq_handler_t
+DIO1_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
+{
+    struct pi433_device *device =3D dev_id;
+
+    if      (device->irq_state[DIO1] =3D=3D DIO_FifoNotEmpty_DIO1)
+    {
+        device->free_in_fifo =3D FIFO_SIZE;
+    }
+    else if (device->irq_state[DIO1] =3D=3D DIO_FifoLevel)
+    {
+        if (device->rx_active)    device->free_in_fifo =3D FIFO_THRESHOLD =
- 1;
+        else            device->free_in_fifo =3D FIFO_SIZE - FIFO_THRESHOL=
D - 1;
+    }
+    printk("DIO1 irq: %d bytes free in fifo\n", device->free_in_fifo); // =
TODO:
printk() should include KERN_ facility level
+    wake_up_interruptible(&device->fifo_wait_queue);
+
+    return (irq_handler_t) IRQ_HANDLED;
+}
+
+static void *DIO_irq_handler[NUM_DIO] =3D {
+    DIO0_irq_handler,
+    DIO1_irq_handler
+};
+
+/*------------------------------------------------------------------------=
-*/
+
+static int
+rf69_set_rx_cfg(struct pi433_device *dev, struct pi433_rx_cfg *rx_cfg)
+{
+    int payload_length;
+
+    /* receiver config */
+    SET_CHECKED(rf69_set_frequency    (dev->spi, rx_cfg->frequency));
+    SET_CHECKED(rf69_set_bit_rate    (dev->spi, rx_cfg->bit_rate));
+    SET_CHECKED(rf69_set_modulation    (dev->spi, rx_cfg->modulation));
+    SET_CHECKED(rf69_set_antenna_impedance     (dev->spi,
rx_cfg->antenna_impedance));
+    SET_CHECKED(rf69_set_rssi_threshold     (dev->spi,
rx_cfg->rssi_threshold));
+    SET_CHECKED(rf69_set_ook_threshold_dec     (dev->spi,
rx_cfg->thresholdDecrement));
+    SET_CHECKED(rf69_set_bandwidth          (dev->spi, rx_cfg->bw_mantisse=
,
rx_cfg->bw_exponent));
+    SET_CHECKED(rf69_set_bandwidth_during_afc(dev->spi, rx_cfg->bw_mantiss=
e,
rx_cfg->bw_exponent));
+    SET_CHECKED(rf69_set_dagc          (dev->spi, rx_cfg->dagc));
+
+    dev->rx_bytes_to_drop =3D rx_cfg->bytes_to_drop;
+
+    /* packet config */
+    /* enable */
+    SET_CHECKED(rf69_set_sync_enable(dev->spi, rx_cfg->enable_sync));
+    if (rx_cfg->enable_sync =3D=3D optionOn)
+    {
+        SET_CHECKED(rf69_set_fifo_fill_condition(dev->spi,
afterSyncInterrupt));
+    }
+    else
+    {
+        SET_CHECKED(rf69_set_fifo_fill_condition(dev->spi, always));
+    }
+    SET_CHECKED(rf69_set_packet_format  (dev->spi,
rx_cfg->enable_length_byte));
+    SET_CHECKED(rf69_set_adressFiltering(dev->spi,
rx_cfg->enable_address_filtering));
+    SET_CHECKED(rf69_set_crc_enable        (dev->spi, rx_cfg->enable_crc))=
;
+
+    /* lengths */
+    SET_CHECKED(rf69_set_sync_size(dev->spi, rx_cfg->sync_length));
+    if (rx_cfg->enable_length_byte =3D=3D optionOn)
+    {
+        SET_CHECKED(rf69_set_payload_length(dev->spi, 0xff));
+    }
+    else if (rx_cfg->fixed_message_length !=3D 0)
+    {
+        payload_length =3D rx_cfg->fixed_message_length;
+        if (rx_cfg->enable_length_byte  =3D=3D optionOn) payload_length++;
+        if (rx_cfg->enable_address_filtering !=3D filteringOff) payload_le=
ngth++;
+        SET_CHECKED(rf69_set_payload_length(dev->spi, payload_length));
+    }
+    else
+    {
+        SET_CHECKED(rf69_set_payload_length(dev->spi, 0));
+    }
+
+    /* values */
+    if (rx_cfg->enable_sync =3D=3D optionOn)
+    {
+        SET_CHECKED(rf69_set_sync_values(dev->spi, rx_cfg->sync_pattern));
+    }
+    if (rx_cfg->enable_address_filtering !=3D filteringOff)
+    {
+        SET_CHECKED(rf69_set_node_address     (dev->spi,
rx_cfg->node_address));
+        SET_CHECKED(rf69_set_broadcast_address(dev->spi,
rx_cfg->broadcast_address));
+    }
+
+    return 0;
+}
+
+static int
+rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
+{
+    SET_CHECKED(rf69_set_frequency    (dev->spi, tx_cfg->frequency));
+    SET_CHECKED(rf69_set_bit_rate    (dev->spi, tx_cfg->bit_rate));
+    SET_CHECKED(rf69_set_modulation    (dev->spi, tx_cfg->modulation));
+    SET_CHECKED(rf69_set_deviation    (dev->spi, tx_cfg->dev_frequency));
+    SET_CHECKED(rf69_set_pa_ramp    (dev->spi, tx_cfg->pa_ramp));
+    SET_CHECKED(rf69_set_modulation_shaping(dev->spi, tx_cfg->modShaping))=
;
+    SET_CHECKED(rf69_set_tx_start_condition(dev->spi,
tx_cfg->tx_start_condition));
+
+    /* packet format enable */
+    if (tx_cfg->enable_preamble =3D=3D optionOn)
+    {
+        SET_CHECKED(rf69_set_preamble_length(dev->spi,
tx_cfg->preamble_length));
+    }
+    else
+    {
+        SET_CHECKED(rf69_set_preamble_length(dev->spi, 0));
+    }
+    SET_CHECKED(rf69_set_sync_enable  (dev->spi, tx_cfg->enable_sync));
+    SET_CHECKED(rf69_set_packet_format(dev->spi, tx_cfg->enable_length_byt=
e));
+    SET_CHECKED(rf69_set_crc_enable      (dev->spi, tx_cfg->enable_crc));
+
+    /* configure sync, if enabled */
+    if (tx_cfg->enable_sync =3D=3D optionOn)
+    {
+        SET_CHECKED(rf69_set_sync_size(dev->spi, tx_cfg->sync_length));
+        SET_CHECKED(rf69_set_sync_values(dev->spi, tx_cfg->sync_pattern));
+    }
+
+    return 0;
+}
+
+/*------------------------------------------------------------------------=
-*/
+
+static int
+pi433_start_rx(struct pi433_device *dev)
+{
+    int retval;
+
+    /* return without action, if no pending read request */
+    if (!dev->rx_active)
+        return 0;
+
+    /* setup for receiving */
+    retval =3D rf69_set_rx_cfg(dev, &dev->rx_cfg);
+    if (retval) return retval;
+
+    /* setup rssi irq */
+    SET_CHECKED(rf69_set_dio_mapping(dev->spi, DIO0, DIO_Rssi_DIO0));
+    dev->irq_state[DIO0] =3D DIO_Rssi_DIO0;
+    irq_set_irq_type(dev->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
+
+    /* setup fifo level interrupt */
+    SET_CHECKED(rf69_set_fifo_threshold(dev->spi, FIFO_SIZE - FIFO_THRESHO=
LD));
+    SET_CHECKED(rf69_set_dio_mapping(dev->spi, DIO1, DIO_FifoLevel));
+    dev->irq_state[DIO1] =3D DIO_FifoLevel;
+    irq_set_irq_type(dev->irq_num[DIO1], IRQ_TYPE_EDGE_RISING);
+
+    /* set module to receiving mode */
+    SET_CHECKED(rf69_set_mode(dev->spi, receive));
+
+    return 0;
+}
+
+
+/*------------------------------------------------------------------------=
-*/
+
+int
+pi433_receive(void *data)
+{
+    struct pi433_device *dev =3D data;
+    struct spi_device *spi =3D dev->spi; /* needed for SET_CHECKED */
+    int bytes_to_read, bytes_total;
+    int retval;
+
+    dev->interrupt_rx_allowed =3D false;
+
+    /* wait for any tx to finish */
+    dev_dbg(dev->dev,"rx: going to wait for any tx to finish");
+    retval =3D wait_event_interruptible(dev->rx_wait_queue, !dev->tx_activ=
e);
+    if(retval) /* wait was interrupted */
+    {
+        dev->interrupt_rx_allowed =3D true;
+        wake_up_interruptible(&dev->tx_wait_queue);
+        return retval;
+    }
+
+    /* prepare status vars */
+    dev->free_in_fifo =3D FIFO_SIZE;
+    dev->rx_position =3D 0;
+    dev->rx_bytes_dropped =3D 0;
+
+    /* setup radio module to listen for something "in the air" */
+    retval =3D pi433_start_rx(dev);
+    if (retval)
+        return retval;
+
+    /* now check RSSI, if low wait for getting high (RSSI interrupt) */
+    while ( !rf69_get_flag(dev->spi, rssiExceededThreshold) )
+    {
+        /* allow tx to interrupt us while waiting for high RSSI */
+        dev->interrupt_rx_allowed =3D true;
+        wake_up_interruptible(&dev->tx_wait_queue);
+
+        /* wait for RSSI level to become high */
+        dev_dbg(dev->dev, "rx: going to wait for high RSSI level");
+        retval =3D wait_event_interruptible(dev->rx_wait_queue,
+                                      rf69_get_flag(dev->spi,
+
                                                       rssiExceededThreshol=
d));
+        if (retval) goto abort; /* wait was interrupted */
+        dev->interrupt_rx_allowed =3D false;
+
+        /* cross check for ongoing tx */
+        if (!dev->tx_active) break;
+    }
+
+    /* configure payload ready irq */
+    SET_CHECKED(rf69_set_dio_mapping(spi, DIO0, DIO_PayloadReady));
+    dev->irq_state[DIO0] =3D DIO_PayloadReady;
+    irq_set_irq_type(dev->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
+
+    /* fixed or unlimited length? */
+    if (dev->rx_cfg.fixed_message_length !=3D 0)
+    {
+        if (dev->rx_cfg.fixed_message_length > dev->rx_buffer_size)
+        {
+            retval =3D -1;
+            goto abort;
+        }
+        bytes_total =3D dev->rx_cfg.fixed_message_length;
+        dev_dbg(dev->dev,"rx: msg len set to %d by fixed length", bytes_to=
tal);
+    }
+    else
+    {
+        bytes_total =3D dev->rx_buffer_size;
+        dev_dbg(dev->dev, "rx: msg len set to %d as requested by read",
bytes_total);
+    }
+
+    /* length byte enabled? */
+    if (dev->rx_cfg.enable_length_byte =3D=3D optionOn)
+    {
+        retval =3D wait_event_interruptible(dev->fifo_wait_queue,
+                          dev->free_in_fifo < FIFO_SIZE);
+        if (retval) goto abort; /* wait was interrupted */
+
+        rf69_read_fifo(spi, (u8 *)&bytes_total, 1);
+        if (bytes_total > dev->rx_buffer_size)
+        {
+            retval =3D -1;
+            goto abort;
+        }
+        dev->free_in_fifo++;
+        dev_dbg(dev->dev, "rx: msg len reset to %d due to length byte",
bytes_total);
+    }
+
+    /* address byte enabled? */
+    if (dev->rx_cfg.enable_address_filtering !=3D filteringOff)
+    {
+        u8 dummy;
+
+        bytes_total--;
+
+        retval =3D wait_event_interruptible(dev->fifo_wait_queue,
+                          dev->free_in_fifo < FIFO_SIZE);
+        if (retval) goto abort; /* wait was interrupted */
+
+        rf69_read_fifo(spi, &dummy, 1);
+        dev->free_in_fifo++;
+        dev_dbg(dev->dev, "rx: address byte stripped off");
+    }
+
+    /* get payload */
+    while (dev->rx_position < bytes_total)
+    {
+        if ( !rf69_get_flag(dev->spi, payloadReady) )
+        {
+            retval =3D wait_event_interruptible(dev->fifo_wait_queue,
+                              dev->free_in_fifo < FIFO_SIZE);
+            if (retval) goto abort; /* wait was interrupted */
+        }
+
+        /* need to drop bytes or acquire? */
+        if (dev->rx_bytes_to_drop > dev->rx_bytes_dropped)
+            bytes_to_read =3D dev->rx_bytes_to_drop - dev->rx_bytes_droppe=
d;
+        else
+            bytes_to_read =3D bytes_total - dev->rx_position;
+
+
+        /* access the fifo */
+        if (bytes_to_read > FIFO_SIZE - dev->free_in_fifo)
+            bytes_to_read =3D FIFO_SIZE - dev->free_in_fifo;
+        retval =3D rf69_read_fifo(spi,
+                    &dev->rx_buffer[dev->rx_position],
+                    bytes_to_read);
+        if (retval) goto abort; /* read failed */
+        dev->free_in_fifo +=3D bytes_to_read;
+
+        /* adjust status vars */
+        if (dev->rx_bytes_to_drop > dev->rx_bytes_dropped)
+            dev->rx_bytes_dropped +=3D bytes_to_read;
+        else
+            dev->rx_position +=3D bytes_to_read;
+    }
+
+
+    /* rx done, wait was interrupted or error occured */
+abort:
+    dev->interrupt_rx_allowed =3D true;
+    SET_CHECKED(rf69_set_mode(dev->spi, standby));
+    wake_up_interruptible(&dev->tx_wait_queue);
+
+    if (retval)
+        return retval;
+    else
+        return bytes_total;
+}
+
+int
+pi433_tx_thread(void *data)
+{
+    struct pi433_device *device =3D data;
+    struct spi_device *spi =3D device->spi; /* needed for SET_CHECKED */
+    struct pi433_tx_cfg tx_cfg;
+    u8     buffer[MAX_MSG_SIZE];
+    size_t size;
+    bool   rx_interrupted =3D false;
+    int    position, repetitions;
+    int    retval;
+
+    while (1)
+    {
+        /* wait for fifo to be populated or for request to terminate*/
+        dev_dbg(device->dev, "thread: going to wait for new messages");
+        wait_event_interruptible(device->tx_wait_queue,
+                     ( !kfifo_is_empty(&device->tx_fifo) ||
+                        kthread_should_stop() ));
+        if ( kthread_should_stop() )
+            return 0;
+
+        /* get data from fifo in the following order:
+           - tx_cfg
+           - size of message
+           - message */
+        mutex_lock(&device->tx_fifo_lock);
+
+        retval =3D kfifo_out(&device->tx_fifo, &tx_cfg, sizeof(tx_cfg));
+        if (retval !=3D sizeof(tx_cfg))
+        {
+            dev_dbg(device->dev, "reading tx_cfg from fifo failed: got %d
byte(s), expected %d", retval, (unsigned int)sizeof(tx_cfg) );
+            mutex_unlock(&device->tx_fifo_lock);
+            continue;
+        }
+
+        retval =3D kfifo_out(&device->tx_fifo, &size, sizeof(size_t));
+        if (retval !=3D sizeof(size_t))
+        {
+            dev_dbg(device->dev, "reading msg size from fifo failed: got %=
d,
expected %d", retval, (unsigned int)sizeof(size_t) );
+            mutex_unlock(&device->tx_fifo_lock);
+            continue;
+        }
+
+        /* use fixed message length, if requested */
+        if (tx_cfg.fixed_message_length !=3D 0)
+            size =3D tx_cfg.fixed_message_length;
+
+        /* increase size, if len byte is requested */
+        if (tx_cfg.enable_length_byte =3D=3D optionOn)
+            size++;
+
+        /* increase size, if adr byte is requested */
+        if (tx_cfg.enable_address_byte =3D=3D optionOn)
+            size++;
+
+        /* prime buffer */
+        memset(buffer, 0, size);
+        position =3D 0;
+
+        /* add length byte, if requested */
+        if (tx_cfg.enable_length_byte  =3D=3D optionOn)
+            buffer[position++] =3D size-1; /* according to spec length byt=
e
itself must be excluded from the length calculation */
+
+        /* add adr byte, if requested */
+        if (tx_cfg.enable_address_byte =3D=3D optionOn)
+            buffer[position++] =3D tx_cfg.address_byte;
+
+        /* finally get message data from fifo */
+        retval =3D kfifo_out(&device->tx_fifo, &buffer[position],
sizeof(buffer)-position );
+        dev_dbg(device->dev, "read %d message byte(s) from fifo queue.",
retval);
+        mutex_unlock(&device->tx_fifo_lock);
+
+        /* if rx is active, we need to interrupt the waiting for
+           incoming telegrams, to be able to send something.
+           We are only allowed, if currently no reception takes
+           place otherwise we need to  wait for the incoming telegram
+           to finish */
+        wait_event_interruptible(device->tx_wait_queue,
+                     !device->rx_active ||
+                      device->interrupt_rx_allowed =3D=3D true);
+
+        /* prevent race conditions
+           irq will be reenabled after tx config is set */
+        disable_irq(device->irq_num[DIO0]);
+        device->tx_active =3D true;
+
+        if (device->rx_active && rx_interrupted =3D=3D false)
+        {
+            /* rx is currently waiting for a telegram;
+               we need to set the radio module to standby */
+            SET_CHECKED(rf69_set_mode(device->spi, standby));
+            rx_interrupted =3D true;
+        }
+
+        /* clear fifo, set fifo threshold, set payload length */
+        SET_CHECKED(rf69_set_mode(spi, standby)); /* this clears the fifo =
*/
+        SET_CHECKED(rf69_set_fifo_threshold(spi, FIFO_THRESHOLD));
+        if (tx_cfg.enable_length_byte =3D=3D optionOn)
+        {
+            SET_CHECKED(rf69_set_payload_length(spi, size *
tx_cfg.repetitions));
+        }
+        else
+        {
+            SET_CHECKED(rf69_set_payload_length(spi, 0));
+        }
+
+        /* configure the rf chip */
+        rf69_set_tx_cfg(device, &tx_cfg);
+
+        /* enable fifo level interrupt */
+        SET_CHECKED(rf69_set_dio_mapping(spi, DIO1, DIO_FifoLevel));
+        device->irq_state[DIO1] =3D DIO_FifoLevel;
+        irq_set_irq_type(device->irq_num[DIO1], IRQ_TYPE_EDGE_FALLING);
+
+        /* enable packet sent interrupt */
+        SET_CHECKED(rf69_set_dio_mapping(spi, DIO0, DIO_PacketSent));
+        device->irq_state[DIO0] =3D DIO_PacketSent;
+        irq_set_irq_type(device->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
+        enable_irq(device->irq_num[DIO0]); /* was disabled by rx active ch=
eck
*/
+
+        /* enable transmission */
+        SET_CHECKED(rf69_set_mode(spi, transmit));
+
+        /* transfer this msg (and repetitions) to chip fifo */
+        device->free_in_fifo =3D FIFO_SIZE;
+        position =3D 0;
+        repetitions =3D tx_cfg.repetitions;
+        while( (repetitions > 0) && (size > position) )
+        {
+            if ( (size - position) > device->free_in_fifo)
+            {    /* msg to big for fifo - take a part */
+                int temp =3D device->free_in_fifo;
+                device->free_in_fifo =3D 0;
+                rf69_write_fifo(spi,
+                                &buffer[position],
+                                temp);
+                position +=3Dtemp;
+            }
+            else
+            {    /* msg fits into fifo - take all */
+                device->free_in_fifo -=3D size;
+                repetitions--;
+                rf69_write_fifo(spi,
+                        &buffer[position],
+                        (size - position) );
+                position =3D 0; /* reset for next repetition */
+            }
+
+            retval =3D wait_event_interruptible(device->fifo_wait_queue,
+                              device->free_in_fifo > 0);
+            if (retval) { printk("ABORT\n"); goto abort; }
+        }
+
+        /* we are done. Wait for packet to get sent */
+        dev_dbg(device->dev, "thread: wiat for packet to get sent/fifo to =
be
empty");
+        wait_event_interruptible(device->fifo_wait_queue,
+                     device->free_in_fifo =3D=3D FIFO_SIZE ||
+                     kthread_should_stop() );
+        if ( kthread_should_stop() )    printk("ABORT\n");
+
+
+        /* STOP_TRANSMISSION */
+        dev_dbg(device->dev, "thread: Packet sent. Set mode to stby.");
+        SET_CHECKED(rf69_set_mode(spi, standby));
+
+        /* everything sent? */
+        if ( kfifo_is_empty(&device->tx_fifo) )
+        {
+abort:
+            if (rx_interrupted)
+            {
+                rx_interrupted =3D false;
+                pi433_start_rx(device);
+            }
+            device->tx_active =3D false;
+            wake_up_interruptible(&device->rx_wait_queue);
+        }
+    }
+}
+
+/*------------------------------------------------------------------------=
-*/
+
+static ssize_t
+pi433_read(struct file *filp, char __user *buf, size_t size, loff_t *f_pos=
)
+{
+    struct pi433_instance    *instance;
+    struct pi433_device    *device;
+    unsigned int        bytes_received;
+    ssize_t            retval;
+
+    /* check, whether internal buffer is big enough for requested size */
+    if (size > MAX_MSG_SIZE)
+        return -EMSGSIZE;
+
+    instance =3D filp->private_data;
+    device =3D instance->device;
+
+    /* just one read request at a time */
+    mutex_lock(&device->rx_lock);
+    if (device->rx_active)
+    {
+        mutex_unlock(&device->rx_lock);
+        return -EAGAIN;
+    }
+    else
+    {
+        device->rx_active =3D true;
+        mutex_unlock(&device->rx_lock);
+    }
+
+    /* start receiving */
+    /* will block until something was received*/
+    device->rx_buffer_size =3D size;
+    bytes_received =3D pi433_receive(device);
+
+    /* release rx */
+    mutex_lock(&device->rx_lock);
+    device->rx_active =3D false;
+    mutex_unlock(&device->rx_lock);
+
+    /* if read was successful copy to user space*/
+    if (bytes_received >=3D 0)
+    {
+        retval =3D copy_to_user(buf, device->rx_buffer, bytes_received);
+        if (retval)
+            return retval;
+    }
+
+    return bytes_received;
+}
+
+
+static ssize_t
+pi433_write(struct file *filp, const char __user *buf,
+        size_t count, loff_t *f_pos)
+{
+    struct pi433_instance    *instance;
+    struct pi433_device    *device;
+    int                     copied, retval;
+
+    instance =3D filp->private_data;
+    device =3D instance->device;
+
+    /* check, whether internal buffer (tx thread) is big enough for reques=
ted
size */
+    if (count > MAX_MSG_SIZE)
+        return -EMSGSIZE;
+
+    /* write the following sequence into fifo:
+       - tx_cfg
+       - size of message
+       - message */
+    mutex_lock(&device->tx_fifo_lock);
+    retval =3D kfifo_in(&device->tx_fifo, &instance->tx_cfg,
sizeof(instance->tx_cfg));
+    if ( retval !=3D sizeof(instance->tx_cfg) )
+        goto abort;
+
+    retval =3D kfifo_in (&device->tx_fifo, &count, sizeof(size_t));
+    if ( retval !=3D sizeof(size_t) )
+        goto abort;
+
+    retval =3D kfifo_from_user(&device->tx_fifo, buf, count, &copied);
+    if (retval || copied !=3D count)
+        goto abort;
+
+    mutex_unlock(&device->tx_fifo_lock);
+
+    /* start transfer */
+    wake_up_interruptible(&device->tx_wait_queue);
+    dev_dbg(device->dev, "write: generated new msg with %d bytes.", copied=
);
+
+    return 0;
+
+abort:
+    dev_dbg(device->dev, "write to fifo failed: 0x%x", retval);
+    kfifo_reset(&device->tx_fifo); // TODO: maybe find a solution, not to
discard already stored, valid entries
+    mutex_unlock(&device->tx_fifo_lock);
+    return -EAGAIN;
+}
+
+
+static long
+pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+    int            err =3D 0;
+    int            retval =3D 0;
+    struct pi433_instance    *instance;
+    struct pi433_device    *device;
+    u32            tmp;
+
+    /* Check type and command number */
+    if (_IOC_TYPE(cmd) !=3D PI433_IOC_MAGIC)
+        return -ENOTTY;
+
+    /* Check access direction once here; don't repeat below.
+     * IOC_DIR is from the user perspective, while access_ok is
+     * from the kernel perspective; so they look reversed.
+     */
+    if (_IOC_DIR(cmd) & _IOC_READ)
+        err =3D !access_ok(VERIFY_WRITE,
+                 (void __user *)arg,
+                 _IOC_SIZE(cmd));
+
+    if (err =3D=3D 0 && _IOC_DIR(cmd) & _IOC_WRITE)
+        err =3D !access_ok(VERIFY_READ,
+                 (void __user *)arg,
+                 _IOC_SIZE(cmd));
+    if (err)
+        return -EFAULT;
+
+    /* TODO? guard against device removal before, or while,
+     * we issue this ioctl. --> device_get()
+     */
+    instance =3D filp->private_data;
+    device =3D instance->device;
+
+    if (device =3D=3D NULL)
+        return -ESHUTDOWN;
+
+    switch (cmd) {
+    case PI433_IOC_RD_TX_CFG:
+        tmp =3D _IOC_SIZE(cmd);
+        if ( (tmp =3D=3D 0) || ((tmp % sizeof(struct pi433_tx_cfg)) !=3D 0=
) )
+        {
+            retval =3D -EINVAL;
+            break;
+        }
+
+        if (__copy_to_user((void __user *)arg,
+                    &instance->tx_cfg,
+                    tmp))
+        {
+            retval =3D -EFAULT;
+            break;
+        }
+
+        break;
+    case PI433_IOC_WR_TX_CFG:
+        tmp =3D _IOC_SIZE(cmd);
+        if ( (tmp =3D=3D 0) || ((tmp % sizeof(struct pi433_tx_cfg)) !=3D 0=
) )
+        {
+            retval =3D -EINVAL;
+            break;
+        }
+
+        if (__copy_from_user(&instance->tx_cfg,
+                     (void __user *)arg,
+                     tmp))
+        {
+            retval =3D -EFAULT;
+            break;
+        }
+
+        break;
+
+    case PI433_IOC_RD_RX_CFG:
+        tmp =3D _IOC_SIZE(cmd);
+        if ( (tmp =3D=3D 0) || ((tmp % sizeof(struct pi433_rx_cfg)) !=3D 0=
) ) {
+            retval =3D -EINVAL;
+            break;
+        }
+
+        if (__copy_to_user((void __user *)arg,
+                   &device->rx_cfg,
+                   tmp))
+        {
+            retval =3D -EFAULT;
+            break;
+        }
+
+        break;
+    case PI433_IOC_WR_RX_CFG:
+        tmp =3D _IOC_SIZE(cmd);
+        mutex_lock(&device->rx_lock);
+
+        /* during pendig read request, change of config not allowed */
+        if (device->rx_active) {
+            retval =3D -EAGAIN;
+            mutex_unlock(&device->rx_lock);
+            break;
+        }
+
+        if ( (tmp =3D=3D 0) || ((tmp % sizeof(struct pi433_rx_cfg)) !=3D 0=
) ) {
+            retval =3D -EINVAL;
+            mutex_unlock(&device->rx_lock);
+            break;
+        }
+
+        if (__copy_from_user(&device->rx_cfg,
+                     (void __user *)arg,
+                     tmp))
+        {
+            retval =3D -EFAULT;
+            mutex_unlock(&device->rx_lock);
+            break;
+        }
+
+        mutex_unlock(&device->rx_lock);
+        break;
+    default:
+        retval =3D -EINVAL;
+    }
+
+    return retval;
+}
+
+#ifdef CONFIG_COMPAT
+static long
+pi433_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+    return pi433_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
+}
+#else
+#define pi433_compat_ioctl NULL
+#endif /* CONFIG_COMPAT */
+
+/*------------------------------------------------------------------------=
-*/
+
+static int pi433_open(struct inode *inode, struct file *filp)
+{
+    struct pi433_device    *device;
+    struct pi433_instance    *instance;
+
+    mutex_lock(&minor_lock);
+    device =3D idr_find(&pi433_idr, iminor(inode));
+
+    mutex_unlock(&minor_lock);
+    if (!device) {
+        dev_dbg(device->dev, "device: minor %d unknown.\n", iminor(inode))=
;
+        return -ENODEV;
+    }
+
+    if (!device->rx_buffer) {
+        device->rx_buffer =3D kmalloc(MAX_MSG_SIZE, GFP_KERNEL);
+        if (!device->rx_buffer)
+        {
+            dev_dbg(device->dev, "open/ENOMEM\n");
+            return -ENOMEM;
+        }
+    }
+
+    device->users++;
+    instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
+    if (!instance)
+    {
+        kfree(device->rx_buffer);
+        device->rx_buffer =3D NULL;
+        return -ENOMEM;
+    }
+
+    /* setup instance data*/
+    instance->device =3D device;
+    instance->tx_cfg.bit_rate =3D 4711;
+    // TODO: fill instance->tx_cfg;
+
+    /* instance data as context */
+    filp->private_data =3D instance;
+    nonseekable_open(inode, filp);
+
+    return 0;
+}
+
+static int pi433_release(struct inode *inode, struct file *filp)
+{
+    struct pi433_instance    *instance;
+    struct pi433_device    *device;
+
+    instance =3D filp->private_data;
+    device =3D instance->device;
+    kfree(instance);
+    filp->private_data =3D NULL;
+
+    /* last close? */
+    device->users--;
+
+    if (!device->users) {
+        kfree(device->rx_buffer);
+        device->rx_buffer =3D NULL;
+        if (device->spi =3D=3D NULL)
+            kfree(device);
+    }
+
+    return 0;
+}
+
+
+/*------------------------------------------------------------------------=
-*/
+
+static int setup_GPIOs(struct pi433_device *device)
+{
+    char     name[5];
+    int    retval;
+    int    i;
+
+    for (i=3D0; i<NUM_DIO; i++)
+    {
+        /* "construct" name and get the gpio descriptor */
+        snprintf(name, sizeof(name), "DIO%d", i);
+        device->gpiod[i] =3D gpiod_get(&device->spi->dev, name, 0 /*GPIOD_=
IN*/);
+
+        if (device->gpiod[i] =3D=3D ERR_PTR(-ENOENT))
+        {
+            dev_dbg(&device->spi->dev, "Could not find entry for %s.
Ignoring.", name);
+            continue;
+        }
+
+        if (device->gpiod[i] =3D=3D ERR_PTR(-EBUSY))
+            dev_dbg(&device->spi->dev, "%s is busy.", name);
+
+        if ( IS_ERR(device->gpiod[i]) )
+        {
+            retval =3D PTR_ERR(device->gpiod[i]);
+            /* release already allocated gpios */
+            for (i--; i>=3D0; i--)
+            {
+                free_irq(device->irq_num[i], device);
+                gpiod_put(device->gpiod[i]);
+            }
+            return retval;
+        }
+
+
+        /* configure the pin */
+        gpiod_unexport(device->gpiod[i]);
+        retval =3D gpiod_direction_input(device->gpiod[i]);
+        if (retval) return retval;
+
+
+        /* configure irq */
+        device->irq_num[i] =3D gpiod_to_irq(device->gpiod[i]);
+        if (device->irq_num[i] < 0)
+        {
+            device->gpiod[i] =3D ERR_PTR(-EINVAL);//(struct gpio_desc
*)device->irq_num[i];
+            return device->irq_num[i];
+        }
+        retval =3D request_irq(device->irq_num[i],
+                     DIO_irq_handler[i],
+                     0, /* flags */
+                     name,
+                     device);
+
+        if (retval)
+            return retval;
+
+        dev_dbg(&device->spi->dev, "%s succesfully configured", name);
+    }
+
+    return 0;
+}
+
+static void free_GPIOs(struct pi433_device *device)
+{
+    int i;
+
+    for (i=3D0; i<NUM_DIO; i++)
+    {
+        /* check if gpiod is valid */
+        if ( IS_ERR(device->gpiod[i]) )
+            continue;
+
+        free_irq(device->irq_num[i], device);
+        gpiod_put(device->gpiod[i]);
+    }
+    return;
+}
+
+static int pi433_get_minor(struct pi433_device *device)
+{
+    int retval =3D -ENOMEM;
+
+    mutex_lock(&minor_lock);
+    retval =3D idr_alloc(&pi433_idr, device, 0, N_PI433_MINORS, GFP_KERNEL=
);
+    if (retval >=3D 0) {
+        device->minor =3D retval;
+        retval =3D 0;
+    } else if (retval =3D=3D -ENOSPC) {
+        dev_err(device->dev, "too many pi433 devices\n");
+        retval =3D -EINVAL;
+    }
+    mutex_unlock(&minor_lock);
+    return retval;
+}
+
+static void pi433_free_minor(struct pi433_device *dev)
+{
+    mutex_lock(&minor_lock);
+    idr_remove(&pi433_idr, dev->minor);
+    mutex_unlock(&minor_lock);
+}
+/*------------------------------------------------------------------------=
-*/
+
+static const struct file_operations pi433_fops =3D {
+    .owner =3D    THIS_MODULE,
+    /* REVISIT switch to aio primitives, so that userspace
+     * gets more complete API coverage.  It'll simplify things
+     * too, except for the locking.
+     */
+    .write =3D    pi433_write,
+    .read =3D        pi433_read,
+    .unlocked_ioctl =3D pi433_ioctl,
+    .compat_ioctl =3D pi433_compat_ioctl,
+    .open =3D        pi433_open,
+    .release =3D    pi433_release,
+    .llseek =3D    no_llseek,
+};
+
+/*------------------------------------------------------------------------=
-*/
+
+static int pi433_probe(struct spi_device *spi)
+{
+    struct pi433_device    *device;
+    int            retval;
+
+    /* setup spi parameters */
+    spi->mode =3D 0x00;
+    spi->bits_per_word =3D 8;
+    /* spi->max_speed_hz =3D 10000000;  1MHz already set by device tree ov=
erlay
*/
+
+    retval =3D spi_setup(spi);
+    if (retval)
+    {
+        dev_dbg(&spi->dev, "configuration of SPI interface failed!\n");
+        return retval;
+    }
+    else
+    {
+        dev_dbg(&spi->dev,
+            "spi interface setup: mode 0x%2x, %d bits per word, %dhz max
speed",
+            spi->mode, spi->bits_per_word, spi->max_speed_hz);
+    }
+
+    /* Ping the chip by reading the version register */
+    retval =3D spi_w8r8(spi, 0x10);
+    if (retval < 0)
+        return retval;
+
+    switch(retval)
+    {
+        case 0x24:
+            dev_dbg(&spi->dev, "fonud pi433 (ver. 0x%x)", retval);
+            break;
+        default:
+            dev_dbg(&spi->dev, "unknown chip version: 0x%x", retval);
+            return -ENODEV;
+    }
+
+    /* Allocate driver data */
+    device =3D kzalloc(sizeof(*device), GFP_KERNEL);
+    if (!device)
+        return -ENOMEM;
+
+    /* Initialize the driver data */
+    device->spi =3D spi;
+    device->rx_active =3D false;
+    device->tx_active =3D false;
+    device->interrupt_rx_allowed =3D false;
+
+    /* init wait queues */
+    init_waitqueue_head(&device->tx_wait_queue);
+    init_waitqueue_head(&device->rx_wait_queue);
+    init_waitqueue_head(&device->fifo_wait_queue);
+
+    /* init fifo */
+    INIT_KFIFO(device->tx_fifo);
+
+    /* init mutexes and locks */
+    mutex_init(&device->tx_fifo_lock);
+    mutex_init(&device->rx_lock);
+
+    /* setup GPIO (including irq_handler) for the different DIOs */
+    retval =3D setup_GPIOs(device);
+    if (retval)
+    {
+        dev_dbg(&spi->dev, "setup of GPIOs failed");
+        goto GPIO_failed;
+    }
+
+    /* setup the radio module */
+    SET_CHECKED(rf69_set_mode        (spi, standby));
+    SET_CHECKED(rf69_set_data_mode        (spi, packet));
+    SET_CHECKED(rf69_set_amplifier_0    (spi, optionOn));
+    SET_CHECKED(rf69_set_amplifier_1    (spi, optionOff));
+    SET_CHECKED(rf69_set_amplifier_2    (spi, optionOff));
+    SET_CHECKED(rf69_set_output_power_level    (spi, 13));
+    SET_CHECKED(rf69_set_antenna_impedance    (spi, fiftyOhm));
+
+    /* start tx thread */
+    device->tx_task_struct =3D kthread_run(pi433_tx_thread,
+                         device,
+                         "pi433_tx_task");
+    if (device->tx_task_struct < 0)
+    {
+        dev_dbg(device->dev, "start of send thread failed");
+        goto send_thread_failed;
+    }
+
+    /* determ minor number */
+    retval =3D pi433_get_minor(device);
+    if (retval)
+    {
+        dev_dbg(device->dev, "get of minor number failed");
+        goto minor_failed;
+    }
+
+    /* create device */
+    device->devt =3D MKDEV(MAJOR(pi433_dev), device->minor);
+    device->dev =3D device_create(pi433_class,
+                    &spi->dev,
+                    device->devt,
+                    device,
+                    "pi433");
+    if (IS_ERR(device->dev)) {
+        pr_err("pi433: device register failed\n");
+        retval =3D PTR_ERR(device->dev);
+        goto device_create_failed;
+    }
+    else {
+        dev_dbg(device->dev,
+            "created device for major %d, minor %d\n",
+            MAJOR(pi433_dev),
+            device->minor);
+    }
+
+    /* create cdev */
+    device->cdev =3D cdev_alloc();
+    device->cdev->owner =3D THIS_MODULE;
+    cdev_init(device->cdev, &pi433_fops);
+    retval =3D cdev_add(device->cdev, device->devt, 1);
+    if (retval)
+    {
+        dev_dbg(device->dev, "register of cdev failed");
+        goto cdev_failed;
+    }
+
+    /* spi setup */
+    spi_set_drvdata(spi, device);
+
+    return 0;
+
+cdev_failed:
+    device_destroy(pi433_class, device->devt);
+device_create_failed:
+    pi433_free_minor(device);
+minor_failed:
+    kthread_stop(device->tx_task_struct);
+send_thread_failed:
+    free_GPIOs(device);
+GPIO_failed:
+    kfree(device);
+
+    return retval;
+}
+
+static int pi433_remove(struct spi_device *spi)
+{
+    struct pi433_device    *device =3D spi_get_drvdata(spi);
+
+    /* free GPIOs */
+    free_GPIOs(device);
+
+    /* make sure ops on existing fds can abort cleanly */
+    device->spi =3D NULL;
+
+    kthread_stop(device->tx_task_struct);
+
+    device_destroy(pi433_class, device->devt);
+
+    cdev_del(device->cdev);
+
+    pi433_free_minor(device);
+
+    if (device->users =3D=3D 0)
+        kfree(device);
+
+    return 0;
+}
+
+static const struct of_device_id pi433_dt_ids[] =3D {
+    { .compatible =3D "Smarthome-Wolf,pi433" },
+    {},
+};
+
+MODULE_DEVICE_TABLE(of, pi433_dt_ids);
+
+static struct spi_driver pi433_spi_driver =3D {
+    .driver =3D {
+        .name =3D        "pi433",
+        .owner =3D    THIS_MODULE,
+        .of_match_table =3D of_match_ptr(pi433_dt_ids),
+    },
+    .probe =3D    pi433_probe,
+    .remove =3D    pi433_remove,
+
+    /* NOTE:  suspend/resume methods are not necessary here.
+     * We don't do anything except pass the requests to/from
+     * the underlying controller.  The refrigerator handles
+     * most issues; the controller driver handles the rest.
+     */
+};
+
+/*------------------------------------------------------------------------=
-*/
+
+static int __init pi433_init(void)
+{
+    int status;
+
+    /* If MAX_MSG_SIZE is smaller then FIFO_SIZE, the driver won't
+           work stable - risk of buffer overflow */
+    if (MAX_MSG_SIZE < FIFO_SIZE)
+        return -EINVAL;
+
+    /* Claim device numbers.  Then register a class
+     * that will key udev/mdev to add/remove /dev nodes.  Last, register
+     * Last, register the driver which manages those device numbers.
+     */
+    status =3D alloc_chrdev_region(&pi433_dev, 0 /*firstminor*/, N_PI433_M=
INORS
/*count*/, "pi433" /*name*/);
+    if (status < 0)
+        return status;
+
+    pi433_class =3D class_create(THIS_MODULE, "pi433");
+    if (IS_ERR(pi433_class))
+    {
+        unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+        return PTR_ERR(pi433_class);
+    }
+
+    status =3D spi_register_driver(&pi433_spi_driver);
+    if (status < 0)
+    {
+        class_destroy(pi433_class);
+        unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+    }
+
+    return status;
+}
+
+module_init(pi433_init);
+
+static void __exit pi433_exit(void)
+{
+    spi_unregister_driver(&pi433_spi_driver);
+    class_destroy(pi433_class);
+    unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+}
+module_exit(pi433_exit);
+
+MODULE_AUTHOR("Marcus Wolf, <linux@wolf-entwicklungen.de>");
+MODULE_DESCRIPTION("Driver for Pi433");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("spi:pi433");
diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433=
_if.h
new file mode 100644
index 0000000..e6ed3cd
--- /dev/null
+++ b/drivers/staging/pi433/pi433_if.h
@@ -0,0 +1,152 @@
+/*
+ * include/linux/TODO
+ *
+ * userspace interface for pi433 radio module
+ *
+ * Pi433 is a 433MHz radio module for the Raspberry Pi.
+ * It is based on the HopeRf Module RFM69CW. Therefore inside of this
+ * driver, you'll find an abstraction of the rf69 chip.
+ *
+ * If needed, this driver could be extended, to also support other
+ * devices, basing on HopeRfs rf69.
+ *
+ * The driver can also be extended, to support other modules of
+ * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *    Marcus Wolf <linux@wolf-entwicklungen.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef PI433_H
+#define PI433_H
+
+#include <linux/types.h>
+#include "rf69_enum.h"
+
+/*------------------------------------------------------------------------=
---*/
+
+
+/*------------------------------------------------------------------------=
---*/
+
+/* IOCTL structs and commands */
+
+/**
+ * struct pi433_tx_config - describes the configuration of the radio modul=
e for
sending
+ * @frequency:
+ * @bit_rate:
+ * @modulation:
+ * @data_mode:
+ * @preamble_length:
+ * @sync_pattern:
+ * @tx_start_condition:
+ * @payload_length:
+ * @repetitions:
+ *
+ * ATTENTION:
+ * If the contents of 'pi433_tx_config' ever change
+ * incompatibly, then the ioctl number (see define below) must change.
+ *
+ * NOTE: struct layout is the same in 64bit and 32bit userspace.
+ */
+#define PI433_TX_CFG_IOCTL_NR     0
+struct pi433_tx_cfg
+{
+    __u32            frequency;
+    __u16            bit_rate;
+    __u32            dev_frequency;
+    enum modulation        modulation;
+    enum modShaping        modShaping;
+
+    enum paRamp        pa_ramp;
+
+    enum txStartCondition    tx_start_condition;
+
+    __u16            repetitions;
+
+
+    /* packet format */
+    enum optionOnOff    enable_preamble;
+    enum optionOnOff    enable_sync;
+    enum optionOnOff    enable_length_byte;
+    enum optionOnOff    enable_address_byte;
+    enum optionOnOff    enable_crc;
+
+    __u16            preamble_length;
+    __u8            sync_length;
+    __u8            fixed_message_length;
+
+    __u8            sync_pattern[8];
+    __u8            address_byte;
+};
+
+
+/**
+ * struct pi433_rx_config - describes the configuration of the radio modul=
e for
sending
+ * @frequency:
+ * @bit_rate:
+ * @modulation:
+ * @data_mode:
+ * @preamble_length:
+ * @sync_pattern:
+ * @tx_start_condition:
+ * @payload_length:
+ * @repetitions:
+ *
+ * ATTENTION:
+ * If the contents of 'pi433_rx_config' ever change
+ * incompatibly, then the ioctl number (see define below) must change
+ *
+ * NOTE: struct layout is the same in 64bit and 32bit userspace.
+ */
+#define PI433_RX_CFG_IOCTL_NR     1
+struct pi433_rx_cfg {
+    __u32            frequency;
+    __u16            bit_rate;
+    __u32            dev_frequency;
+
+    enum modulation        modulation;
+
+    __u8            rssi_threshold;
+    enum thresholdDecrement    thresholdDecrement;
+    enum antennaImpedance    antenna_impedance;
+    enum lnaGain        lna_gain;
+    enum mantisse        bw_mantisse;    /* normal: 0x50 */
+    __u8            bw_exponent;    /* during AFC: 0x8b */
+    enum dagc        dagc;
+
+
+
+    /* packet format */
+    enum optionOnOff    enable_sync;
+    enum optionOnOff    enable_length_byte;      /* should be used in
combination with sync, only */
+    enum addressFiltering    enable_address_filtering; /* operational with
sync, only */
+    enum optionOnOff    enable_crc;          /* only operational, if sync =
on
and fixed length or length byte is used */
+
+    __u8            sync_length;
+    __u8            fixed_message_length;
+    __u32            bytes_to_drop;
+
+    __u8            sync_pattern[8];
+    __u8            node_address;
+    __u8            broadcast_address;
+};
+
+
+#define PI433_IOC_MAGIC            'r'
+
+#define PI433_IOC_RD_TX_CFG    _IOR(PI433_IOC_MAGIC, PI433_TX_CFG_IOCTL_NR=
,
char[sizeof(struct pi433_tx_cfg)])
+#define PI433_IOC_WR_TX_CFG    _IOW(PI433_IOC_MAGIC, PI433_TX_CFG_IOCTL_NR=
,
char[sizeof(struct pi433_tx_cfg)])
+
+#define PI433_IOC_RD_RX_CFG    _IOR(PI433_IOC_MAGIC, PI433_RX_CFG_IOCTL_NR=
,
char[sizeof(struct pi433_rx_cfg)])
+#define PI433_IOC_WR_RX_CFG    _IOW(PI433_IOC_MAGIC, PI433_RX_CFG_IOCTL_NR=
,
char[sizeof(struct pi433_rx_cfg)])
+
+#endif /* PI433_H */
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
new file mode 100644
index 0000000..b6bc45b
--- /dev/null
+++ b/drivers/staging/pi433/rf69.c
@@ -0,0 +1,982 @@
+/*
+ * abstraction of the spi interface of HopeRf rf69 radio module
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *    Marcus Wolf <linux@wolf-entwicklungen.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/* enable prosa debug info */
+#undef DEBUG
+/* enable print of values on reg access */
+#undef DEBUG_VALUES
+/* enable print of values on fifo access */
+#undef DEBUG_FIFO_ACCESS
+
+#include <linux/types.h>
+#include <linux/spi/spi.h>
+
+#include "rf69.h"
+#include "rf69_registers.h"
+
+#define F_OSC      32000000 /* in Hz */
+#define FIFO_SIZE 66        /* in byte */
+
+/*------------------------------------------------------------------------=
-*/
+
+#define READ_REG(x)    rf69_read_reg (spi, x)
+#define WRITE_REG(x,y)    rf69_write_reg(spi, x, y)
+#define INVALID_PARAM \
+    { \
+        dev_dbg(&spi->dev, "set: illegal input param"); \
+        return -EINVAL; \
+    }
+
+/*------------------------------------------------------------------------=
-*/
+
+int rf69_set_mode(struct spi_device *spi, enum mode mode)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: mode");
+    #endif
+
+    switch (mode){
+    case transmit:      return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE)=
 &
~MASK_OPMODE_MODE) | OPMODE_MODE_TRANSMIT);
+    case receive:      return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) =
&
~MASK_OPMODE_MODE) | OPMODE_MODE_RECEIVE);
+    case synthesizer: return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) &
~MASK_OPMODE_MODE) | OPMODE_MODE_SYNTHESIZER);
+    case standby:      return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) =
&
~MASK_OPMODE_MODE) | OPMODE_MODE_STANDBY);
+    case mode_sleep:  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) &
~MASK_OPMODE_MODE) | OPMODE_MODE_SLEEP);
+    default:      INVALID_PARAM;
+    }
+
+    // we are using packet mode, so this check is not really needed
+    // but waiting for mode ready is necessary when going from sleep becau=
se
the FIFO may not be immediately available from previous mode
+    //while (_mode =3D=3D RF69_MODE_SLEEP && (READ_REG(REG_IRQFLAGS1) &
RF_IRQFLAGS1_MODEREADY) =3D=3D 0x00); // Wait for ModeReady
+
+}
+
+int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: data mode");
+    #endif
+
+    switch (dataMode) {
+    case packet:        return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_PACKET);
+    case continuous:    return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_CONTINUOU=
S);
+    case continuousNoSync:  return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) |
DATAMODUL_MODE_CONTINUOUS_NOSYNC);
+    default:        INVALID_PARAM;
+    }
+}
+
+int rf69_set_modulation(struct spi_device *spi, enum modulation modulation=
)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: modulation");
+    #endif
+
+    switch (modulation) {
+    case OOK:   return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &
~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_OOK);
+    case FSK:   return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &
~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_FSK);
+    default:    INVALID_PARAM;
+    }
+}
+
+enum modulation rf69_get_modulation(struct spi_device *spi)
+{
+    u8 currentValue;   =20
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "get: mode");
+    #endif
+
+    currentValue =3D READ_REG(REG_DATAMODUL);
+
+    switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE >> 3)  // TODO
improvement: change 3 to define
+    {
+    case DATAMODUL_MODULATION_TYPE_OOK: return OOK;
+    case DATAMODUL_MODULATION_TYPE_FSK: return FSK;
+    default:                return undefined;
+    }
+}
+
+int rf69_set_modulation_shaping(struct spi_device *spi, enum modShaping
modShaping)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: mod shaping");
+    #endif
+
+    if (rf69_get_modulation(spi) =3D=3D FSK)
+    {
+        switch (modShaping) {
+        case shapingOff: return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_NONE);
+        case shaping1_0: return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_1_0);
+        case shaping0_5: return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_0_3);
+        case shaping0_3: return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_0_5);
+        default:     INVALID_PARAM;
+        }
+    }
+    else
+    {
+        switch (modShaping) {
+        case shapingOff: return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_NONE);
+        case shapingBR:     return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_BR);
+        case shaping2BR: return WRITE_REG(REG_DATAMODUL,
(READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) |
DATAMODUL_MODULATION_SHAPE_2BR);
+        default:     INVALID_PARAM;
+        }
+    }
+}
+
+int rf69_set_bit_rate(struct spi_device *spi, u16 bitRate)
+{
+    int retval;
+    u32 bitRate_min;
+    u32 bitRate_reg;
+    u8 msb;
+    u8 lsb;
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: bit rate");
+    #endif
+
+    // check input value
+    bitRate_min =3D F_OSC / 8388608; // 8388608 =3D 2^23;
+    if (bitRate < bitRate_min)
+    {
+        dev_dbg(&spi->dev, "setBitRate: illegal input param");
+        INVALID_PARAM;
+    }
+
+    // calculate reg settings
+    bitRate_reg =3D (F_OSC / bitRate);
+
+    msb =3D (bitRate_reg&0xff00)   >>  8;
+    lsb =3D (bitRate_reg&0xff);
+
+    // transmit to RF 69
+    retval =3D WRITE_REG(REG_BITRATE_MSB, msb);
+    if (retval)  return retval;
+    retval =3D WRITE_REG(REG_BITRATE_LSB, lsb);
+    if (retval)  return retval;
+
+    return 0;
+}
+
+int rf69_set_deviation(struct spi_device *spi, u32 deviation)
+{
+    int retval;
+//    u32 f_max; TODO: Abh=C3=A4ngigkeit von Bitrate beachten!!
+    u64 f_reg;
+    u64 f_step;
+    u8 msb;
+    u8 lsb;
+    u64 factor =3D 1000000; // to improve precision of calculation
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: deviation");
+    #endif
+
+    if (deviation < 600 || deviation > 500000) //TODO: Abh=C3=A4ngigkeit v=
on Bitrate
beachten!!
+    {
+        dev_dbg(&spi->dev, "set_deviation: illegal input param");
+        INVALID_PARAM;
+    }
+
+    // calculat f step
+    f_step =3D F_OSC * factor;
+    do_div(f_step, 524288); //  524288 =3D 2^19
+
+    // calculate register settings
+    f_reg =3D deviation * factor;
+    do_div(f_reg  , f_step);
+
+    msb =3D (f_reg&0xff00)   >>  8;
+    lsb =3D (f_reg&0xff);
+
+    // check msb
+    if (msb & !FDEVMASB_MASK)
+    {
+        dev_dbg(&spi->dev, "set_deviation: err in calc of msb");
+        INVALID_PARAM;
+    }
+
+    // write to chip
+    retval =3D WRITE_REG(REG_FDEV_MSB, msb);
+    if (retval)  return retval;
+    retval =3D WRITE_REG(REG_FDEV_LSB, lsb);
+    if (retval)  return retval;
+
+    return 0;
+}
+
+int rf69_set_frequency(struct spi_device *spi, u32 frequency)
+{
+    int retval;
+    u32 f_max;
+    u64 f_reg;
+    u64 f_step;
+    u8 msb;
+    u8 mid;
+    u8 lsb;
+    u64 factor =3D 1000000; // to improve precision of calculation
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: frequency");
+    #endif
+
+    // calculat f step
+    f_step =3D F_OSC * factor;
+    do_div(f_step, 524288); //  524288 =3D 2^19
+
+    // check input value
+    f_max =3D f_step * 8388608 / factor;
+    if (frequency > f_max)
+    {
+        dev_dbg(&spi->dev, "setFrequency: illegal input param");
+        INVALID_PARAM;
+    }
+
+    // calculate reg settings
+    f_reg =3D frequency * factor;
+    do_div(f_reg  , f_step);
+
+    msb =3D (f_reg&0xff0000) >> 16;
+    mid =3D (f_reg&0xff00)   >>  8;
+    lsb =3D (f_reg&0xff);
+
+    // write to chip
+    retval =3D WRITE_REG(REG_FRF_MSB, msb);
+    if (retval)  return retval;
+    retval =3D WRITE_REG(REG_FRF_MID, mid);
+    if (retval)  return retval;
+    retval =3D WRITE_REG(REG_FRF_LSB, lsb);
+    if (retval)  return retval;
+
+    return 0;
+}
+
+int rf69_set_amplifier_0(struct spi_device *spi, enum optionOnOff optionOn=
Off)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: amp #0");
+    #endif
+
+    switch(optionOnOff) {
+    case optionOn:    return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL)=
 |
 MASK_PALEVEL_PA0) );
+    case optionOff:    return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL=
) &
~MASK_PALEVEL_PA0) );
+    default:    INVALID_PARAM;
+    }
+}   =20
+
+int rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOff optionOn=
Off)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: amp #1");
+    #endif
+
+    switch(optionOnOff) {
+    case optionOn:    return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL)=
 |
 MASK_PALEVEL_PA1) );
+    case optionOff: return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) &
~MASK_PALEVEL_PA1) );
+    default:    INVALID_PARAM;
+    }
+}
+
+int rf69_set_amplifier_2(struct spi_device *spi, enum optionOnOff optionOn=
Off)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: amp #2");
+    #endif
+
+    switch(optionOnOff) {
+    case optionOn:    return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL)=
 |
 MASK_PALEVEL_PA2) );
+    case optionOff:    return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL=
) &
~MASK_PALEVEL_PA2) );
+    default:    INVALID_PARAM;
+    }
+}
+
+int rf69_set_output_power_level(struct spi_device *spi, u8 powerLevel)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: power level");
+    #endif
+
+    powerLevel +=3D18; // TODO Abh=C3=A4ngigkeit von PA0,1,2 setting
+
+    // check input value
+    if (powerLevel > 0x1f)
+        INVALID_PARAM;
+
+    // write value
+    return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) &
~MASK_PALEVEL_OUTPUT_POWER) | powerLevel);
+}
+
+int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paRamp)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: pa ramp");
+    #endif
+
+    switch(paRamp) {
+    case ramp3400:    return WRITE_REG(REG_PARAMP, PARAMP_3400);
+    case ramp2000:    return WRITE_REG(REG_PARAMP, PARAMP_2000);
+    case ramp1000:    return WRITE_REG(REG_PARAMP, PARAMP_1000);
+    case ramp500:    return WRITE_REG(REG_PARAMP, PARAMP_500);
+    case ramp250:    return WRITE_REG(REG_PARAMP, PARAMP_250);
+    case ramp125:    return WRITE_REG(REG_PARAMP, PARAMP_125);
+    case ramp100:    return WRITE_REG(REG_PARAMP, PARAMP_100);
+    case ramp62:    return WRITE_REG(REG_PARAMP, PARAMP_62);
+    case ramp50:    return WRITE_REG(REG_PARAMP, PARAMP_50);
+    case ramp40:    return WRITE_REG(REG_PARAMP, PARAMP_40);
+    case ramp31:    return WRITE_REG(REG_PARAMP, PARAMP_31);
+    case ramp25:    return WRITE_REG(REG_PARAMP, PARAMP_25);
+    case ramp20:    return WRITE_REG(REG_PARAMP, PARAMP_20);
+    case ramp15:    return WRITE_REG(REG_PARAMP, PARAMP_15);
+    case ramp12:    return WRITE_REG(REG_PARAMP, PARAMP_12);
+    case ramp10:    return WRITE_REG(REG_PARAMP, PARAMP_10);
+    default:    INVALID_PARAM;
+    }
+}
+
+int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedan=
ce
antennaImpedance)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: antenna impedance");
+    #endif
+
+    switch(antennaImpedance) {
+    case fiftyOhm:        return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) &
~MASK_LNA_ZIN) );
+    case twohundretOhm: return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) |
 MASK_LNA_ZIN) );
+    default:        INVALID_PARAM;
+    }
+}
+
+int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: lna gain");
+    #endif
+
+    switch(lnaGain) {
+    case automatic:     return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_AUTO) );
+    case max:     return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_MAX) );
+    case maxMinus6:  return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_6) );
+    case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_12) );
+    case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_24) );
+    case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_36) );
+    case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_48) );
+    default:     INVALID_PARAM;
+    }
+}
+
+enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
+{
+    u8 currentValue;   =20
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "get: lna gain");
+    #endif
+
+    currentValue =3D READ_REG(REG_LNA);
+
+    switch (currentValue & MASK_LNA_CURRENT_GAIN >> 3)  // improvement: ch=
ange
3 to define
+    {
+    case LNA_GAIN_AUTO:        return automatic;
+    case LNA_GAIN_MAX:        return max;
+    case LNA_GAIN_MAX_MINUS_6:  return maxMinus6;
+    case LNA_GAIN_MAX_MINUS_12: return maxMinus12;
+    case LNA_GAIN_MAX_MINUS_24: return maxMinus24;
+    case LNA_GAIN_MAX_MINUS_36: return maxMinus36;
+    case LNA_GAIN_MAX_MINUS_48: return maxMinus48;
+    default:            return undefined;
+    }
+}
+
+int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi ,u8 reg, e=
num
dccPercent dccPercent)
+{
+    switch (dccPercent) {
+    case dcc16Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_16_PERCENT) );
+    case dcc8Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_8_PERCENT) );
+    case dcc4Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_4_PERCENT) );
+    case dcc2Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_2_PERCENT) );
+    case dcc1Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_1_PERCENT) );
+    case dcc0_5Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_0_5_PERCENT) );
+    case dcc0_25Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_0_25_PERCENT) );
+    case dcc0_125Percent:    return WRITE_REG(reg, ( (READ_REG(reg) &
~MASK_BW_DCC_FREQ) | BW_DCC_0_125_PERCENT) );
+    default:        INVALID_PARAM;
+    }
+}
+
+int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent
dccPercent)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: cut off freq");
+    #endif
+
+    return rf69_set_dc_cut_off_frequency_intern(spi, REG_RXBW, dccPercent)=
;
+}
+
+int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum
dccPercent dccPercent)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: cut off freq during afc");
+    #endif
+
+    return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent=
);
+}
+
+int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantiss=
e
mantisse, u8 exponent)
+{
+    u8 newValue;
+
+    // check value for mantisse and exponent
+    if (exponent > 7)   INVALID_PARAM;
+    if ( (mantisse!=3Dmantisse16) &&
+         (mantisse!=3Dmantisse20) &&
+             (mantisse!=3Dmantisse24) ) INVALID_PARAM;
+
+    // read old value
+    newValue =3D READ_REG(reg);
+
+    // "delete" mantisse and exponent =3D just keep the DCC setting
+    newValue =3D newValue & MASK_BW_DCC_FREQ;
+
+    // add new mantisse
+    switch(mantisse) {
+    case mantisse16: newValue =3D newValue | BW_MANT_16;    break;
+    case mantisse20: newValue =3D newValue | BW_MANT_20;    break;
+    case mantisse24: newValue =3D newValue | BW_MANT_24;    break;
+    }
+
+    // add new exponent
+    newValue =3D newValue | exponent;
+
+    // write back
+    return WRITE_REG(reg, newValue);
+}
+
+int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8
exponent)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: band width");
+    #endif
+
+    return rf69_set_bandwidth_intern(spi, REG_RXBW, mantisse, exponent);
+}
+
+int rf69_set_bandwidth_during_afc(struct spi_device *spi, enum mantisse
mantisse, u8 exponent)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: band width during afc");
+    #endif
+
+    return rf69_set_bandwidth_intern(spi, REG_AFCBW, mantisse, exponent);
+}
+
+int rf69_set_ook_threshold_type(struct spi_device *spi, enum thresholdType
thresholdType)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: threshold type");
+    #endif
+
+    switch (thresholdType)
+    {
+    case fixed:    return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) =
&
~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_FIXED) );
+    case peak:    return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &
~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_PEAK) );
+    case average:    return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_AVERAGE) );
+    default:    INVALID_PARAM;
+    }
+}
+
+int rf69_set_ook_threshold_step(struct spi_device *spi, enum thresholdStep
thresholdStep)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: threshold step");
+    #endif
+
+    switch (thresholdStep) {
+    case step_0_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_0_5_DB) );
+    case step_1_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_0_DB) );
+    case step_1_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_5_DB) );
+    case step_2_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_2_0_DB) );
+    case step_3_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_3_0_DB) );
+    case step_4_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_4_0_DB) );
+    case step_5_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_5_0_DB) );
+    case step_6_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_6_0_DB) );
+    default:     INVALID_PARAM;
+    }
+}
+
+int rf69_set_ook_threshold_dec(struct spi_device *spi, enum thresholdDecre=
ment
thresholdDecrement)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: threshold decrement");
+    #endif
+
+    switch (thresholdDecrement) {
+    case dec_every8th: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &
~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_8TH) );
+    case dec_every4th: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &
~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_4TH) );
+    case dec_every2nd: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &
~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_2ND) );
+    case dec_once:       return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOK=
PEAK)
& ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_ONCE) );
+    case dec_twice:       return WRITE_REG(REG_OOKPEAK, (
(READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_TWICE)=
 );
+    case dec_4times:   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &
~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_4_TIMES) );
+    case dec_8times:   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &
~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_8_TIMES) );
+    case dec_16times:  return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &
~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_16_TIMES) );
+    default:       INVALID_PARAM;
+    }
+}
+
+int rf69_set_dio_mapping(struct spi_device *spi, u8 DIONumber, u8 value)
+{
+    u8 mask;
+    u8 shift;
+    u8 regaddr;
+    u8 regValue;
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: DIO mapping");
+    #endif
+
+    // check DIO number
+    if (DIONumber > 5) INVALID_PARAM;
+
+    switch (DIONumber) {
+    case 0: mask=3DMASK_DIO0; shift=3DSHIFT_DIO0; regaddr=3DREG_DIOMAPPING=
1; break;
+    case 1: mask=3DMASK_DIO1; shift=3DSHIFT_DIO1; regaddr=3DREG_DIOMAPPING=
1; break;
+    case 2: mask=3DMASK_DIO2; shift=3DSHIFT_DIO2; regaddr=3DREG_DIOMAPPING=
1; break;
+    case 3: mask=3DMASK_DIO3; shift=3DSHIFT_DIO3; regaddr=3DREG_DIOMAPPING=
1; break;
+    case 4: mask=3DMASK_DIO4; shift=3DSHIFT_DIO4; regaddr=3DREG_DIOMAPPING=
2; break;
+    case 5: mask=3DMASK_DIO5; shift=3DSHIFT_DIO5; regaddr=3DREG_DIOMAPPING=
2; break;
+    }
+
+    // read reg
+    regValue=3DREAD_REG(regaddr);
+    // delete old value
+    regValue =3D regValue & ~mask;
+    // add new value
+    regValue =3D regValue | value << shift;
+    // write back
+    return WRITE_REG(regaddr,regValue);
+}
+
+bool rf69_get_flag(struct spi_device *spi, enum flag flag)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "get: flag");
+    #endif
+
+    switch(flag) {
+    case modeSwitchCompleted:     return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_MODE_READY);
+    case readyToReceive:          return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_RX_READY);
+    case readyToSend:          return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_TX_READY);
+    case pllLocked:              return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_PLL_LOCK);
+    case rssiExceededThreshold:   return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_RSSI);
+    case timeout:              return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_TIMEOUT);
+    case automode:              return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_AUTOMODE);
+    case syncAddressMatch:          return (READ_REG(REG_IRQFLAGS1) &
MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
+    case fifoFull:              return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_FIFO_FULL);
+/*    case fifoNotEmpty:          return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_FIFO_NOT_EMPTY); */
+    case fifoEmpty:              return !(READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_FIFO_NOT_EMPTY);
+    case fifoLevelBelowThreshold: return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_FIFO_LEVEL);
+    case fifoOverrun:          return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_FIFO_OVERRUN);
+    case packetSent:          return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_PACKET_SENT);
+    case payloadReady:          return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_PAYLOAD_READY);
+    case crcOk:              return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_CRC_OK);
+    case batteryLow:          return (READ_REG(REG_IRQFLAGS2) &
MASK_IRQFLAGS2_LOW_BAT);
+    default:              return false;
+    }
+}
+
+int rf69_reset_flag(struct spi_device *spi, enum flag flag)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "reset: flag");
+    #endif
+
+    switch(flag) {
+    case rssiExceededThreshold: return WRITE_REG(REG_IRQFLAGS1,
MASK_IRQFLAGS1_RSSI);
+    case syncAddressMatch:        return WRITE_REG(REG_IRQFLAGS1,
MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
+    case fifoOverrun:        return WRITE_REG(REG_IRQFLAGS2,
MASK_IRQFLAGS2_FIFO_OVERRUN);
+    default:            INVALID_PARAM;
+    }
+}
+
+int rf69_set_rssi_threshold(struct spi_device *spi, u8 threshold)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: rssi threshold");
+    #endif
+
+    /* no value check needed - u8 exactly matches register size */
+
+    return WRITE_REG(REG_RSSITHRESH, threshold);
+}
+
+int rf69_set_rx_start_timeout(struct spi_device *spi, u8 timeout)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: start timeout");
+    #endif
+
+    /* no value check needed - u8 exactly matches register size */
+
+    return WRITE_REG(REG_RXTIMEOUT1, timeout);
+}
+
+int rf69_set_rssi_timeout(struct spi_device *spi, u8 timeout)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: rssi timeout");
+    #endif
+
+    /* no value check needed - u8 exactly matches register size */
+
+    return WRITE_REG(REG_RXTIMEOUT2, timeout);
+}
+
+int rf69_set_preamble_length(struct spi_device *spi, u16 preambleLength)
+{
+    int retval;
+    u8 msb, lsb;
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: preample length");
+    #endif
+
+    /* no value check needed - u16 exactly matches register size */
+
+    /* calculate reg settings */
+    msb =3D (preambleLength&0xff00)   >>  8;
+    lsb =3D (preambleLength&0xff);
+
+    /* transmit to chip */
+    retval =3D WRITE_REG(REG_PREAMBLE_MSB, msb);
+    if (retval) return retval;
+    retval =3D WRITE_REG(REG_PREAMBLE_LSB, lsb);
+
+    return retval;
+}
+
+int rf69_set_sync_enable(struct spi_device *spi, enum optionOnOff optionOn=
Off)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: sync enable");
+    #endif
+
+    switch(optionOnOff) {
+    case optionOn:    return WRITE_REG(REG_SYNC_CONFIG,
(READ_REG(REG_SYNC_CONFIG) |  MASK_SYNC_CONFIG_SYNC_ON) );
+    case optionOff:    return WRITE_REG(REG_SYNC_CONFIG,
(READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_ON) );
+    default:    INVALID_PARAM;
+    }
+}
+
+int rf69_set_fifo_fill_condition(struct spi_device *spi, enum fifoFillCond=
ition
fifoFillCondition)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: fifo fill condition");
+    #endif
+
+    switch(fifoFillCondition) {
+    case always:         return WRITE_REG(REG_SYNC_CONFIG,
(READ_REG(REG_SYNC_CONFIG) |  MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );
+    case afterSyncInterrupt: return WRITE_REG(REG_SYNC_CONFIG,
(READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );
+    default:         INVALID_PARAM;
+    }
+}
+
+int rf69_set_sync_size(struct spi_device *spi, u8 syncSize)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: sync size");
+    #endif
+
+    // check input value
+    if (syncSize > 0x07)
+        INVALID_PARAM;
+
+    // write value
+    return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) &
~MASK_SYNC_CONFIG_SYNC_SIZE) | (syncSize << 3) );
+}
+
+int rf69_set_sync_tolerance(struct spi_device *spi, u8 syncTolerance)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: sync tolerance");
+    #endif
+
+    // check input value
+    if (syncTolerance > 0x07)
+        INVALID_PARAM;
+
+    // write value
+    return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) &
~MASK_SYNC_CONFIG_SYNC_SIZE) | syncTolerance);
+}
+
+int rf69_set_sync_values(struct spi_device *spi, u8 syncValues[8])
+{
+    int retval =3D 0;
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: sync values");
+    #endif
+
+    retval +=3D WRITE_REG(REG_SYNCVALUE1, syncValues[0]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE2, syncValues[1]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE3, syncValues[2]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE4, syncValues[3]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE5, syncValues[4]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE6, syncValues[5]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE7, syncValues[6]);
+    retval +=3D WRITE_REG(REG_SYNCVALUE8, syncValues[7]);
+
+    return retval;
+}
+
+int rf69_set_packet_format(struct spi_device * spi, enum packetFormat
packetFormat)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: packet format");
+    #endif
+
+    switch(packetFormat) {
+    case packetLengthVar: return WRITE_REG(REG_PACKETCONFIG1,
(READ_REG(REG_PACKETCONFIG1) |  MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE) )=
;
+    case packetLengthFix: return WRITE_REG(REG_PACKETCONFIG1,
(READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE) )=
;
+    default:          INVALID_PARAM;
+    }
+}
+
+int rf69_set_crc_enable(struct spi_device *spi, enum optionOnOff optionOnO=
ff)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: crc enable");
+    #endif
+
+    switch(optionOnOff) {
+    case optionOn:    return WRITE_REG(REG_PACKETCONFIG1,
(READ_REG(REG_PACKETCONFIG1) |  MASK_PACKETCONFIG1_CRC_ON) );
+    case optionOff:    return WRITE_REG(REG_PACKETCONFIG1,
(READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_CRC_ON) );
+    default:    INVALID_PARAM;
+    }
+}
+
+int rf69_set_adressFiltering(struct spi_device *spi, enum addressFiltering
addressFiltering)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: address filtering");
+    #endif
+
+    switch (addressFiltering) {
+    case filteringOff:         return WRITE_REG(REG_PACKETCONFIG1, (
(READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) |
PACKETCONFIG1_ADDRESSFILTERING_OFF) );
+    case nodeAddress:         return WRITE_REG(REG_PACKETCONFIG1, (
(READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) |
PACKETCONFIG1_ADDRESSFILTERING_NODE) );
+    case nodeOrBroadcastAddress: return WRITE_REG(REG_PACKETCONFIG1, (
(READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) |
PACKETCONFIG1_ADDRESSFILTERING_NODEBROADCAST) );
+    default:             INVALID_PARAM;
+    }
+}
+
+int rf69_set_payload_length(struct spi_device *spi, u8 payloadLength)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: payload length");
+    #endif
+
+    return WRITE_REG(REG_PAYLOAD_LENGTH, payloadLength);
+}
+
+u8  rf69_get_payload_length(struct spi_device *spi)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "get: payload length");
+    #endif
+
+    return (u8) READ_REG(REG_PAYLOAD_LENGTH);
+}
+
+int rf69_set_node_address(struct spi_device *spi, u8 nodeAddress)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: node address");
+    #endif
+
+    return WRITE_REG(REG_NODEADRS, nodeAddress);
+}
+
+int rf69_set_broadcast_address(struct spi_device *spi, u8 broadcastAddress=
)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: broadcast address");
+    #endif
+
+    return WRITE_REG(REG_BROADCASTADRS, broadcastAddress);
+}
+
+int rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCondit=
ion
txStartCondition)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: start condition");
+    #endif
+
+    switch(txStartCondition) {
+    case fifoLevel:       return WRITE_REG(REG_FIFO_THRESH,
(READ_REG(REG_FIFO_THRESH) & ~MASK_FIFO_THRESH_TXSTART) );
+    case fifoNotEmpty: return WRITE_REG(REG_FIFO_THRESH,
(READ_REG(REG_FIFO_THRESH) |  MASK_FIFO_THRESH_TXSTART) );
+    default:       INVALID_PARAM;
+    }
+}
+
+int rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold)
+{
+    int retval;
+
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: fifo threshold");
+    #endif
+
+    // check input value
+    if (threshold & 0x80)
+        INVALID_PARAM;
+
+    // write value
+    retval =3D WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) &
~MASK_FIFO_THRESH_VALUE) | threshold);
+    if (retval)
+        return retval;
+
+    // access the fifo to activate new threshold
+    return rf69_read_fifo (spi, (u8*) &retval, 1); // retval used as buffe=
r
+}
+
+int rf69_set_dagc(struct spi_device *spi, enum dagc dagc)
+{
+    #ifdef DEBUG
+        dev_dbg(&spi->dev, "set: dagc");
+    #endif
+
+    switch(dagc) {
+    case normalMode:         return WRITE_REG(REG_TESTDAGC, DAGC_NORMAL);
+    case improve:             return WRITE_REG(REG_TESTDAGC,
DAGC_IMPROVED_LOWBETA0);
+    case improve4LowModulationIndex: return WRITE_REG(REG_TESTDAGC,
DAGC_IMPROVED_LOWBETA1);
+    default:             INVALID_PARAM;
+    }
+}
+
+/*------------------------------------------------------------------------=
-*/
+
+int rf69_read_fifo (struct spi_device *spi, u8 *buffer, unsigned int size)
+{
+    #ifdef DEBUG_FIFO_ACCESS   =20
+        int i;
+    #endif
+    struct spi_transfer transfer;
+    u8 local_buffer[FIFO_SIZE + 1];
+    int retval;
+
+    if (size > FIFO_SIZE)
+    {
+        #ifdef DEBUG
+            dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then
internal buffer \n");
+        #endif
+        return -EMSGSIZE;
+    }
+
+    /* prepare a bidirectional transfer */
+    local_buffer[0] =3D REG_FIFO;
+    memset(&transfer, 0, sizeof(transfer));
+      transfer.tx_buf =3D local_buffer;
+      transfer.rx_buf =3D local_buffer;
+    transfer.len    =3D size+1;
+
+    retval =3D spi_sync_transfer(spi, &transfer, 1);
+
+    #ifdef DEBUG_FIFO_ACCESS
+        for (i=3D0; i<size; i++)
+            dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i+1]);
+    #endif
+
+    memcpy(buffer, &local_buffer[1], size);  // TODO: ohne memcopy w=C3=A4=
re sch=C3=B6ner
+
+    return retval;
+}
+
+int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
+{
+    #ifdef DEBUG_FIFO_ACCESS   =20
+        int i;
+    #endif
+    char spi_address =3D REG_FIFO | WRITE_BIT;
+    u8 local_buffer[FIFO_SIZE + 1];
+
+    if (size > FIFO_SIZE)
+    {
+        #ifdef DEBUG
+            dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then
internal buffer \n");
+        #endif
+        return -EMSGSIZE;
+    }
+
+    local_buffer[0] =3D spi_address;
+    memcpy(&local_buffer[1], buffer, size);  // TODO: ohne memcopy w=C3=A4=
re sch=C3=B6ner
+
+    #ifdef DEBUG_FIFO_ACCESS
+        for (i=3D0; i<size; i++)
+            dev_dbg(&spi->dev, "0x%x\n",buffer[i]);
+    #endif
+
+    return spi_write (spi, local_buffer, size + 1);
+}
+
+/*------------------------------------------------------------------------=
-*/
+
+u8 rf69_read_reg(struct spi_device *spi, u8 addr)
+{
+    int retval;
+
+    retval =3D spi_w8r8(spi, addr);
+
+    #ifdef DEBUG_VALUES
+        if (retval < 0)
+            /* should never happen, since we already checked,
+               that module is connected. Therefore no error
+               handling, just an optional error message... */
+            dev_dbg(&spi->dev, "read 0x%x FAILED\n",
+                addr);
+        else
+            dev_dbg(&spi->dev, "read 0x%x from reg 0x%x\n",
+                retval,
+                addr);
+    #endif
+
+    return retval;
+}
+
+int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value)
+{
+    int retval;
+    char buffer[2];
+   =20
+    buffer[0] =3D addr | WRITE_BIT;
+    buffer[1] =3D value;
+
+    retval =3D spi_write(spi, &buffer, 2);
+
+    #ifdef DEBUG_VALUES
+        if (retval < 0)
+            /* should never happen, since we already checked,
+               that module is connected. Therefore no error
+               handling, just an optional error message... */
+            dev_dbg(&spi->dev, "write 0x%x to 0x%x FAILED\n",
+                value,
+                addr);
+        else
+            dev_dbg(&spi->dev, "wrote 0x%x to reg 0x%x\n",
+                value,
+                addr);
+    #endif
+
+    return retval;
+}
+
+
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
new file mode 100644
index 0000000..6a6841b
--- /dev/null
+++ b/drivers/staging/pi433/rf69.h
@@ -0,0 +1,82 @@
+/*
+ * hardware abstraction/register access for HopeRf rf69 radio module
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *    Marcus Wolf <linux@wolf-entwicklungen.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef RF69_H
+#define RF69_H
+
+#include "rf69_enum.h"
+#include "rf69_registers.h"
+
+#define F_OSC         32000000  /* in Hz */
+#define FREQUENCY    433920000 /* in Hz, modifying this value impacts CE
certification */
+#define FIFO_SIZE     66        /* in byte */
+#define FIFO_THRESHOLD    15       /* in byte */
+
+int rf69_set_mode(struct spi_device *spi, enum mode mode);
+int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode);
+int rf69_set_modulation(struct spi_device *spi, enum modulation modulation=
);
+enum modulation rf69_get_modulation(struct spi_device *spi);
+int rf69_set_modulation_shaping(struct spi_device *spi, enum modShaping
modShaping);
+int rf69_set_bit_rate(struct spi_device *spi, u16 bitRate);
+int rf69_set_deviation(struct spi_device *spi, u32 deviation);
+int rf69_set_frequency(struct spi_device *spi, u32 frequency);
+int rf69_set_amplifier_0(struct spi_device *spi, enum optionOnOff optionOn=
Off);
+int rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOff optionOn=
Off);
+int rf69_set_amplifier_2(struct spi_device *spi, enum optionOnOff optionOn=
Off);
+int rf69_set_output_power_level(struct spi_device *spi, u8 powerLevel);
+int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paRamp);
+int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedan=
ce
antennaImpedance);
+int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain);
+enum lnaGain rf69_get_lna_gain(struct spi_device *spi);
+int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi, u8 reg, e=
num
dccPercent dccPercent);
+int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent
dccPercent);
+int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum
dccPercent dccPercent);
+int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8
exponent);
+int rf69_set_bandwidth_during_afc(struct spi_device *spi, enum mantisse
mantisse, u8 exponent);
+int rf69_set_ook_threshold_type(struct spi_device *spi, enum thresholdType
thresholdType);
+int rf69_set_ook_threshold_step(struct spi_device *spi, enum thresholdStep
thresholdStep);
+int rf69_set_ook_threshold_dec(struct spi_device *spi, enum thresholdDecre=
ment
thresholdDecrement);
+int rf69_set_dio_mapping(struct spi_device *spi, u8 DIONumber, u8 value);
+bool rf69_get_flag(struct spi_device *spi, enum flag flag);
+int rf69_reset_flag(struct spi_device *spi, enum flag flag);
+int rf69_set_rssi_threshold(struct spi_device *spi, u8 threshold);
+int rf69_set_rx_start_timeout(struct spi_device *spi, u8 timeout);
+int rf69_set_rssi_timeout(struct spi_device *spi, u8 timeout);
+int rf69_set_preamble_length(struct spi_device *spi, u16 preambleLength);
+int rf69_set_sync_enable(struct spi_device *spi, enum optionOnOff optionOn=
Off);
+int rf69_set_fifo_fill_condition(struct spi_device *spi, enum fifoFillCond=
ition
fifoFillCondition);
+int rf69_set_sync_size(struct spi_device *spi, u8 sync_size);
+int rf69_set_sync_tolerance(struct spi_device *spi, u8 syncTolerance);
+int rf69_set_sync_values(struct spi_device *spi, u8 syncValues[8]);
+int rf69_set_packet_format(struct spi_device * spi, enum packetFormat
packetFormat);
+int rf69_set_crc_enable(struct spi_device *spi, enum optionOnOff optionOnO=
ff);
+int rf69_set_adressFiltering(struct spi_device *spi, enum addressFiltering
addressFiltering);
+int rf69_set_payload_length(struct spi_device *spi, u8 payloadLength);
+u8  rf69_get_payload_length(struct spi_device *spi);
+int rf69_set_node_address(struct spi_device *spi, u8 nodeAddress);
+int rf69_set_broadcast_address(struct spi_device *spi, u8 broadcastAddress=
);
+int rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCondit=
ion
txStartCondition);
+int rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold);
+int rf69_set_dagc(struct spi_device *spi, enum dagc dagc);
+
+int rf69_read_fifo (struct spi_device *spi, u8 *buffer, unsigned int size)=
;
+int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)=
;
+
+u8  rf69_read_reg (struct spi_device *spi, u8 addr);
+int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value);
+
+
+#endif
diff --git a/drivers/staging/pi433/rf69_enum.h
b/drivers/staging/pi433/rf69_enum.h
new file mode 100644
index 0000000..fbfb59b
--- /dev/null
+++ b/drivers/staging/pi433/rf69_enum.h
@@ -0,0 +1,201 @@
+/*
+ * enumerations for HopeRf rf69 radio module
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *    Marcus Wolf <linux@wolf-entwicklungen.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef RF69_ENUM_H
+#define RF69_ENUM_H
+
+enum optionOnOff
+{
+    optionOff,
+    optionOn
+};
+
+enum mode
+{
+    mode_sleep,
+    standby,
+    synthesizer,
+    transmit,
+    receive
+};
+
+enum dataMode
+{
+    packet,
+    continuous,
+    continuousNoSync
+};
+
+enum modulation
+{
+    OOK,
+    FSK
+};
+
+enum modShaping
+{
+    shapingOff,
+    shaping1_0,
+    shaping0_5,
+    shaping0_3,
+    shapingBR,
+    shaping2BR
+};
+
+enum paRamp
+{
+    ramp3400,
+    ramp2000,
+    ramp1000,
+    ramp500,
+    ramp250,
+    ramp125,
+    ramp100,
+    ramp62,
+    ramp50,
+    ramp40,
+    ramp31,
+    ramp25,
+    ramp20,
+    ramp15,
+    ramp12,
+    ramp10
+};
+
+enum antennaImpedance
+{
+    fiftyOhm,
+    twohundretOhm
+};
+
+enum lnaGain
+{
+    automatic,
+    max,
+    maxMinus6,
+    maxMinus12,
+    maxMinus24,
+    maxMinus36,
+    maxMinus48,
+    undefined
+};
+
+enum dccPercent
+{
+    dcc16Percent,
+    dcc8Percent,
+    dcc4Percent,
+    dcc2Percent,
+    dcc1Percent,
+    dcc0_5Percent,
+    dcc0_25Percent,
+    dcc0_125Percent
+};
+
+enum mantisse
+{
+    mantisse16,
+    mantisse20,
+    mantisse24
+};
+
+enum thresholdType
+{
+    fixed,
+    peak,
+    average
+};
+
+enum thresholdStep
+{
+    step_0_5db,
+    step_1_0db,
+    step_1_5db,
+    step_2_0db,
+    step_3_0db,
+    step_4_0db,
+    step_5_0db,
+    step_6_0db
+};
+
+enum thresholdDecrement
+{
+    dec_every8th,
+    dec_every4th,
+    dec_every2nd,
+    dec_once,
+    dec_twice,
+    dec_4times,
+    dec_8times,
+    dec_16times
+};
+
+enum flag
+{
+    modeSwitchCompleted,
+    readyToReceive,
+    readyToSend,
+    pllLocked,
+    rssiExceededThreshold,
+    timeout,
+    automode,
+    syncAddressMatch,
+    fifoFull,
+//    fifoNotEmpty, collision with next enum; replaced by following enum..=
.
+    fifoEmpty,
+    fifoLevelBelowThreshold,
+    fifoOverrun,
+    packetSent,
+    payloadReady,
+    crcOk,
+    batteryLow
+};
+
+enum fifoFillCondition
+{
+    afterSyncInterrupt,
+    always
+};
+
+enum packetFormat
+{
+    packetLengthFix,
+    packetLengthVar
+};
+
+enum txStartCondition
+{
+    fifoLevel,
+    fifoNotEmpty
+};
+
+enum addressFiltering
+{
+    filteringOff,
+    nodeAddress,
+    nodeOrBroadcastAddress
+};
+
+enum dagc
+{
+    normalMode,
+    improve,
+    improve4LowModulationIndex
+};
+
+
+#endif
diff --git a/drivers/staging/pi433/rf69_registers.h
b/drivers/staging/pi433/rf69_registers.h
new file mode 100644
index 0000000..d0c4992
--- /dev/null
+++ b/drivers/staging/pi433/rf69_registers.h
@@ -0,0 +1,489 @@
+/*
+ * register description for HopeRf rf69 radio module
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *    Marcus Wolf <linux@wolf-entwicklungen.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/*******************************************/
+/* RF69 register addresses           */
+/*******************************************/
+#define  REG_FIFO            0x00
+#define  REG_OPMODE            0x01
+#define  REG_DATAMODUL            0x02
+#define  REG_BITRATE_MSB        0x03
+#define  REG_BITRATE_LSB        0x04
+#define  REG_FDEV_MSB            0x05
+#define  REG_FDEV_LSB            0x06
+#define  REG_FRF_MSB            0x07
+#define  REG_FRF_MID            0x08
+#define  REG_FRF_LSB            0x09
+#define  REG_OSC1            0x0A
+#define  REG_AFCCTRL            0x0B
+#define  REG_LOWBAT            0x0C
+#define  REG_LISTEN1            0x0D
+#define  REG_LISTEN2            0x0E
+#define  REG_LISTEN3            0x0F
+#define  REG_VERSION            0x10
+#define  REG_PALEVEL            0x11
+#define  REG_PARAMP            0x12
+#define  REG_OCP            0x13
+#define  REG_AGCREF            0x14 /* not available on RF69 */
+#define  REG_AGCTHRESH1            0x15 /* not available on RF69 */
+#define  REG_AGCTHRESH2            0x16 /* not available on RF69 */
+#define  REG_AGCTHRESH3            0x17 /* not available on RF69 */
+#define  REG_LNA            0x18
+#define  REG_RXBW            0x19
+#define  REG_AFCBW            0x1A
+#define  REG_OOKPEAK            0x1B
+#define  REG_OOKAVG            0x1C
+#define  REG_OOKFIX            0x1D
+#define  REG_AFCFEI            0x1E
+#define  REG_AFCMSB            0x1F
+#define  REG_AFCLSB            0x20
+#define  REG_FEIMSB            0x21
+#define  REG_FEILSB            0x22
+#define  REG_RSSICONFIG            0x23
+#define  REG_RSSIVALUE            0x24
+#define  REG_DIOMAPPING1        0x25
+#define  REG_DIOMAPPING2        0x26
+#define  REG_IRQFLAGS1            0x27
+#define  REG_IRQFLAGS2            0x28
+#define  REG_RSSITHRESH            0x29
+#define  REG_RXTIMEOUT1            0x2A
+#define  REG_RXTIMEOUT2            0x2B
+#define  REG_PREAMBLE_MSB        0x2C
+#define  REG_PREAMBLE_LSB        0x2D
+#define  REG_SYNC_CONFIG        0x2E
+#define  REG_SYNCVALUE1            0x2F
+#define  REG_SYNCVALUE2            0x30
+#define  REG_SYNCVALUE3            0x31
+#define  REG_SYNCVALUE4            0x32
+#define  REG_SYNCVALUE5            0x33
+#define  REG_SYNCVALUE6            0x34
+#define  REG_SYNCVALUE7            0x35
+#define  REG_SYNCVALUE8            0x36
+#define  REG_PACKETCONFIG1        0x37
+#define  REG_PAYLOAD_LENGTH        0x38
+#define  REG_NODEADRS            0x39
+#define  REG_BROADCASTADRS        0x3A
+#define  REG_AUTOMODES            0x3B
+#define  REG_FIFO_THRESH        0x3C
+#define  REG_PACKETCONFIG2        0x3D
+#define  REG_AESKEY1            0x3E
+#define  REG_AESKEY2            0x3F
+#define  REG_AESKEY3            0x40
+#define  REG_AESKEY4            0x41
+#define  REG_AESKEY5            0x42
+#define  REG_AESKEY6            0x43
+#define  REG_AESKEY7            0x44
+#define  REG_AESKEY8            0x45
+#define  REG_AESKEY9            0x46
+#define  REG_AESKEY10            0x47
+#define  REG_AESKEY11            0x48
+#define  REG_AESKEY12            0x49
+#define  REG_AESKEY13            0x4A
+#define  REG_AESKEY14            0x4B
+#define  REG_AESKEY15            0x4C
+#define  REG_AESKEY16            0x4D
+#define  REG_TEMP1            0x4E
+#define  REG_TEMP2            0x4F
+#define  REG_TESTPA1            0x5A /* only present on RFM69HW */
+#define  REG_TESTPA2            0x5C /* only present on RFM69HW */
+#define  REG_TESTDAGC            0x6F
+
+/******************************************************/
+/* RF69/SX1231 bit definition                */
+/******************************************************/
+/* write bit */
+#define WRITE_BIT                0x80
+
+/* RegOpMode */
+#define  MASK_OPMODE_SEQUENCER_OFF        0x80
+#define  MASK_OPMODE_LISTEN_ON            0x40
+#define  MASK_OPMODE_LISTEN_ABORT        0x20
+#define  MASK_OPMODE_MODE            0x1C
+
+#define  OPMODE_MODE_SLEEP            0x00
+#define  OPMODE_MODE_STANDBY            0x04 /* default */
+#define  OPMODE_MODE_SYNTHESIZER        0x08
+#define  OPMODE_MODE_TRANSMIT            0x0C
+#define  OPMODE_MODE_RECEIVE            0x10
+
+/* RegDataModul */
+#define  MASK_DATAMODUL_MODE            0x06
+#define  MASK_DATAMODUL_MODULATION_TYPE        0x18
+#define  MASK_DATAMODUL_MODULATION_SHAPE    0x03
+
+#define  DATAMODUL_MODE_PACKET            0x00 /* default */
+#define  DATAMODUL_MODE_CONTINUOUS        0x40
+#define  DATAMODUL_MODE_CONTINUOUS_NOSYNC    0x60
+
+#define  DATAMODUL_MODULATION_TYPE_FSK        0x00 /* default */
+#define  DATAMODUL_MODULATION_TYPE_OOK        0x08
+
+#define  DATAMODUL_MODULATION_SHAPE_NONE    0x00 /* default */
+#define  DATAMODUL_MODULATION_SHAPE_1_0        0x01
+#define  DATAMODUL_MODULATION_SHAPE_0_5        0x02
+#define  DATAMODUL_MODULATION_SHAPE_0_3        0x03
+#define  DATAMODUL_MODULATION_SHAPE_BR        0x01
+#define  DATAMODUL_MODULATION_SHAPE_2BR        0x02
+
+/* RegFDevMsb (0x05)*/
+#define FDEVMASB_MASK                0x3f
+
+/*
+// RegOsc1
+#define  OSC1_RCCAL_START            0x80
+#define  OSC1_RCCAL_DONE            0x40
+
+// RegLowBat
+#define  LOWBAT_MONITOR                0x10
+#define  LOWBAT_ON                0x08
+#define  LOWBAT_OFF                0x00  // Default
+
+#define  LOWBAT_TRIM_1695            0x00
+#define  LOWBAT_TRIM_1764            0x01
+#define  LOWBAT_TRIM_1835            0x02  // Default
+#define  LOWBAT_TRIM_1905            0x03
+#define  LOWBAT_TRIM_1976            0x04
+#define  LOWBAT_TRIM_2045            0x05
+#define  LOWBAT_TRIM_2116            0x06
+#define  LOWBAT_TRIM_2185            0x07
+
+
+// RegListen1
+#define  LISTEN1_RESOL_64            0x50
+#define  LISTEN1_RESOL_4100            0xA0  // Default
+#define  LISTEN1_RESOL_262000            0xF0
+
+#define  LISTEN1_CRITERIA_RSSI            0x00  // Default
+#define  LISTEN1_CRITERIA_RSSIANDSYNC        0x08
+
+#define  LISTEN1_END_00                0x00
+#define  LISTEN1_END_01                0x02  // Default
+#define  LISTEN1_END_10                0x04
+
+
+// RegListen2
+#define  LISTEN2_COEFIDLE_VALUE            0xF5 // Default
+
+// RegListen3
+#define  LISTEN3_COEFRX_VALUE            0x20 // Default
+*/
+
+// RegPaLevel
+#define  MASK_PALEVEL_PA0            0x80
+#define  MASK_PALEVEL_PA1            0x40
+#define  MASK_PALEVEL_PA2            0x20
+#define  MASK_PALEVEL_OUTPUT_POWER        0x1F
+
+
+
+// RegPaRamp
+#define  PARAMP_3400                0x00
+#define  PARAMP_2000                0x01
+#define  PARAMP_1000                0x02
+#define  PARAMP_500                0x03
+#define  PARAMP_250                0x04
+#define  PARAMP_125                0x05
+#define  PARAMP_100                0x06
+#define  PARAMP_62                0x07
+#define  PARAMP_50                0x08
+#define  PARAMP_40                0x09 /* default */
+#define  PARAMP_31                0x0A
+#define  PARAMP_25                0x0B
+#define  PARAMP_20                0x0C
+#define  PARAMP_15                0x0D
+#define  PARAMP_12                0x0E
+#define  PARAMP_10                0x0F
+
+#define  MASK_PARAMP                0x0F
+
+/*
+// RegOcp
+#define  OCP_OFF                0x0F
+#define  OCP_ON                    0x1A  // Default
+
+#define  OCP_TRIM_45                0x00
+#define  OCP_TRIM_50                0x01
+#define  OCP_TRIM_55                0x02
+#define  OCP_TRIM_60                0x03
+#define  OCP_TRIM_65                0x04
+#define  OCP_TRIM_70                0x05
+#define  OCP_TRIM_75                0x06
+#define  OCP_TRIM_80                0x07
+#define  OCP_TRIM_85                0x08
+#define  OCP_TRIM_90                0x09
+#define  OCP_TRIM_95                0x0A
+#define  OCP_TRIM_100                0x0B  // Default
+#define  OCP_TRIM_105                0x0C
+#define  OCP_TRIM_110                0x0D
+#define  OCP_TRIM_115                0x0E
+#define  OCP_TRIM_120                0x0F
+*/
+
+/* RegLna (0x18) */
+#define  MASK_LNA_ZIN                0x80
+#define  MASK_LNA_CURRENT_GAIN            0x38
+#define  MASK_LNA_GAIN                0x07
+
+#define  LNA_GAIN_AUTO                0x00 /* default */
+#define  LNA_GAIN_MAX                0x01
+#define  LNA_GAIN_MAX_MINUS_6            0x02
+#define  LNA_GAIN_MAX_MINUS_12            0x03
+#define  LNA_GAIN_MAX_MINUS_24            0x04
+#define  LNA_GAIN_MAX_MINUS_36            0x05
+#define  LNA_GAIN_MAX_MINUS_48            0x06
+
+
+/* RegRxBw (0x19) and RegAfcBw (0x1A) */
+#define  MASK_BW_DCC_FREQ            0xE0
+#define  MASK_BW_MANTISSE            0x18
+#define  MASK_BW_EXPONENT            0x07
+
+#define  BW_DCC_16_PERCENT            0x00
+#define  BW_DCC_8_PERCENT            0x20
+#define  BW_DCC_4_PERCENT            0x40 /* default */
+#define  BW_DCC_2_PERCENT            0x60
+#define  BW_DCC_1_PERCENT            0x80
+#define  BW_DCC_0_5_PERCENT            0xA0
+#define  BW_DCC_0_25_PERCENT            0xC0
+#define  BW_DCC_0_125_PERCENT            0xE0
+
+#define  BW_MANT_16                0x00
+#define  BW_MANT_20                0x08
+#define  BW_MANT_24                0x10 /* default */
+
+
+/* RegOokPeak (0x1B) */
+#define  MASK_OOKPEAK_THRESTYPE            0xc0
+#define  MASK_OOKPEAK_THRESSTEP            0x38
+#define  MASK_OOKPEAK_THRESDEC            0x07
+
+#define  OOKPEAK_THRESHTYPE_FIXED        0x00
+#define  OOKPEAK_THRESHTYPE_PEAK        0x40 /* default */
+#define  OOKPEAK_THRESHTYPE_AVERAGE        0x80
+
+#define  OOKPEAK_THRESHSTEP_0_5_DB        0x00 /* default */
+#define  OOKPEAK_THRESHSTEP_1_0_DB        0x08
+#define  OOKPEAK_THRESHSTEP_1_5_DB        0x10
+#define  OOKPEAK_THRESHSTEP_2_0_DB        0x18
+#define  OOKPEAK_THRESHSTEP_3_0_DB        0x20
+#define  OOKPEAK_THRESHSTEP_4_0_DB        0x28
+#define  OOKPEAK_THRESHSTEP_5_0_DB        0x30
+#define  OOKPEAK_THRESHSTEP_6_0_DB        0x38
+
+#define  OOKPEAK_THRESHDEC_ONCE            0x00 /* default */
+#define  OOKPEAK_THRESHDEC_EVERY_2ND        0x01
+#define  OOKPEAK_THRESHDEC_EVERY_4TH        0x02
+#define  OOKPEAK_THRESHDEC_EVERY_8TH        0x03
+#define  OOKPEAK_THRESHDEC_TWICE        0x04
+#define  OOKPEAK_THRESHDEC_4_TIMES        0x05
+#define  OOKPEAK_THRESHDEC_8_TIMES        0x06
+#define  OOKPEAK_THRESHDEC_16_TIMES        0x07
+
+/*
+// RegOokAvg
+#define  OOKAVG_AVERAGETHRESHFILT_00        0x00
+#define  OOKAVG_AVERAGETHRESHFILT_01        0x40
+#define  OOKAVG_AVERAGETHRESHFILT_10        0x80  // Default
+#define  OOKAVG_AVERAGETHRESHFILT_11        0xC0
+
+
+// RegAfcFei
+#define  AFCFEI_FEI_DONE            0x40
+#define  AFCFEI_FEI_START            0x20
+#define  AFCFEI_AFC_DONE            0x10
+#define  AFCFEI_AFCAUTOCLEAR_ON            0x08
+#define  AFCFEI_AFCAUTOCLEAR_OFF        0x00  // Default
+
+#define  AFCFEI_AFCAUTO_ON            0x04
+#define  AFCFEI_AFCAUTO_OFF            0x00  // Default
+
+#define  AFCFEI_AFC_CLEAR            0x02
+#define  AFCFEI_AFC_START            0x01
+
+// RegRssiConfig
+#define  RSSI_FASTRX_ON                0x08
+#define  RSSI_FASTRX_OFF            0x00  // Default
+#define  RSSI_DONE                0x02
+#define  RSSI_START                0x01
+*/
+
+/* RegDioMapping1 */
+#define  MASK_DIO0                0xC0
+#define  MASK_DIO1                0x30
+#define  MASK_DIO2                0x0C
+#define  MASK_DIO3                0x03
+#define  SHIFT_DIO0                6
+#define  SHIFT_DIO1                4
+#define  SHIFT_DIO2                2
+#define  SHIFT_DIO3                0
+
+/* RegDioMapping2 */
+#define  MASK_DIO4                0xC0
+#define  MASK_DIO5                0x30
+#define  SHIFT_DIO4                6
+#define  SHIFT_DIO5                4
+
+/* DIO numbers */
+#define  DIO0                    0
+#define  DIO1                    1
+#define  DIO2                    2
+#define  DIO3                    3
+#define  DIO4                    4
+#define  DIO5                    5
+
+/* DIO Mapping values (packet mode) */
+#define  DIO_ModeReady_DIO4            0x00
+#define  DIO_ModeReady_DIO5            0x03
+#define  DIO_ClkOut                0x00
+#define  DIO_Data                0x01
+#define  DIO_TimeOut_DIO1            0x03
+#define  DIO_TimeOut_DIO4            0x00
+#define  DIO_Rssi_DIO0                0x03
+#define  DIO_Rssi_DIO3_4            0x01
+#define  DIO_RxReady                0x02
+#define  DIO_PLLLock                0x03
+#define  DIO_TxReady                0x01
+#define  DIO_FifoFull_DIO1            0x01
+#define  DIO_FifoFull_DIO3            0x00
+#define  DIO_SyncAddress            0x02
+#define  DIO_FifoNotEmpty_DIO1            0x02
+#define  DIO_FifoNotEmpty_FIO2            0x00
+#define  DIO_Automode                0x04
+#define  DIO_FifoLevel                0x00
+#define  DIO_CrcOk                0x00
+#define  DIO_PayloadReady            0x01
+#define  DIO_PacketSent                0x00
+#define  DIO_Dclk                0x00
+
+/* RegDioMapping2 CLK_OUT part */
+#define  MASK_DIOMAPPING2_CLK_OUT        0x07
+
+#define  DIOMAPPING2_CLK_OUT_NO_DIV        0x00
+#define  DIOMAPPING2_CLK_OUT_DIV_2        0x01
+#define  DIOMAPPING2_CLK_OUT_DIV_4        0x02
+#define  DIOMAPPING2_CLK_OUT_DIV_8        0x03
+#define  DIOMAPPING2_CLK_OUT_DIV_16        0x04
+#define  DIOMAPPING2_CLK_OUT_DIV_32        0x05
+#define  DIOMAPPING2_CLK_OUT_RC            0x06
+#define  DIOMAPPING2_CLK_OUT_OFF        0x07 /* default */
+
+/* RegIrqFlags1 */
+#define  MASK_IRQFLAGS1_MODE_READY        0x80
+#define  MASK_IRQFLAGS1_RX_READY        0x40
+#define  MASK_IRQFLAGS1_TX_READY        0x20
+#define  MASK_IRQFLAGS1_PLL_LOCK        0x10
+#define  MASK_IRQFLAGS1_RSSI            0x08
+#define  MASK_IRQFLAGS1_TIMEOUT            0x04
+#define  MASK_IRQFLAGS1_AUTOMODE        0x02
+#define  MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH    0x01
+
+/* RegIrqFlags2 */
+#define  MASK_IRQFLAGS2_FIFO_FULL        0x80
+#define  MASK_IRQFLAGS2_FIFO_NOT_EMPTY        0x40
+#define  MASK_IRQFLAGS2_FIFO_LEVEL        0x20
+#define  MASK_IRQFLAGS2_FIFO_OVERRUN        0x10
+#define  MASK_IRQFLAGS2_PACKET_SENT        0x08
+#define  MASK_IRQFLAGS2_PAYLOAD_READY        0x04
+#define  MASK_IRQFLAGS2_CRC_OK            0x02
+#define  MASK_IRQFLAGS2_LOW_BAT            0x01
+
+/* RegSyncConfig */
+#define  MASK_SYNC_CONFIG_SYNC_ON        0x80 /* default */
+#define  MASK_SYNC_CONFIG_FIFO_FILL_CONDITION    0x40
+#define  MASK_SYNC_CONFIG_SYNC_SIZE        0x38
+#define  MASK_SYNC_CONFIG_SYNC_TOLERANCE    0x07
+
+/* RegPacketConfig1 */
+#define  MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE    0x80
+#define  MASK_PACKETCONFIG1_DCFREE            0x60
+#define  MASK_PACKETCONFIG1_CRC_ON            0x10 /* default */
+#define  MASK_PACKETCONFIG1_CRCAUTOCLEAR_OFF        0x08
+#define  MASK_PACKETCONFIG1_ADDRESSFILTERING        0x06
+
+#define  PACKETCONFIG1_DCFREE_OFF            0x00 /* default */
+#define  PACKETCONFIG1_DCFREE_MANCHESTER        0x20
+#define  PACKETCONFIG1_DCFREE_WHITENING            0x40
+#define  PACKETCONFIG1_ADDRESSFILTERING_OFF        0x00 /* default */
+#define  PACKETCONFIG1_ADDRESSFILTERING_NODE        0x02
+#define  PACKETCONFIG1_ADDRESSFILTERING_NODEBROADCAST    0x04
+
+/*
+// RegAutoModes
+#define  AUTOMODES_ENTER_OFF            0x00  // Default
+#define  AUTOMODES_ENTER_FIFONOTEMPTY        0x20
+#define  AUTOMODES_ENTER_FIFOLEVEL        0x40
+#define  AUTOMODES_ENTER_CRCOK            0x60
+#define  AUTOMODES_ENTER_PAYLOADREADY        0x80
+#define  AUTOMODES_ENTER_SYNCADRSMATCH        0xA0
+#define  AUTOMODES_ENTER_PACKETSENT        0xC0
+#define  AUTOMODES_ENTER_FIFOEMPTY        0xE0
+
+#define  AUTOMODES_EXIT_OFF            0x00  // Default
+#define  AUTOMODES_EXIT_FIFOEMPTY        0x04
+#define  AUTOMODES_EXIT_FIFOLEVEL        0x08
+#define  AUTOMODES_EXIT_CRCOK            0x0C
+#define  AUTOMODES_EXIT_PAYLOADREADY        0x10
+#define  AUTOMODES_EXIT_SYNCADRSMATCH        0x14
+#define  AUTOMODES_EXIT_PACKETSENT        0x18
+#define  AUTOMODES_EXIT_RXTIMEOUT        0x1C
+
+#define  AUTOMODES_INTERMEDIATE_SLEEP        0x00  // Default
+#define  AUTOMODES_INTERMEDIATE_STANDBY        0x01
+#define  AUTOMODES_INTERMEDIATE_RECEIVER    0x02
+#define  AUTOMODES_INTERMEDIATE_TRANSMITTER    0x03
+
+*/
+/* RegFifoThresh (0x3c) */
+#define  MASK_FIFO_THRESH_TXSTART        0x80
+#define  MASK_FIFO_THRESH_VALUE            0x7F
+
+/*
+
+// RegPacketConfig2
+#define  PACKET2_RXRESTARTDELAY_1BIT        0x00  // Default
+#define  PACKET2_RXRESTARTDELAY_2BITS        0x10
+#define  PACKET2_RXRESTARTDELAY_4BITS        0x20
+#define  PACKET2_RXRESTARTDELAY_8BITS        0x30
+#define  PACKET2_RXRESTARTDELAY_16BITS        0x40
+#define  PACKET2_RXRESTARTDELAY_32BITS        0x50
+#define  PACKET2_RXRESTARTDELAY_64BITS        0x60
+#define  PACKET2_RXRESTARTDELAY_128BITS        0x70
+#define  PACKET2_RXRESTARTDELAY_256BITS        0x80
+#define  PACKET2_RXRESTARTDELAY_512BITS        0x90
+#define  PACKET2_RXRESTARTDELAY_1024BITS    0xA0
+#define  PACKET2_RXRESTARTDELAY_2048BITS    0xB0
+#define  PACKET2_RXRESTARTDELAY_NONE        0xC0
+#define  PACKET2_RXRESTART            0x04
+
+#define  PACKET2_AUTORXRESTART_ON        0x02  // Default
+#define  PACKET2_AUTORXRESTART_OFF        0x00
+
+#define  PACKET2_AES_ON                0x01
+#define  PACKET2_AES_OFF            0x00  // Default
+
+
+// RegTemp1
+#define  TEMP1_MEAS_START            0x08
+#define  TEMP1_MEAS_RUNNING            0x04
+#define  TEMP1_ADCLOWPOWER_ON            0x01  // Default
+#define  TEMP1_ADCLOWPOWER_OFF            0x00
+*/
+
+// RegTestDagc (0x6F)
+#define  DAGC_NORMAL                0x00 /* Reset value */
+#define  DAGC_IMPROVED_LOWBETA1            0x20
+#define  DAGC_IMPROVED_LOWBETA0            0x30 /* Recommended val */
=20
=20
=20
=20

> Greg KH <gregkh@linuxfoundation.org> hat am 12. Juli 2017 um 09:43
> geschrieben:
>
>
> On Tue, Jul 11, 2017 at 06:02:09PM +0200, Marcus Wolf wrote:
> > Hi folks,
> >
> > I developed a radio shield for the 433MHz ISM band [0] for the Raspberr=
y Pi.
> > This shield is called Pi433 [1]. It can be used to communicate between =
two
> > Raspberries or to control third party equipment e. g. cheap radio socke=
ts
> > [2].
> > The base of this radio shield is a radio module from HopeRf - a
> > rfm69cw-433s2.
> >
> > In the beginning, I conrolled the rf69 chip by direct access via SPI, b=
ut I
> > figured out, that several tasks were hard to handle. Especially the
> > following
> > points were annoying:
> > * Just one process could open the SPI interface so just one process was
> > able to access the module
> > * A simultaneous send and receive was very hard to implement
> >
> > Therefore I started to implement a driver.
> > The drivers features:
> > * simple access/nice abstraction of spi registers via open, close,
> > read, write and ioctl
> > * multiple applications can open
> > * tx requests are queued, so every app can send a tx request at any tim=
e
> > * first app asking for rx will block other apps, also asking for rx unt=
il
> > one
> > rx
> > cycle is complete
> > * rx cycle means listening on the air until something appears
> > * if an app wants to tx during the driver is waiting in rx cycle, rx wi=
ll be
> > shortly interrupted to do the tx task
> > * for each tx task a seperate configuration of the rf chip (bitrate,
> > modulation, ...)
> > can be chosen
> > * wrtten in modular architecture, allowing to extend for other products=
 with
> > rf69 chip (e.g. rfm69hcw, ...) or even to support other HopeRf chips wi=
th
> > similar
> > interface (e. g. rfm12, rfm95, ...)
> >
> > In principle the driver was intended to be used by my project
> > (Smarthome-Pi),
> > only.
> > But while having all this nice features, I was asked, whether I could o=
ffer
> > the
> > driver to the community. I never did that before, so I started reading =
about
> > submitting drivers and figured out, that there is a lot of work to do, =
to
> > meet
> > all
> > concepts and ideas of complying to kernel code. I spend some days and
> > modified
> > a lot, but still, a lot of things aren't perfect.
> > Already known tasks are:
> >
> > * coding style does not fully comply with the kernel style guide.
> > * still TODOs, annotated in the code
> > * currently the code introduces new IOCTLs. I'm afraid this is a bad id=
ea.
> > Replace this with another interface, hints are welcome!
> >
> > I tested the patch on Raspbian with Kernel v4.12 and applied the patch =
on
> > mainline Linux v4.12
> >
> > Is it posibble to integrate into the staging area to ease further
> > development?
>
> Sure, I'm always glad to take new drivers, but can you submit it as just
> a single patch, and keep it self-contained (i.e. nothing outside of
> drivers/staging/YOUR_DRIVER/)?
>
> thanks,
>
> greg k-h
>
------=_Part_65627_1469814005.1500117343632
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html><head>
    <meta charset=3D"UTF-8">
</head><body style=3D""><div>Hi Greg,</div>
<div>&#160;</div>
<div>thanks for your reply :-)</div>
<div>&#160;</div>
<div>Today I moved the documentation and header files to drivers/staging/pi=
433 and fromated it as a single patch.</div>
<div>&#160;</div>
<div>Cheers,</div>
<div>&#160;</div>
<div>Marcus</div>
<div>&#160;</div>
<div>diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig<br>inde=
x 268d4e6..fdf060c 100644<br>--- a/drivers/staging/Kconfig<br>+++ b/drivers=
/staging/Kconfig<br>@@ -110,4 +110,6 @@ source &#34;drivers/staging/ccree/K=
config&#34;<br>&#160;<br>&#160;source &#34;drivers/staging/typec/Kconfig&#3=
4;<br>&#160;<br>+source &#34;drivers/staging/pi433/Kconfig&#34;<br>+<br>&#1=
60;endif # STAGING<br>diff --git a/drivers/staging/Makefile b/drivers/stagi=
ng/Makefile<br>index b93e6f5..998f644 100644<br>--- a/drivers/staging/Makef=
ile<br>+++ b/drivers/staging/Makefile<br>@@ -44,3 +44,4 @@ obj-$(CONFIG_KS7=
010)&#160;&#160; &#160;&#160;&#160; &#160;+=3D ks7010/<br>&#160;obj-$(CONFI=
G_GREYBUS)&#160;&#160; &#160;&#160;&#160; &#160;+=3D greybus/<br>&#160;obj-=
$(CONFIG_BCM2835_VCHIQ)&#160;&#160; &#160;+=3D vc04_services/<br>&#160;obj-=
$(CONFIG_CRYPTO_DEV_CCREE)&#160;&#160; &#160;+=3D ccree/<br>+obj-$(CONFIG_P=
I433)&#160;&#160; &#160;&#160;&#160; &#160;+=3D pi433/<br>diff --git a/driv=
ers/staging/pi433/Documentation/devicetree/pi433-overlay.dts b/drivers/stag=
ing/pi433/Documentation/devicetree/pi433-overlay.dts<br>new file mode 10064=
4<br>index 0000000..004b502<br>--- /dev/null<br>+++ b/drivers/staging/pi433=
/Documentation/devicetree/pi433-overlay.dts<br>@@ -0,0 +1,53 @@<br>+// Defi=
nitions for Pi433<br>+/dts-v1/;<br>+/plugin/;<br>+<br>+/ {<br>+&#160;&#160;=
&#160;&#160;&#160;&#160;&#160; compatible =3D &#34;bcm,bcm2835&#34;, &#34;b=
cm,bcm2708&#34;, &#34;bcm,bcm2709&#34;;<br>+<br>+&#160;&#160;&#160;&#160;&#=
160;&#160;&#160; fragment@0 {<br>+&#160;&#160;&#160;&#160;&#160;&#160;&#160=
;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; target =3D &#60;&#38;spi0=
&#62;;<br>+&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#16=
0;&#160;&#160;&#160;&#160; __overlay__ {<br>+&#160;&#160;&#160;&#160;&#160;=
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#1=
60;&#160;&#160;&#160;&#160;&#160; status =3D &#34;okay&#34;;<br>+<br>+&#160=
;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#=
160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; spidev@0{<br>+&#=
160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160=
;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#=
160;&#160;&#160;&#160;&#160;&#160; status =3D &#34;disabled&#34;;<br>+&#160=
;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#=
160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; };<br>+<br>+&#16=
0;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&=
#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; spidev@1{<br>+&=
#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#16=
0;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&=
#160;&#160;&#160;&#160;&#160;&#160; status =3D &#34;disabled&#34;;<br>+&#16=
0;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&=
#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; };<br>+&#160;&#=
160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160=
;&#160; };<br>+&#160;&#160;&#160;&#160;&#160;&#160;&#160; };<br>+<br>+&#160=
;&#160; &#160;fragment@1 {<br>+&#160;&#160; &#160;&#160;&#160; &#160;target=
 =3D &#60;&#38;gpio&#62;;<br>+&#160;&#160; &#160;&#160;&#160; &#160;__overl=
ay__ {<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;pi433_p=
ins: pi433_pins {<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;brcm,pins =3D &#60;7 25 24&#62;;<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;brcm,function =
=3D &#60;0 0 0&#62;; // in in in<br>+&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160; &#160;};<br>+&#160;&#160; &#160;&#160;&#160; &#160;};<br>+&#16=
0;&#160; &#160;};<br>+<br>+&#160;&#160; &#160;fragment@2 {<br>+&#160;&#160;=
 &#160;&#160;&#160; &#160;target =3D &#60;&#38;spi0&#62;;<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;__overlay__ {<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;#address-cells =3D &#60;1&#62;;<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;#size-cells =3D &#60;0&#62;;<br>=
+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;status =3D &#34;o=
kay&#34;;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;pi433: pi433@0 {<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;compatible =3D &#34;Smarthome-Wolf,pi433&#34;;<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
reg =3D &#60;0&#62;;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;spi-max-frequency =3D &#60;10000000&#62;;<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;st=
atus =3D &#34;okay&#34;;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;pinctrl-0 =3D &#60;&#38;pi433_pins&#62;;=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;DIO0-gpio =3D &#60;&#38;gpio 24 0&#62;;<br>+&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;DIO1-gpio =3D &#60;&#38;=
gpio 25 0&#62;;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;DIO2-gpio =3D &#60;&#38;gpio&#160; 7 0&#62;;<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;};<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;};<br>+&#160;&#160; &#160;};<br>+};<br>diff --git a/d=
rivers/staging/pi433/Documentation/devicetree/pi433.txt b/drivers/staging/p=
i433/Documentation/devicetree/pi433.txt<br>new file mode 100644<br>index 00=
00000..14197c6<br>--- /dev/null<br>+++ b/drivers/staging/pi433/Documentatio=
n/devicetree/pi433.txt<br>@@ -0,0 +1,62 @@<br>+* Smarthome-Wolf Pi433 - a 4=
33MHz radio module/shield for Raspberry Pi (see www.pi433.de)<br>+<br>+Requ=
ired properties:<br>+- compatible: must be &#34;Smarthome-Wolf,pi433&#34;<b=
r>+- reg: chip select of SPI Interface<br>+- DIOx-gpio must be dedicated to=
 the GPIO, connected with DIOx of the RFM69 module<br>+<br>+<br>+Example:<b=
r>+<br>+With the following lines in gpio-section, the gpio pins, connected =
with pi433 are <br>+reserved/declared.<br>+<br>+&#38;gpio{<br>+&#160;&#160;=
 &#160;[...]<br>+<br>+&#160;&#160; &#160;pi433_pins: pi433_pins {<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;brcm,pins =3D &#60;7 25 24&#62;;<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;brcm,function =3D &#60;0 0 0&#62;; // in i=
n in<br>+&#160;&#160; &#160;};<br>+<br>+&#160;&#160; &#160;[...]<br>+}<br>+=
<br>+With the following lines in spi section, the device pi433 is declared.=
<br>+It consists of the three gpio pins and an spi interface (here chip sel=
ect 0)<br>+<br>+&#38;spi0{<br>+&#160;&#160; &#160;[...]<br>+<br>+&#160;&#16=
0; &#160;pi433: pi433@0 {<br>+&#160;&#160; &#160;&#160;&#160; &#160;compati=
ble =3D &#34;Smarthome-Wolf,pi433&#34;;<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;reg =3D &#60;0&#62;; /* CE 0 */<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;#address-cells =3D &#60;1&#62;;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;#size-cells =3D &#60;0&#62;;<br>+&#160;&#160; &#160;&#160;&#160; &#160=
;spi-max-frequency =3D &#60;10000000&#62;;<br>+<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;pinctrl-0 =3D &#60;&#38;pi433_pins&#62;;<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;DIO0-gpio =3D &#60;&#38;gpio 24 0&#62;;<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;DIO1-gpio =3D &#60;&#38;gpio 25 0&#62;;<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;DIO2-gpio =3D &#60;&#38;gpio&#160; 7 0=
&#62;;<br>+&#160;&#160; &#160;};<br>+}<br>+<br>+<br>+<br>+For Raspbian user=
s only<br>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>+Since Raspbian supports device tree overlays, you may use and ov=
erlay, instead<br>+of editing your boards device tree.<br>+For using the ov=
erlay, you need to compile the file pi433-overlay.dts you can <br>+find asi=
de to this documentation.<br>+The file needs to be compiled - either manual=
ly or by integration in your kernel<br>+source tree. For a manual compile, =
you may use a command line like the following:<br>+&#39;linux/scripts/dtc/d=
tc -@ -I dts -O dtb -o pi433.dtbo pi433-overlay.dts&#39;<br>+<br>+For compi=
ling inside of the kernel tree, you need to copy pi433-overlay.dts to<br>+a=
rch/arm/boot/dts/overlays and you need to add the file to the list of files=
<br>+in the Makefile over there. Execute &#39;make dtbs&#39; in kernel tree=
 root to make the <br>+kernel make files compile the device tree overlay fo=
r you.<br>+<br>+<br>diff --git a/drivers/staging/pi433/Documentation/pi433.=
txt b/drivers/staging/pi433/Documentation/pi433.txt<br>new file mode 100644=
<br>index 0000000..860dd0f<br>--- /dev/null<br>+++ b/drivers/staging/pi433/=
Documentation/pi433.txt<br>@@ -0,0 +1,274 @@<br>+=3D=3D=3D=3D=3D <br>+Pi433=
 <br>+=3D=3D=3D=3D=3D <br>+ <br>+ <br>+Introduction <br>+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D <br>+This driver is for controlling pi433, a radio modul=
e for the Raspberry Pi <br>+(www.pi433.de). It supports transmission and re=
ception. It can be opened <br>+by multiple applications for transmission an=
d reception. While transmit <br>+jobs were queued and process automatically=
 in the background, the first &#160;<br>+application asking for reception w=
ill block out all other applications &#160;<br>+until something gets receiv=
ed terminates the read request. &#160;<br>+The driver supports on the fly r=
eloading of the hardware fifo of the rf <br>+chip, thus enabling for much l=
onger telegrams then hardware fifo size. <br>+ <br>+Discription of driver o=
peration <br>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D <br>+ <br>+a) transmission <br>+ <br>+Eac=
h transmission can take place with a different configuration of the rf <br>=
+module. Therfore each application can set its own set of parameters. The d=
river <br>+takes care, that each transmission takes place with the paramete=
rset of the <br>+application, that requests the transmission. To allow the =
transmission to take <br>+place in the background, a tx thread is introduce=
d. <br>+The transfer of data from the main thread to the tx thread is reali=
sed by a <br>+kfifo. With each write request of an application, the passed =
in data and the <br>+corresponding parameter set gets written to the kfifo.=
 &#160;<br>+On the other &#34;side&#34; of the kfifo, the tx thread continu=
ously checks, whether the <br>+kfifo is empty. If not, it gets one set of c=
onfig and data from the kfifo. If &#160;<br>+there is no receive request or=
 the receiver is still waiting for something in <br>+the air, the rf module=
 is set to standby, the parameters for transmission gets <br>+set, the hard=
ware fifo of the rf chip gets preloaded and the transmission gets <br>+star=
ted. Upon hardware fifo threshold interrupt it gets reloaded, thus enabling=
 <br>+much longer telegrams then hardware fifo size. If the telegram is sen=
d and there <br>+is more data available in the kfifo, the procedure is repe=
ated. If not the <br>+transmission cycle ends. <br>+ <br>+b) reception <br>=
+ <br>+Since there is only one application allowed to receive data at a tim=
e, for <br>+reception there is only one configuration set. <br>+As soon as =
an application sets an request for receiving a telegram, the reception <br>=
+configuration set is written to the rf module and it gets set into receivi=
ng mode. &#160;<br>+Now the driver is waiting, that a predefined RSSI level=
 (signal strength at the <br>+receiver) is reached. Until this hasn&#39;t h=
appened, the reception can be <br>+interrupted by the transmission thread a=
t any time to insert a transmission cycle. <br>+As soon as the predefined R=
SSI level is meat, a receiving cycle starts. Similar <br>+as described for =
the transmission cycle the read out of the hardware fifo is done <br>+dynam=
ically. Upon each hardware fifo threshold interrupt, a portion of data gets=
 <br>+read. So also for reception it is possible to receive more data then =
the hardware <br>+fifo can hold. <br>+ <br>+ <br>+Driver API <br>+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D <br>+ <br>+The driver is currently implemented as a c=
haracter device. Therefore it supports <br>+the calls open, ioctl, read, wr=
ite and close. <br>+ <br>+ <br>+params for ioctl <br>+---------------- <br>=
+ <br>+There are four options: &#160;<br>+PI433_IOC_RD_TX_CFG - get the tra=
nsmission parameters from the driver <br>+PI433_IOC_WR_TX_CFG - set the tra=
nsmission parameters <br>+PI433_IOC_RD_RX_CFG - get the receiving parameter=
s from the driver <br>+PI433_IOC_WR_RX_CFG - set the receiving parameters &=
#160;<br>+ <br>+The tx configuration is transfered via struct pi433_tx_cfg,=
 the parameterset for transmission. &#160;<br>+It is devided into two secti=
ons: rf parameters and packet format. <br>+ <br>+rf params: <br>+&#160;&#16=
0; &#160;frequency <br>+&#160;&#160; &#160;&#160;&#160; &#160;frequency use=
d for transmission. &#160;<br>+&#160;&#160; &#160;&#160;&#160; &#160;Allowe=
d values: 433050000...434790000 <br>+&#160;&#160; &#160;bit_rate <br>+&#160=
;&#160; &#160;&#160;&#160; &#160;bit rate used for transmission. &#160;<br>=
+&#160;&#160; &#160;&#160;&#160; &#160;Allowed values: ##### <br>+&#160;&#1=
60; &#160;dev_frequency <br>+&#160;&#160; &#160;&#160;&#160; &#160;frequenc=
y deviation in case of FSK. &#160;<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;Allowed values: 600...500000 <br>+&#160;&#160; &#160;modulation <br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;FSK - frequency shift key <br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;OOK - On-Off-key <br>+&#160;&#160; &#160;modSha=
ping <br>+&#160;&#160; &#160;&#160;&#160; &#160;shapingOff&#160;&#160; &#16=
0;- no shaping <br>+&#160;&#160; &#160;&#160;&#160; &#160;shaping1_0&#160;&=
#160; &#160;- gauss filter with BT 1 (FSK only) <br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;shaping0_5&#160;&#160; &#160;- gauss filter with BT 0.5 (FS=
K only) <br>+&#160;&#160; &#160;&#160;&#160; &#160;shaping0_3&#160;&#160; &=
#160;- gauss filter with BT 0.3 (FSK only) <br>+&#160;&#160; &#160;&#160;&#=
160; &#160;shapingBR&#160;&#160; &#160;- filter cut off at BR (OOK only) <b=
r>+&#160;&#160; &#160;&#160;&#160; &#160;shaping2BR&#160;&#160; &#160;- fil=
ter cut off at 2*BR (OOK only) <br>+&#160;&#160; &#160;paRamp (FSK only) <b=
r>+&#160;&#160; &#160;&#160;&#160; &#160;ramp3400&#160;&#160; &#160;- amp r=
amps up in 3.4ms <br>+&#160;&#160; &#160;&#160;&#160; &#160;ramp2000&#160;&=
#160; &#160;- amp ramps up in 2.0ms <br>+&#160;&#160; &#160;&#160;&#160; &#=
160;ramp1000&#160;&#160; &#160;- amp ramps up in 1ms <br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;ramp500&#160;&#160; &#160;&#160;&#160; &#160;- amp ram=
ps up in 500us <br>+&#160;&#160; &#160;&#160;&#160; &#160;ramp250&#160;&#16=
0; &#160;&#160;&#160; &#160;- amp ramps up in 250us <br>+&#160;&#160; &#160=
;&#160;&#160; &#160;ramp125&#160;&#160; &#160;&#160;&#160; &#160;- amp ramp=
s up in 125us <br>+&#160;&#160; &#160;&#160;&#160; &#160;ramp100&#160;&#160=
; &#160;&#160;&#160; &#160;- amp ramps up in 100us <br>+&#160;&#160; &#160;=
&#160;&#160; &#160;ramp62&#160;&#160; &#160;&#160;&#160; &#160;- amp ramps =
up in 62us <br>+&#160;&#160; &#160;&#160;&#160; &#160;ramp50&#160;&#160; &#=
160;&#160;&#160; &#160;- amp ramps up in 50us <br>+&#160;&#160; &#160;&#160=
;&#160; &#160;ramp40&#160;&#160; &#160;&#160;&#160; &#160;- amp ramps up in=
 40us <br>+&#160;&#160; &#160;&#160;&#160; &#160;ramp31&#160;&#160; &#160;&=
#160;&#160; &#160;- amp ramps up in 31us <br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;ramp25&#160;&#160; &#160;&#160;&#160; &#160;- amp ramps up in 25us=
 <br>+&#160;&#160; &#160;&#160;&#160; &#160;ramp20&#160;&#160; &#160;&#160;=
&#160; &#160;- amp ramps up in 20us <br>+&#160;&#160; &#160;&#160;&#160; &#=
160;ramp15&#160;&#160; &#160;&#160;&#160; &#160;- amp ramps up in 15us <br>=
+&#160;&#160; &#160;&#160;&#160; &#160;ramp12&#160;&#160; &#160;&#160;&#160=
; &#160;- amp ramps up in 12us <br>+&#160;&#160; &#160;&#160;&#160; &#160;r=
amp10&#160;&#160; &#160;&#160;&#160; &#160;- amp ramps up in 10us <br>+&#16=
0;&#160; &#160;tx_start_condition <br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;fifoLevel&#160;&#160; &#160;- transmission starts, if fifo is filled to <=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160; threshold level <br>+&#160;&#160; &#160;&#160;&#160; &#160;fifo=
NotEmpty&#160;&#160; &#160;- transmission starts, as soon as there is one <=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160; byte in internal fifo <br>+&#160;&#160; &#160;repetitions <br>+=
&#160;&#160; &#160;&#160;&#160; &#160;This gives the option, to send a tele=
gram multiple times. Default: 1 <br>+ <br>+packet format: <br>+&#160;&#160;=
 &#160;enable_preamble <br>+&#160;&#160; &#160;&#160;&#160; &#160;optionOn&=
#160;&#160; &#160;- a preamble will be automatically generated <br>+&#160;&=
#160; &#160;&#160;&#160; &#160;optionOff&#160;&#160; &#160;- no preamble wi=
ll be generated <br>+&#160;&#160; &#160;enable_sync <br>+&#160;&#160; &#160=
;&#160;&#160; &#160;optionOn&#160;&#160; &#160;- a sync word will be automa=
tically added to <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160; the telegram after preamble <br>+&#160;&#160;=
 &#160;&#160;&#160; &#160;optionOff&#160;&#160; &#160;- no sync word will b=
e added <br>+&#160;&#160; &#160;&#160;&#160; &#160;Attention: While possibl=
e to generate sync without preamble, the <br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;receiver won&#39;t be able to detect the sync without preamble. <b=
r>+&#160;&#160; &#160;enable_length_byte <br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;optionOn&#160;&#160; &#160;- the length of the telegram will be au=
tomatically <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;&#160; added to the telegram. It&#39;s part of the payloa=
d <br>+&#160;&#160; &#160;&#160;&#160; &#160;optionOff&#160;&#160; &#160;- =
no length information will be automatically added <br>+&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; to the teleg=
ram. <br>+&#160;&#160; &#160;&#160;&#160; &#160;Attention: For telegram len=
gth over 255 bytes, this option can&#39;t be used <br>+&#160;&#160; &#160;&=
#160;&#160; &#160;Attention: should be used in combination with sync, only =
<br>+&#160;&#160; &#160;enable_address_byte <br>+&#160;&#160; &#160;&#160;&=
#160; &#160;optionOn&#160;&#160; &#160;- the address byte will be automatic=
ally added to the <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;&#160; telgram. It&#39;s part of the payload <br>+&=
#160;&#160; &#160;&#160;&#160; &#160;optionOff&#160;&#160; &#160;- the addr=
ess byte will not be added to the telegram. <br>+&#160;&#160; &#160;&#160;&=
#160; &#160;The address byte can be used for address filtering, so the rece=
iver <br>+&#160;&#160; &#160;&#160;&#160; &#160;will only receive telegrams=
 with a given address byte. <br>+&#160;&#160; &#160;&#160;&#160; &#160;Atte=
ntion: should be used in combination with sync, only <br>+&#160;&#160; &#16=
0;enable_crc <br>+&#160;&#160; &#160;&#160;&#160; &#160;optionOn&#160;&#160=
; &#160;- an crc will be automatically calculated over the <br>+&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; pay=
load of the telegram and added to the telegram <br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; after payload. =
<br>+&#160;&#160; &#160;&#160;&#160; &#160;optionOff&#160;&#160; &#160;- no=
 crc will be calculated&#160;&#160; &#160;&#160;&#160; &#160; <br>+&#160;&#=
160; &#160;preamble_length <br>+&#160;&#160; &#160;&#160;&#160; &#160;lengt=
h of the preamble. Allowed values: 0...65536 <br>+&#160;&#160; &#160;sync_l=
ength <br>+&#160;&#160; &#160;&#160;&#160; &#160;length of the sync word. A=
llowed values: 0...8 <br>+&#160;&#160; &#160;fixed_message_length <br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;length of the payload of the telegram. Wi=
ll override the length <br>+&#160;&#160; &#160;&#160;&#160; &#160;given by =
the buffer, passed in with the write command. Will be <br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;ignored if set to zero. <br>+&#160;&#160; &#160;sync_=
pattern[8] <br>+&#160;&#160; &#160;&#160;&#160; &#160;contains up to eight =
values, that are used as the sync pattern <br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;on sync option <br>+&#160;&#160; &#160;address_byte <br>+&#160;&#=
160; &#160;&#160;&#160; &#160;one byte, used as address byte on address byt=
e option. <br>+ <br>+ <br>+The rx configuration is transfered via struct pi=
433_rx_cfg, the parameterset for receiving. It is devided into two sections=
: rf parameters and packet format. <br>+ <br>+rf params: <br>+&#160;&#160; =
&#160;frequency <br>+&#160;&#160; &#160;&#160;&#160; &#160;frequency used f=
or transmission. &#160;<br>+&#160;&#160; &#160;&#160;&#160; &#160;Allowed v=
alues: 433050000...434790000 <br>+&#160;&#160; &#160;bit_rate <br>+&#160;&#=
160; &#160;&#160;&#160; &#160;bit rate used for transmission. <br>+&#160;&#=
160; &#160;&#160;&#160; &#160;Allowed values: ##### <br>+&#160;&#160; &#160=
;dev_frequency <br>+&#160;&#160; &#160;&#160;&#160; &#160;frequency deviati=
on in case of FSK. <br>+&#160;&#160; &#160;&#160;&#160; &#160;Allowed value=
s: 600...500000 <br>+&#160;&#160; &#160;modulation <br>+&#160;&#160; &#160;=
&#160;&#160; &#160;FSK - frequency shift key <br>+&#160;&#160; &#160;&#160;=
&#160; &#160;OOK - on off key <br>+&#160;&#160; &#160;rssi_threshold <br>+&=
#160;&#160; &#160;&#160;&#160; &#160;threshold value for the signal strengt=
h on the receiver input. <br>+&#160;&#160; &#160;&#160;&#160; &#160;If this=
 value is exeeded, a reception cycle starts <br>+&#160;&#160; &#160;&#160;&=
#160; &#160;Allowed values: 0...255 <br>+&#160;&#160; &#160;thresholdDecrem=
ent <br>+&#160;&#160; &#160;&#160;&#160; &#160;in order to adapt to differe=
nt levels of singnal strength, over <br>+&#160;&#160; &#160;&#160;&#160; &#=
160;time the receiver gets more and more sensitive. This value &#160;<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;determs, how fast the sensitivity incr=
eases. <br>+&#160;&#160; &#160;&#160;&#160; &#160;step_0_5db&#160;&#160; &#=
160;- increase in 0,5dB steps <br>+&#160;&#160; &#160;&#160;&#160; &#160;st=
ep_1_0db&#160;&#160; &#160;- increase in 1 db steps <br>+&#160;&#160; &#160=
;&#160;&#160; &#160;step_1_5db&#160;&#160; &#160;- increase in 1,5dB steps =
<br>+&#160;&#160; &#160;&#160;&#160; &#160;step_2_0db&#160;&#160; &#160;- i=
ncrease in 2 db steps <br>+&#160;&#160; &#160;&#160;&#160; &#160;step_3_0db=
&#160;&#160; &#160;- increase in 3 db steps <br>+&#160;&#160; &#160;&#160;&=
#160; &#160;step_4_0db&#160;&#160; &#160;- increase in 4 db steps <br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;step_5_0db&#160;&#160; &#160;- increase i=
n 5 db steps <br>+&#160;&#160; &#160;&#160;&#160; &#160;step_6_0db&#160;&#1=
60; &#160;- increase in 6 db steps <br>+&#160;&#160; &#160;antennaImpedance=
 <br>+&#160;&#160; &#160;&#160;&#160; &#160;sets the electrical adoption of=
 the antenna <br>+&#160;&#160; &#160;&#160;&#160; &#160;fiftyOhm&#160;&#160=
; &#160;- for antennas with an impedance of 50Ohm <br>+&#160;&#160; &#160;&=
#160;&#160; &#160;twohundretOhm&#160;&#160; &#160;- for antennas with an im=
pedance of 200Ohm <br>+&#160;&#160; &#160;lnaGain <br>+&#160;&#160; &#160;&=
#160;&#160; &#160;sets the gain of the low noise amp <br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;automatic&#160;&#160; &#160;- lna gain is determed by =
an agc <br>+&#160;&#160; &#160;&#160;&#160; &#160;max&#160;&#160; &#160;&#1=
60;&#160; &#160;- lna gain is set to maximum <br>+&#160;&#160; &#160;&#160;=
&#160; &#160;maxMinus6&#160;&#160; &#160;- lna gain is set to&#160; 6db bel=
ow max <br>+&#160;&#160; &#160;&#160;&#160; &#160;maxMinus12&#160;&#160; &#=
160;- lna gain is set to 12db below max <br>+&#160;&#160; &#160;&#160;&#160=
; &#160;maxMinus24&#160;&#160; &#160;- lna gain is set to 24db below max <b=
r>+&#160;&#160; &#160;&#160;&#160; &#160;maxMinus36&#160;&#160; &#160;- lna=
 gain is set to 36db below max <br>+&#160;&#160; &#160;&#160;&#160; &#160;m=
axMinus48&#160;&#160; &#160;- lna gain is set to 48db below max <br>+&#160;=
&#160; &#160;bw_mantisse <br>+&#160;&#160; &#160;&#160;&#160; &#160;sets th=
e bandwidth of the channel filter - part one: mantisse. &#160;<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;mantisse16&#160;&#160; &#160;- mantisse is se=
t to 16 <br>+&#160;&#160; &#160;&#160;&#160; &#160;mantisse20&#160;&#160; &=
#160;- mantisse is set to 20 <br>+&#160;&#160; &#160;&#160;&#160; &#160;man=
tisse24&#160;&#160; &#160;- mantisse is set to 24 <br>+&#160;&#160; &#160;b=
w_exponent <br>+&#160;&#160; &#160;&#160;&#160; &#160;sets the bandwidth of=
 the channel filter - part two: exponent. &#160;<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;Allowd values: 0...7 <br>+&#160;&#160; &#160;dagc; <br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;operation mode of the digital automatic =
gain control <br>+&#160;&#160; &#160;&#160;&#160; &#160;normalMode <br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;improve <br>+&#160;&#160; &#160;&#160;&#=
160; &#160;improve4LowModulationIndex <br>+ <br>+ packet format: <br>+&#160=
;&#160; &#160;enable_sync <br>+&#160;&#160; &#160;&#160;&#160; &#160;option=
On&#160; - sync detection is enabled. If configured sync pattern <br>+&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160; isn&=
#39;t found, telegram will be internally discarded &#160;<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;optionOff - sync detection is disabled. <br>+&#160=
;&#160; &#160;enable_length_byte <br>+&#160;&#160; &#160;&#160;&#160; &#160=
;optionOn&#160;&#160; - First byte of payload will be used as length byte, =
&#160;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160;&#160;&#160; regardless of the amount of bytes that were requested &#1=
60;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0;&#160;&#160; by the read request. <br>+&#160;&#160; &#160;&#160;&#160; &#=
160;optionOff&#160; - Number of bytes to be read will be set according to <=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#=
160;&#160; amount of bytes that were requested by the read request. <br>+&#=
160;&#160; &#160;&#160;&#160; &#160;Attention: should be used in combinatio=
n with sync, only <br>+&#160;&#160; &#160;enable_address_filtering; <br>+&#=
160;&#160; &#160;&#160;&#160; &#160;filteringOff&#160;&#160; &#160;&#160;&#=
160; &#160;- no adress filtering will take place <br>+&#160;&#160; &#160;&#=
160;&#160; &#160;nodeAddress&#160;&#160; &#160;&#160;&#160; &#160;- all tel=
egrams, not matching the node &#160;<br>+&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; address=
 will be internally discarded <br>+&#160;&#160; &#160;&#160;&#160; &#160;no=
deOrBroadcastAddress&#160;&#160; &#160;- all telegrams, neither matching th=
e <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;&#160; node, nor the broadcast address will <br>=
+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160; be internally discarded <br>+&#160;&#160; &#160=
;&#160;&#160; &#160;Attention: Sync option must be enabled in order to use =
this feature <br>+&#160;&#160; &#160;enable_crc <br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;optionOn&#160;&#160; &#160;- a crc will be calculated over =
the payload of <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160; the telegram, that was received. If the <br>+&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&=
#160; calculated crc doesn&#39;t match to two bytes, <br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; that foll=
ow the payload, the telegram will be <br>+&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; internally discarded. <br=
>+&#160;&#160; &#160;&#160;&#160; &#160;Attention: This option is only oper=
ational, if sync on and fixed length <br>+&#160;&#160; &#160;&#160;&#160; &=
#160;or length byte is used <br>+&#160;&#160; &#160;sync_length <br>+&#160;=
&#160; &#160;&#160;&#160; &#160;Gives the length of the payload. &#160;<br>=
+&#160;&#160; &#160;&#160;&#160; &#160;Attention: This setting must meet th=
e setting of the transmitter, <br>+&#160;&#160; &#160;&#160;&#160; &#160;if=
 sync option is used. <br>+&#160;&#160; &#160;fixed_message_length <br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;Overrides the telegram length either giv=
en by the first byte of <br>+&#160;&#160; &#160;&#160;&#160; &#160;payload =
or by the read request. <br>+&#160;&#160; &#160;bytes_to_drop <br>+&#160;&#=
160; &#160;&#160;&#160; &#160;gives the number of bytes, that will be dropp=
ed before transfering <br>+&#160;&#160; &#160;&#160;&#160; &#160;data to th=
e read buffer <br>+&#160;&#160; &#160;&#160;&#160; &#160;This option is onl=
y usefull, if all packet helper are switched <br>+&#160;&#160; &#160;&#160;=
&#160; &#160;off and the rf chip is used in raw receiving mode. This may be=
 <br>+&#160;&#160; &#160;&#160;&#160; &#160;needed, if a telegram of a thir=
d party device should be received, <br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;using a protocol not compatible with the packet engine of the rf69 chip.=
 <br>+&#160;&#160; &#160;sync_pattern[8] <br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;contains up to eight values, that are used as the sync pattern <br=
>+&#160;&#160; &#160;&#160;&#160; &#160;on sync option. <br>+&#160;&#160; &=
#160;&#160;&#160; &#160;This setting must meet the configuration of the tra=
nsmitting device, <br>+&#160;&#160; &#160;&#160;&#160; &#160;if sync option=
 is enabled. <br>+&#160;&#160; &#160;node_address <br>+&#160;&#160; &#160;&=
#160;&#160; &#160;one byte, used as node address byte on address byte optio=
n. <br>+&#160;&#160; &#160;broadcast_address <br>+&#160;&#160; &#160;&#160;=
&#160; &#160;one byte, used as broadcast address byte on address byte optio=
n. <br>+&#160;&#160; &#160;&#160;&#160; &#160; <br>+ <br>diff --git a/drive=
rs/staging/pi433/Kconfig b/drivers/staging/pi433/Kconfig<br>new file mode 1=
00644<br>index 0000000..61b4b4e<br>--- /dev/null<br>+++ b/drivers/staging/p=
i433/Kconfig<br>@@ -0,0 +1,16 @@<br>+config PI433<br>+&#160;&#160;&#160;&#1=
60;&#160;&#160;&#160; tristate &#34;Pi433 - a 433MHz radio module for Raspb=
erry Pi&#34;<br>+&#160;&#160;&#160;&#160;&#160;&#160;&#160; default n<br>+&=
#160;&#160;&#160;&#160;&#160;&#160;&#160; ---help---<br>+&#160;&#160;&#160;=
&#160;&#160;&#160;&#160;&#160;&#160; This option allows you to enable suppo=
rt for the radio module Pi433.<br>+<br>+&#160;&#160;&#160;&#160;&#160;&#160=
;&#160;&#160;&#160; Pi433 is a shield that fits onto the GPIO header of a R=
aspberry Pi <br>+&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; or =
compatible. It extends the Raspberry Pi with the option, to <br>+&#160;&#16=
0;&#160;&#160;&#160;&#160;&#160;&#160;&#160; send and receive data in the 4=
33MHz ISM band - for example to <br>+&#160;&#160;&#160;&#160;&#160;&#160;&#=
160;&#160;&#160; communicate between two systems without using ethernet or =
bluetooth<br>+&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; or for=
 control or read sockets, actors, sensors, widely available<br>+&#160;&#160=
;&#160;&#160;&#160;&#160;&#160;&#160;&#160; for low price.<br>+<br>+&#160;&=
#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; For details or the option t=
o buy, please visit https://pi433.de/en.html<br>+<br>+&#160;&#160;&#160;&#1=
60;&#160;&#160;&#160;&#160;&#160; If in doubt, say N here, but saying yes m=
ost probably won&#39;t hurt<br>diff --git a/drivers/staging/pi433/Makefile =
b/drivers/staging/pi433/Makefile<br>new file mode 100644<br>index 0000000..=
417f3e4<br>--- /dev/null<br>+++ b/drivers/staging/pi433/Makefile<br>@@ -0,0=
 +1,3 @@<br>+obj-$(CONFIG_PI433) +=3D pi433.o<br>+<br>+pi433-objs :=3D pi43=
3_if.o rf69.o<br>diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/st=
aging/pi433/pi433_if.c<br>new file mode 100644<br>index 0000000..57edf91<br=
>--- /dev/null<br>+++ b/drivers/staging/pi433/pi433_if.c<br>@@ -0,0 +1,1315=
 @@<br>+/*<br>+ * userspace interface for pi433 radio module<br>+ *<br>+ * =
Pi433 is a 433MHz radio module for the Raspberry Pi.<br>+ * It is based on =
the HopeRf Module RFM69CW. Therefore inside of this<br>+ * driver, you&#39;=
ll find an abstraction of the rf69 chip.<br>+ *<br>+ * If needed, this driv=
er could be extended, to also support other<br>+ * devices, basing on HopeR=
fs rf69.<br>+ *<br>+ * The driver can also be extended, to support other mo=
dules of<br>+ * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM=
95, ...<br>+ *<br>+ * Copyright (C) 2016 Wolf-Entwicklungen<br>+ *&#160;&#1=
60; &#160;Marcus Wolf &#60;linux@wolf-entwicklungen.de&#62;<br>+ *<br>+ * T=
his program is free software; you can redistribute it and/or modify<br>+ * =
it under the terms of the GNU General Public License as published by<br>+ *=
 the Free Software Foundation; either version 2 of the License, or<br>+ * (=
at your option) any later version.<br>+ *<br>+ * This program is distribute=
d in the hope that it will be useful,<br>+ * but WITHOUT ANY WARRANTY; with=
out even the implied warranty of<br>+ * MERCHANTABILITY or FITNESS FOR A PA=
RTICULAR PURPOSE.&#160; See the<br>+ * GNU General Public License for more =
details.<br>+ */<br>+<br>+#undef DEBUG<br>+<br>+#include &#60;linux/init.h&=
#62;<br>+#include &#60;linux/module.h&#62;<br>+#include &#60;linux/idr.h&#6=
2;<br>+#include &#60;linux/ioctl.h&#62;<br>+#include &#60;linux/uaccess.h&#=
62;<br>+#include &#60;linux/fs.h&#62;<br>+#include &#60;linux/device.h&#62;=
<br>+#include &#60;linux/cdev.h&#62;<br>+#include &#60;linux/err.h&#62;<br>=
+#include &#60;linux/kfifo.h&#62;<br>+#include &#60;linux/errno.h&#62;<br>+=
#include &#60;linux/mutex.h&#62;<br>+#include &#60;linux/of.h&#62;<br>+#inc=
lude &#60;linux/of_device.h&#62;<br>+#include &#60;linux/interrupt.h&#62;<b=
r>+#include &#60;linux/irq.h&#62;<br>+#include &#60;linux/gpio/consumer.h&#=
62;<br>+#include &#60;linux/kthread.h&#62;<br>+#include &#60;linux/wait.h&#=
62;<br>+#include &#60;linux/spi/spi.h&#62;<br>+#ifdef CONFIG_COMPAT<br>+#in=
clude &#60;asm/compat.h&#62;<br>+#endif<br>+<br>+#include &#34;pi433_if.h&#=
34;<br>+#include &#34;rf69.h&#34;<br>+<br>+<br>+#define N_PI433_MINORS&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;(1U &#60;&#60; MINORBIT=
S) /*32*/&#160;&#160; &#160;/* ... up to 256 */<br>+#define MAX_MSG_SIZE&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;900&#160;&#160; &#160=
;/* min: FIFO_SIZE! */<br>+#define MSG_FIFO_SIZE&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;65536&#160;&#160; /* 65536 =3D 2^16&#160; */<=
br>+#define NUM_DIO&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;2<br>+<br>+static dev_t pi433_dev;<br>+static DEFINE_ID=
R(pi433_idr);<br>+static DEFINE_MUTEX(minor_lock); /* Protect idr accesses =
*/<br>+<br>+static struct class *pi433_class; /* mainly for udev to create =
/dev/pi433 */<br>+<br>+/* tx config is instance specific<br>+&#160;&#160; &=
#160;so with each open a new tx config struct is needed */<br>+/* rx config=
 is device specific<br>+&#160;&#160; &#160;so we have just one rx config, e=
bedded in device struct */<br>+struct pi433_device {<br>+&#160;&#160; &#160=
;/* device handling related values */<br>+&#160;&#160; &#160;dev_t&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;devt;<br>+&#160;&#160; &#16=
0;int&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;minor;<br>+&#=
160;&#160; &#160;struct device&#160;&#160; &#160;&#160;&#160; &#160;*dev;<b=
r>+&#160;&#160; &#160;struct cdev&#160;&#160; &#160;&#160;&#160; &#160;*cde=
v;<br>+&#160;&#160; &#160;struct spi_device&#160;&#160; &#160;*spi;<br>+&#1=
60;&#160; &#160;unsigned&#160;&#160; &#160;&#160;&#160; &#160;users;<br>+<b=
r>+&#160;&#160; &#160;/* irq related values */<br>+&#160;&#160; &#160;struc=
t gpio_desc&#160;&#160; &#160;*gpiod[NUM_DIO];<br>+&#160;&#160; &#160;int&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;irq_num[NUM_DIO];<br=
>+&#160;&#160; &#160;u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;irq_state[NUM_DIO];<br>+<br>+&#160;&#160; &#160;/* tx related values *=
/<br>+&#160;&#160; &#160;STRUCT_KFIFO_REC_1(MSG_FIFO_SIZE) tx_fifo;<br>+&#1=
60;&#160; &#160;struct mutex&#160;&#160; &#160;&#160;&#160; &#160;tx_fifo_l=
ock; // TODO: check, whether necessary or obsolete<br>+&#160;&#160; &#160;s=
truct task_struct&#160;&#160; &#160;*tx_task_struct;<br>+&#160;&#160; &#160=
;wait_queue_head_t&#160;&#160; &#160;tx_wait_queue;<br>+&#160;&#160; &#160;=
u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;free_in_fifo;<br=
>+<br>+&#160;&#160; &#160;/* rx related values */<br>+&#160;&#160; &#160;st=
ruct pi433_rx_cfg&#160;&#160; &#160;rx_cfg;<br>+&#160;&#160; &#160;u8&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;*rx_buffer;<br>+&#160;&#=
160; &#160;unsigned int&#160;&#160; &#160;&#160;&#160; &#160;rx_buffer_size=
;<br>+&#160;&#160; &#160;u32&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;rx_bytes_to_drop;<br>+&#160;&#160; &#160;u32&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;rx_bytes_dropped;<br>+&#160;&#160; &#16=
0;unsigned int&#160;&#160; &#160;&#160;&#160; &#160;rx_position;<br>+&#160;=
&#160; &#160;struct mutex&#160;&#160; &#160;&#160;&#160; &#160;rx_lock;<br>=
+&#160;&#160; &#160;wait_queue_head_t&#160;&#160; &#160;rx_wait_queue;<br>+=
<br>+&#160;&#160; &#160;/* fifo wait queue */<br>+&#160;&#160; &#160;struct=
 task_struct&#160;&#160; &#160;*fifo_task_struct;<br>+&#160;&#160; &#160;wa=
it_queue_head_t&#160;&#160; &#160;fifo_wait_queue;<br>+<br>+&#160;&#160; &#=
160;/* flags */<br>+&#160;&#160; &#160;bool&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;rx_active;<br>+&#160;&#160; &#160;bool&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;tx_active;<br>+&#160;&#160; &#=
160;bool&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;interrupt_=
rx_allowed;<br>+};<br>+<br>+struct pi433_instance {<br>+&#160;&#160; &#160;=
struct pi433_device&#160;&#160; &#160;*device;<br>+&#160;&#160; &#160;struc=
t pi433_tx_cfg&#160;&#160; &#160;tx_cfg;<br>+};<br>+<br>+/*----------------=
---------------------------------------------------------*/<br>+<br>+/* mac=
ro for checked access of registers of radio module */<br>+#define SET_CHECK=
ED(retval) \<br>+&#160;&#160; &#160;if (retval &#60; 0) \<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;return retval;<br>+<br>+/*------------------------=
-------------------------------------------------*/<br>+<br>+/* GPIO interr=
upt handlers */<br>+static irq_handler_t<br>+DIO0_irq_handler(unsigned int =
irq, void *dev_id, struct pt_regs *regs)<br>+{<br>+&#160;&#160; &#160;struc=
t pi433_device *device =3D dev_id;<br>+<br>+&#160;&#160; &#160;if&#160;&#16=
0;&#160;&#160;&#160; (device-&#62;irq_state[DIO0] =3D=3D DIO_PacketSent)<br=
>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;device-&#6=
2;free_in_fifo =3D FIFO_SIZE;<br>+&#160;&#160; &#160;&#160;&#160; &#160;pri=
ntk(&#34;DIO0 irq: Packet sent\n&#34;); // TODO: printk() should include KE=
RN_ facility level<br>+&#160;&#160; &#160;&#160;&#160; &#160;wake_up_interr=
uptible(&#38;device-&#62;fifo_wait_queue);<br>+&#160;&#160; &#160;}<br>+&#1=
60;&#160; &#160;else if (device-&#62;irq_state[DIO0] =3D=3D DIO_Rssi_DIO0)<=
br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;printk(&=
#34;DIO0 irq: RSSI level over threshold\n&#34;);<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;wake_up_interruptible(&#38;device-&#62;rx_wait_queue);<br>+=
&#160;&#160; &#160;}<br>+&#160;&#160; &#160;else if (device-&#62;irq_state[=
DIO0] =3D=3D DIO_PayloadReady)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;printk(&#34;DIO0 irq: PayloadReady\n&#34;);<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;device-&#62;free_in_fifo =3D 0;<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;wake_up_interruptible(&#38;device-&#62;fif=
o_wait_queue);<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;return =
(irq_handler_t) IRQ_HANDLED;<br>+}<br>+<br>+static irq_handler_t<br>+DIO1_i=
rq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)<br>+{<br>+=
&#160;&#160; &#160;struct pi433_device *device =3D dev_id;<br>+<br>+&#160;&=
#160; &#160;if&#160;&#160;&#160;&#160;&#160; (device-&#62;irq_state[DIO1] =
=3D=3D DIO_FifoNotEmpty_DIO1)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;device-&#62;free_in_fifo =3D FIFO_SIZE;<br>+&#160;&#1=
60; &#160;}<br>+&#160;&#160; &#160;else if (device-&#62;irq_state[DIO1] =3D=
=3D DIO_FifoLevel)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#=
160; &#160;if (device-&#62;rx_active)&#160;&#160; &#160;device-&#62;free_in=
_fifo =3D FIFO_THRESHOLD - 1;<br>+&#160;&#160; &#160;&#160;&#160; &#160;els=
e&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;free_=
in_fifo =3D FIFO_SIZE - FIFO_THRESHOLD - 1;<br>+&#160;&#160; &#160;}<br>+&#=
160;&#160; &#160;printk(&#34;DIO1 irq: %d bytes free in fifo\n&#34;, device=
-&#62;free_in_fifo); // TODO: printk() should include KERN_ facility level<=
br>+&#160;&#160; &#160;wake_up_interruptible(&#38;device-&#62;fifo_wait_que=
ue);<br>+<br>+&#160;&#160; &#160;return (irq_handler_t) IRQ_HANDLED;<br>+}<=
br>+<br>+static void *DIO_irq_handler[NUM_DIO] =3D {<br>+&#160;&#160; &#160=
;DIO0_irq_handler,<br>+&#160;&#160; &#160;DIO1_irq_handler<br>+};<br>+<br>+=
/*-------------------------------------------------------------------------=
*/<br>+<br>+static int<br>+rf69_set_rx_cfg(struct pi433_device *dev, struct=
 pi433_rx_cfg *rx_cfg)<br>+{<br>+&#160;&#160; &#160;int payload_length;<br>=
+<br>+&#160;&#160; &#160;/* receiver config */<br>+&#160;&#160; &#160;SET_C=
HECKED(rf69_set_frequency&#160;&#160; &#160;(dev-&#62;spi, rx_cfg-&#62;freq=
uency));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_bit_rate&#160;&#160; &=
#160;(dev-&#62;spi, rx_cfg-&#62;bit_rate));<br>+&#160;&#160; &#160;SET_CHEC=
KED(rf69_set_modulation&#160;&#160; &#160;(dev-&#62;spi, rx_cfg-&#62;modula=
tion));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_antenna_impedance&#160;=
&#160; &#160; (dev-&#62;spi, rx_cfg-&#62;antenna_impedance));<br>+&#160;&#1=
60; &#160;SET_CHECKED(rf69_set_rssi_threshold&#160;&#160; &#160; (dev-&#62;=
spi, rx_cfg-&#62;rssi_threshold));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_=
set_ook_threshold_dec&#160;&#160; &#160; (dev-&#62;spi, rx_cfg-&#62;thresho=
ldDecrement));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_bandwidth &#160;=
&#160; &#160;&#160;&#160; &#160; (dev-&#62;spi, rx_cfg-&#62;bw_mantisse, rx=
_cfg-&#62;bw_exponent));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_bandwi=
dth_during_afc(dev-&#62;spi, rx_cfg-&#62;bw_mantisse, rx_cfg-&#62;bw_expone=
nt));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_dagc &#160;&#160; &#160;&=
#160;&#160; &#160; (dev-&#62;spi, rx_cfg-&#62;dagc));<br>+<br>+&#160;&#160;=
 &#160;dev-&#62;rx_bytes_to_drop =3D rx_cfg-&#62;bytes_to_drop;<br>+<br>+&#=
160;&#160; &#160;/* packet config */<br>+&#160;&#160; &#160;/* enable */<br=
>+&#160;&#160; &#160;SET_CHECKED(rf69_set_sync_enable(dev-&#62;spi, rx_cfg-=
&#62;enable_sync));<br>+&#160;&#160; &#160;if (rx_cfg-&#62;enable_sync =3D=
=3D optionOn)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;SET_CHECKED(rf69_set_fifo_fill_condition(dev-&#62;spi, afterSyncInter=
rupt));<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;else<br>+&#160;&#16=
0; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_f=
ifo_fill_condition(dev-&#62;spi, always));<br>+&#160;&#160; &#160;}<br>+&#1=
60;&#160; &#160;SET_CHECKED(rf69_set_packet_format&#160; (dev-&#62;spi, rx_=
cfg-&#62;enable_length_byte));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_=
adressFiltering(dev-&#62;spi, rx_cfg-&#62;enable_address_filtering));<br>+&=
#160;&#160; &#160;SET_CHECKED(rf69_set_crc_enable&#160;&#160; &#160;&#160;&=
#160;&#160; (dev-&#62;spi, rx_cfg-&#62;enable_crc));<br>+<br>+&#160;&#160; =
&#160;/* lengths */<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_sync_size(d=
ev-&#62;spi, rx_cfg-&#62;sync_length));<br>+&#160;&#160; &#160;if (rx_cfg-&=
#62;enable_length_byte =3D=3D optionOn)<br>+&#160;&#160; &#160;{<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_payload_length(dev-&#6=
2;spi, 0xff));<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;else if (rx_=
cfg-&#62;fixed_message_length !=3D 0)<br>+&#160;&#160; &#160;{<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;payload_length =3D rx_cfg-&#62;fixed_message_=
length;<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (rx_cfg-&#62;enable_le=
ngth_byte&#160; =3D=3D optionOn) payload_length++;<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;if (rx_cfg-&#62;enable_address_filtering !=3D filteringOf=
f) payload_length++;<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(=
rf69_set_payload_length(dev-&#62;spi, payload_length));<br>+&#160;&#160; &#=
160;}<br>+&#160;&#160; &#160;else<br>+&#160;&#160; &#160;{<br>+&#160;&#160;=
 &#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_payload_length(dev-&#62;spi,=
 0));<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;/* values */<br>=
+&#160;&#160; &#160;if (rx_cfg-&#62;enable_sync =3D=3D optionOn)<br>+&#160;=
&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_s=
et_sync_values(dev-&#62;spi, rx_cfg-&#62;sync_pattern));<br>+&#160;&#160; &=
#160;}<br>+&#160;&#160; &#160;if (rx_cfg-&#62;enable_address_filtering !=3D=
 filteringOff)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;SET_CHECKED(rf69_set_node_address&#160;&#160;&#160;&#160; (dev-&#62;=
spi, rx_cfg-&#62;node_address));<br>+&#160;&#160; &#160;&#160;&#160; &#160;=
SET_CHECKED(rf69_set_broadcast_address(dev-&#62;spi, rx_cfg-&#62;broadcast_=
address));<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;return 0;<b=
r>+}<br>+<br>+static int<br>+rf69_set_tx_cfg(struct pi433_device *dev, stru=
ct pi433_tx_cfg *tx_cfg)<br>+{<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_=
frequency&#160;&#160; &#160;(dev-&#62;spi, tx_cfg-&#62;frequency));<br>+&#1=
60;&#160; &#160;SET_CHECKED(rf69_set_bit_rate&#160;&#160; &#160;(dev-&#62;s=
pi, tx_cfg-&#62;bit_rate));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_mod=
ulation&#160;&#160; &#160;(dev-&#62;spi, tx_cfg-&#62;modulation));<br>+&#16=
0;&#160; &#160;SET_CHECKED(rf69_set_deviation&#160;&#160; &#160;(dev-&#62;s=
pi, tx_cfg-&#62;dev_frequency));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_se=
t_pa_ramp&#160;&#160; &#160;(dev-&#62;spi, tx_cfg-&#62;pa_ramp));<br>+&#160=
;&#160; &#160;SET_CHECKED(rf69_set_modulation_shaping(dev-&#62;spi, tx_cfg-=
&#62;modShaping));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_tx_start_con=
dition(dev-&#62;spi, tx_cfg-&#62;tx_start_condition));<br>+<br>+&#160;&#160=
; &#160;/* packet format enable */<br>+&#160;&#160; &#160;if (tx_cfg-&#62;e=
nable_preamble =3D=3D optionOn)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_preamble_length(dev-&#62;spi, =
tx_cfg-&#62;preamble_length));<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#=
160;else<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160=
;SET_CHECKED(rf69_set_preamble_length(dev-&#62;spi, 0));<br>+&#160;&#160; &=
#160;}<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_sync_enable&#160; (dev-&=
#62;spi, tx_cfg-&#62;enable_sync));<br>+&#160;&#160; &#160;SET_CHECKED(rf69=
_set_packet_format(dev-&#62;spi, tx_cfg-&#62;enable_length_byte));<br>+&#16=
0;&#160; &#160;SET_CHECKED(rf69_set_crc_enable&#160;&#160; &#160;&#160; (de=
v-&#62;spi, tx_cfg-&#62;enable_crc));<br>+<br>+&#160;&#160; &#160;/* config=
ure sync, if enabled */<br>+&#160;&#160; &#160;if (tx_cfg-&#62;enable_sync =
=3D=3D optionOn)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;SET_CHECKED(rf69_set_sync_size(dev-&#62;spi, tx_cfg-&#62;sync_leng=
th));<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_sync_v=
alues(dev-&#62;spi, tx_cfg-&#62;sync_pattern));<br>+&#160;&#160; &#160;}<br=
>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<br>+/*----------------------=
---------------------------------------------------*/<br>+<br>+static int<b=
r>+pi433_start_rx(struct pi433_device *dev)<br>+{<br>+&#160;&#160; &#160;in=
t retval;<br>+<br>+&#160;&#160; &#160;/* return without action, if no pendi=
ng read request */<br>+&#160;&#160; &#160;if (!dev-&#62;rx_active)<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;return 0;<br>+<br>+&#160;&#160; &#160;/* =
setup for receiving */<br>+&#160;&#160; &#160;retval =3D rf69_set_rx_cfg(de=
v, &#38;dev-&#62;rx_cfg);<br>+&#160;&#160; &#160;if (retval) return retval;=
<br>+<br>+&#160;&#160; &#160;/* setup rssi irq */<br>+&#160;&#160; &#160;SE=
T_CHECKED(rf69_set_dio_mapping(dev-&#62;spi, DIO0, DIO_Rssi_DIO0));<br>+&#1=
60;&#160; &#160;dev-&#62;irq_state[DIO0] =3D DIO_Rssi_DIO0;<br>+&#160;&#160=
; &#160;irq_set_irq_type(dev-&#62;irq_num[DIO0], IRQ_TYPE_EDGE_RISING);<br>=
+<br>+&#160;&#160; &#160;/* setup fifo level interrupt */<br>+&#160;&#160; =
&#160;SET_CHECKED(rf69_set_fifo_threshold(dev-&#62;spi, FIFO_SIZE - FIFO_TH=
RESHOLD));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_dio_mapping(dev-&#62=
;spi, DIO1, DIO_FifoLevel));<br>+&#160;&#160; &#160;dev-&#62;irq_state[DIO1=
] =3D DIO_FifoLevel;<br>+&#160;&#160; &#160;irq_set_irq_type(dev-&#62;irq_n=
um[DIO1], IRQ_TYPE_EDGE_RISING);<br>+<br>+&#160;&#160; &#160;/* set module =
to receiving mode */<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_mode(dev-&=
#62;spi, receive));<br>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<br>+<b=
r>+/*----------------------------------------------------------------------=
---*/<br>+<br>+int<br>+pi433_receive(void *data)<br>+{<br>+&#160;&#160; &#1=
60;struct pi433_device *dev =3D data;<br>+&#160;&#160; &#160;struct spi_dev=
ice *spi =3D dev-&#62;spi; /* needed for SET_CHECKED */<br>+&#160;&#160; &#=
160;int bytes_to_read, bytes_total;<br>+&#160;&#160; &#160;int retval;<br>+=
<br>+&#160;&#160; &#160;dev-&#62;interrupt_rx_allowed =3D false;<br>+<br>+&=
#160;&#160; &#160;/* wait for any tx to finish */<br>+&#160;&#160; &#160;de=
v_dbg(dev-&#62;dev,&#34;rx: going to wait for any tx to finish&#34;);<br>+&=
#160;&#160; &#160;retval =3D wait_event_interruptible(dev-&#62;rx_wait_queu=
e, !dev-&#62;tx_active);<br>+&#160;&#160; &#160;if(retval) /* wait was inte=
rrupted */<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;dev-&#62;interrupt_rx_allowed =3D true;<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;wake_up_interruptible(&#38;dev-&#62;tx_wait_queue);<br>+&#160;&#1=
60; &#160;&#160;&#160; &#160;return retval;<br>+&#160;&#160; &#160;}<br>+<b=
r>+&#160;&#160; &#160;/* prepare status vars */<br>+&#160;&#160; &#160;dev-=
&#62;free_in_fifo =3D FIFO_SIZE;<br>+&#160;&#160; &#160;dev-&#62;rx_positio=
n =3D 0;<br>+&#160;&#160; &#160;dev-&#62;rx_bytes_dropped =3D 0;<br>+<br>+&=
#160;&#160; &#160;/* setup radio module to listen for something &#34;in the=
 air&#34; */<br>+&#160;&#160; &#160;retval =3D pi433_start_rx(dev);<br>+&#1=
60;&#160; &#160;if (retval)<br>+&#160;&#160; &#160;&#160;&#160; &#160;retur=
n retval;<br>+<br>+&#160;&#160; &#160;/* now check RSSI, if low wait for ge=
tting high (RSSI interrupt) */<br>+&#160;&#160; &#160;while ( !rf69_get_fla=
g(dev-&#62;spi, rssiExceededThreshold) )<br>+&#160;&#160; &#160;{<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;/* allow tx to interrupt us while waiting =
for high RSSI */<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev-&#62;interru=
pt_rx_allowed =3D true;<br>+&#160;&#160; &#160;&#160;&#160; &#160;wake_up_i=
nterruptible(&#38;dev-&#62;tx_wait_queue);<br>+<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;/* wait for RSSI level to become high */<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;dev_dbg(dev-&#62;dev, &#34;rx: going to wait for hig=
h RSSI level&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =3D wa=
it_event_interruptible(dev-&#62;rx_wait_queue,<br>+&#160;&#160; &#160;&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#1=
60;&#160;&#160;&#160;&#160;&#160; rf69_get_flag(dev-&#62;spi,<br>+&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#16=
0;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&=
#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#16=
0;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&=
#160;&#160; rssiExceededThreshold)); <br>+&#160;&#160; &#160;&#160;&#160; &=
#160;if (retval) goto abort; /* wait was interrupted */<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;dev-&#62;interrupt_rx_allowed =3D false;<br>+<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;/* cross check for ongoing tx */<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;if (!dev-&#62;tx_active) break;<br>+&#1=
60;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;/* configure payload ready ir=
q */<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_dio_mapping(spi, DIO0, DIO=
_PayloadReady));<br>+&#160;&#160; &#160;dev-&#62;irq_state[DIO0] =3D DIO_Pa=
yloadReady;<br>+&#160;&#160; &#160;irq_set_irq_type(dev-&#62;irq_num[DIO0],=
 IRQ_TYPE_EDGE_RISING);<br>+<br>+&#160;&#160; &#160;/* fixed or unlimited l=
ength? */<br>+&#160;&#160; &#160;if (dev-&#62;rx_cfg.fixed_message_length !=
=3D 0)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;i=
f (dev-&#62;rx_cfg.fixed_message_length &#62; dev-&#62;rx_buffer_size)<br>+=
&#160;&#160; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;retval =3D -1;<br>+&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;goto abort;<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;}<br>+&#160;&#160; &#160;&#160;&#160; &#160;bytes_total =3D dev-&#62;=
rx_cfg.fixed_message_length;<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_=
dbg(dev-&#62;dev,&#34;rx: msg len set to %d by fixed length&#34;, bytes_tot=
al);<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;else<br>+&#160;&#160; =
&#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;bytes_total =3D dev-&#62;=
rx_buffer_size;<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(dev-&#62;=
dev, &#34;rx: msg len set to %d as requested by read&#34;, bytes_total);<br=
>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;/* length byte enabled? =
*/<br>+&#160;&#160; &#160;if (dev-&#62;rx_cfg.enable_length_byte =3D=3D opt=
ionOn)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;r=
etval =3D wait_event_interruptible(dev-&#62;fifo_wait_queue,<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160; dev-&#62;free_in_fifo &#60; FIFO_SIZE);=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (retval) goto abort; /* wait =
was interrupted */<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;rf69_read=
_fifo(spi, (u8 *)&#38;bytes_total, 1);<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;if (bytes_total &#62; dev-&#62;rx_buffer_size)<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;retval =3D -1;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;goto abort;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;dev-&#62;free_in_fifo++;<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;dev_dbg(dev-&#62;dev, &#34;rx: msg len reset to %d =
due to length byte&#34;, bytes_total);<br>+&#160;&#160; &#160;}<br>+<br>+&#=
160;&#160; &#160;/* address byte enabled? */<br>+&#160;&#160; &#160;if (dev=
-&#62;rx_cfg.enable_address_filtering !=3D filteringOff)<br>+&#160;&#160; &=
#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;u8 dummy;<br>+<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;bytes_total--;<br>+<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;retval =3D wait_event_interruptible(dev-&#62;fifo_wait_qu=
eue,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160; dev-&#62;free_in_fif=
o &#60; FIFO_SIZE);<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (retval) g=
oto abort; /* wait was interrupted */<br>+<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;rf69_read_fifo(spi, &#38;dummy, 1);<br>+&#160;&#160; &#160;&#160;=
&#160; &#160;dev-&#62;free_in_fifo++;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;dev_dbg(dev-&#62;dev, &#34;rx: address byte stripped off&#34;);<br>+&#=
160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;/* get payload */<br>+&#160;=
&#160; &#160;while (dev-&#62;rx_position &#60; bytes_total)<br>+&#160;&#160=
; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( !rf69_get_flag(dev=
-&#62;spi, payloadReady) )<br>+&#160;&#160; &#160;&#160;&#160; &#160;{<br>+=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retval =3D wait_ev=
ent_interruptible(dev-&#62;fifo_wait_queue,<br>+&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160; &#160;&#160; dev-&#62;free_in_fifo &#60; FIFO_SIZE=
);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;if (retval)=
 goto abort; /* wait was interrupted */<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* need to drop byt=
es or acquire? */<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (dev-&#62;rx=
_bytes_to_drop &#62; dev-&#62;rx_bytes_dropped)<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;bytes_to_read =3D dev-&#62;rx_bytes_to_dr=
op - dev-&#62;rx_bytes_dropped;<br>+&#160;&#160; &#160;&#160;&#160; &#160;e=
lse<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;bytes_to_r=
ead =3D bytes_total - dev-&#62;rx_position;<br>+<br>+<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;/* access the fifo */<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;if (bytes_to_read &#62; FIFO_SIZE - dev-&#62;free_in_fifo)<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;bytes_to_read =3D FI=
FO_SIZE - dev-&#62;free_in_fifo;<br>+&#160;&#160; &#160;&#160;&#160; &#160;=
retval =3D rf69_read_fifo(spi,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#38;dev-&#62;rx_buf=
fer[dev-&#62;rx_position],<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;bytes_to_read);<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;if (retval) goto abort; /* read failed */=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev-&#62;free_in_fifo +=3D bytes=
_to_read;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* adjust status v=
ars */<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (dev-&#62;rx_bytes_to_d=
rop &#62; dev-&#62;rx_bytes_dropped)<br>+&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;dev-&#62;rx_bytes_dropped +=3D bytes_to_read;<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;else<br>+&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;dev-&#62;rx_position +=3D bytes_to_read;<br>+&#1=
60;&#160; &#160;}<br>+<br>+<br>+&#160;&#160; &#160;/* rx done, wait was int=
errupted or error occured */<br>+abort:<br>+&#160;&#160; &#160;dev-&#62;int=
errupt_rx_allowed =3D true;<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_mod=
e(dev-&#62;spi, standby));<br>+&#160;&#160; &#160;wake_up_interruptible(&#3=
8;dev-&#62;tx_wait_queue);<br>+<br>+&#160;&#160; &#160;if (retval)<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;return retval;<br>+&#160;&#160; &#160;els=
e<br>+&#160;&#160; &#160;&#160;&#160; &#160;return bytes_total;<br>+}<br>+<=
br>+int<br>+pi433_tx_thread(void *data)<br>+{<br>+&#160;&#160; &#160;struct=
 pi433_device *device =3D data;<br>+&#160;&#160; &#160;struct spi_device *s=
pi =3D device-&#62;spi; /* needed for SET_CHECKED */<br>+&#160;&#160; &#160=
;struct pi433_tx_cfg tx_cfg;<br>+&#160;&#160; &#160;u8&#160;&#160;&#160;&#1=
60; buffer[MAX_MSG_SIZE];<br>+&#160;&#160; &#160;size_t size;<br>+&#160;&#1=
60; &#160;bool&#160;&#160; rx_interrupted =3D false;<br>+&#160;&#160; &#160=
;int&#160;&#160;&#160; position, repetitions;<br>+&#160;&#160; &#160;int&#1=
60;&#160;&#160; retval;<br>+<br>+&#160;&#160; &#160;while (1)<br>+&#160;&#1=
60; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* wait for fifo to b=
e populated or for request to terminate*/<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;dev_dbg(device-&#62;dev, &#34;thread: going to wait for new messag=
es&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;wait_event_interruptibl=
e(device-&#62;tx_wait_queue,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160; ( !kfifo_is_empty(&#3=
8;device-&#62;tx_fifo) ||<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160; kthrea=
d_should_stop() ));<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( kthread_=
should_stop() )<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;return 0;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* get data from=
 fifo in the following order:<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; - tx_cfg<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; -=
 size of message<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; - m=
essage */<br>+&#160;&#160; &#160;&#160;&#160; &#160;mutex_lock(&#38;device-=
&#62;tx_fifo_lock);<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =
=3D kfifo_out(&#38;device-&#62;tx_fifo, &#38;tx_cfg, sizeof(tx_cfg));<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;if (retval !=3D sizeof(tx_cfg))<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;dev_dbg(device-&#62;dev, &#34;reading tx_cfg from f=
ifo failed: got %d byte(s), expected %d&#34;, retval, (unsigned int)sizeof(=
tx_cfg) );<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;mut=
ex_unlock(&#38;device-&#62;tx_fifo_lock);<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;continue;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =3D kfifo_out(=
&#38;device-&#62;tx_fifo, &#38;size, sizeof(size_t));<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;if (retval !=3D sizeof(size_t))<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;dev_dbg(device-&#62;dev, &#34;reading msg size from fifo failed: go=
t %d, expected %d&#34;, retval, (unsigned int)sizeof(size_t) );<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;mutex_unlock(&#38;device-=
&#62;tx_fifo_lock);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;continue;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;/* use fixed message length, if requested *=
/<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (tx_cfg.fixed_message_length=
 !=3D 0)<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;size =
=3D tx_cfg.fixed_message_length;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;/* increase size, if len byte is requested */<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;if (tx_cfg.enable_length_byte =3D=3D optionOn)<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;size++;<br>+<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;/* increase size, if adr byte is requested *=
/<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (tx_cfg.enable_address_byte =
=3D=3D optionOn)<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;size++;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* prime buffer *=
/<br>+&#160;&#160; &#160;&#160;&#160; &#160;memset(buffer, 0, size);<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;position =3D 0;<br>+<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;/* add length byte, if requested */<br>+&#160;&#160=
; &#160;&#160;&#160; &#160;if (tx_cfg.enable_length_byte&#160; =3D=3D optio=
nOn)<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;buffer[po=
sition++] =3D size-1; /* according to spec length byte itself must be exclu=
ded from the length calculation */<br>+<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;/* add adr byte, if requested */<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;if (tx_cfg.enable_address_byte =3D=3D optionOn)<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;buffer[position++] =3D tx_cfg.addr=
ess_byte;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* finally get mes=
sage data from fifo */<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =3D=
 kfifo_out(&#38;device-&#62;tx_fifo, &#38;buffer[position], sizeof(buffer)-=
position );<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(device-&#62;d=
ev, &#34;read %d message byte(s) from fifo queue.&#34;, retval);<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;mutex_unlock(&#38;device-&#62;tx_fifo_lock)=
;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* if rx is active, we nee=
d to interrupt the waiting for<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; incoming telegrams, to be able to send something.<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; We are only allowed, if currently =
no reception takes<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; p=
lace otherwise we need to&#160; wait for the incoming telegram<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; to finish */<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;wait_event_interruptible(device-&#62;tx_wait_queue,<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160; !device-&#62;rx_active ||<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
&#160; device-&#62;interrupt_rx_allowed =3D=3D true);<br>+<br>+&#160;&#160;=
 &#160;&#160;&#160; &#160;/* prevent race conditions<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;&#160;&#160; irq will be reenabled after tx config is s=
et */<br>+&#160;&#160; &#160;&#160;&#160; &#160;disable_irq(device-&#62;irq=
_num[DIO0]);<br>+&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;tx_activ=
e =3D true;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (device-&#62;=
rx_active &#38;&#38; rx_interrupted =3D=3D false)<br>+&#160;&#160; &#160;&#=
160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;/* rx is currently waiting for a telegram;<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;&#160;&#160; we need to set the radio mod=
ule to standby */<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;SET_CHECKED(rf69_set_mode(device-&#62;spi, standby));<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;rx_interrupted =3D true;<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;/* clear fifo, set fifo threshold, set payload length */<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_mode(spi, standby));=
 /* this clears the fifo */<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_C=
HECKED(rf69_set_fifo_threshold(spi, FIFO_THRESHOLD));<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;if (tx_cfg.enable_length_byte =3D=3D optionOn)<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;SET_CHECKED(rf69_set_payload_length(spi, size * tx_c=
fg.repetitions));<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+&#160;&#1=
60; &#160;&#160;&#160; &#160;else<br>+&#160;&#160; &#160;&#160;&#160; &#160=
;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED=
(rf69_set_payload_length(spi, 0));<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* configure the rf chip=
 */<br>+&#160;&#160; &#160;&#160;&#160; &#160;rf69_set_tx_cfg(device, &#38;=
tx_cfg);<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* enable fifo leve=
l interrupt */<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_s=
et_dio_mapping(spi, DIO1, DIO_FifoLevel));<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;device-&#62;irq_state[DIO1] =3D DIO_FifoLevel;<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;irq_set_irq_type(device-&#62;irq_num[DIO1], IRQ_TYP=
E_EDGE_FALLING);<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* enable p=
acket sent interrupt */<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECK=
ED(rf69_set_dio_mapping(spi, DIO0, DIO_PacketSent));<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;device-&#62;irq_state[DIO0] =3D DIO_PacketSent;<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;irq_set_irq_type(device-&#62;irq_num[DIO=
0], IRQ_TYPE_EDGE_RISING);<br>+&#160;&#160; &#160;&#160;&#160; &#160;enable=
_irq(device-&#62;irq_num[DIO0]); /* was disabled by rx active check */<br>+=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* enable transmission */<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_set_mode(spi, transmit=
));<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* transfer this msg (an=
d repetitions) to chip fifo */<br>+&#160;&#160; &#160;&#160;&#160; &#160;de=
vice-&#62;free_in_fifo =3D FIFO_SIZE;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;position =3D 0;<br>+&#160;&#160; &#160;&#160;&#160; &#160;repetitions =
=3D tx_cfg.repetitions;<br>+&#160;&#160; &#160;&#160;&#160; &#160;while( (r=
epetitions &#62; 0) &#38;&#38; (size &#62; position) )<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;if ( (size - position) &#62; device-&#62;free_in_fifo)<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;{&#160;&#160; &#160;/* m=
sg to big for fifo - take a part */<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;int temp =3D device-&#62;free_in_f=
ifo;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;device-&#62;free_in_fifo =3D 0;<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;rf69_write_fifo(spi,<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160=
;&#160;&#160; &#38;buffer[position],<br>+&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#1=
60;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; temp);<br>+&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;posit=
ion +=3Dtemp;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
}<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;else<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;{&#160;&#160; &#160;/=
* msg fits into fifo - take all */<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;free_in_fifo -=3D size;=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;repetitions--;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;rf69_write_fifo(spi,<br>+&#160;&#160; &#160;&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;&#38;buffer[position],<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;(size - position) );<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;position =3D 0; /* reset for next repetitio=
n */<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br=
>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retval =3D wait_=
event_interruptible(device-&#62;fifo_wait_queue, <br>+&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;&#160; device-&#62;free_in_fifo &#62; =
0);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;if (retval=
) { printk(&#34;ABORT\n&#34;); goto abort; }<br>+&#160;&#160; &#160;&#160;&=
#160; &#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* we are done=
. Wait for packet to get sent */<br>+&#160;&#160; &#160;&#160;&#160; &#160;=
dev_dbg(device-&#62;dev, &#34;thread: wiat for packet to get sent/fifo to b=
e empty&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;wait_event_interru=
ptible(device-&#62;fifo_wait_queue,<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160; device-&#62;fr=
ee_in_fifo =3D=3D FIFO_SIZE ||<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160; kthread_should_stop=
() );<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( kthread_should_stop() =
)&#160;&#160; &#160;printk(&#34;ABORT\n&#34;);<br>+<br>+<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;/* STOP_TRANSMISSION */<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;dev_dbg(device-&#62;dev, &#34;thread: Packet sent. Set mode =
to stby.&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;SET_CHECKED(rf69_=
set_mode(spi, standby));<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* =
everything sent? */<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( kfifo_is=
_empty(&#38;device-&#62;tx_fifo) )<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;{<br>+abort:<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;if (rx_interrupted)<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;=
 &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160=
;&#160; &#160;rx_interrupted =3D false;<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;pi433_start_rx(device);<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;}<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;tx_active =3D false;=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;wake_up_inter=
ruptible(&#38;device-&#62;rx_wait_queue);<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;}<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+/*----------------------=
---------------------------------------------------*/<br>+<br>+static ssize=
_t<br>+pi433_read(struct file *filp, char __user *buf, size_t size, loff_t =
*f_pos)<br>+{<br>+&#160;&#160; &#160;struct pi433_instance&#160;&#160; &#16=
0;*instance;<br>+&#160;&#160; &#160;struct pi433_device&#160;&#160; &#160;*=
device;<br>+&#160;&#160; &#160;unsigned int&#160;&#160; &#160;&#160;&#160; =
&#160;bytes_received;<br>+&#160;&#160; &#160;ssize_t&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;retval;<br>+<br>+&#160;&#160; &#160;/* ch=
eck, whether internal buffer is big enough for requested size */<br>+&#160;=
&#160; &#160;if (size &#62; MAX_MSG_SIZE)<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;return -EMSGSIZE;<br>+<br>+&#160;&#160; &#160;instance =3D filp-&#=
62;private_data;<br>+&#160;&#160; &#160;device =3D instance-&#62;device;<br=
>+<br>+&#160;&#160; &#160;/* just one read request at a time */<br>+&#160;&=
#160; &#160;mutex_lock(&#38;device-&#62;rx_lock);<br>+&#160;&#160; &#160;if=
 (device-&#62;rx_active)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#=
160;&#160; &#160;mutex_unlock(&#38;device-&#62;rx_lock);<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;return -EAGAIN;<br>+&#160;&#160; &#160;}<br>+&#160;=
&#160; &#160;else<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;device-&#62;rx_active =3D true;<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;mutex_unlock(&#38;device-&#62;rx_lock);<br>+&#160;&#160; &#160;}<b=
r>+<br>+&#160;&#160; &#160;/* start receiving */<br>+&#160;&#160; &#160;/* =
will block until something was received*/<br>+&#160;&#160; &#160;device-&#6=
2;rx_buffer_size =3D size;<br>+&#160;&#160; &#160;bytes_received =3D pi433_=
receive(device);<br>+<br>+&#160;&#160; &#160;/* release rx */<br>+&#160;&#1=
60; &#160;mutex_lock(&#38;device-&#62;rx_lock);<br>+&#160;&#160; &#160;devi=
ce-&#62;rx_active =3D false;<br>+&#160;&#160; &#160;mutex_unlock(&#38;devic=
e-&#62;rx_lock);<br>+<br>+&#160;&#160; &#160;/* if read was successful copy=
 to user space*/<br>+&#160;&#160; &#160;if (bytes_received &#62;=3D 0)<br>+=
&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =3D c=
opy_to_user(buf, device-&#62;rx_buffer, bytes_received);<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;if (retval)<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;&#160;&#160; &#160;return retval;<br>+&#160;&#160; &#160;}<br>+<br>+&#16=
0;&#160; &#160;return bytes_received;<br>+}<br>+<br>+<br>+static ssize_t<br=
>+pi433_write(struct file *filp, const char __user *buf,<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;size_t count, loff_t *f_pos)<br>+{<br>+&#160;&#160;=
 &#160;struct pi433_instance&#160;&#160; &#160;*instance;<br>+&#160;&#160; =
&#160;struct pi433_device&#160;&#160; &#160;*device;<br>+&#160;&#160; &#160=
;int&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160=
;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; copied, retval;<br>+<br>+=
&#160;&#160; &#160;instance =3D filp-&#62;private_data;<br>+&#160;&#160; &#=
160;device =3D instance-&#62;device;<br>+<br>+&#160;&#160; &#160;/* check, =
whether internal buffer (tx thread) is big enough for requested size */<br>=
+&#160;&#160; &#160;if (count &#62; MAX_MSG_SIZE)<br>+&#160;&#160; &#160;&#=
160;&#160; &#160;return -EMSGSIZE;<br>+<br>+&#160;&#160; &#160;/* write the=
 following sequence into fifo:<br>+&#160;&#160; &#160;&#160;&#160; - tx_cfg=
<br>+&#160;&#160; &#160;&#160;&#160; - size of message<br>+&#160;&#160; &#1=
60;&#160;&#160; - message */<br>+&#160;&#160; &#160;mutex_lock(&#38;device-=
&#62;tx_fifo_lock);<br>+&#160;&#160; &#160;retval =3D kfifo_in(&#38;device-=
&#62;tx_fifo, &#38;instance-&#62;tx_cfg, sizeof(instance-&#62;tx_cfg));<br>=
+&#160;&#160; &#160;if ( retval !=3D sizeof(instance-&#62;tx_cfg) )<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;goto abort;<br>+<br>+&#160;&#160; &#160;=
retval =3D kfifo_in (&#38;device-&#62;tx_fifo, &#38;count, sizeof(size_t));=
<br>+&#160;&#160; &#160;if ( retval !=3D sizeof(size_t) )<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;goto abort;<br>+<br>+&#160;&#160; &#160;retval =3D=
 kfifo_from_user(&#38;device-&#62;tx_fifo, buf, count, &#38;copied);<br>+&#=
160;&#160; &#160;if (retval || copied !=3D count)<br>+&#160;&#160; &#160;&#=
160;&#160; &#160;goto abort;<br>+<br>+&#160;&#160; &#160;mutex_unlock(&#38;=
device-&#62;tx_fifo_lock);<br>+<br>+&#160;&#160; &#160;/* start transfer */=
<br>+&#160;&#160; &#160;wake_up_interruptible(&#38;device-&#62;tx_wait_queu=
e);<br>+&#160;&#160; &#160;dev_dbg(device-&#62;dev, &#34;write: generated n=
ew msg with %d bytes.&#34;, copied);<br>+<br>+&#160;&#160; &#160;return 0;<=
br>+<br>+abort:<br>+&#160;&#160; &#160;dev_dbg(device-&#62;dev, &#34;write =
to fifo failed: 0x%x&#34;, retval);<br>+&#160;&#160; &#160;kfifo_reset(&#38=
;device-&#62;tx_fifo); // TODO: maybe find a solution, not to discard alrea=
dy stored, valid entries<br>+&#160;&#160; &#160;mutex_unlock(&#38;device-&#=
62;tx_fifo_lock);<br>+&#160;&#160; &#160;return -EAGAIN;<br>+}<br>+<br>+<br=
>+static long<br>+pi433_ioctl(struct file *filp, unsigned int cmd, unsigned=
 long arg)<br>+{<br>+&#160;&#160; &#160;int&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;err =3D 0;<br>+&#160;&#160; &#160;int&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;retval =3D 0;<br>+&#160;&#160; =
&#160;struct pi433_instance&#160;&#160; &#160;*instance;<br>+&#160;&#160; &=
#160;struct pi433_device&#160;&#160; &#160;*device;<br>+&#160;&#160; &#160;=
u32&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;tmp;<br>+<br>+&=
#160;&#160; &#160;/* Check type and command number */<br>+&#160;&#160; &#16=
0;if (_IOC_TYPE(cmd) !=3D PI433_IOC_MAGIC)<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;return -ENOTTY;<br>+<br>+&#160;&#160; &#160;/* Check access direc=
tion once here; don&#39;t repeat below.<br>+&#160;&#160; &#160; * IOC_DIR i=
s from the user perspective, while access_ok is<br>+&#160;&#160; &#160; * f=
rom the kernel perspective; so they look reversed.<br>+&#160;&#160; &#160; =
*/<br>+&#160;&#160; &#160;if (_IOC_DIR(cmd) &#38; _IOC_READ)<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;err =3D !access_ok(VERIFY_WRITE,<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160; (void __=
user *)arg,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160; _IOC_SIZE(cmd));<br>+<br>+&#160;&#160; &#160;if (err =3D=
=3D 0 &#38;&#38; _IOC_DIR(cmd) &#38; _IOC_WRITE)<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;err =3D !access_ok(VERIFY_READ,<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160; (void __user *)arg,<b=
r>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160; _IOC_SIZE(cmd));<br>+&#160;&#160; &#160;if (err)<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;return -EFAULT;<br>+<br>+&#160;&#160; &#160;/* TODO? g=
uard against device removal before, or while,<br>+&#160;&#160; &#160; * we =
issue this ioctl. --&#62; device_get()<br>+&#160;&#160; &#160; */<br>+&#160=
;&#160; &#160;instance =3D filp-&#62;private_data;<br>+&#160;&#160; &#160;d=
evice =3D instance-&#62;device;<br>+<br>+&#160;&#160; &#160;if (device =3D=
=3D NULL)<br>+&#160;&#160; &#160;&#160;&#160; &#160;return -ESHUTDOWN;<br>+=
<br>+&#160;&#160; &#160;switch (cmd) {<br>+&#160;&#160; &#160;case PI433_IO=
C_RD_TX_CFG:<br>+&#160;&#160; &#160;&#160;&#160; &#160;tmp =3D _IOC_SIZE(cm=
d);<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( (tmp =3D=3D 0) || ((tmp =
% sizeof(struct pi433_tx_cfg)) !=3D 0) )<br>+&#160;&#160; &#160;&#160;&#160=
; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retv=
al =3D -EINVAL;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;break;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;if (__copy_to_user((void __user *)arg,<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;=
&#160;&#160; &#38;instance-&#62;tx_cfg,<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160; tmp))<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;retval =3D -EFAULT;<br>+&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;break;<br>+&#160;&#16=
0; &#160;case PI433_IOC_WR_TX_CFG:<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;tmp =3D _IOC_SIZE(cmd);<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( (t=
mp =3D=3D 0) || ((tmp % sizeof(struct pi433_tx_cfg)) !=3D 0) )<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;retval =3D -EINVAL;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<=
br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (__copy_from_user(&#38;in=
stance-&#62;tx_cfg,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; (void __user *)arg,<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160;&#160;&#160; tmp))<br>+&#160;&#160; &#160;&#160;&#160; &#160;{<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retval =3D -EF=
AULT;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;break;<b=
r>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;break;<br>+<br>+&#160;&#160; &#160;case PI433_IOC_RD_RX_CFG:=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;tmp =3D _IOC_SIZE(cmd);<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;if ( (tmp =3D=3D 0) || ((tmp % sizeof(str=
uct pi433_rx_cfg)) !=3D 0) ) {<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;retval =3D -EINVAL;<br>+&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<b=
r>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (__copy_to_user((void __us=
er *)arg,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#38;device-&#62;rx_cfg,<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; tmp)=
)<br>+&#160;&#160; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;retval =3D -EFAULT;<br>+&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;&#160;&=
#160; &#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;break;<br>+&#1=
60;&#160; &#160;case PI433_IOC_WR_RX_CFG:<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;tmp =3D _IOC_SIZE(cmd);<br>+&#160;&#160; &#160;&#160;&#160; &#160;=
mutex_lock(&#38;device-&#62;rx_lock);<br>+<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;/* during pendig read request, change of config not allowed */<br=
>+&#160;&#160; &#160;&#160;&#160; &#160;if (device-&#62;rx_active) {<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retval =3D -EAGAIN;<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;mutex_unlock(&=
#38;device-&#62;rx_lock);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;break;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;if ( (tmp =3D=3D 0) || ((tmp % sizeof(st=
ruct pi433_rx_cfg)) !=3D 0) ) {<br>+&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;retval =3D -EINVAL;<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;mutex_unlock(&#38;device-&#62;rx_lock);<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;break;<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;if=
 (__copy_from_user(&#38;device-&#62;rx_cfg,<br>+&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; (=
void __user *)arg,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; tmp))<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;retval =3D -EFAULT;<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; &#160;mutex_unlock(&#38;device-&#62;rx_lock);<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;mutex_unlo=
ck(&#38;device-&#62;rx_lock);<br>+&#160;&#160; &#160;&#160;&#160; &#160;bre=
ak;<br>+&#160;&#160; &#160;default:<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;retval =3D -EINVAL;<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160=
;return retval;<br>+}<br>+<br>+#ifdef CONFIG_COMPAT<br>+static long<br>+pi4=
33_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)<br>=
+{<br>+&#160;&#160; &#160;return pi433_ioctl(filp, cmd, (unsigned long)comp=
at_ptr(arg));<br>+}<br>+#else<br>+#define pi433_compat_ioctl NULL<br>+#endi=
f /* CONFIG_COMPAT */<br>+<br>+/*------------------------------------------=
-------------------------------*/<br>+<br>+static int pi433_open(struct ino=
de *inode, struct file *filp)<br>+{<br>+&#160;&#160; &#160;struct pi433_dev=
ice&#160;&#160; &#160;*device;<br>+&#160;&#160; &#160;struct pi433_instance=
&#160;&#160; &#160;*instance;<br>+<br>+&#160;&#160; &#160;mutex_lock(&#38;m=
inor_lock);<br>+&#160;&#160; &#160;device =3D idr_find(&#38;pi433_idr, imin=
or(inode));<br>+<br>+&#160;&#160; &#160;mutex_unlock(&#38;minor_lock);<br>+=
&#160;&#160; &#160;if (!device) {<br>+&#160;&#160; &#160;&#160;&#160; &#160=
;dev_dbg(device-&#62;dev, &#34;device: minor %d unknown.\n&#34;, iminor(ino=
de));<br>+&#160;&#160; &#160;&#160;&#160; &#160;return -ENODEV;<br>+&#160;&=
#160; &#160;}<br>+<br>+&#160;&#160; &#160;if (!device-&#62;rx_buffer) {<br>=
+&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;rx_buffer =3D kmalloc(MA=
X_MSG_SIZE, GFP_KERNEL);<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (!dev=
ice-&#62;rx_buffer)<br>+&#160;&#160; &#160;&#160;&#160; &#160;{<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(device-&#62;dev, =
&#34;open/ENOMEM\n&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;return -ENOMEM;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>=
+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;device-&#62;users++;<br>+=
&#160;&#160; &#160;instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);<br>=
+&#160;&#160; &#160;if (!instance)<br>+&#160;&#160; &#160;{<br>+&#160;&#160=
; &#160;&#160;&#160; &#160;kfree(device-&#62;rx_buffer);<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;device-&#62;rx_buffer =3D NULL;<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;return -ENOMEM;<br>+&#160;&#160; &#160;}<br>+<br>+&#=
160;&#160; &#160;/* setup instance data*/<br>+&#160;&#160; &#160;instance-&=
#62;device =3D device;<br>+&#160;&#160; &#160;instance-&#62;tx_cfg.bit_rate=
 =3D 4711;<br>+&#160;&#160; &#160;// TODO: fill instance-&#62;tx_cfg;<br>+<=
br>+&#160;&#160; &#160;/* instance data as context */<br>+&#160;&#160; &#16=
0;filp-&#62;private_data =3D instance;<br>+&#160;&#160; &#160;nonseekable_o=
pen(inode, filp);<br>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<br>+stat=
ic int pi433_release(struct inode *inode, struct file *filp)<br>+{<br>+&#16=
0;&#160; &#160;struct pi433_instance&#160;&#160; &#160;*instance;<br>+&#160=
;&#160; &#160;struct pi433_device&#160;&#160; &#160;*device;<br>+<br>+&#160=
;&#160; &#160;instance =3D filp-&#62;private_data;<br>+&#160;&#160; &#160;d=
evice =3D instance-&#62;device;<br>+&#160;&#160; &#160;kfree(instance);<br>=
+&#160;&#160; &#160;filp-&#62;private_data =3D NULL;<br>+<br>+&#160;&#160; =
&#160;/* last close? */<br>+&#160;&#160; &#160;device-&#62;users--;<br>+<br=
>+&#160;&#160; &#160;if (!device-&#62;users) {<br>+&#160;&#160; &#160;&#160=
;&#160; &#160;kfree(device-&#62;rx_buffer);<br>+&#160;&#160; &#160;&#160;&#=
160; &#160;device-&#62;rx_buffer =3D NULL;<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;if (device-&#62;spi =3D=3D NULL)<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;kfree(device);<br>+&#160;&#160; &#160;}<br>+<b=
r>+&#160;&#160; &#160;return 0;<br>+}<br>+<br>+<br>+/*---------------------=
----------------------------------------------------*/<br>+<br>+static int =
setup_GPIOs(struct pi433_device *device)<br>+{<br>+&#160;&#160; &#160;char =
&#160;&#160; &#160;name[5];<br>+&#160;&#160; &#160;int&#160;&#160; &#160;re=
tval;<br>+&#160;&#160; &#160;int&#160;&#160; &#160;i;<br>+<br>+&#160;&#160;=
 &#160;for (i=3D0; i&#60;NUM_DIO; i++)<br>+&#160;&#160; &#160;{<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;/* &#34;construct&#34; name and get the gpio=
 descriptor */<br>+&#160;&#160; &#160;&#160;&#160; &#160;snprintf(name, siz=
eof(name), &#34;DIO%d&#34;, i);<br>+&#160;&#160; &#160;&#160;&#160; &#160;d=
evice-&#62;gpiod[i] =3D gpiod_get(&#38;device-&#62;spi-&#62;dev, name, 0 /*=
GPIOD_IN*/);<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (device-&#62=
;gpiod[i] =3D=3D ERR_PTR(-ENOENT))<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#=
38;device-&#62;spi-&#62;dev, &#34;Could not find entry for %s. Ignoring.&#3=
4;, name);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;con=
tinue;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;if (device-&#62;gpiod[i] =3D=3D ERR_PTR(-EBUSY))<br>=
+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;devi=
ce-&#62;spi-&#62;dev, &#34;%s is busy.&#34;, name);<br>+<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;if ( IS_ERR(device-&#62;gpiod[i]) )<br>+&#160;&#160=
; &#160;&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;retval =3D PTR_ERR(device-&#62;gpiod[i]);<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;/* release already allocated gpi=
os */<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;for (i--=
; i&#62;=3D0; i--)<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;free_irq(device-&#62;irq_num[i], device);<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;gpiod_put(device=
-&#62;gpiod[i]);<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;}<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;return re=
tval;<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+<br>+<br>+&#160;&#160=
; &#160;&#160;&#160; &#160;/* configure the pin */<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;gpiod_unexport(device-&#62;gpiod[i]);<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;retval =3D gpiod_direction_input(device-&#62;gpiod[i=
]);<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (retval) return retval;<br=
>+<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* configure irq */<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;device-&#62;irq_num[i] =3D gpiod_to_ir=
q(device-&#62;gpiod[i]);<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (devi=
ce-&#62;irq_num[i] &#60; 0)<br>+&#160;&#160; &#160;&#160;&#160; &#160;{<br>=
+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;gpiod=
[i] =3D ERR_PTR(-EINVAL);//(struct gpio_desc *)device-&#62;irq_num[i];<br>+=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;return device-&#62=
;irq_num[i];<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;retval =3D request_irq(device-&#62;irq_num[i],<br>+=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160;&#160;&#160; DIO_irq_handler[i],<br>+&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;=
 0, /* flags */<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160;&#160;&#160; name,<br>+&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;=
&#160; device);<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (retval)<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;return retval;=
<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;device-&#62;sp=
i-&#62;dev, &#34;%s succesfully configured&#34;, name);<br>+&#160;&#160; &#=
160;}<br>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<br>+static void free=
_GPIOs(struct pi433_device *device)<br>+{<br>+&#160;&#160; &#160;int i;<br>=
+<br>+&#160;&#160; &#160;for (i=3D0; i&#60;NUM_DIO; i++)<br>+&#160;&#160; &=
#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;/* check if gpiod is valid=
 */<br>+&#160;&#160; &#160;&#160;&#160; &#160;if ( IS_ERR(device-&#62;gpiod=
[i]) )<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;continu=
e;<br>+<br>+&#160;&#160; &#160;&#160;&#160; &#160;free_irq(device-&#62;irq_=
num[i], device);<br>+&#160;&#160; &#160;&#160;&#160; &#160;gpiod_put(device=
-&#62;gpiod[i]);<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;return;<br=
>+}<br>+<br>+static int pi433_get_minor(struct pi433_device *device)<br>+{<=
br>+&#160;&#160; &#160;int retval =3D -ENOMEM;<br>+<br>+&#160;&#160; &#160;=
mutex_lock(&#38;minor_lock);<br>+&#160;&#160; &#160;retval =3D idr_alloc(&#=
38;pi433_idr, device, 0, N_PI433_MINORS, GFP_KERNEL);<br>+&#160;&#160; &#16=
0;if (retval &#62;=3D 0) {<br>+&#160;&#160; &#160;&#160;&#160; &#160;device=
-&#62;minor =3D retval;<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =
=3D 0;<br>+&#160;&#160; &#160;} else if (retval =3D=3D -ENOSPC) {<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;dev_err(device-&#62;dev, &#34;too many pi4=
33 devices\n&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;retval =3D -E=
INVAL;<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;mutex_unlock(&#38;mi=
nor_lock);<br>+&#160;&#160; &#160;return retval;<br>+}<br>+<br>+static void=
 pi433_free_minor(struct pi433_device *dev)<br>+{<br>+&#160;&#160; &#160;mu=
tex_lock(&#38;minor_lock);<br>+&#160;&#160; &#160;idr_remove(&#38;pi433_idr=
, dev-&#62;minor);<br>+&#160;&#160; &#160;mutex_unlock(&#38;minor_lock);<br=
>+}<br>+/*-----------------------------------------------------------------=
--------*/<br>+<br>+static const struct file_operations pi433_fops =3D {<br=
>+&#160;&#160; &#160;.owner =3D&#160;&#160; &#160;THIS_MODULE,<br>+&#160;&#=
160; &#160;/* REVISIT switch to aio primitives, so that userspace<br>+&#160=
;&#160; &#160; * gets more complete API coverage.&#160; It&#39;ll simplify =
things<br>+&#160;&#160; &#160; * too, except for the locking.<br>+&#160;&#1=
60; &#160; */<br>+&#160;&#160; &#160;.write =3D&#160;&#160; &#160;pi433_wri=
te,<br>+&#160;&#160; &#160;.read =3D&#160;&#160; &#160;&#160;&#160; &#160;p=
i433_read,<br>+&#160;&#160; &#160;.unlocked_ioctl =3D pi433_ioctl,<br>+&#16=
0;&#160; &#160;.compat_ioctl =3D pi433_compat_ioctl,<br>+&#160;&#160; &#160=
;.open =3D&#160;&#160; &#160;&#160;&#160; &#160;pi433_open,<br>+&#160;&#160=
; &#160;.release =3D&#160;&#160; &#160;pi433_release,<br>+&#160;&#160; &#16=
0;.llseek =3D&#160;&#160; &#160;no_llseek,<br>+};<br>+<br>+/*--------------=
-----------------------------------------------------------*/<br>+<br>+stat=
ic int pi433_probe(struct spi_device *spi)<br>+{<br>+&#160;&#160; &#160;str=
uct pi433_device&#160;&#160; &#160;*device;<br>+&#160;&#160; &#160;int&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retval;<br>+<br>+&#160;=
&#160; &#160;/* setup spi parameters */<br>+&#160;&#160; &#160;spi-&#62;mod=
e =3D 0x00;<br>+&#160;&#160; &#160;spi-&#62;bits_per_word =3D 8;<br>+&#160;=
&#160; &#160;/* spi-&#62;max_speed_hz =3D 10000000;&#160; 1MHz already set =
by device tree overlay */<br>+<br>+&#160;&#160; &#160;retval =3D spi_setup(=
spi);<br>+&#160;&#160; &#160;if (retval)<br>+&#160;&#160; &#160;{<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;configurat=
ion of SPI interface failed!\n&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;return retval;<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;else<br=
>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#=
38;spi-&#62;dev,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;&#34;spi interface setup: mode 0x%2x, %d bits per word, %dhz max speed&#=
34;,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;spi-&#62;=
mode, spi-&#62;bits_per_word, spi-&#62;max_speed_hz);<br>+&#160;&#160; &#16=
0;}<br>+<br>+&#160;&#160; &#160;/* Ping the chip by reading the version reg=
ister */<br>+&#160;&#160; &#160;retval =3D spi_w8r8(spi, 0x10);<br>+&#160;&=
#160; &#160;if (retval &#60; 0)<br>+&#160;&#160; &#160;&#160;&#160; &#160;r=
eturn retval;<br>+<br>+&#160;&#160; &#160;switch(retval)<br>+&#160;&#160; &=
#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;case 0x24:<br>+&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#=
34;fonud pi433 (ver. 0x%x)&#34;, retval);<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;default:<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev=
_dbg(&#38;spi-&#62;dev, &#34;unknown chip version: 0x%x&#34;, retval);<br>+=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;return -ENODEV;<br=
>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;/* Allocate driver data =
*/<br>+&#160;&#160; &#160;device =3D kzalloc(sizeof(*device), GFP_KERNEL);<=
br>+&#160;&#160; &#160;if (!device)<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;return -ENOMEM;<br>+<br>+&#160;&#160; &#160;/* Initialize the driver dat=
a */<br>+&#160;&#160; &#160;device-&#62;spi =3D spi;<br>+&#160;&#160; &#160=
;device-&#62;rx_active =3D false;<br>+&#160;&#160; &#160;device-&#62;tx_act=
ive =3D false;<br>+&#160;&#160; &#160;device-&#62;interrupt_rx_allowed =3D =
false;<br>+<br>+&#160;&#160; &#160;/* init wait queues */<br>+&#160;&#160; =
&#160;init_waitqueue_head(&#38;device-&#62;tx_wait_queue);<br>+&#160;&#160;=
 &#160;init_waitqueue_head(&#38;device-&#62;rx_wait_queue);<br>+&#160;&#160=
; &#160;init_waitqueue_head(&#38;device-&#62;fifo_wait_queue);<br>+<br>+&#1=
60;&#160; &#160;/* init fifo */<br>+&#160;&#160; &#160;INIT_KFIFO(device-&#=
62;tx_fifo);<br>+<br>+&#160;&#160; &#160;/* init mutexes and locks */<br>+&=
#160;&#160; &#160;mutex_init(&#38;device-&#62;tx_fifo_lock);<br>+&#160;&#16=
0; &#160;mutex_init(&#38;device-&#62;rx_lock);<br>+<br>+&#160;&#160; &#160;=
/* setup GPIO (including irq_handler) for the different DIOs */<br>+&#160;&=
#160; &#160;retval =3D setup_GPIOs(device);<br>+&#160;&#160; &#160;if (retv=
al)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_=
dbg(&#38;spi-&#62;dev, &#34;setup of GPIOs failed&#34;);<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;goto GPIO_failed;<br>+&#160;&#160; &#160;}<br>+<br>=
+&#160;&#160; &#160;/* setup the radio module */<br>+&#160;&#160; &#160;SET=
_CHECKED(rf69_set_mode&#160;&#160; &#160;&#160;&#160; &#160;(spi, standby))=
;<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_data_mode&#160;&#160; &#160;&=
#160;&#160; &#160;(spi, packet));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_s=
et_amplifier_0&#160;&#160; &#160;(spi, optionOn));<br>+&#160;&#160; &#160;S=
ET_CHECKED(rf69_set_amplifier_1&#160;&#160; &#160;(spi, optionOff));<br>+&#=
160;&#160; &#160;SET_CHECKED(rf69_set_amplifier_2&#160;&#160; &#160;(spi, o=
ptionOff));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_output_power_level&=
#160;&#160; &#160;(spi, 13));<br>+&#160;&#160; &#160;SET_CHECKED(rf69_set_a=
ntenna_impedance&#160;&#160; &#160;(spi, fiftyOhm));<br>+<br>+&#160;&#160; =
&#160;/* start tx thread */<br>+&#160;&#160; &#160;device-&#62;tx_task_stru=
ct =3D kthread_run(pi433_tx_thread,<br>+&#160;&#160; &#160;&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#1=
60;&#160; device,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160; &#34;pi4=
33_tx_task&#34;);<br>+&#160;&#160; &#160;if (device-&#62;tx_task_struct &#6=
0; 0)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;de=
v_dbg(device-&#62;dev, &#34;start of send thread failed&#34;);<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;goto send_thread_failed;<br>+&#160;&#160; &#1=
60;}<br>+<br>+&#160;&#160; &#160;/* determ minor number */<br>+&#160;&#160;=
 &#160;retval =3D pi433_get_minor(device);<br>+&#160;&#160; &#160;if (retva=
l)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_d=
bg(device-&#62;dev, &#34;get of minor number failed&#34;);<br>+&#160;&#160;=
 &#160;&#160;&#160; &#160;goto minor_failed;<br>+&#160;&#160; &#160;}<br>+<=
br>+&#160;&#160; &#160;/* create device */<br>+&#160;&#160; &#160;device-&#=
62;devt =3D MKDEV(MAJOR(pi433_dev), device-&#62;minor);<br>+&#160;&#160; &#=
160;device-&#62;dev =3D device_create(pi433_class,<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160; =
&#38;spi-&#62;dev,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160;&#160; device-&#62;devt,<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60;&#160; device,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160;&#160; &#34;pi433&#34;);<br>+&#160;&#160=
; &#160;if (IS_ERR(device-&#62;dev)) {<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;pr_err(&#34;pi433: device register failed\n&#34;);<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;retval =3D PTR_ERR(device-&#62;dev);<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;goto device_create_failed;<br>+&#160;&#160; &#1=
60;}<br>+&#160;&#160; &#160;else {<br>+&#160;&#160; &#160;&#160;&#160; &#16=
0;dev_dbg(device-&#62;dev,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;=
&#160; &#160;&#34;created device for major %d, minor %d\n&#34;,<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;MAJOR(pi433_dev),<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;device-&#62;minor);<b=
r>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;/* create cdev */<br>+&=
#160;&#160; &#160;device-&#62;cdev =3D cdev_alloc();<br>+&#160;&#160; &#160=
;device-&#62;cdev-&#62;owner =3D THIS_MODULE;<br>+&#160;&#160; &#160;cdev_i=
nit(device-&#62;cdev, &#38;pi433_fops);<br>+&#160;&#160; &#160;retval =3D c=
dev_add(device-&#62;cdev, device-&#62;devt, 1);<br>+&#160;&#160; &#160;if (=
retval)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;=
dev_dbg(device-&#62;dev, &#34;register of cdev failed&#34;);<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;goto cdev_failed;<br>+&#160;&#160; &#160;}<br>+=
<br>+&#160;&#160; &#160;/* spi setup */<br>+&#160;&#160; &#160;spi_set_drvd=
ata(spi, device);<br>+<br>+&#160;&#160; &#160;return 0;<br>+<br>+cdev_faile=
d:<br>+&#160;&#160; &#160;device_destroy(pi433_class, device-&#62;devt);<br=
>+device_create_failed:<br>+&#160;&#160; &#160;pi433_free_minor(device);<br=
>+minor_failed:<br>+&#160;&#160; &#160;kthread_stop(device-&#62;tx_task_str=
uct);<br>+send_thread_failed:<br>+&#160;&#160; &#160;free_GPIOs(device);<br=
>+GPIO_failed:<br>+&#160;&#160; &#160;kfree(device);<br>+<br>+&#160;&#160; =
&#160;return retval;<br>+}<br>+<br>+static int pi433_remove(struct spi_devi=
ce *spi)<br>+{<br>+&#160;&#160; &#160;struct pi433_device&#160;&#160; &#160=
;*device =3D spi_get_drvdata(spi);<br>+<br>+&#160;&#160; &#160;/* free GPIO=
s */<br>+&#160;&#160; &#160;free_GPIOs(device);<br>+<br>+&#160;&#160; &#160=
;/* make sure ops on existing fds can abort cleanly */<br>+&#160;&#160; &#1=
60;device-&#62;spi =3D NULL;<br>+<br>+&#160;&#160; &#160;kthread_stop(devic=
e-&#62;tx_task_struct);<br>+<br>+&#160;&#160; &#160;device_destroy(pi433_cl=
ass, device-&#62;devt);<br>+<br>+&#160;&#160; &#160;cdev_del(device-&#62;cd=
ev);<br>+<br>+&#160;&#160; &#160;pi433_free_minor(device);<br>+<br>+&#160;&=
#160; &#160;if (device-&#62;users =3D=3D 0)<br>+&#160;&#160; &#160;&#160;&#=
160; &#160;kfree(device);<br>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<=
br>+static const struct of_device_id pi433_dt_ids[] =3D {<br>+&#160;&#160; =
&#160;{ .compatible =3D &#34;Smarthome-Wolf,pi433&#34; },<br>+&#160;&#160; =
&#160;{},<br>+};<br>+<br>+MODULE_DEVICE_TABLE(of, pi433_dt_ids);<br>+<br>+s=
tatic struct spi_driver pi433_spi_driver =3D {<br>+&#160;&#160; &#160;.driv=
er =3D {<br>+&#160;&#160; &#160;&#160;&#160; &#160;.name =3D&#160;&#160; &#=
160;&#160;&#160; &#160;&#34;pi433&#34;,<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;.owner =3D&#160;&#160; &#160;THIS_MODULE,<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;.of_match_table =3D of_match_ptr(pi433_dt_ids),<br>+&#160;&=
#160; &#160;},<br>+&#160;&#160; &#160;.probe =3D&#160;&#160; &#160;pi433_pr=
obe,<br>+&#160;&#160; &#160;.remove =3D&#160;&#160; &#160;pi433_remove,<br>=
+<br>+&#160;&#160; &#160;/* NOTE:&#160; suspend/resume methods are not nece=
ssary here.<br>+&#160;&#160; &#160; * We don&#39;t do anything except pass =
the requests to/from<br>+&#160;&#160; &#160; * the underlying controller.&#=
160; The refrigerator handles<br>+&#160;&#160; &#160; * most issues; the co=
ntroller driver handles the rest.<br>+&#160;&#160; &#160; */<br>+};<br>+<br=
>+/*-----------------------------------------------------------------------=
--*/<br>+<br>+static int __init pi433_init(void)<br>+{<br>+&#160;&#160; &#1=
60;int status;<br>+<br>+&#160;&#160; &#160;/* If MAX_MSG_SIZE is smaller th=
en FIFO_SIZE, the driver won&#39;t<br>+&#160;&#160;&#160;&#160;&#160;&#160;=
&#160;&#160;&#160;&#160; work stable - risk of buffer overflow */<br>+&#160=
;&#160; &#160;if (MAX_MSG_SIZE &#60; FIFO_SIZE)<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;return -EINVAL;<br>+<br>+&#160;&#160; &#160;/* Claim device =
numbers.&#160; Then register a class<br>+&#160;&#160; &#160; * that will ke=
y udev/mdev to add/remove /dev nodes.&#160; Last, register<br>+&#160;&#160;=
 &#160; * Last, register the driver which manages those device numbers.<br>=
+&#160;&#160; &#160; */<br>+&#160;&#160; &#160;status =3D alloc_chrdev_regi=
on(&#38;pi433_dev, 0 /*firstminor*/, N_PI433_MINORS /*count*/, &#34;pi433&#=
34; /*name*/);<br>+&#160;&#160; &#160;if (status &#60; 0)<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;return status;<br>+<br>+&#160;&#160; &#160;pi433_c=
lass =3D class_create(THIS_MODULE, &#34;pi433&#34;);<br>+&#160;&#160; &#160=
;if (IS_ERR(pi433_class))<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driv=
er.name);<br>+&#160;&#160; &#160;&#160;&#160; &#160;return PTR_ERR(pi433_cl=
ass);<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;status =3D spi_r=
egister_driver(&#38;pi433_spi_driver);<br>+&#160;&#160; &#160;if (status &#=
60; 0)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;c=
lass_destroy(pi433_class);<br>+&#160;&#160; &#160;&#160;&#160; &#160;unregi=
ster_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);<br>+&#160;&#16=
0; &#160;}<br>+<br>+&#160;&#160; &#160;return status;<br>+}<br>+<br>+module=
_init(pi433_init);<br>+<br>+static void __exit pi433_exit(void)<br>+{<br>+&=
#160;&#160; &#160;spi_unregister_driver(&#38;pi433_spi_driver);<br>+&#160;&=
#160; &#160;class_destroy(pi433_class);<br>+&#160;&#160; &#160;unregister_c=
hrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);<br>+}<br>+module_exi=
t(pi433_exit);<br>+<br>+MODULE_AUTHOR(&#34;Marcus Wolf, &#60;linux@wolf-ent=
wicklungen.de&#62;&#34;);<br>+MODULE_DESCRIPTION(&#34;Driver for Pi433&#34;=
);<br>+MODULE_LICENSE(&#34;GPL&#34;);<br>+MODULE_ALIAS(&#34;spi:pi433&#34;)=
;<br>diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/=
pi433_if.h<br>new file mode 100644<br>index 0000000..e6ed3cd<br>--- /dev/nu=
ll<br>+++ b/drivers/staging/pi433/pi433_if.h<br>@@ -0,0 +1,152 @@<br>+/*<br=
>+ * include/linux/TODO<br>+ *<br>+ * userspace interface for pi433 radio m=
odule<br>+ *<br>+ * Pi433 is a 433MHz radio module for the Raspberry Pi.<br=
>+ * It is based on the HopeRf Module RFM69CW. Therefore inside of this<br>=
+ * driver, you&#39;ll find an abstraction of the rf69 chip.<br>+ *<br>+ * =
If needed, this driver could be extended, to also support other<br>+ * devi=
ces, basing on HopeRfs rf69.<br>+ *<br>+ * The driver can also be extended,=
 to support other modules of<br>+ * HopeRf with a similar interace - e. g. =
RFM69HCW, RFM12, RFM95, ...<br>+ * Copyright (C) 2016 Wolf-Entwicklungen<br=
>+ *&#160;&#160; &#160;Marcus Wolf &#60;linux@wolf-entwicklungen.de&#62;<br=
>+ *<br>+ * This program is free software; you can redistribute it and/or m=
odify<br>+ * it under the terms of the GNU General Public License as publis=
hed by<br>+ * the Free Software Foundation; either version 2 of the License=
, or<br>+ * (at your option) any later version.<br>+ *<br>+ * This program =
is distributed in the hope that it will be useful,<br>+ * but WITHOUT ANY W=
ARRANTY; without even the implied warranty of<br>+ * MERCHANTABILITY or FIT=
NESS FOR A PARTICULAR PURPOSE.&#160; See the<br>+ * GNU General Public Lice=
nse for more details.<br>+ */<br>+<br>+#ifndef PI433_H<br>+#define PI433_H<=
br>+<br>+#include &#60;linux/types.h&#62;<br>+#include &#34;rf69_enum.h&#34=
;<br>+<br>+/*--------------------------------------------------------------=
-------------*/<br>+<br>+<br>+/*-------------------------------------------=
--------------------------------*/<br>+<br>+/* IOCTL structs and commands *=
/<br>+<br>+/**<br>+ * struct pi433_tx_config - describes the configuration =
of the radio module for sending<br>+ * @frequency:<br>+ * @bit_rate:<br>+ *=
 @modulation:<br>+ * @data_mode:<br>+ * @preamble_length:<br>+ * @sync_patt=
ern:<br>+ * @tx_start_condition:<br>+ * @payload_length:<br>+ * @repetition=
s:<br>+ *<br>+ * ATTENTION:<br>+ * If the contents of &#39;pi433_tx_config&=
#39; ever change<br>+ * incompatibly, then the ioctl number (see define bel=
ow) must change.<br>+ *<br>+ * NOTE: struct layout is the same in 64bit and=
 32bit userspace.<br>+ */<br>+#define PI433_TX_CFG_IOCTL_NR &#160;&#160; &#=
160;0<br>+struct pi433_tx_cfg<br>+{<br>+&#160;&#160; &#160;__u32&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;frequency;<br>+&#160;&#160; &=
#160;__u16&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;bit_rate=
;<br>+&#160;&#160; &#160;__u32&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;dev_frequency;<br>+&#160;&#160; &#160;enum modulation&#160;&#16=
0; &#160;&#160;&#160; &#160;modulation;<br>+&#160;&#160; &#160;enum modShap=
ing&#160;&#160; &#160;&#160;&#160; &#160;modShaping;<br>+<br>+&#160;&#160; =
&#160;enum paRamp&#160;&#160; &#160;&#160;&#160; &#160;pa_ramp;<br>+<br>+&#=
160;&#160; &#160;enum txStartCondition&#160;&#160; &#160;tx_start_condition=
;<br>+<br>+&#160;&#160; &#160;__u16&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;repetitions;<br>+<br>+<br>+&#160;&#160; &#160;/* packet fo=
rmat */<br>+&#160;&#160; &#160;enum optionOnOff&#160;&#160; &#160;enable_pr=
eamble;<br>+&#160;&#160; &#160;enum optionOnOff&#160;&#160; &#160;enable_sy=
nc;<br>+&#160;&#160; &#160;enum optionOnOff&#160;&#160; &#160;enable_length=
_byte;<br>+&#160;&#160; &#160;enum optionOnOff&#160;&#160; &#160;enable_add=
ress_byte;<br>+&#160;&#160; &#160;enum optionOnOff&#160;&#160; &#160;enable=
_crc;<br>+<br>+&#160;&#160; &#160;__u16&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;preamble_length;<br>+&#160;&#160; &#160;__u8&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;sync_length;<br>+&#160;&#160=
; &#160;__u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;fixed_=
message_length;<br>+<br>+&#160;&#160; &#160;__u8&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;sync_pattern[8];<br>+&#160;&#160; &#160;__u8&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;address_byte;<br>+}=
;<br>+<br>+<br>+/**<br>+ * struct pi433_rx_config - describes the configura=
tion of the radio module for sending<br>+ * @frequency:<br>+ * @bit_rate:<b=
r>+ * @modulation:<br>+ * @data_mode:<br>+ * @preamble_length:<br>+ * @sync=
_pattern:<br>+ * @tx_start_condition:<br>+ * @payload_length:<br>+ * @repet=
itions:<br>+ *<br>+ * ATTENTION:<br>+ * If the contents of &#39;pi433_rx_co=
nfig&#39; ever change<br>+ * incompatibly, then the ioctl number (see defin=
e below) must change<br>+ *<br>+ * NOTE: struct layout is the same in 64bit=
 and 32bit userspace.<br>+ */<br>+#define PI433_RX_CFG_IOCTL_NR &#160;&#160=
; &#160;1<br>+struct pi433_rx_cfg {<br>+&#160;&#160; &#160;__u32&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;frequency;<br>+&#160;&#160; &=
#160;__u16&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;bit_rate=
;<br>+&#160;&#160; &#160;__u32&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;dev_frequency;<br>+<br>+&#160;&#160; &#160;enum modulation&#160=
;&#160; &#160;&#160;&#160; &#160;modulation;<br>+<br>+&#160;&#160; &#160;__=
u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;rssi_threshold;<=
br>+&#160;&#160; &#160;enum thresholdDecrement&#160;&#160; &#160;thresholdD=
ecrement;<br>+&#160;&#160; &#160;enum antennaImpedance&#160;&#160; &#160;an=
tenna_impedance;<br>+&#160;&#160; &#160;enum lnaGain&#160;&#160; &#160;&#16=
0;&#160; &#160;lna_gain;<br>+&#160;&#160; &#160;enum mantisse&#160;&#160; &=
#160;&#160;&#160; &#160;bw_mantisse;&#160;&#160; &#160;/* normal: 0x50 */<b=
r>+&#160;&#160; &#160;__u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;bw_exponent;&#160;&#160; &#160;/* during AFC: 0x8b */<br>+&#160;&#1=
60; &#160;enum dagc&#160;&#160; &#160;&#160;&#160; &#160;dagc;<br>+<br>+<br=
>+<br>+&#160;&#160; &#160;/* packet format */<br>+&#160;&#160; &#160;enum o=
ptionOnOff&#160;&#160; &#160;enable_sync;<br>+&#160;&#160; &#160;enum optio=
nOnOff&#160;&#160; &#160;enable_length_byte;&#160;&#160; &#160;&#160; /* sh=
ould be used in combination with sync, only */<br>+&#160;&#160; &#160;enum =
addressFiltering&#160;&#160; &#160;enable_address_filtering; /* operational=
 with sync, only */<br>+&#160;&#160; &#160;enum optionOnOff&#160;&#160; &#1=
60;enable_crc;&#160;&#160; &#160;&#160;&#160; &#160;&#160; /* only operatio=
nal, if sync on and fixed length or length byte is used */<br>+<br>+&#160;&=
#160; &#160;__u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;sy=
nc_length;<br>+&#160;&#160; &#160;__u8&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;fixed_message_length;<br>+&#160;&#160; &#160;__u32&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;bytes_to_drop;<br>+<br>=
+&#160;&#160; &#160;__u8&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;sync_pattern[8];<br>+&#160;&#160; &#160;__u8&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;node_address;<br>+&#160;&#160; &#160;__u8&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;broadcast_address;<b=
r>+};<br>+<br>+<br>+#define PI433_IOC_MAGIC&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;&#39;r&#39;<br>+<br>+#define PI433_IOC_RD_TX_CFG&#=
160;&#160; &#160;_IOR(PI433_IOC_MAGIC, PI433_TX_CFG_IOCTL_NR, char[sizeof(s=
truct pi433_tx_cfg)])<br>+#define PI433_IOC_WR_TX_CFG&#160;&#160; &#160;_IO=
W(PI433_IOC_MAGIC, PI433_TX_CFG_IOCTL_NR, char[sizeof(struct pi433_tx_cfg)]=
)<br>+<br>+#define PI433_IOC_RD_RX_CFG&#160;&#160; &#160;_IOR(PI433_IOC_MAG=
IC, PI433_RX_CFG_IOCTL_NR, char[sizeof(struct pi433_rx_cfg)])<br>+#define P=
I433_IOC_WR_RX_CFG&#160;&#160; &#160;_IOW(PI433_IOC_MAGIC, PI433_RX_CFG_IOC=
TL_NR, char[sizeof(struct pi433_rx_cfg)])<br>+<br>+#endif /* PI433_H */<br>=
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c<br=
>new file mode 100644<br>index 0000000..b6bc45b<br>--- /dev/null<br>+++ b/d=
rivers/staging/pi433/rf69.c<br>@@ -0,0 +1,982 @@<br>+/*<br>+ * abstraction =
of the spi interface of HopeRf rf69 radio module<br>+ *<br>+ * Copyright (C=
) 2016 Wolf-Entwicklungen<br>+ *&#160;&#160; &#160;Marcus Wolf &#60;linux@w=
olf-entwicklungen.de&#62;<br>+ *<br>+ * This program is free software; you =
can redistribute it and/or modify<br>+ * it under the terms of the GNU Gene=
ral Public License as published by<br>+ * the Free Software Foundation; eit=
her version 2 of the License, or<br>+ * (at your option) any later version.=
<br>+ *<br>+ * This program is distributed in the hope that it will be usef=
ul,<br>+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<b=
r>+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&#160; See the<br=
>+ * GNU General Public License for more details.<br>+ */<br>+<br>+/* enabl=
e prosa debug info */<br>+#undef DEBUG<br>+/* enable print of values on reg=
 access */<br>+#undef DEBUG_VALUES<br>+/* enable print of values on fifo ac=
cess */<br>+#undef DEBUG_FIFO_ACCESS<br>+<br>+#include &#60;linux/types.h&#=
62;<br>+#include &#60;linux/spi/spi.h&#62;<br>+<br>+#include &#34;rf69.h&#3=
4;<br>+#include &#34;rf69_registers.h&#34;<br>+<br>+#define F_OSC&#160;&#16=
0; &#160;&#160; 32000000 /* in Hz */<br>+#define FIFO_SIZE 66 &#160;&#160; =
&#160;&#160;&#160; /* in byte */<br>+<br>+/*-------------------------------=
------------------------------------------*/<br>+<br>+#define READ_REG(x)&#=
160;&#160; &#160;rf69_read_reg (spi, x)<br>+#define WRITE_REG(x,y)&#160;&#1=
60; &#160;rf69_write_reg(spi, x, y)<br>+#define INVALID_PARAM \<br>+&#160;&=
#160; &#160;{ \<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-=
&#62;dev, &#34;set: illegal input param&#34;); \<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;return -EINVAL; \<br>+&#160;&#160; &#160;}<br>+<br>+/*-----=
--------------------------------------------------------------------*/<br>+=
<br>+int rf69_set_mode(struct spi_device *spi, enum mode mode)<br>+{<br>+&#=
160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev=
_dbg(&#38;spi-&#62;dev, &#34;set: mode&#34;);<br>+&#160;&#160; &#160;#endif=
<br>+<br>+&#160;&#160; &#160;switch (mode){<br>+&#160;&#160; &#160;case tra=
nsmit:&#160;&#160; &#160;&#160; return WRITE_REG(REG_OPMODE, (READ_REG(REG_=
OPMODE) &#38; ~MASK_OPMODE_MODE) | OPMODE_MODE_TRANSMIT);<br>+&#160;&#160; =
&#160;case receive:&#160;&#160; &#160;&#160; return WRITE_REG(REG_OPMODE, (=
READ_REG(REG_OPMODE) &#38; ~MASK_OPMODE_MODE) | OPMODE_MODE_RECEIVE);<br>+&=
#160;&#160; &#160;case synthesizer: return WRITE_REG(REG_OPMODE, (READ_REG(=
REG_OPMODE) &#38; ~MASK_OPMODE_MODE) | OPMODE_MODE_SYNTHESIZER);<br>+&#160;=
&#160; &#160;case standby:&#160;&#160; &#160;&#160; return WRITE_REG(REG_OP=
MODE, (READ_REG(REG_OPMODE) &#38; ~MASK_OPMODE_MODE) | OPMODE_MODE_STANDBY)=
;<br>+&#160;&#160; &#160;case mode_sleep:&#160; return WRITE_REG(REG_OPMODE=
, (READ_REG(REG_OPMODE) &#38; ~MASK_OPMODE_MODE) | OPMODE_MODE_SLEEP);<br>+=
&#160;&#160; &#160;default:&#160;&#160; &#160;&#160; INVALID_PARAM;<br>+&#1=
60;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;// we are using packet mode, =
so this check is not really needed<br>+&#160;&#160; &#160;// but waiting fo=
r mode ready is necessary when going from sleep because the FIFO may not be=
 immediately available from previous mode<br>+&#160;&#160; &#160;//while (_=
mode =3D=3D RF69_MODE_SLEEP &#38;&#38; (READ_REG(REG_IRQFLAGS1) &#38; RF_IR=
QFLAGS1_MODEREADY) =3D=3D 0x00); // Wait for ModeReady<br>+<br>+}<br>+<br>+=
int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode)<br>+=
{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: data mode&#34;);<br>+&#160;&#160;=
 &#160;#endif<br>+<br>+&#160;&#160; &#160;switch (dataMode) {<br>+&#160;&#1=
60; &#160;case packet:&#160;&#160; &#160;&#160;&#160; &#160;return WRITE_RE=
G(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MASK_DATAMODUL_MODE) | DAT=
AMODUL_MODE_PACKET);<br>+&#160;&#160; &#160;case continuous:&#160;&#160; &#=
160;return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MASK_DA=
TAMODUL_MODE) | DATAMODUL_MODE_CONTINUOUS);<br>+&#160;&#160; &#160;case con=
tinuousNoSync:&#160; return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODU=
L) &#38; ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_CONTINUOUS_NOSYNC);<br>+&#1=
60;&#160; &#160;default:&#160;&#160; &#160;&#160;&#160; &#160;INVALID_PARAM=
;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_modulation(struct sp=
i_device *spi, enum modulation modulation)<br>+{<br>+&#160;&#160; &#160;#if=
def DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;d=
ev, &#34;set: modulation&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#16=
0;&#160; &#160;switch (modulation) {<br>+&#160;&#160; &#160;case OOK:&#160;=
&#160; return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MASK=
_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_OOK);<br>+&#160;&#1=
60; &#160;case FSK:&#160;&#160; return WRITE_REG(REG_DATAMODUL, (READ_REG(R=
EG_DATAMODUL) &#38; ~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION=
_TYPE_FSK);<br>+&#160;&#160; &#160;default:&#160;&#160;&#160; INVALID_PARAM=
;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+enum modulation rf69_get_modulati=
on(struct spi_device *spi)<br>+{<br>+&#160;&#160; &#160;u8 currentValue;&#1=
60;&#160; &#160;<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;get: mode&#34;);<b=
r>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;currentValue =3D R=
EAD_REG(REG_DATAMODUL);<br>+<br>+&#160;&#160; &#160;switch (currentValue &#=
38; MASK_DATAMODUL_MODULATION_TYPE &#62;&#62; 3)&#160; // TODO improvement:=
 change 3 to define<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;case DA=
TAMODUL_MODULATION_TYPE_OOK: return OOK;<br>+&#160;&#160; &#160;case DATAMO=
DUL_MODULATION_TYPE_FSK: return FSK;<br>+&#160;&#160; &#160;default:&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160; return=
 undefined;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_modulation=
_shaping(struct spi_device *spi, enum modShaping modShaping)<br>+{<br>+&#16=
0;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_d=
bg(&#38;spi-&#62;dev, &#34;set: mod shaping&#34;);<br>+&#160;&#160; &#160;#=
endif<br>+<br>+&#160;&#160; &#160;if (rf69_get_modulation(spi) =3D=3D FSK)<=
br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;switch (=
modShaping) {<br>+&#160;&#160; &#160;&#160;&#160; &#160;case shapingOff: re=
turn WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MASK_DATAMODU=
L_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_NONE);<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;case shaping1_0: return WRITE_REG(REG_DATAMODUL, (RE=
AD_REG(REG_DATAMODUL) &#38; ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_M=
ODULATION_SHAPE_1_0);<br>+&#160;&#160; &#160;&#160;&#160; &#160;case shapin=
g0_5: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MASK_=
DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_0_3);<br>+&#160;&#=
160; &#160;&#160;&#160; &#160;case shaping0_3: return WRITE_REG(REG_DATAMOD=
UL, (READ_REG(REG_DATAMODUL) &#38; ~MASK_DATAMODUL_MODULATION_SHAPE) | DATA=
MODUL_MODULATION_SHAPE_0_5);<br>+&#160;&#160; &#160;&#160;&#160; &#160;defa=
ult:&#160;&#160; &#160; INVALID_PARAM;<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;}<br>+&#160;&#160; &#160;}<br>+&#160;&#160; &#160;else<br>+&#160;&#16=
0; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;switch (modShaping) {<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;case shapingOff: return WRITE_REG=
(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MASK_DATAMODUL_MODULATION_S=
HAPE) | DATAMODUL_MODULATION_SHAPE_NONE);<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;case shapingBR:&#160;&#160; &#160; return WRITE_REG(REG_DATAMODUL,=
 (READ_REG(REG_DATAMODUL) &#38; ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMOD=
UL_MODULATION_SHAPE_BR);<br>+&#160;&#160; &#160;&#160;&#160; &#160;case sha=
ping2BR: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) &#38; ~MA=
SK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_2BR);<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;default:&#160;&#160; &#160; INVALID_PARAM;=
<br>+&#160;&#160; &#160;&#160;&#160; &#160;}<br>+&#160;&#160; &#160;}<br>+}=
<br>+<br>+int rf69_set_bit_rate(struct spi_device *spi, u16 bitRate)<br>+{<=
br>+&#160;&#160; &#160;int retval;<br>+&#160;&#160; &#160;u32 bitRate_min;<=
br>+&#160;&#160; &#160;u32 bitRate_reg;<br>+&#160;&#160; &#160;u8 msb;<br>+=
&#160;&#160; &#160;u8 lsb;<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: bit=
 rate&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;// c=
heck input value<br>+&#160;&#160; &#160;bitRate_min =3D F_OSC / 8388608; //=
 8388608 =3D 2^23;<br>+&#160;&#160; &#160;if (bitRate &#60; bitRate_min)<br=
>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#=
38;spi-&#62;dev, &#34;setBitRate: illegal input param&#34;);<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+<br=
>+&#160;&#160; &#160;// calculate reg settings<br>+&#160;&#160; &#160;bitRa=
te_reg =3D (F_OSC / bitRate);<br>+<br>+&#160;&#160; &#160;msb =3D (bitRate_=
reg&#38;0xff00)&#160;&#160; &#62;&#62;&#160; 8;<br>+&#160;&#160; &#160;lsb =
=3D (bitRate_reg&#38;0xff);<br>+<br>+&#160;&#160; &#160;// transmit to RF 6=
9<br>+&#160;&#160; &#160;retval =3D WRITE_REG(REG_BITRATE_MSB, msb); <br>+&=
#160;&#160; &#160;if (retval)&#160; return retval;<br>+&#160;&#160; &#160;r=
etval =3D WRITE_REG(REG_BITRATE_LSB, lsb);<br>+&#160;&#160; &#160;if (retva=
l)&#160; return retval;<br>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<br=
>+int rf69_set_deviation(struct spi_device *spi, u32 deviation)<br>+{<br>+&=
#160;&#160; &#160;int retval;<br>+//&#160;&#160; &#160;u32 f_max; TODO: Abh=
&#228;ngigkeit von Bitrate beachten!!<br>+&#160;&#160; &#160;u64 f_reg;<br>=
+&#160;&#160; &#160;u64 f_step;<br>+&#160;&#160; &#160;u8 msb;<br>+&#160;&#=
160; &#160;u8 lsb;<br>+&#160;&#160; &#160;u64 factor =3D 1000000; // to imp=
rove precision of calculation<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+=
&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: =
deviation&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;=
if (deviation &#60; 600 || deviation &#62; 500000) //TODO: Abh&#228;ngigkei=
t von Bitrate beachten!!<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#=
160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set_deviation: illegal inp=
ut param&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;INVALID_PARAM;<br=
>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160;// calculat f step<br>+&=
#160;&#160; &#160;f_step =3D F_OSC * factor;<br>+&#160;&#160; &#160;do_div(=
f_step, 524288); //&#160; 524288 =3D 2^19<br>+<br>+&#160;&#160; &#160;// ca=
lculate register settings<br>+&#160;&#160; &#160;f_reg =3D deviation * fact=
or;<br>+&#160;&#160; &#160;do_div(f_reg&#160; , f_step);<br>+<br>+&#160;&#1=
60; &#160;msb =3D (f_reg&#38;0xff00)&#160;&#160; &#62;&#62;&#160; 8;<br>+&#=
160;&#160; &#160;lsb =3D (f_reg&#38;0xff);<br>+<br>+&#160;&#160; &#160;// c=
heck msb<br>+&#160;&#160; &#160;if (msb &#38; !FDEVMASB_MASK)<br>+&#160;&#1=
60; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62=
;dev, &#34;set_deviation: err in calc of msb&#34;);<br>+&#160;&#160; &#160;=
&#160;&#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&=
#160; &#160;// write to chip<br>+&#160;&#160; &#160;retval =3D WRITE_REG(RE=
G_FDEV_MSB, msb);<br>+&#160;&#160; &#160;if (retval)&#160; return retval;<b=
r>+&#160;&#160; &#160;retval =3D WRITE_REG(REG_FDEV_LSB, lsb);<br>+&#160;&#=
160; &#160;if (retval)&#160; return retval;<br>+<br>+&#160;&#160; &#160;ret=
urn 0;<br>+}<br>+<br>+int rf69_set_frequency(struct spi_device *spi, u32 fr=
equency)<br>+{<br>+&#160;&#160; &#160;int retval;<br>+&#160;&#160; &#160;u3=
2 f_max;<br>+&#160;&#160; &#160;u64 f_reg;<br>+&#160;&#160; &#160;u64 f_ste=
p;<br>+&#160;&#160; &#160;u8 msb;<br>+&#160;&#160; &#160;u8 mid;<br>+&#160;=
&#160; &#160;u8 lsb;<br>+&#160;&#160; &#160;u64 factor =3D 1000000; // to i=
mprove precision of calculation<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG<br=
>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set=
: frequency&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#16=
0;// calculat f step<br>+&#160;&#160; &#160;f_step =3D F_OSC * factor;<br>+=
&#160;&#160; &#160;do_div(f_step, 524288); //&#160; 524288 =3D 2^19<br>+<br=
>+&#160;&#160; &#160;// check input value<br>+&#160;&#160; &#160;f_max =3D =
f_step * 8388608 / factor;<br>+&#160;&#160; &#160;if (frequency &#62; f_max=
)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_db=
g(&#38;spi-&#62;dev, &#34;setFrequency: illegal input param&#34;);<br>+&#16=
0;&#160; &#160;&#160;&#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<b=
r>+<br>+&#160;&#160; &#160;// calculate reg settings<br>+&#160;&#160; &#160=
;f_reg =3D frequency * factor;<br>+&#160;&#160; &#160;do_div(f_reg&#160; , =
f_step);<br>+<br>+&#160;&#160; &#160;msb =3D (f_reg&#38;0xff0000) &#62;&#62=
; 16;<br>+&#160;&#160; &#160;mid =3D (f_reg&#38;0xff00)&#160;&#160; &#62;&#=
62;&#160; 8;<br>+&#160;&#160; &#160;lsb =3D (f_reg&#38;0xff);<br>+<br>+&#16=
0;&#160; &#160;// write to chip<br>+&#160;&#160; &#160;retval =3D WRITE_REG=
(REG_FRF_MSB, msb);<br>+&#160;&#160; &#160;if (retval)&#160; return retval;=
<br>+&#160;&#160; &#160;retval =3D WRITE_REG(REG_FRF_MID, mid);<br>+&#160;&=
#160; &#160;if (retval)&#160; return retval;<br>+&#160;&#160; &#160;retval =
=3D WRITE_REG(REG_FRF_LSB, lsb);<br>+&#160;&#160; &#160;if (retval)&#160; r=
eturn retval;<br>+<br>+&#160;&#160; &#160;return 0;<br>+}<br>+<br>+int rf69=
_set_amplifier_0(struct spi_device *spi, enum optionOnOff optionOnOff)<br>+=
{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &=
#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: amp #0&#34;);<br>+&#160;&#160; &#=
160;#endif<br>+<br>+&#160;&#160; &#160;switch(optionOnOff) {<br>+&#160;&#16=
0; &#160;case optionOn:&#160;&#160; &#160;return WRITE_REG(REG_PALEVEL, (RE=
AD_REG(REG_PALEVEL) |&#160; MASK_PALEVEL_PA0) );<br>+&#160;&#160; &#160;cas=
e optionOff:&#160;&#160; &#160;return WRITE_REG(REG_PALEVEL, (READ_REG(REG_=
PALEVEL) &#38; ~MASK_PALEVEL_PA0) );<br>+&#160;&#160; &#160;default:&#160;&=
#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}&#160;&#160; &#160=
;<br>+<br>+int rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOf=
f optionOnOff)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &=
#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: amp #1&#34;);<=
br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch(optionOnOf=
f) {<br>+&#160;&#160; &#160;case optionOn:&#160;&#160; &#160;return WRITE_R=
EG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |&#160; MASK_PALEVEL_PA1) );<br>+&#1=
60;&#160; &#160;case optionOff: return WRITE_REG(REG_PALEVEL, (READ_REG(REG=
_PALEVEL) &#38; ~MASK_PALEVEL_PA1) );<br>+&#160;&#160; &#160;default:&#160;=
&#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf6=
9_set_amplifier_2(struct spi_device *spi, enum optionOnOff optionOnOff)<br>=
+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: amp #2&#34;);<br>+&#160;&#160; &=
#160;#endif<br>+<br>+&#160;&#160; &#160;switch(optionOnOff) {<br>+&#160;&#1=
60; &#160;case optionOn:&#160;&#160; &#160;return WRITE_REG(REG_PALEVEL, (R=
EAD_REG(REG_PALEVEL) |&#160; MASK_PALEVEL_PA2) );<br>+&#160;&#160; &#160;ca=
se optionOff:&#160;&#160; &#160;return WRITE_REG(REG_PALEVEL, (READ_REG(REG=
_PALEVEL) &#38; ~MASK_PALEVEL_PA2) );<br>+&#160;&#160; &#160;default:&#160;=
&#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf6=
9_set_output_power_level(struct spi_device *spi, u8 powerLevel)<br>+{<br>+&=
#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;de=
v_dbg(&#38;spi-&#62;dev, &#34;set: power level&#34;);<br>+&#160;&#160; &#16=
0;#endif<br>+<br>+&#160;&#160; &#160;powerLevel +=3D18; // TODO Abh&#228;ng=
igkeit von PA0,1,2 setting<br>+<br>+&#160;&#160; &#160;// check input value=
<br>+&#160;&#160; &#160;if (powerLevel &#62; 0x1f)<br>+&#160;&#160; &#160;&=
#160;&#160; &#160;INVALID_PARAM;<br>+<br>+&#160;&#160; &#160;// write value=
<br>+&#160;&#160; &#160;return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL=
) &#38; ~MASK_PALEVEL_OUTPUT_POWER) | powerLevel);<br>+}<br>+<br>+int rf69_=
set_pa_ramp(struct spi_device *spi, enum paRamp paRamp)<br>+{<br>+&#160;&#1=
60; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#=
38;spi-&#62;dev, &#34;set: pa ramp&#34;);<br>+&#160;&#160; &#160;#endif<br>=
+<br>+&#160;&#160; &#160;switch(paRamp) {<br>+&#160;&#160; &#160;case ramp3=
400:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAMP_3400);<br>+&#160=
;&#160; &#160;case ramp2000:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP,=
 PARAMP_2000);<br>+&#160;&#160; &#160;case ramp1000:&#160;&#160; &#160;retu=
rn WRITE_REG(REG_PARAMP, PARAMP_1000);<br>+&#160;&#160; &#160;case ramp500:=
&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAMP_500);<br>+&#160;&#16=
0; &#160;case ramp250:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAM=
P_250);<br>+&#160;&#160; &#160;case ramp125:&#160;&#160; &#160;return WRITE=
_REG(REG_PARAMP, PARAMP_125);<br>+&#160;&#160; &#160;case ramp100:&#160;&#1=
60; &#160;return WRITE_REG(REG_PARAMP, PARAMP_100);<br>+&#160;&#160; &#160;=
case ramp62:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAMP_62);<br>=
+&#160;&#160; &#160;case ramp50:&#160;&#160; &#160;return WRITE_REG(REG_PAR=
AMP, PARAMP_50);<br>+&#160;&#160; &#160;case ramp40:&#160;&#160; &#160;retu=
rn WRITE_REG(REG_PARAMP, PARAMP_40);<br>+&#160;&#160; &#160;case ramp31:&#1=
60;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAMP_31);<br>+&#160;&#160; &=
#160;case ramp25:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAMP_25)=
;<br>+&#160;&#160; &#160;case ramp20:&#160;&#160; &#160;return WRITE_REG(RE=
G_PARAMP, PARAMP_20);<br>+&#160;&#160; &#160;case ramp15:&#160;&#160; &#160=
;return WRITE_REG(REG_PARAMP, PARAMP_15);<br>+&#160;&#160; &#160;case ramp1=
2:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAMP_12);<br>+&#160;&#1=
60; &#160;case ramp10:&#160;&#160; &#160;return WRITE_REG(REG_PARAMP, PARAM=
P_10);<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;INVALID_PARAM;<br>=
+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_antenna_impedance(struct =
spi_device *spi, enum antennaImpedance antennaImpedance)<br>+{<br>+&#160;&#=
160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&=
#38;spi-&#62;dev, &#34;set: antenna impedance&#34;);<br>+&#160;&#160; &#160=
;#endif<br>+<br>+&#160;&#160; &#160;switch(antennaImpedance) {<br>+&#160;&#=
160; &#160;case fiftyOhm:&#160;&#160; &#160;&#160;&#160;&#160; return WRITE=
_REG(REG_LNA, (READ_REG(REG_LNA) &#38; ~MASK_LNA_ZIN) );<br>+&#160;&#160; &=
#160;case twohundretOhm: return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) |&#16=
0; MASK_LNA_ZIN) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;&#160=
;&#160;&#160; INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf=
69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain)<br>+{<br>+&#1=
60;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_=
dbg(&#38;spi-&#62;dev, &#34;set: lna gain&#34;);<br>+&#160;&#160; &#160;#en=
dif<br>+<br>+&#160;&#160; &#160;switch(lnaGain) {<br>+&#160;&#160; &#160;ca=
se automatic:&#160;&#160; &#160; return WRITE_REG(REG_LNA, ( (READ_REG(REG_=
LNA) &#38; ~MASK_LNA_GAIN) &#38; LNA_GAIN_AUTO) );<br>+&#160;&#160; &#160;c=
ase max:&#160;&#160; &#160; return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) =
&#38; ~MASK_LNA_GAIN) &#38; LNA_GAIN_MAX) );<br>+&#160;&#160; &#160;case ma=
xMinus6:&#160; return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &#38; ~MASK_L=
NA_GAIN) &#38; LNA_GAIN_MAX_MINUS_6) );<br>+&#160;&#160; &#160;case maxMinu=
s12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &#38; ~MASK_LNA_GAIN) &=
#38; LNA_GAIN_MAX_MINUS_12) );<br>+&#160;&#160; &#160;case maxMinus24: retu=
rn WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &#38; ~MASK_LNA_GAIN) &#38; LNA_=
GAIN_MAX_MINUS_24) );<br>+&#160;&#160; &#160;case maxMinus36: return WRITE_=
REG(REG_LNA, ( (READ_REG(REG_LNA) &#38; ~MASK_LNA_GAIN) &#38; LNA_GAIN_MAX_=
MINUS_36) );<br>+&#160;&#160; &#160;case maxMinus48: return WRITE_REG(REG_L=
NA, ( (READ_REG(REG_LNA) &#38; ~MASK_LNA_GAIN) &#38; LNA_GAIN_MAX_MINUS_48)=
 );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160; INVALID_PARAM;<br>+&=
#160;&#160; &#160;}<br>+}<br>+<br>+enum lnaGain rf69_get_lna_gain(struct sp=
i_device *spi)<br>+{<br>+&#160;&#160; &#160;u8 currentValue;&#160;&#160; &#=
160;<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;=
&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;get: lna gain&#34;);<br>+&#160=
;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;currentValue =3D READ_REG(=
REG_LNA);<br>+<br>+&#160;&#160; &#160;switch (currentValue &#38; MASK_LNA_C=
URRENT_GAIN &#62;&#62; 3)&#160; // improvement: change 3 to define<br>+&#16=
0;&#160; &#160;{<br>+&#160;&#160; &#160;case LNA_GAIN_AUTO:&#160;&#160; &#1=
60;&#160;&#160;&#160; return automatic;<br>+&#160;&#160; &#160;case LNA_GAI=
N_MAX:&#160;&#160; &#160;&#160;&#160;&#160; return max;<br>+&#160;&#160; &#=
160;case LNA_GAIN_MAX_MINUS_6:&#160; return maxMinus6;<br>+&#160;&#160; &#1=
60;case LNA_GAIN_MAX_MINUS_12: return maxMinus12;<br>+&#160;&#160; &#160;ca=
se LNA_GAIN_MAX_MINUS_24: return maxMinus24;<br>+&#160;&#160; &#160;case LN=
A_GAIN_MAX_MINUS_36: return maxMinus36;<br>+&#160;&#160; &#160;case LNA_GAI=
N_MAX_MINUS_48: return maxMinus48;<br>+&#160;&#160; &#160;default:&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160;&#160; return undefined;<br>+&#160=
;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_dc_cut_off_frequency_intern(str=
uct spi_device *spi ,u8 reg, enum dccPercent dccPercent)<br>+{<br>+&#160;&#=
160; &#160;switch (dccPercent) {<br>+&#160;&#160; &#160;case dcc16Percent:&=
#160;&#160; &#160;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC=
_FREQ) | BW_DCC_16_PERCENT) );<br>+&#160;&#160; &#160;case dcc8Percent:&#16=
0;&#160; &#160;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FR=
EQ) | BW_DCC_8_PERCENT) );<br>+&#160;&#160; &#160;case dcc4Percent:&#160;&#=
160; &#160;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FREQ) =
| BW_DCC_4_PERCENT) );<br>+&#160;&#160; &#160;case dcc2Percent:&#160;&#160;=
 &#160;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FREQ) | BW=
_DCC_2_PERCENT) );<br>+&#160;&#160; &#160;case dcc1Percent:&#160;&#160; &#1=
60;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FREQ) | BW_DCC=
_1_PERCENT) );<br>+&#160;&#160; &#160;case dcc0_5Percent:&#160;&#160; &#160=
;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FREQ) | BW_DCC_0=
_5_PERCENT) );<br>+&#160;&#160; &#160;case dcc0_25Percent:&#160;&#160; &#16=
0;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FREQ) | BW_DCC_=
0_25_PERCENT) );<br>+&#160;&#160; &#160;case dcc0_125Percent:&#160;&#160; &=
#160;return WRITE_REG(reg, ( (READ_REG(reg) &#38; ~MASK_BW_DCC_FREQ) | BW_D=
CC_0_125_PERCENT) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;&#16=
0;&#160; &#160;INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int r=
f69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent dccPer=
cent)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#16=
0;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: cut off freq&#34;);<br>=
+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;return rf69_set_dc_c=
ut_off_frequency_intern(spi, REG_RXBW, dccPercent);<br>+}<br>+<br>+int rf69=
_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercen=
t dccPercent)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#=
160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: cut off freq du=
ring afc&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;r=
eturn rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);<br>=
+}<br>+<br>+int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, e=
num mantisse mantisse, u8 exponent)<br>+{<br>+&#160;&#160; &#160;u8 newValu=
e;<br>+ <br>+&#160;&#160; &#160;// check value for mantisse and exponent<br=
>+&#160;&#160; &#160;if (exponent &#62; 7)&#160;&#160; INVALID_PARAM;<br>+&=
#160;&#160; &#160;if ( (mantisse!=3Dmantisse16) &#38;&#38; <br>+&#160;&#160=
; &#160;&#160;&#160;&#160;&#160; (mantisse!=3Dmantisse20) &#38;&#38; <br>+&=
#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; (ma=
ntisse!=3Dmantisse24) ) INVALID_PARAM;<br>+<br>+&#160;&#160; &#160;// read =
old value<br>+&#160;&#160; &#160;newValue =3D READ_REG(reg);<br>+<br>+&#160=
;&#160; &#160;// &#34;delete&#34; mantisse and exponent =3D just keep the D=
CC setting<br>+&#160;&#160; &#160;newValue =3D newValue &#38; MASK_BW_DCC_F=
REQ;<br>+<br>+&#160;&#160; &#160;// add new mantisse<br>+&#160;&#160; &#160=
;switch(mantisse) {<br>+&#160;&#160; &#160;case mantisse16: newValue =3D ne=
wValue | BW_MANT_16;&#160;&#160; &#160;break;<br>+&#160;&#160; &#160;case m=
antisse20: newValue =3D newValue | BW_MANT_20;&#160;&#160; &#160;break;<br>=
+&#160;&#160; &#160;case mantisse24: newValue =3D newValue | BW_MANT_24;&#1=
60;&#160; &#160;break;<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160; &#160=
;// add new exponent<br>+&#160;&#160; &#160;newValue =3D newValue | exponen=
t;<br>+<br>+&#160;&#160; &#160;// write back<br>+&#160;&#160; &#160;return =
WRITE_REG(reg, newValue);<br>+}<br>+<br>+int rf69_set_bandwidth(struct spi_=
device *spi, enum mantisse mantisse, u8 exponent)<br>+{<br>+&#160;&#160; &#=
160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi=
-&#62;dev, &#34;set: band width&#34;);<br>+&#160;&#160; &#160;#endif<br>+<b=
r>+&#160;&#160; &#160;return rf69_set_bandwidth_intern(spi, REG_RXBW, manti=
sse, exponent);<br>+}<br>+<br>+int rf69_set_bandwidth_during_afc(struct spi=
_device *spi, enum mantisse mantisse, u8 exponent)<br>+{<br>+&#160;&#160; &=
#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;sp=
i-&#62;dev, &#34;set: band width during afc&#34;);<br>+&#160;&#160; &#160;#=
endif<br>+<br>+&#160;&#160; &#160;return rf69_set_bandwidth_intern(spi, REG=
_AFCBW, mantisse, exponent);<br>+}<br>+<br>+int rf69_set_ook_threshold_type=
(struct spi_device *spi, enum thresholdType thresholdType)<br>+{<br>+&#160;=
&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg=
(&#38;spi-&#62;dev, &#34;set: threshold type&#34;);<br>+&#160;&#160; &#160;=
#endif<br>+<br>+&#160;&#160; &#160;switch (thresholdType)<br>+&#160;&#160; =
&#160;{<br>+&#160;&#160; &#160;case fixed:&#160;&#160; &#160;return WRITE_R=
EG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESTYPE) | O=
OKPEAK_THRESHTYPE_FIXED) );<br>+&#160;&#160; &#160;case peak:&#160;&#160; &=
#160;return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOK=
PEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_PEAK) );<br>+&#160;&#160; &#160;case a=
verage:&#160;&#160; &#160;return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOK=
PEAK) &#38; ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_AVERAGE) );<br>+&=
#160;&#160; &#160;default:&#160;&#160; &#160;INVALID_PARAM;<br>+&#160;&#160=
; &#160;}<br>+}<br>+<br>+int rf69_set_ook_threshold_step(struct spi_device =
*spi, enum thresholdStep thresholdStep)<br>+{<br>+&#160;&#160; &#160;#ifdef=
 DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev,=
 &#34;set: threshold step&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#1=
60;&#160; &#160;switch (thresholdStep) {<br>+&#160;&#160; &#160;case step_0=
_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OO=
KPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_0_5_DB) );<br>+&#160;&#160; &#160;cas=
e step_1_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; =
~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_0_DB) );<br>+&#160;&#160; &=
#160;case step_1_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK=
) &#38; ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_5_DB) );<br>+&#160;=
&#160; &#160;case step_2_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG=
_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_2_0_DB) );<br=
>+&#160;&#160; &#160;case step_3_0db: return WRITE_REG(REG_OOKPEAK, ( (READ=
_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_3_0_D=
B) );<br>+&#160;&#160; &#160;case step_4_0db: return WRITE_REG(REG_OOKPEAK,=
 ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHST=
EP_4_0_DB) );<br>+&#160;&#160; &#160;case step_5_0db: return WRITE_REG(REG_=
OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_=
THRESHSTEP_5_0_DB) );<br>+&#160;&#160; &#160;case step_6_0db: return WRITE_=
REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESSTEP) | =
OOKPEAK_THRESHSTEP_6_0_DB) );<br>+&#160;&#160; &#160;default:&#160;&#160; &=
#160; INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_o=
ok_threshold_dec(struct spi_device *spi, enum thresholdDecrement thresholdD=
ecrement)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;=
&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: threshold decrement=
&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch (t=
hresholdDecrement) {<br>+&#160;&#160; &#160;case dec_every8th: return WRITE=
_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESDEC) | =
OOKPEAK_THRESHDEC_EVERY_8TH) );<br>+&#160;&#160; &#160;case dec_every4th: r=
eturn WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_T=
HRESDEC) | OOKPEAK_THRESHDEC_EVERY_4TH) );<br>+&#160;&#160; &#160;case dec_=
every2nd: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MAS=
K_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_2ND) );<br>+&#160;&#160; &#16=
0;case dec_once:&#160;&#160; &#160;&#160;&#160; return WRITE_REG(REG_OOKPEA=
K, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHD=
EC_ONCE) );<br>+&#160;&#160; &#160;case dec_twice:&#160;&#160; &#160;&#160;=
&#160; return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_O=
OKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_TWICE) );<br>+&#160;&#160; &#160;case =
dec_4times:&#160;&#160; return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPE=
AK) &#38; ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_4_TIMES) );<br>+&#160=
;&#160; &#160;case dec_8times:&#160;&#160; return WRITE_REG(REG_OOKPEAK, ( =
(READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_8_=
TIMES) );<br>+&#160;&#160; &#160;case dec_16times:&#160; return WRITE_REG(R=
EG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) &#38; ~MASK_OOKPEAK_THRESDEC) | OOKPEA=
K_THRESHDEC_16_TIMES) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;=
&#160;&#160; INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf6=
9_set_dio_mapping(struct spi_device *spi, u8 DIONumber, u8 value)<br>+{<br>=
+&#160;&#160; &#160;u8 mask;<br>+&#160;&#160; &#160;u8 shift;<br>+&#160;&#1=
60; &#160;u8 regaddr;<br>+&#160;&#160; &#160;u8 regValue;<br>+<br>+&#160;&#=
160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&=
#38;spi-&#62;dev, &#34;set: DIO mapping&#34;);<br>+&#160;&#160; &#160;#endi=
f<br>+<br>+&#160;&#160; &#160;// check DIO number<br>+&#160;&#160; &#160;if=
 (DIONumber &#62; 5) INVALID_PARAM;<br>+<br>+&#160;&#160; &#160;switch (DIO=
Number) {<br>+&#160;&#160; &#160;case 0: mask=3DMASK_DIO0; shift=3DSHIFT_DI=
O0; regaddr=3DREG_DIOMAPPING1; break;<br>+&#160;&#160; &#160;case 1: mask=
=3DMASK_DIO1; shift=3DSHIFT_DIO1; regaddr=3DREG_DIOMAPPING1; break;<br>+&#1=
60;&#160; &#160;case 2: mask=3DMASK_DIO2; shift=3DSHIFT_DIO2; regaddr=3DREG=
_DIOMAPPING1; break;<br>+&#160;&#160; &#160;case 3: mask=3DMASK_DIO3; shift=
=3DSHIFT_DIO3; regaddr=3DREG_DIOMAPPING1; break;<br>+&#160;&#160; &#160;cas=
e 4: mask=3DMASK_DIO4; shift=3DSHIFT_DIO4; regaddr=3DREG_DIOMAPPING2; break=
;<br>+&#160;&#160; &#160;case 5: mask=3DMASK_DIO5; shift=3DSHIFT_DIO5; rega=
ddr=3DREG_DIOMAPPING2; break;<br>+&#160;&#160; &#160;}<br>+<br>+&#160;&#160=
; &#160;// read reg<br>+&#160;&#160; &#160;regValue=3DREAD_REG(regaddr);<br=
>+&#160;&#160; &#160;// delete old value<br>+&#160;&#160; &#160;regValue =
=3D regValue &#38; ~mask;<br>+&#160;&#160; &#160;// add new value<br>+&#160=
;&#160; &#160;regValue =3D regValue | value &#60;&#60; shift;<br>+&#160;&#1=
60; &#160;// write back<br>+&#160;&#160; &#160;return WRITE_REG(regaddr,reg=
Value);<br>+}<br>+<br>+bool rf69_get_flag(struct spi_device *spi, enum flag=
 flag)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#1=
60;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;get: flag&#34;);<br>+&#160;=
&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch(flag) {<br>+&#160;&#=
160; &#160;case modeSwitchCompleted:&#160;&#160;&#160;&#160; return (READ_R=
EG(REG_IRQFLAGS1) &#38; MASK_IRQFLAGS1_MODE_READY);<br>+&#160;&#160; &#160;=
case readyToReceive:&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; retur=
n (READ_REG(REG_IRQFLAGS1) &#38; MASK_IRQFLAGS1_RX_READY);<br>+&#160;&#160;=
 &#160;case readyToSend:&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; r=
eturn (READ_REG(REG_IRQFLAGS1) &#38; MASK_IRQFLAGS1_TX_READY);<br>+&#160;&#=
160; &#160;case pllLocked:&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
;&#160;&#160;&#160; return (READ_REG(REG_IRQFLAGS1) &#38; MASK_IRQFLAGS1_PL=
L_LOCK);<br>+&#160;&#160; &#160;case rssiExceededThreshold:&#160;&#160; ret=
urn (READ_REG(REG_IRQFLAGS1) &#38; MASK_IRQFLAGS1_RSSI);<br>+&#160;&#160; &=
#160;case timeout:&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&=
#160;&#160; return (READ_REG(REG_IRQFLAGS1) &#38; MASK_IRQFLAGS1_TIMEOUT);<=
br>+&#160;&#160; &#160;case automode:&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160;&#160;&#160;&#160; return (READ_REG(REG_IRQFLAGS1) &#38; MASK_I=
RQFLAGS1_AUTOMODE);<br>+&#160;&#160; &#160;case syncAddressMatch:&#160;&#16=
0; &#160;&#160;&#160;&#160;&#160;&#160; return (READ_REG(REG_IRQFLAGS1) &#3=
8; MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);<br>+&#160;&#160; &#160;case fifoFull=
:&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; retur=
n (READ_REG(REG_IRQFLAGS2) &#38; MASK_IRQFLAGS2_FIFO_FULL);<br>+/*&#160;&#1=
60; &#160;case fifoNotEmpty:&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#16=
0; return (READ_REG(REG_IRQFLAGS2) &#38; MASK_IRQFLAGS2_FIFO_NOT_EMPTY); */=
<br>+&#160;&#160; &#160;case fifoEmpty:&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160;&#160;&#160;&#160; return !(READ_REG(REG_IRQFLAGS2) &#38; MAS=
K_IRQFLAGS2_FIFO_NOT_EMPTY);<br>+&#160;&#160; &#160;case fifoLevelBelowThre=
shold: return (READ_REG(REG_IRQFLAGS2) &#38; MASK_IRQFLAGS2_FIFO_LEVEL);<br=
>+&#160;&#160; &#160;case fifoOverrun:&#160;&#160; &#160;&#160;&#160;&#160;=
&#160;&#160; return (READ_REG(REG_IRQFLAGS2) &#38; MASK_IRQFLAGS2_FIFO_OVER=
RUN);<br>+&#160;&#160; &#160;case packetSent:&#160;&#160; &#160;&#160;&#160=
;&#160;&#160;&#160; return (READ_REG(REG_IRQFLAGS2) &#38; MASK_IRQFLAGS2_PA=
CKET_SENT);<br>+&#160;&#160; &#160;case payloadReady:&#160;&#160; &#160;&#1=
60;&#160;&#160;&#160;&#160; return (READ_REG(REG_IRQFLAGS2) &#38; MASK_IRQF=
LAGS2_PAYLOAD_READY);<br>+&#160;&#160; &#160;case crcOk:&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; return (READ_REG(REG_IRQF=
LAGS2) &#38; MASK_IRQFLAGS2_CRC_OK);<br>+&#160;&#160; &#160;case batteryLow=
:&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; return (READ_REG(REG_IRQ=
FLAGS2) &#38; MASK_IRQFLAGS2_LOW_BAT);<br>+&#160;&#160; &#160;default:&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160; return fals=
e;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_reset_flag(struct spi_d=
evice *spi, enum flag flag)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&=
#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;reset:=
 flag&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;swit=
ch(flag) {<br>+&#160;&#160; &#160;case rssiExceededThreshold: return WRITE_=
REG(REG_IRQFLAGS1, MASK_IRQFLAGS1_RSSI);<br>+&#160;&#160; &#160;case syncAd=
dressMatch:&#160;&#160; &#160;&#160;&#160;&#160; return WRITE_REG(REG_IRQFL=
AGS1, MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);<br>+&#160;&#160; &#160;case fifoO=
verrun:&#160;&#160; &#160;&#160;&#160;&#160; return WRITE_REG(REG_IRQFLAGS2=
, MASK_IRQFLAGS2_FIFO_OVERRUN);<br>+&#160;&#160; &#160;default:&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160;&#160; INVALID_PARAM;<br>+&#160;&#160=
; &#160;}<br>+}<br>+<br>+int rf69_set_rssi_threshold(struct spi_device *spi=
, u8 threshold)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; =
&#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: rssi threshol=
d&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;/* no va=
lue check needed - u8 exactly matches register size */<br>+<br>+&#160;&#160=
; &#160;return WRITE_REG(REG_RSSITHRESH, threshold);<br>+}<br>+<br>+int rf6=
9_set_rx_start_timeout(struct spi_device *spi, u8 timeout)<br>+{<br>+&#160;=
&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg=
(&#38;spi-&#62;dev, &#34;set: start timeout&#34;);<br>+&#160;&#160; &#160;#=
endif<br>+<br>+&#160;&#160; &#160;/* no value check needed - u8 exactly mat=
ches register size */<br>+<br>+&#160;&#160; &#160;return WRITE_REG(REG_RXTI=
MEOUT1, timeout);<br>+}<br>+<br>+int rf69_set_rssi_timeout(struct spi_devic=
e *spi, u8 timeout)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#1=
60; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: rssi time=
out&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;/* no =
value check needed - u8 exactly matches register size */<br>+<br>+&#160;&#1=
60; &#160;return WRITE_REG(REG_RXTIMEOUT2, timeout);<br>+}<br>+<br>+int rf6=
9_set_preamble_length(struct spi_device *spi, u16 preambleLength)<br>+{<br>=
+&#160;&#160; &#160;int retval;<br>+&#160;&#160; &#160;u8 msb, lsb;<br>+<br=
>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160=
;dev_dbg(&#38;spi-&#62;dev, &#34;set: preample length&#34;);<br>+&#160;&#16=
0; &#160;#endif<br>+<br>+&#160;&#160; &#160;/* no value check needed - u16 =
exactly matches register size */<br>+<br>+&#160;&#160; &#160;/* calculate r=
eg settings */<br>+&#160;&#160; &#160;msb =3D (preambleLength&#38;0xff00)&#=
160;&#160; &#62;&#62;&#160; 8;<br>+&#160;&#160; &#160;lsb =3D (preambleLeng=
th&#38;0xff);<br>+<br>+&#160;&#160; &#160;/* transmit to chip */<br>+&#160;=
&#160; &#160;retval =3D WRITE_REG(REG_PREAMBLE_MSB, msb);<br>+&#160;&#160; =
&#160;if (retval) return retval;<br>+&#160;&#160; &#160;retval =3D WRITE_RE=
G(REG_PREAMBLE_LSB, lsb);<br>+<br>+&#160;&#160; &#160;return retval;<br>+}<=
br>+<br>+int rf69_set_sync_enable(struct spi_device *spi, enum optionOnOff =
optionOnOff)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: sync enable&#34;=
);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch(optionO=
nOff) {<br>+&#160;&#160; &#160;case optionOn:&#160;&#160; &#160;return WRIT=
E_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) |&#160; MASK_SYNC_CONFIG_=
SYNC_ON) );<br>+&#160;&#160; &#160;case optionOff:&#160;&#160; &#160;return=
 WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) &#38; ~MASK_SYNC_CON=
FIG_SYNC_ON) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;INVALID_P=
ARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_fifo_fill_condit=
ion(struct spi_device *spi, enum fifoFillCondition fifoFillCondition)<br>+{=
<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#=
160;dev_dbg(&#38;spi-&#62;dev, &#34;set: fifo fill condition&#34;);<br>+&#1=
60;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch(fifoFillCondition=
) {<br>+&#160;&#160; &#160;case always:&#160;&#160; &#160;&#160;&#160; &#16=
0; return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) |&#160; MAS=
K_SYNC_CONFIG_FIFO_FILL_CONDITION) );<br>+&#160;&#160; &#160;case afterSync=
Interrupt: return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) &#3=
8; ~MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );<br>+&#160;&#160; &#160;default=
:&#160;&#160; &#160;&#160;&#160; &#160; INVALID_PARAM;<br>+&#160;&#160; &#1=
60;}<br>+}<br>+<br>+int rf69_set_sync_size(struct spi_device *spi, u8 syncS=
ize)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160=
;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: sync size&#34;);<br>+&#1=
60;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;// check input value<br>=
+&#160;&#160; &#160;if (syncSize &#62; 0x07)<br>+&#160;&#160; &#160;&#160;&=
#160; &#160;INVALID_PARAM;<br>+<br>+&#160;&#160; &#160;// write value<br>+&=
#160;&#160; &#160;return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONF=
IG) &#38; ~MASK_SYNC_CONFIG_SYNC_SIZE) | (syncSize &#60;&#60; 3) );<br>+}<b=
r>+<br>+int rf69_set_sync_tolerance(struct spi_device *spi, u8 syncToleranc=
e)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&=
#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: sync tolerance&#34;);<br>+=
&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;// check input value<=
br>+&#160;&#160; &#160;if (syncTolerance &#62; 0x07)<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;INVALID_PARAM;<br>+<br>+&#160;&#160; &#160;// write val=
ue<br>+&#160;&#160; &#160;return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_S=
YNC_CONFIG) &#38; ~MASK_SYNC_CONFIG_SYNC_SIZE) | syncTolerance);<br>+}<br>+=
<br>+int rf69_set_sync_values(struct spi_device *spi, u8 syncValues[8])<br>=
+{<br>+&#160;&#160; &#160;int retval =3D 0;<br>+<br>+&#160;&#160; &#160;#if=
def DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;d=
ev, &#34;set: sync values&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#1=
60;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE1, syncValues[0]);<br>+&=
#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE2, syncValues[1]);<br>=
+&#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE3, syncValues[2]);<b=
r>+&#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE4, syncValues[3]);=
<br>+&#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE5, syncValues[4]=
);<br>+&#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE6, syncValues[=
5]);<br>+&#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE7, syncValue=
s[6]);<br>+&#160;&#160; &#160;retval +=3D WRITE_REG(REG_SYNCVALUE8, syncVal=
ues[7]);<br>+<br>+&#160;&#160; &#160;return retval;<br>+}<br>+<br>+int rf69=
_set_packet_format(struct spi_device * spi, enum packetFormat packetFormat)=
<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: packet format&#34;);<br>+&#1=
60;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch(packetFormat) {<b=
r>+&#160;&#160; &#160;case packetLengthVar: return WRITE_REG(REG_PACKETCONF=
IG1, (READ_REG(REG_PACKETCONFIG1) |&#160; MASK_PACKETCONFIG1_PAKET_FORMAT_V=
ARIABLE) );<br>+&#160;&#160; &#160;case packetLengthFix: return WRITE_REG(R=
EG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) &#38; ~MASK_PACKETCONFIG1_PA=
KET_FORMAT_VARIABLE) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;&=
#160;&#160;&#160;&#160;&#160; INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}=
<br>+<br>+int rf69_set_crc_enable(struct spi_device *spi, enum optionOnOff =
optionOnOff)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#1=
60;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: crc enable&#34;)=
;<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch(optionOn=
Off) {<br>+&#160;&#160; &#160;case optionOn:&#160;&#160; &#160;return WRITE=
_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) |&#160; MASK_PACKETCON=
FIG1_CRC_ON) );<br>+&#160;&#160; &#160;case optionOff:&#160;&#160; &#160;re=
turn WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) &#38; ~MASK_=
PACKETCONFIG1_CRC_ON) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;=
INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int rf69_set_adressF=
iltering(struct spi_device *spi, enum addressFiltering addressFiltering)<br=
>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: address filtering&#34;);<br>+&#=
160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch (addressFilterin=
g) {<br>+&#160;&#160; &#160;case filteringOff:&#160;&#160; &#160;&#160;&#16=
0;&#160;&#160; return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCO=
NFIG1) &#38; ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSF=
ILTERING_OFF) );<br>+&#160;&#160; &#160;case nodeAddress:&#160;&#160; &#160=
;&#160;&#160;&#160;&#160; return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(R=
EG_PACKETCONFIG1) &#38; ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFI=
G1_ADDRESSFILTERING_NODE) );<br>+&#160;&#160; &#160;case nodeOrBroadcastAdd=
ress: return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) &#=
38; ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_=
NODEBROADCAST) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160;&#160;&#160; INVALID_PARAM;<br>+&#160;&#160; &#160;=
}<br>+}<br>+<br>+int rf69_set_payload_length(struct spi_device *spi, u8 pay=
loadLength)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: payload length&#3=
4;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;return WRITE=
_REG(REG_PAYLOAD_LENGTH, payloadLength);<br>+}<br>+<br>+u8&#160; rf69_get_p=
ayload_length(struct spi_device *spi)<br>+{<br>+&#160;&#160; &#160;#ifdef D=
EBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &=
#34;get: payload length&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160=
;&#160; &#160;return (u8) READ_REG(REG_PAYLOAD_LENGTH);<br>+}<br>+<br>+int =
rf69_set_node_address(struct spi_device *spi, u8 nodeAddress)<br>+{<br>+&#1=
60;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_=
dbg(&#38;spi-&#62;dev, &#34;set: node address&#34;);<br>+&#160;&#160; &#160=
;#endif<br>+<br>+&#160;&#160; &#160;return WRITE_REG(REG_NODEADRS, nodeAddr=
ess);<br>+}<br>+<br>+int rf69_set_broadcast_address(struct spi_device *spi,=
 u8 broadcastAddress)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&=
#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: broadca=
st address&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160=
;return WRITE_REG(REG_BROADCASTADRS, broadcastAddress);<br>+}<br>+<br>+int =
rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCondition t=
xStartCondition)<br>+{<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#160;&#160;=
 &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: start condit=
ion&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;switch=
(txStartCondition) {<br>+&#160;&#160; &#160;case fifoLevel:&#160;&#160; &#1=
60;&#160;&#160; return WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH=
) &#38; ~MASK_FIFO_THRESH_TXSTART) );<br>+&#160;&#160; &#160;case fifoNotEm=
pty: return WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) |&#160; M=
ASK_FIFO_THRESH_TXSTART) );<br>+&#160;&#160; &#160;default:&#160;&#160; &#1=
60;&#160;&#160; INVALID_PARAM;<br>+&#160;&#160; &#160;}<br>+}<br>+<br>+int =
rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold)<br>+{<br>+&#1=
60;&#160; &#160;int retval;<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG<br>+&#=
160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;set: fi=
fo threshold&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#1=
60;// check input value<br>+&#160;&#160; &#160;if (threshold &#38; 0x80)<br=
>+&#160;&#160; &#160;&#160;&#160; &#160;INVALID_PARAM;<br>+<br>+&#160;&#160=
; &#160;// write value<br>+&#160;&#160; &#160;retval =3D WRITE_REG(REG_FIFO=
_THRESH, (READ_REG(REG_FIFO_THRESH) &#38; ~MASK_FIFO_THRESH_VALUE) | thresh=
old);<br>+&#160;&#160; &#160;if (retval)<br>+&#160;&#160; &#160;&#160;&#160=
; &#160;return retval;<br>+<br>+&#160;&#160; &#160;// access the fifo to ac=
tivate new threshold <br>+&#160;&#160; &#160;return rf69_read_fifo (spi, (u=
8*) &#38;retval, 1); // retval used as buffer<br>+}<br>+<br>+int rf69_set_d=
agc(struct spi_device *spi, enum dagc dagc)<br>+{<br>+&#160;&#160; &#160;#i=
fdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;=
dev, &#34;set: dagc&#34;);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#1=
60; &#160;switch(dagc) {<br>+&#160;&#160; &#160;case normalMode:&#160;&#160=
; &#160;&#160;&#160; &#160; return WRITE_REG(REG_TESTDAGC, DAGC_NORMAL);<br=
>+&#160;&#160; &#160;case improve:&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; &#160; return WRITE_REG(REG_TESTDAGC, DAGC_IMPROVED_LOWBETA0);<br=
>+&#160;&#160; &#160;case improve4LowModulationIndex: return WRITE_REG(REG_=
TESTDAGC, DAGC_IMPROVED_LOWBETA1);<br>+&#160;&#160; &#160;default:&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160; INVALID_PARAM;<br>+&#160;&=
#160; &#160;}<br>+}<br>+<br>+/*--------------------------------------------=
-----------------------------*/<br>+<br>+int rf69_read_fifo (struct spi_dev=
ice *spi, u8 *buffer, unsigned int size)<br>+{<br>+&#160;&#160; &#160;#ifde=
f DEBUG_FIFO_ACCESS&#160;&#160; &#160;<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;int i;<br>+&#160;&#160; &#160;#endif<br>+&#160;&#160; &#160;struct sp=
i_transfer transfer;<br>+&#160;&#160; &#160;u8 local_buffer[FIFO_SIZE + 1];=
<br>+&#160;&#160; &#160;int retval;<br>+<br>+&#160;&#160; &#160;if (size &#=
62; FIFO_SIZE)<br>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160;=
 &#160;#ifdef DEBUG<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;dev_dbg(&#38;spi-&#62;dev, &#34;read fifo: passed in buffer bigger th=
en internal buffer \n&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;#end=
if<br>+&#160;&#160; &#160;&#160;&#160; &#160;return -EMSGSIZE;<br>+&#160;&#=
160; &#160;}<br>+<br>+&#160;&#160; &#160;/* prepare a bidirectional transfe=
r */<br>+&#160;&#160; &#160;local_buffer[0] =3D REG_FIFO;<br>+&#160;&#160; =
&#160;memset(&#38;transfer, 0, sizeof(transfer));<br>+ &#160;&#160;&#160; &=
#160;transfer.tx_buf =3D local_buffer;<br>+ &#160;&#160;&#160; &#160;transf=
er.rx_buf =3D local_buffer;<br>+&#160;&#160; &#160;transfer.len&#160;&#160;=
 &#160;=3D size+1;<br>+<br>+&#160;&#160; &#160;retval =3D spi_sync_transfer=
(spi, &#38;transfer, 1);<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG_FIFO_ACCE=
SS<br>+&#160;&#160; &#160;&#160;&#160; &#160;for (i=3D0; i&#60;size; i++) <=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;s=
pi-&#62;dev, &#34;%d - 0x%x\n&#34;, i, local_buffer[i+1]);<br>+&#160;&#160;=
 &#160;#endif<br>+<br>+&#160;&#160; &#160;memcpy(buffer, &#38;local_buffer[=
1], size);&#160; // TODO: ohne memcopy w&#228;re sch&#246;ner<br>+<br>+&#16=
0;&#160; &#160;return retval;<br>+}<br>+<br>+int rf69_write_fifo(struct spi=
_device *spi, u8 *buffer, unsigned int size)<br>+{<br>+&#160;&#160; &#160;#=
ifdef DEBUG_FIFO_ACCESS&#160;&#160; &#160;<br>+&#160;&#160; &#160;&#160;&#1=
60; &#160;int i;<br>+&#160;&#160; &#160;#endif<br>+&#160;&#160; &#160;char =
spi_address =3D REG_FIFO | WRITE_BIT; <br>+&#160;&#160; &#160;u8 local_buff=
er[FIFO_SIZE + 1];<br>+<br>+&#160;&#160; &#160;if (size &#62; FIFO_SIZE)<br=
>+&#160;&#160; &#160;{<br>+&#160;&#160; &#160;&#160;&#160; &#160;#ifdef DEB=
UG<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#3=
8;spi-&#62;dev, &#34;read fifo: passed in buffer bigger then internal buffe=
r \n&#34;);<br>+&#160;&#160; &#160;&#160;&#160; &#160;#endif<br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;return -EMSGSIZE;<br>+&#160;&#160; &#160;}<br>+=
<br>+&#160;&#160; &#160;local_buffer[0] =3D spi_address;<br>+&#160;&#160; &=
#160;memcpy(&#38;local_buffer[1], buffer, size);&#160; // TODO: ohne memcop=
y w&#228;re sch&#246;ner<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG_FIFO_ACCE=
SS<br>+&#160;&#160; &#160;&#160;&#160; &#160;for (i=3D0; i&#60;size; i++)<b=
r>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;sp=
i-&#62;dev, &#34;0x%x\n&#34;,buffer[i]);<br>+&#160;&#160; &#160;#endif<br>+=
<br>+&#160;&#160; &#160;return spi_write (spi, local_buffer, size + 1);<br>=
+}<br>+<br>+/*-------------------------------------------------------------=
------------*/<br>+<br>+u8 rf69_read_reg(struct spi_device *spi, u8 addr)<b=
r>+{<br>+&#160;&#160; &#160;int retval;<br>+<br>+&#160;&#160; &#160;retval =
=3D spi_w8r8(spi, addr);<br>+<br>+&#160;&#160; &#160;#ifdef DEBUG_VALUES<br=
>+&#160;&#160; &#160;&#160;&#160; &#160;if (retval &#60; 0) <br>+&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;/* should never happen, sinc=
e we already checked, <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; that module is connected. Therefore no error <br>+&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; handling=
, just an optional error message... */<br>+&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;read 0x%x FAILED\n=
&#34;,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;addr);<br>+&#160;&#160; &#160;&#160;&#160; &#160;else<br>+&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;d=
ev, &#34;read 0x%x from reg 0x%x\n&#34;,<br>+&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;retval,<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;addr);<br>+&#160=
;&#160; &#160;#endif<br>+<br>+&#160;&#160; &#160;return retval;<br>+}<br>+<=
br>+int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value)<br>+{<br>=
+&#160;&#160; &#160;int retval;<br>+&#160;&#160; &#160;char buffer[2];<br>+=
&#160;&#160; &#160;<br>+&#160;&#160; &#160;buffer[0] =3D addr | WRITE_BIT;<=
br>+&#160;&#160; &#160;buffer[1] =3D value;<br>+<br>+&#160;&#160; &#160;ret=
val =3D spi_write(spi, &#38;buffer, 2);<br>+<br>+&#160;&#160; &#160;#ifdef =
DEBUG_VALUES<br>+&#160;&#160; &#160;&#160;&#160; &#160;if (retval &#60; 0)<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;/* should neve=
r happen, since we already checked, <br>+&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; that module is connected. Therefore no =
error <br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; handling, just an optional error message... */<br>+&#160;&#160; &#160=
;&#160;&#160; &#160;&#160;&#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;writ=
e 0x%x to 0x%x FAILED\n&#34;,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;value,<br>+&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;addr);<br>+&#160;&#160; &#16=
0;&#160;&#160; &#160;else<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;dev_dbg(&#38;spi-&#62;dev, &#34;wrote 0x%x to reg 0x%x\n&#34;,<=
br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;value,<br>+&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;addr);<br>+&#160;&#160; &#160;#endif<br>+<br>+&#160;&#160;=
 &#160;return retval;<br>+}<br>+<br>+<br>diff --git a/drivers/staging/pi433=
/rf69.h b/drivers/staging/pi433/rf69.h<br>new file mode 100644<br>index 000=
0000..6a6841b<br>--- /dev/null<br>+++ b/drivers/staging/pi433/rf69.h<br>@@ =
-0,0 +1,82 @@<br>+/*<br>+ * hardware abstraction/register access for HopeRf=
 rf69 radio module<br>+ *<br>+ * Copyright (C) 2016 Wolf-Entwicklungen<br>+=
 *&#160;&#160; &#160;Marcus Wolf &#60;linux@wolf-entwicklungen.de&#62;<br>+=
 *<br>+ * This program is free software; you can redistribute it and/or mod=
ify<br>+ * it under the terms of the GNU General Public License as publishe=
d by<br>+ * the Free Software Foundation; either version 2 of the License, =
or<br>+ * (at your option) any later version.<br>+ *<br>+ * This program is=
 distributed in the hope that it will be useful,<br>+ * but WITHOUT ANY WAR=
RANTY; without even the implied warranty of<br>+ * MERCHANTABILITY or FITNE=
SS FOR A PARTICULAR PURPOSE.&#160; See the<br>+ * GNU General Public Licens=
e for more details.<br>+ */<br>+#ifndef RF69_H<br>+#define RF69_H<br>+<br>+=
#include &#34;rf69_enum.h&#34;<br>+#include &#34;rf69_registers.h&#34;<br>+=
<br>+#define F_OSC &#160;&#160; &#160;&#160;&#160; &#160;32000000&#160; /* =
in Hz */<br>+#define FREQUENCY&#160;&#160; &#160;433920000 /* in Hz, modify=
ing this value impacts CE certification */<br>+#define FIFO_SIZE &#160;&#16=
0; &#160;66&#160;&#160;&#160;&#160;&#160;&#160;&#160; /* in byte */<br>+#de=
fine FIFO_THRESHOLD&#160;&#160; &#160;15 &#160;&#160; &#160;&#160; /* in by=
te */<br>+<br>+int rf69_set_mode(struct spi_device *spi, enum mode mode);<b=
r>+int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode);<=
br>+int rf69_set_modulation(struct spi_device *spi, enum modulation modulat=
ion);<br>+enum modulation rf69_get_modulation(struct spi_device *spi);<br>+=
int rf69_set_modulation_shaping(struct spi_device *spi, enum modShaping mod=
Shaping);<br>+int rf69_set_bit_rate(struct spi_device *spi, u16 bitRate);<b=
r>+int rf69_set_deviation(struct spi_device *spi, u32 deviation);<br>+int r=
f69_set_frequency(struct spi_device *spi, u32 frequency);<br>+int rf69_set_=
amplifier_0(struct spi_device *spi, enum optionOnOff optionOnOff);<br>+int =
rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOff optionOnOff);=
<br>+int rf69_set_amplifier_2(struct spi_device *spi, enum optionOnOff opti=
onOnOff);<br>+int rf69_set_output_power_level(struct spi_device *spi, u8 po=
werLevel);<br>+int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paR=
amp);<br>+int rf69_set_antenna_impedance(struct spi_device *spi, enum anten=
naImpedance antennaImpedance);<br>+int rf69_set_lna_gain(struct spi_device =
*spi, enum lnaGain lnaGain);<br>+enum lnaGain rf69_get_lna_gain(struct spi_=
device *spi);<br>+int rf69_set_dc_cut_off_frequency_intern(struct spi_devic=
e *spi, u8 reg, enum dccPercent dccPercent);<br>+int rf69_set_dc_cut_off_fr=
equency(struct spi_device *spi, enum dccPercent dccPercent);<br>+int rf69_s=
et_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercent =
dccPercent);<br>+int rf69_set_bandwidth(struct spi_device *spi, enum mantis=
se mantisse, u8 exponent);<br>+int rf69_set_bandwidth_during_afc(struct spi=
_device *spi, enum mantisse mantisse, u8 exponent);<br>+int rf69_set_ook_th=
reshold_type(struct spi_device *spi, enum thresholdType thresholdType);<br>=
+int rf69_set_ook_threshold_step(struct spi_device *spi, enum thresholdStep=
 thresholdStep);<br>+int rf69_set_ook_threshold_dec(struct spi_device *spi,=
 enum thresholdDecrement thresholdDecrement);<br>+int rf69_set_dio_mapping(=
struct spi_device *spi, u8 DIONumber, u8 value);<br>+bool rf69_get_flag(str=
uct spi_device *spi, enum flag flag);<br>+int rf69_reset_flag(struct spi_de=
vice *spi, enum flag flag);<br>+int rf69_set_rssi_threshold(struct spi_devi=
ce *spi, u8 threshold);<br>+int rf69_set_rx_start_timeout(struct spi_device=
 *spi, u8 timeout);<br>+int rf69_set_rssi_timeout(struct spi_device *spi, u=
8 timeout);<br>+int rf69_set_preamble_length(struct spi_device *spi, u16 pr=
eambleLength);<br>+int rf69_set_sync_enable(struct spi_device *spi, enum op=
tionOnOff optionOnOff);<br>+int rf69_set_fifo_fill_condition(struct spi_dev=
ice *spi, enum fifoFillCondition fifoFillCondition);<br>+int rf69_set_sync_=
size(struct spi_device *spi, u8 sync_size);<br>+int rf69_set_sync_tolerance=
(struct spi_device *spi, u8 syncTolerance);<br>+int rf69_set_sync_values(st=
ruct spi_device *spi, u8 syncValues[8]);<br>+int rf69_set_packet_format(str=
uct spi_device * spi, enum packetFormat packetFormat);<br>+int rf69_set_crc=
_enable(struct spi_device *spi, enum optionOnOff optionOnOff);<br>+int rf69=
_set_adressFiltering(struct spi_device *spi, enum addressFiltering addressF=
iltering);<br>+int rf69_set_payload_length(struct spi_device *spi, u8 paylo=
adLength);<br>+u8&#160; rf69_get_payload_length(struct spi_device *spi);<br=
>+int rf69_set_node_address(struct spi_device *spi, u8 nodeAddress);<br>+in=
t rf69_set_broadcast_address(struct spi_device *spi, u8 broadcastAddress);<=
br>+int rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCon=
dition txStartCondition);<br>+int rf69_set_fifo_threshold(struct spi_device=
 *spi, u8 threshold);<br>+int rf69_set_dagc(struct spi_device *spi, enum da=
gc dagc);<br>+<br>+int rf69_read_fifo (struct spi_device *spi, u8 *buffer, =
unsigned int size);<br>+int rf69_write_fifo(struct spi_device *spi, u8 *buf=
fer, unsigned int size);<br>+<br>+u8&#160; rf69_read_reg (struct spi_device=
 *spi, u8 addr);<br>+int rf69_write_reg(struct spi_device *spi, u8 addr, u8=
 value);<br>+<br>+<br>+#endif <br>diff --git a/drivers/staging/pi433/rf69_e=
num.h b/drivers/staging/pi433/rf69_enum.h<br>new file mode 100644<br>index =
0000000..fbfb59b<br>--- /dev/null<br>+++ b/drivers/staging/pi433/rf69_enum.=
h<br>@@ -0,0 +1,201 @@<br>+/*<br>+ * enumerations for HopeRf rf69 radio mod=
ule<br>+ *<br>+ * Copyright (C) 2016 Wolf-Entwicklungen<br>+ *&#160;&#160; =
&#160;Marcus Wolf &#60;linux@wolf-entwicklungen.de&#62;<br>+ *<br>+ * This =
program is free software; you can redistribute it and/or modify<br>+ * it u=
nder the terms of the GNU General Public License as published by<br>+ * the=
 Free Software Foundation; either version 2 of the License, or<br>+ * (at y=
our option) any later version.<br>+ *<br>+ * This program is distributed in=
 the hope that it will be useful,<br>+ * but WITHOUT ANY WARRANTY; without =
even the implied warranty of<br>+ * MERCHANTABILITY or FITNESS FOR A PARTIC=
ULAR PURPOSE.&#160; See the<br>+ * GNU General Public License for more deta=
ils.<br>+ */<br>+<br>+#ifndef RF69_ENUM_H<br>+#define RF69_ENUM_H<br>+<br>+=
enum optionOnOff<br>+{<br>+&#160;&#160;&#160; optionOff,<br>+&#160;&#160;&#=
160; optionOn<br>+};<br>+<br>+enum mode<br>+{<br>+&#160;&#160;&#160; mode_s=
leep,<br>+&#160;&#160;&#160; standby,<br>+&#160;&#160;&#160; synthesizer,<b=
r>+&#160;&#160;&#160; transmit,<br>+&#160;&#160;&#160; receive<br>+};<br>+<=
br>+enum dataMode<br>+{<br>+&#160;&#160;&#160; packet,<br>+&#160;&#160;&#16=
0; continuous,<br>+&#160;&#160;&#160; continuousNoSync<br>+};<br>+<br>+enum=
 modulation<br>+{<br>+&#160;&#160;&#160; OOK,<br>+&#160;&#160;&#160; FSK<br=
>+};<br>+<br>+enum modShaping<br>+{<br>+&#160;&#160;&#160; shapingOff,<br>+=
&#160;&#160;&#160; shaping1_0,<br>+&#160;&#160;&#160; shaping0_5,<br>+&#160=
;&#160;&#160; shaping0_3,<br>+&#160;&#160;&#160; shapingBR,<br>+&#160;&#160=
;&#160; shaping2BR<br>+};<br>+<br>+enum paRamp<br>+{<br>+&#160;&#160;&#160;=
 ramp3400,<br>+&#160;&#160;&#160; ramp2000,<br>+&#160;&#160;&#160; ramp1000=
,<br>+&#160;&#160;&#160; ramp500,<br>+&#160;&#160;&#160; ramp250,<br>+&#160=
;&#160;&#160; ramp125,<br>+&#160;&#160;&#160; ramp100,<br>+&#160;&#160;&#16=
0; ramp62,<br>+&#160;&#160;&#160; ramp50,<br>+&#160;&#160;&#160; ramp40,<br=
>+&#160;&#160;&#160; ramp31,<br>+&#160;&#160;&#160; ramp25,<br>+&#160;&#160=
;&#160; ramp20,<br>+&#160;&#160;&#160; ramp15,<br>+&#160;&#160;&#160; ramp1=
2,<br>+&#160;&#160;&#160; ramp10<br>+};<br>+<br>+enum antennaImpedance<br>+=
{<br>+&#160;&#160;&#160; fiftyOhm,<br>+&#160;&#160;&#160; twohundretOhm<br>=
+};<br>+<br>+enum lnaGain<br>+{<br>+&#160;&#160;&#160; automatic,<br>+&#160=
;&#160;&#160; max,<br>+&#160;&#160;&#160; maxMinus6,<br>+&#160;&#160;&#160;=
 maxMinus12,<br>+&#160;&#160;&#160; maxMinus24,<br>+&#160;&#160;&#160; maxM=
inus36,<br>+&#160;&#160;&#160; maxMinus48,<br>+&#160;&#160;&#160; undefined=
<br>+};<br>+<br>+enum dccPercent<br>+{<br>+&#160;&#160;&#160; dcc16Percent,=
<br>+&#160;&#160;&#160; dcc8Percent,<br>+&#160;&#160;&#160; dcc4Percent,<br=
>+&#160;&#160;&#160; dcc2Percent,<br>+&#160;&#160;&#160; dcc1Percent,<br>+&=
#160;&#160;&#160; dcc0_5Percent,<br>+&#160;&#160;&#160; dcc0_25Percent,<br>=
+&#160;&#160;&#160; dcc0_125Percent<br>+};<br>+<br>+enum mantisse<br>+{<br>=
+&#160;&#160;&#160; mantisse16,<br>+&#160;&#160;&#160; mantisse20,<br>+&#16=
0;&#160;&#160; mantisse24<br>+};<br>+<br>+enum thresholdType<br>+{<br>+&#16=
0;&#160;&#160; fixed,<br>+&#160;&#160;&#160; peak,<br>+&#160;&#160;&#160; a=
verage<br>+};<br>+<br>+enum thresholdStep<br>+{<br>+&#160;&#160;&#160; step=
_0_5db,<br>+&#160;&#160;&#160; step_1_0db,<br>+&#160;&#160;&#160; step_1_5d=
b,<br>+&#160;&#160;&#160; step_2_0db,<br>+&#160;&#160;&#160; step_3_0db,<br=
>+&#160;&#160;&#160; step_4_0db,<br>+&#160;&#160;&#160; step_5_0db,<br>+&#1=
60;&#160;&#160; step_6_0db<br>+};<br>+<br>+enum thresholdDecrement<br>+{<br=
>+&#160;&#160;&#160; dec_every8th,<br>+&#160;&#160;&#160; dec_every4th,<br>=
+&#160;&#160;&#160; dec_every2nd,<br>+&#160;&#160;&#160; dec_once,<br>+&#16=
0;&#160;&#160; dec_twice,<br>+&#160;&#160;&#160; dec_4times,<br>+&#160;&#16=
0;&#160; dec_8times,<br>+&#160;&#160;&#160; dec_16times<br>+};<br>+<br>+enu=
m flag<br>+{<br>+&#160;&#160;&#160; modeSwitchCompleted,<br>+&#160;&#160;&#=
160; readyToReceive,<br>+&#160;&#160;&#160; readyToSend,<br>+&#160;&#160;&#=
160; pllLocked,<br>+&#160;&#160;&#160; rssiExceededThreshold,<br>+&#160;&#1=
60;&#160; timeout,<br>+&#160;&#160;&#160; automode,<br>+&#160;&#160;&#160; =
syncAddressMatch,<br>+&#160;&#160;&#160; fifoFull,<br>+//&#160;&#160;&#160;=
 fifoNotEmpty, collision with next enum; replaced by following enum...<br>+=
&#160;&#160;&#160; fifoEmpty,<br>+&#160;&#160;&#160; fifoLevelBelowThreshol=
d,<br>+&#160;&#160;&#160; fifoOverrun,<br>+&#160;&#160;&#160; packetSent,<b=
r>+&#160;&#160;&#160; payloadReady,<br>+&#160;&#160;&#160; crcOk,<br>+&#160=
;&#160;&#160; batteryLow<br>+};<br>+<br>+enum fifoFillCondition<br>+{<br>+&=
#160;&#160;&#160; afterSyncInterrupt,<br>+&#160;&#160;&#160; always<br>+};<=
br>+<br>+enum packetFormat<br>+{<br>+&#160;&#160;&#160; packetLengthFix,<br=
>+&#160;&#160;&#160; packetLengthVar<br>+};<br>+<br>+enum txStartCondition<=
br>+{<br>+&#160;&#160;&#160; fifoLevel,<br>+&#160;&#160;&#160; fifoNotEmpty=
<br>+};<br>+<br>+enum addressFiltering<br>+{<br>+&#160;&#160;&#160; filteri=
ngOff,<br>+&#160;&#160;&#160; nodeAddress,<br>+&#160;&#160;&#160; nodeOrBro=
adcastAddress<br>+};<br>+<br>+enum dagc<br>+{<br>+&#160;&#160;&#160; normal=
Mode,<br>+&#160;&#160;&#160; improve,<br>+&#160;&#160;&#160; improve4LowMod=
ulationIndex<br>+};<br>+<br>+<br>+#endif<br>diff --git a/drivers/staging/pi=
433/rf69_registers.h b/drivers/staging/pi433/rf69_registers.h<br>new file m=
ode 100644<br>index 0000000..d0c4992<br>--- /dev/null<br>+++ b/drivers/stag=
ing/pi433/rf69_registers.h<br>@@ -0,0 +1,489 @@<br>+/*<br>+ * register desc=
ription for HopeRf rf69 radio module<br>+ *<br>+ * Copyright (C) 2016 Wolf-=
Entwicklungen<br>+ *&#160;&#160; &#160;Marcus Wolf &#60;linux@wolf-entwickl=
ungen.de&#62;<br>+ *<br>+ * This program is free software; you can redistri=
bute it and/or modify<br>+ * it under the terms of the GNU General Public L=
icense as published by<br>+ * the Free Software Foundation; either version =
2 of the License, or<br>+ * (at your option) any later version.<br>+ *<br>+=
 * This program is distributed in the hope that it will be useful,<br>+ * b=
ut WITHOUT ANY WARRANTY; without even the implied warranty of<br>+ * MERCHA=
NTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&#160; See the<br>+ * GNU Gen=
eral Public License for more details.<br>+ */<br>+<br>+/*******************=
************************/<br>+/* RF69 register addresses&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; */<br>+/***********************************=
********/<br>+#define&#160; REG_FIFO&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x00<br>+#define&#160; REG_OPMODE&#160;&#160; &#160;&#160=
;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; REG_DATAMODUL&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#define&#160; R=
EG_BITRATE_MSB&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#define&#160; =
REG_BITRATE_LSB&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+#define&#160;=
 REG_FDEV_MSB&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x05<=
br>+#define&#160; REG_FDEV_LSB&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;0x06<br>+#define&#160; REG_FRF_MSB&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;0x07<br>+#define&#160; REG_FRF_MID&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;0x08<br>+#define&#160; REG_FRF_=
LSB&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x09<br>+#defin=
e&#160; REG_OSC1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x=
0A<br>+#define&#160; REG_AFCCTRL&#160;&#160; &#160;&#160;&#160; &#160;&#160=
;&#160; &#160;0x0B<br>+#define&#160; REG_LOWBAT&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;0x0C<br>+#define&#160; REG_LISTEN1&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0D<br>+#define&#160; REG_LIS=
TEN2&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0E<br>+#defi=
ne&#160; REG_LISTEN3&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;0x0F<br>+#define&#160; REG_VERSION&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x10<br>+#define&#160; REG_PALEVEL&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;0x11<br>+#define&#160; REG_PARAMP&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x12<br>+#define&#160; REG=
_OCP&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x13<br>+#defi=
ne&#160; REG_AGCREF&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;0x14 /* not available on RF69 */<br>+#define&#160; REG_AGCTHRESH1&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x15 /* not available on RF=
69 */<br>+#define&#160; REG_AGCTHRESH2&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;0x16 /* not available on RF69 */<br>+#define&#160; REG_=
AGCTHRESH3&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x17 /* =
not available on RF69 */<br>+#define&#160; REG_LNA&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;0x18<br>+#define&#160; REG_RXBW&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x19<br>+#define&#160; REG_AFC=
BW&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x1A<br>+#define=
&#160; REG_OOKPEAK&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x1B<br>+#define&#160; REG_OOKAVG&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;0x1C<br>+#define&#160; REG_OOKFIX&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x1D<br>+#define&#160; REG_AFCFEI&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x1E<br>+#define&#160; REG_AFC=
MSB&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x1F<br>+#defin=
e&#160; REG_AFCLSB&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x20<br>+#define&#160; REG_FEIMSB&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;0x21<br>+#define&#160; REG_FEILSB&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x22<br>+#define&#160; REG_RSSICONFIG&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x23<br>+#define&#160; REG=
_RSSIVALUE&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x24<br>=
+#define&#160; REG_DIOMAPPING1&#160;&#160; &#160;&#160;&#160; &#160;0x25<br=
>+#define&#160; REG_DIOMAPPING2&#160;&#160; &#160;&#160;&#160; &#160;0x26<b=
r>+#define&#160; REG_IRQFLAGS1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;0x27<br>+#define&#160; REG_IRQFLAGS2&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x28<br>+#define&#160; REG_RSSITHRESH&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x29<br>+#define&#160; REG=
_RXTIMEOUT1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x2A<br=
>+#define&#160; REG_RXTIMEOUT2&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;0x2B<br>+#define&#160; REG_PREAMBLE_MSB&#160;&#160; &#160;&#160=
;&#160; &#160;0x2C<br>+#define&#160; REG_PREAMBLE_LSB&#160;&#160; &#160;&#1=
60;&#160; &#160;0x2D<br>+#define&#160; REG_SYNC_CONFIG&#160;&#160; &#160;&#=
160;&#160; &#160;0x2E<br>+#define&#160; REG_SYNCVALUE1&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;0x2F<br>+#define&#160; REG_SYNCVALUE2&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x30<br>+#define&#16=
0; REG_SYNCVALUE3&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0=
x31<br>+#define&#160; REG_SYNCVALUE4&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x32<br>+#define&#160; REG_SYNCVALUE5&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;0x33<br>+#define&#160; REG_SYNCVALUE6&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x34<br>+#define&#1=
60; REG_SYNCVALUE7&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x35<br>+#define&#160; REG_SYNCVALUE8&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160; &#160;0x36<br>+#define&#160; REG_PACKETCONFIG1&#160;&#160; &#1=
60;&#160;&#160; &#160;0x37<br>+#define&#160; REG_PAYLOAD_LENGTH&#160;&#160;=
 &#160;&#160;&#160; &#160;0x38<br>+#define&#160; REG_NODEADRS&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;0x39<br>+#define&#160; REG_BROAD=
CASTADRS&#160;&#160; &#160;&#160;&#160; &#160;0x3A<br>+#define&#160; REG_AU=
TOMODES&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x3B<br>+#d=
efine&#160; REG_FIFO_THRESH&#160;&#160; &#160;&#160;&#160; &#160;0x3C<br>+#=
define&#160; REG_PACKETCONFIG2&#160;&#160; &#160;&#160;&#160; &#160;0x3D<br=
>+#define&#160; REG_AESKEY1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;0x3E<br>+#define&#160; REG_AESKEY2&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;0x3F<br>+#define&#160; REG_AESKEY3&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;0x40<br>+#define&#160; REG_AESKEY4=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x41<br>+#define&#=
160; REG_AESKEY5&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x=
42<br>+#define&#160; REG_AESKEY6&#160;&#160; &#160;&#160;&#160; &#160;&#160=
;&#160; &#160;0x43<br>+#define&#160; REG_AESKEY7&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x44<br>+#define&#160; REG_AESKEY8&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x45<br>+#define&#160; REG_AE=
SKEY9&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x46<br>+#def=
ine&#160; REG_AESKEY10&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;0x47<br>+#define&#160; REG_AESKEY11&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;0x48<br>+#define&#160; REG_AESKEY12&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; &#160;0x49<br>+#define&#160; REG_AESKEY13&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x4A<br>+#define&#16=
0; REG_AESKEY14&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x4=
B<br>+#define&#160; REG_AESKEY15&#160;&#160; &#160;&#160;&#160; &#160;&#160=
;&#160; &#160;0x4C<br>+#define&#160; REG_AESKEY16&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160; &#160;0x4D<br>+#define&#160; REG_TEMP1&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x4E<br>+#define&#160; REG_TEM=
P2&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x4F<br>+#define=
&#160; REG_TESTPA1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x5A /* only present on RFM69HW */<br>+#define&#160; REG_TESTPA2&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x5C /* only present on RFM69=
HW */<br>+#define&#160; REG_TESTDAGC&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x6F<br>+<br>+/******************************************=
************/<br>+/* RF69/SX1231 bit definition&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;*/<br>+/*******************=
***********************************/<br>+/* write bit */<br>+#define WRITE_=
BIT&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;0x80<br>+<br>+/* RegOpMode */<br>+#define&#160; MASK_OPMODE_SEQUENCER_O=
FF&#160;&#160; &#160;&#160;&#160; &#160;0x80<br>+#define&#160; MASK_OPMODE_=
LISTEN_ON&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x40<br>+=
#define&#160; MASK_OPMODE_LISTEN_ABORT&#160;&#160; &#160;&#160;&#160; &#160=
;0x20<br>+#define&#160; MASK_OPMODE_MODE&#160;&#160; &#160;&#160;&#160; &#1=
60;&#160;&#160; &#160;0x1C<br>+<br>+#define&#160; OPMODE_MODE_SLEEP&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; OPM=
ODE_MODE_STANDBY&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x=
04 /* default */<br>+#define&#160; OPMODE_MODE_SYNTHESIZER&#160;&#160; &#16=
0;&#160;&#160; &#160;0x08<br>+#define&#160; OPMODE_MODE_TRANSMIT&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0C<br>+#define&#160; OPMODE=
_MODE_RECEIVE&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x10<=
br>+<br>+/* RegDataModul */<br>+#define&#160; MASK_DATAMODUL_MODE&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x06<br>+#define&#160; MASK_=
DATAMODUL_MODULATION_TYPE&#160;&#160; &#160;&#160;&#160; &#160;0x18<br>+#de=
fine&#160; MASK_DATAMODUL_MODULATION_SHAPE&#160;&#160; &#160;0x03<br>+<br>+=
#define&#160; DATAMODUL_MODE_PACKET&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;0x00 /* default */<br>+#define&#160; DATAMODUL_MODE_CONTIN=
UOUS&#160;&#160; &#160;&#160;&#160; &#160;0x40<br>+#define&#160; DATAMODUL_=
MODE_CONTINUOUS_NOSYNC&#160;&#160; &#160;0x60<br>+<br>+#define&#160; DATAMO=
DUL_MODULATION_TYPE_FSK&#160;&#160; &#160;&#160;&#160; &#160;0x00 /* defaul=
t */<br>+#define&#160; DATAMODUL_MODULATION_TYPE_OOK&#160;&#160; &#160;&#16=
0;&#160; &#160;0x08<br>+<br>+#define&#160; DATAMODUL_MODULATION_SHAPE_NONE&=
#160;&#160; &#160;0x00 /* default */<br>+#define&#160; DATAMODUL_MODULATION=
_SHAPE_1_0&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; DATA=
MODUL_MODULATION_SHAPE_0_5&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#d=
efine&#160; DATAMODUL_MODULATION_SHAPE_0_3&#160;&#160; &#160;&#160;&#160; &=
#160;0x03<br>+#define&#160; DATAMODUL_MODULATION_SHAPE_BR&#160;&#160; &#160=
;&#160;&#160; &#160;0x01<br>+#define&#160; DATAMODUL_MODULATION_SHAPE_2BR&#=
160;&#160; &#160;&#160;&#160; &#160;0x02<br>+<br>+/* RegFDevMsb (0x05)*/<br=
>+#define FDEVMASB_MASK&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;0x3f<br>+<br>+/*<br>+// RegOsc1<br>+#define&#160; O=
SC1_RCCAL_START&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x8=
0<br>+#define&#160; OSC1_RCCAL_DONE&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;0x40<br>+<br>+// RegLowBat<br>+#define&#160; LOWBAT_MONITO=
R&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#16=
0;0x10<br>+#define&#160; LOWBAT_ON&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;0x08<br>+#define&#160; LOWBAT_OFF&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00&#=
160; // Default<br>+<br>+#define&#160; LOWBAT_TRIM_1695&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; LOWBAT_TRIM_176=
4&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&=
#160; LOWBAT_TRIM_1835&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;0x02&#160; // Default<br>+#define&#160; LOWBAT_TRIM_1905&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#define&#160; LOWBAT_TRI=
M_1976&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+#de=
fine&#160; LOWBAT_TRIM_2045&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;0x05<br>+#define&#160; LOWBAT_TRIM_2116&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x06<br>+#define&#160; LOWBAT_TRIM_2185&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x07<br>+<br>+<br>+// Re=
gListen1<br>+#define&#160; LISTEN1_RESOL_64&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;0x50<br>+#define&#160; LISTEN1_RESOL_4100&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0xA0&#160; // Default<br>+#=
define&#160; LISTEN1_RESOL_262000&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;0xF0<br>+<br>+#define&#160; LISTEN1_CRITERIA_RSSI&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+#de=
fine&#160; LISTEN1_CRITERIA_RSSIANDSYNC&#160;&#160; &#160;&#160;&#160; &#16=
0;0x08<br>+<br>+#define&#160; LISTEN1_END_00&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; LISTEN1=
_END_01&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;0x02&#160; // Default<br>+#define&#160; LISTEN1_END_10&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+<br=
>+<br>+// RegListen2<br>+#define&#160; LISTEN2_COEFIDLE_VALUE&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;0xF5 // Default<br>+<br>+// RegL=
isten3<br>+#define&#160; LISTEN3_COEFRX_VALUE&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;0x20 // Default<br>+*/<br>+<br>+// RegPaLevel<br=
>+#define&#160; MASK_PALEVEL_PA0&#160;&#160; &#160;&#160;&#160; &#160;&#160=
;&#160; &#160;0x80<br>+#define&#160; MASK_PALEVEL_PA1&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;0x40<br>+#define&#160; MASK_PALEVEL_PA2&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x20<br>+#define&#1=
60; MASK_PALEVEL_OUTPUT_POWER&#160;&#160; &#160;&#160;&#160; &#160;0x1F<br>=
+<br>+<br>+<br>+// RegPaRamp<br>+#define&#160; PARAMP_3400&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00<br>+#define=
&#160; PARAMP_2000&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160; &#160;0x01<br>+#define&#160; PARAMP_1000&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#define&#160=
; PARAMP_500&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;=
&#160; &#160;0x03<br>+#define&#160; PARAMP_250&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+#define&#160; PARAM=
P_125&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;0x05<br>+#define&#160; PARAMP_100&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;0x06<br>+#define&#160; PARAMP_62&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x=
07<br>+#define&#160; PARAMP_50&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160; &#160;0x08<br>+#define&#160; PARAMP_40&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x09 /* def=
ault */<br>+#define&#160; PARAMP_31&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;0x0A<br>+#define&#160; PARAMP_25&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0B<b=
r>+#define&#160; PARAMP_20&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;0x0C<br>+#define&#160; PARAMP_15&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0D<br>+#defin=
e&#160; PARAMP_12&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x0E<br>+#define&#160; PARAMP_10&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0F<br>+<br>+#define&#1=
60; MASK_PARAMP&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#1=
60;&#160; &#160;0x0F<br>+<br>+/*<br>+// RegOcp<br>+#define&#160; OCP_OFF&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x=
0F<br>+#define&#160; OCP_ON&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x1A&#160; // Default<br>+<b=
r>+#define&#160; OCP_TRIM_45&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; OCP_TRIM_50&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#d=
efine&#160; OCP_TRIM_55&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;0x02<br>+#define&#160; OCP_TRIM_60&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#define=
&#160; OCP_TRIM_65&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160; &#160;0x04<br>+#define&#160; OCP_TRIM_70&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x05<br>+#define&#160=
; OCP_TRIM_75&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160=
;&#160; &#160;0x06<br>+#define&#160; OCP_TRIM_80&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x07<br>+#define&#160; OCP=
_TRIM_85&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;0x08<br>+#define&#160; OCP_TRIM_90&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;0x09<br>+#define&#160; OCP_TRIM=
_95&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;0x0A<br>+#define&#160; OCP_TRIM_100&#160;&#160; &#160;&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;0x0B&#160; // Default<br>+#define&#=
160; OCP_TRIM_105&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x0C<br>+#define&#160; OCP_TRIM_110&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0D<br>+#define&#160=
; OCP_TRIM_115&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;0x0E<br>+#define&#160; OCP_TRIM_120&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x0F<br>+*/<br>+<br>+/* =
RegLna (0x18) */<br>+#define&#160; MASK_LNA_ZIN&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x80<br>+#define&#160; MASK=
_LNA_CURRENT_GAIN&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0=
x38<br>+#define&#160; MASK_LNA_GAIN&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;0x07<br>+<br>+#define&#160; LNA_GAIN_AU=
TO&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;0x00 /* default */<br>+#define&#160; LNA_GAIN_MAX&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160;=
 LNA_GAIN_MAX_MINUS_6&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;0x02<br>+#define&#160; LNA_GAIN_MAX_MINUS_12&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;0x03<br>+#define&#160; LNA_GAIN_MAX_MINUS_24&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+#define&#16=
0; LNA_GAIN_MAX_MINUS_36&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;0x05<br>+#define&#160; LNA_GAIN_MAX_MINUS_48&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;0x06<br>+<br>+<br>+/* RegRxBw (0x19) and Re=
gAfcBw (0x1A) */<br>+#define&#160; MASK_BW_DCC_FREQ&#160;&#160; &#160;&#160=
;&#160; &#160;&#160;&#160; &#160;0xE0<br>+#define&#160; MASK_BW_MANTISSE&#1=
60;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x18<br>+#define&#160=
; MASK_BW_EXPONENT&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x07<br>+<br>+#define&#160; BW_DCC_16_PERCENT&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; BW_DCC_8_PERCENT&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x20<br>+#define&#160; BW_D=
CC_4_PERCENT&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x40 /=
* default */<br>+#define&#160; BW_DCC_2_PERCENT&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;0x60<br>+#define&#160; BW_DCC_1_PERCENT&#160;&=
#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x80<br>+#define&#160; BW=
_DCC_0_5_PERCENT&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x=
A0<br>+#define&#160; BW_DCC_0_25_PERCENT&#160;&#160; &#160;&#160;&#160; &#1=
60;&#160;&#160; &#160;0xC0<br>+#define&#160; BW_DCC_0_125_PERCENT&#160;&#16=
0; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0xE0<br>+<br>+#define&#160; =
BW_MANT_16&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#=
160; &#160;0x00<br>+#define&#160; BW_MANT_20&#160;&#160; &#160;&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x08<br>+#define&#160; BW_MANT=
_24&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;0x10 /* default */<br>+<br>+<br>+/* RegOokPeak (0x1B) */<br>+#define&#1=
60; MASK_OOKPEAK_THRESTYPE&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;0xc0<br>+#define&#160; MASK_OOKPEAK_THRESSTEP&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;0x38<br>+#define&#160; MASK_OOKPEAK_THRE=
SDEC&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x07<br>+<br>+=
#define&#160; OOKPEAK_THRESHTYPE_FIXED&#160;&#160; &#160;&#160;&#160; &#160=
;0x00<br>+#define&#160; OOKPEAK_THRESHTYPE_PEAK&#160;&#160; &#160;&#160;&#1=
60; &#160;0x40 /* default */<br>+#define&#160; OOKPEAK_THRESHTYPE_AVERAGE&#=
160;&#160; &#160;&#160;&#160; &#160;0x80<br>+<br>+#define&#160; OOKPEAK_THR=
ESHSTEP_0_5_DB&#160;&#160; &#160;&#160;&#160; &#160;0x00 /* default */<br>+=
#define&#160; OOKPEAK_THRESHSTEP_1_0_DB&#160;&#160; &#160;&#160;&#160; &#16=
0;0x08<br>+#define&#160; OOKPEAK_THRESHSTEP_1_5_DB&#160;&#160; &#160;&#160;=
&#160; &#160;0x10<br>+#define&#160; OOKPEAK_THRESHSTEP_2_0_DB&#160;&#160; &=
#160;&#160;&#160; &#160;0x18<br>+#define&#160; OOKPEAK_THRESHSTEP_3_0_DB&#1=
60;&#160; &#160;&#160;&#160; &#160;0x20<br>+#define&#160; OOKPEAK_THRESHSTE=
P_4_0_DB&#160;&#160; &#160;&#160;&#160; &#160;0x28<br>+#define&#160; OOKPEA=
K_THRESHSTEP_5_0_DB&#160;&#160; &#160;&#160;&#160; &#160;0x30<br>+#define&#=
160; OOKPEAK_THRESHSTEP_6_0_DB&#160;&#160; &#160;&#160;&#160; &#160;0x38<br=
>+<br>+#define&#160; OOKPEAK_THRESHDEC_ONCE&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;0x00 /* default */<br>+#define&#160; OOKPEAK_THRES=
HDEC_EVERY_2ND&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; =
OOKPEAK_THRESHDEC_EVERY_4TH&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#=
define&#160; OOKPEAK_THRESHDEC_EVERY_8TH&#160;&#160; &#160;&#160;&#160; &#1=
60;0x03<br>+#define&#160; OOKPEAK_THRESHDEC_TWICE&#160;&#160; &#160;&#160;&=
#160; &#160;0x04<br>+#define&#160; OOKPEAK_THRESHDEC_4_TIMES&#160;&#160; &#=
160;&#160;&#160; &#160;0x05<br>+#define&#160; OOKPEAK_THRESHDEC_8_TIMES&#16=
0;&#160; &#160;&#160;&#160; &#160;0x06<br>+#define&#160; OOKPEAK_THRESHDEC_=
16_TIMES&#160;&#160; &#160;&#160;&#160; &#160;0x07<br>+<br>+/*<br>+// RegOo=
kAvg<br>+#define&#160; OOKAVG_AVERAGETHRESHFILT_00&#160;&#160; &#160;&#160;=
&#160; &#160;0x00<br>+#define&#160; OOKAVG_AVERAGETHRESHFILT_01&#160;&#160;=
 &#160;&#160;&#160; &#160;0x40<br>+#define&#160; OOKAVG_AVERAGETHRESHFILT_1=
0&#160;&#160; &#160;&#160;&#160; &#160;0x80&#160; // Default<br>+#define&#1=
60; OOKAVG_AVERAGETHRESHFILT_11&#160;&#160; &#160;&#160;&#160; &#160;0xC0<b=
r>+<br>+<br>+// RegAfcFei<br>+#define&#160; AFCFEI_FEI_DONE&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;0x40<br>+#define&#160; AFCFEI_FEI_=
START&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x20<br>+#def=
ine&#160; AFCFEI_AFC_DONE&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;=
 &#160;0x10<br>+#define&#160; AFCFEI_AFCAUTOCLEAR_ON&#160;&#160; &#160;&#16=
0;&#160; &#160;&#160;&#160; &#160;0x08<br>+#define&#160; AFCFEI_AFCAUTOCLEA=
R_OFF&#160;&#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+<br>+#=
define&#160; AFCFEI_AFCAUTO_ON&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;0x04<br>+#define&#160; AFCFEI_AFCAUTO_OFF&#160;&#160; &#160;&#1=
60;&#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+<br>+#define&#=
160; AFCFEI_AFC_CLEAR&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;0x02<br>+#define&#160; AFCFEI_AFC_START&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;0x01<br>+<br>+// RegRssiConfig<br>+#define&#160; RS=
SI_FASTRX_ON&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;=
&#160; &#160;0x08<br>+#define&#160; RSSI_FASTRX_OFF&#160;&#160; &#160;&#160=
;&#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+#define&#160; RS=
SI_DONE&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160=
; &#160;0x02<br>+#define&#160; RSSI_START&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+*/<br>+<br>+/* RegDioMap=
ping1 */<br>+#define&#160; MASK_DIO0&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;0xC0<br>+#define&#160; MASK_DIO1&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x30<=
br>+#define&#160; MASK_DIO2&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;0x0C<br>+#define&#160; MASK_DIO3&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#defi=
ne&#160; SHIFT_DIO0&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;6<br>+#define&#160; SHIFT_DIO1&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;4<br>+#define&#160; SHIF=
T_DIO2&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160;=
 &#160;2<br>+#define&#160; SHIFT_DIO3&#160;&#160; &#160;&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; &#160;0<br>+<br>+/* RegDioMapping2 */<br>+#=
define&#160; MASK_DIO4&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;0xC0<br>+#define&#160; MASK_DIO5&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x30<br>+#define&#1=
60; SHIFT_DIO4&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#16=
0;&#160; &#160;6<br>+#define&#160; SHIFT_DIO5&#160;&#160; &#160;&#160;&#160=
; &#160;&#160;&#160; &#160;&#160;&#160; &#160;4<br>+<br>+/* DIO numbers */<=
br>+#define&#160; DIO0&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;&#160;&#160; &#160;0<br>+#define&#160; DIO1&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#=
160; &#160;1<br>+#define&#160; DIO2&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;2<br>+#define&#160; =
DIO3&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &=
#160;&#160;&#160; &#160;3<br>+#define&#160; DIO4&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;4<br>+#=
define&#160; DIO5&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;&#160;&#160; &#160;5<br>+<br>+/* DIO Mapping values (pack=
et mode) */<br>+#define&#160; DIO_ModeReady_DIO4&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; DIO_ModeReady_DIO5&#16=
0;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#define&#160;=
 DIO_ClkOut&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;0x00<br>+#define&#160; DIO_Data&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; DIO_Time=
Out_DIO1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#=
define&#160; DIO_TimeOut_DIO4&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#=
160; &#160;0x00<br>+#define&#160; DIO_Rssi_DIO0&#160;&#160; &#160;&#160;&#1=
60; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#define&#160; DIO_=
Rssi_DIO3_4&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br=
>+#define&#160; DIO_RxReady&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;&#160;&#160; &#160;0x02<br>+#define&#160; DIO_PLLLock&#160;&#160; =
&#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#de=
fine&#160; DIO_TxReady&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;0x01<br>+#define&#160; DIO_FifoFull_DIO1&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; DIO_Fif=
oFull_DIO3&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00<br>=
+#define&#160; DIO_SyncAddress&#160;&#160; &#160;&#160;&#160; &#160;&#160;&=
#160; &#160;0x02<br>+#define&#160; DIO_FifoNotEmpty_DIO1&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#define&#160; DIO_FifoNotEmp=
ty_FIO2&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00<br>+#d=
efine&#160; DIO_Automode&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;0x04<br>+#define&#160; DIO_FifoLevel&#160;&#160; &=
#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x00<br>+#def=
ine&#160; DIO_CrcOk&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;0x00<br>+#define&#160; DIO_PayloadReady&#160;&#160; &#1=
60;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; DIO_PacketS=
ent&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;0x00<br>+#define&#160; DIO_Dclk&#160;&#160; &#160;&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;0x00<br>+<br>+/* RegDioMapping2 CLK_OUT=
 part */<br>+#define&#160; MASK_DIOMAPPING2_CLK_OUT&#160;&#160; &#160;&#160=
;&#160; &#160;0x07<br>+<br>+#define&#160; DIOMAPPING2_CLK_OUT_NO_DIV&#160;&=
#160; &#160;&#160;&#160; &#160;0x00<br>+#define&#160; DIOMAPPING2_CLK_OUT_D=
IV_2&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; DIOMAPPING=
2_CLK_OUT_DIV_4&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#define&#160;=
 DIOMAPPING2_CLK_OUT_DIV_8&#160;&#160; &#160;&#160;&#160; &#160;0x03<br>+#d=
efine&#160; DIOMAPPING2_CLK_OUT_DIV_16&#160;&#160; &#160;&#160;&#160; &#160=
;0x04<br>+#define&#160; DIOMAPPING2_CLK_OUT_DIV_32&#160;&#160; &#160;&#160;=
&#160; &#160;0x05<br>+#define&#160; DIOMAPPING2_CLK_OUT_RC&#160;&#160; &#16=
0;&#160;&#160; &#160;&#160;&#160; &#160;0x06<br>+#define&#160; DIOMAPPING2_=
CLK_OUT_OFF&#160;&#160; &#160;&#160;&#160; &#160;0x07 /* default */<br>+<br=
>+/* RegIrqFlags1 */<br>+#define&#160; MASK_IRQFLAGS1_MODE_READY&#160;&#160=
; &#160;&#160;&#160; &#160;0x80<br>+#define&#160; MASK_IRQFLAGS1_RX_READY&#=
160;&#160; &#160;&#160;&#160; &#160;0x40<br>+#define&#160; MASK_IRQFLAGS1_T=
X_READY&#160;&#160; &#160;&#160;&#160; &#160;0x20<br>+#define&#160; MASK_IR=
QFLAGS1_PLL_LOCK&#160;&#160; &#160;&#160;&#160; &#160;0x10<br>+#define&#160=
; MASK_IRQFLAGS1_RSSI&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#1=
60;0x08<br>+#define&#160; MASK_IRQFLAGS1_TIMEOUT&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x04<br>+#define&#160; MASK_IRQFLAGS1_AUTOMOD=
E&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#define&#160; MASK_IRQFLAGS=
1_SYNC_ADDRESS_MATCH&#160;&#160; &#160;0x01<br>+<br>+/* RegIrqFlags2 */<br>=
+#define&#160; MASK_IRQFLAGS2_FIFO_FULL&#160;&#160; &#160;&#160;&#160; &#16=
0;0x80<br>+#define&#160; MASK_IRQFLAGS2_FIFO_NOT_EMPTY&#160;&#160; &#160;&#=
160;&#160; &#160;0x40<br>+#define&#160; MASK_IRQFLAGS2_FIFO_LEVEL&#160;&#16=
0; &#160;&#160;&#160; &#160;0x20<br>+#define&#160; MASK_IRQFLAGS2_FIFO_OVER=
RUN&#160;&#160; &#160;&#160;&#160; &#160;0x10<br>+#define&#160; MASK_IRQFLA=
GS2_PACKET_SENT&#160;&#160; &#160;&#160;&#160; &#160;0x08<br>+#define&#160;=
 MASK_IRQFLAGS2_PAYLOAD_READY&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>=
+#define&#160; MASK_IRQFLAGS2_CRC_OK&#160;&#160; &#160;&#160;&#160; &#160;&=
#160;&#160; &#160;0x02<br>+#define&#160; MASK_IRQFLAGS2_LOW_BAT&#160;&#160;=
 &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+<br>+/* RegSyncConfig=
 */<br>+#define&#160; MASK_SYNC_CONFIG_SYNC_ON&#160;&#160; &#160;&#160;&#16=
0; &#160;0x80 /* default */<br>+#define&#160; MASK_SYNC_CONFIG_FIFO_FILL_CO=
NDITION&#160;&#160; &#160;0x40<br>+#define&#160; MASK_SYNC_CONFIG_SYNC_SIZE=
&#160;&#160; &#160;&#160;&#160; &#160;0x38<br>+#define&#160; MASK_SYNC_CONF=
IG_SYNC_TOLERANCE&#160;&#160; &#160;0x07<br>+<br>+/* RegPacketConfig1 */<br=
>+#define&#160; MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE&#160;&#160; &#160;=
0x80<br>+#define&#160; MASK_PACKETCONFIG1_DCFREE&#160;&#160; &#160;&#160;&#=
160; &#160;&#160;&#160; &#160;0x60<br>+#define&#160; MASK_PACKETCONFIG1_CRC=
_ON&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x10 /* default=
 */<br>+#define&#160; MASK_PACKETCONFIG1_CRCAUTOCLEAR_OFF&#160;&#160; &#160=
;&#160;&#160; &#160;0x08<br>+#define&#160; MASK_PACKETCONFIG1_ADDRESSFILTER=
ING&#160;&#160; &#160;&#160;&#160; &#160;0x06<br>+<br>+#define&#160; PACKET=
CONFIG1_DCFREE_OFF&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x00 /* default */<br>+#define&#160; PACKETCONFIG1_DCFREE_MANCHESTER&#160;&=
#160; &#160;&#160;&#160; &#160;0x20<br>+#define&#160; PACKETCONFIG1_DCFREE_=
WHITENING&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x40<br>+=
#define&#160; PACKETCONFIG1_ADDRESSFILTERING_OFF&#160;&#160; &#160;&#160;&#=
160; &#160;0x00 /* default */<br>+#define&#160; PACKETCONFIG1_ADDRESSFILTER=
ING_NODE&#160;&#160; &#160;&#160;&#160; &#160;0x02<br>+#define&#160; PACKET=
CONFIG1_ADDRESSFILTERING_NODEBROADCAST&#160;&#160; &#160;0x04<br>+<br>+/*<b=
r>+// RegAutoModes<br>+#define&#160; AUTOMODES_ENTER_OFF&#160;&#160; &#160;=
&#160;&#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+#define&#16=
0; AUTOMODES_ENTER_FIFONOTEMPTY&#160;&#160; &#160;&#160;&#160; &#160;0x20<b=
r>+#define&#160; AUTOMODES_ENTER_FIFOLEVEL&#160;&#160; &#160;&#160;&#160; &=
#160;0x40<br>+#define&#160; AUTOMODES_ENTER_CRCOK&#160;&#160; &#160;&#160;&=
#160; &#160;&#160;&#160; &#160;0x60<br>+#define&#160; AUTOMODES_ENTER_PAYLO=
ADREADY&#160;&#160; &#160;&#160;&#160; &#160;0x80<br>+#define&#160; AUTOMOD=
ES_ENTER_SYNCADRSMATCH&#160;&#160; &#160;&#160;&#160; &#160;0xA0<br>+#defin=
e&#160; AUTOMODES_ENTER_PACKETSENT&#160;&#160; &#160;&#160;&#160; &#160;0xC=
0<br>+#define&#160; AUTOMODES_ENTER_FIFOEMPTY&#160;&#160; &#160;&#160;&#160=
; &#160;0xE0<br>+<br>+#define&#160; AUTOMODES_EXIT_OFF&#160;&#160; &#160;&#=
160;&#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+#define&#160;=
 AUTOMODES_EXIT_FIFOEMPTY&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+#de=
fine&#160; AUTOMODES_EXIT_FIFOLEVEL&#160;&#160; &#160;&#160;&#160; &#160;0x=
08<br>+#define&#160; AUTOMODES_EXIT_CRCOK&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;0x0C<br>+#define&#160; AUTOMODES_EXIT_PAYLOADREADY&#=
160;&#160; &#160;&#160;&#160; &#160;0x10<br>+#define&#160; AUTOMODES_EXIT_S=
YNCADRSMATCH&#160;&#160; &#160;&#160;&#160; &#160;0x14<br>+#define&#160; AU=
TOMODES_EXIT_PACKETSENT&#160;&#160; &#160;&#160;&#160; &#160;0x18<br>+#defi=
ne&#160; AUTOMODES_EXIT_RXTIMEOUT&#160;&#160; &#160;&#160;&#160; &#160;0x1C=
<br>+<br>+#define&#160; AUTOMODES_INTERMEDIATE_SLEEP&#160;&#160; &#160;&#16=
0;&#160; &#160;0x00&#160; // Default<br>+#define&#160; AUTOMODES_INTERMEDIA=
TE_STANDBY&#160;&#160; &#160;&#160;&#160; &#160;0x01<br>+#define&#160; AUTO=
MODES_INTERMEDIATE_RECEIVER&#160;&#160; &#160;0x02<br>+#define&#160; AUTOMO=
DES_INTERMEDIATE_TRANSMITTER&#160;&#160; &#160;0x03<br>+<br>+*/<br>+/* RegF=
ifoThresh (0x3c) */<br>+#define&#160; MASK_FIFO_THRESH_TXSTART&#160;&#160; =
&#160;&#160;&#160; &#160;0x80<br>+#define&#160; MASK_FIFO_THRESH_VALUE&#160=
;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x7F<br>+<br>+/*<br>+<b=
r>+// RegPacketConfig2<br>+#define&#160; PACKET2_RXRESTARTDELAY_1BIT&#160;&=
#160; &#160;&#160;&#160; &#160;0x00&#160; // Default<br>+#define&#160; PACK=
ET2_RXRESTARTDELAY_2BITS&#160;&#160; &#160;&#160;&#160; &#160;0x10<br>+#def=
ine&#160; PACKET2_RXRESTARTDELAY_4BITS&#160;&#160; &#160;&#160;&#160; &#160=
;0x20<br>+#define&#160; PACKET2_RXRESTARTDELAY_8BITS&#160;&#160; &#160;&#16=
0;&#160; &#160;0x30<br>+#define&#160; PACKET2_RXRESTARTDELAY_16BITS&#160;&#=
160; &#160;&#160;&#160; &#160;0x40<br>+#define&#160; PACKET2_RXRESTARTDELAY=
_32BITS&#160;&#160; &#160;&#160;&#160; &#160;0x50<br>+#define&#160; PACKET2=
_RXRESTARTDELAY_64BITS&#160;&#160; &#160;&#160;&#160; &#160;0x60<br>+#defin=
e&#160; PACKET2_RXRESTARTDELAY_128BITS&#160;&#160; &#160;&#160;&#160; &#160=
;0x70<br>+#define&#160; PACKET2_RXRESTARTDELAY_256BITS&#160;&#160; &#160;&#=
160;&#160; &#160;0x80<br>+#define&#160; PACKET2_RXRESTARTDELAY_512BITS&#160=
;&#160; &#160;&#160;&#160; &#160;0x90<br>+#define&#160; PACKET2_RXRESTARTDE=
LAY_1024BITS&#160;&#160; &#160;0xA0<br>+#define&#160; PACKET2_RXRESTARTDELA=
Y_2048BITS&#160;&#160; &#160;0xB0<br>+#define&#160; PACKET2_RXRESTARTDELAY_=
NONE&#160;&#160; &#160;&#160;&#160; &#160;0xC0<br>+#define&#160; PACKET2_RX=
RESTART&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x04<br>+<b=
r>+#define&#160; PACKET2_AUTORXRESTART_ON&#160;&#160; &#160;&#160;&#160; &#=
160;0x02&#160; // Default<br>+#define&#160; PACKET2_AUTORXRESTART_OFF&#160;=
&#160; &#160;&#160;&#160; &#160;0x00<br>+<br>+#define&#160; PACKET2_AES_ON&=
#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;=
0x01<br>+#define&#160; PACKET2_AES_OFF&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;0x00&#160; // Default<br>+<br>+<br>+// RegTemp1<br>+#de=
fine&#160; TEMP1_MEAS_START&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#16=
0; &#160;0x08<br>+#define&#160; TEMP1_MEAS_RUNNING&#160;&#160; &#160;&#160;=
&#160; &#160;&#160;&#160; &#160;0x04<br>+#define&#160; TEMP1_ADCLOWPOWER_ON=
&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x01&#160; // Defa=
ult<br>+#define&#160; TEMP1_ADCLOWPOWER_OFF&#160;&#160; &#160;&#160;&#160; =
&#160;&#160;&#160; &#160;0x00<br>+*/<br>+<br>+// RegTestDagc (0x6F)<br>+#de=
fine&#160; DAGC_NORMAL&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#=
160;&#160;&#160; &#160;0x00 /* Reset value */<br>+#define&#160; DAGC_IMPROV=
ED_LOWBETA1&#160;&#160; &#160;&#160;&#160; &#160;&#160;&#160; &#160;0x20<br=
>+#define&#160; DAGC_IMPROVED_LOWBETA0&#160;&#160; &#160;&#160;&#160; &#160=
;&#160;&#160; &#160;0x30 /* Recommended val */</div>
<div>&#160;</div>
<div>&#160;</div>
<div>&#160;</div>
<div>&#160;</div>
<div><br>&#62; Greg KH &#60;gregkh@linuxfoundation.org&#62; hat am 12. Juli=
 2017 um 09:43 geschrieben:<br>&#62; <br>&#62; <br>&#62; On Tue, Jul 11, 20=
17 at 06:02:09PM +0200, Marcus Wolf wrote:<br>&#62; &#62; Hi folks,<br>&#62=
; &#62; <br>&#62; &#62; I developed a radio shield for the 433MHz ISM band =
[0] for the Raspberry Pi.<br>&#62; &#62; This shield is called Pi433 [1]. I=
t can be used to communicate between two<br>&#62; &#62; Raspberries or to c=
ontrol third party equipment e. g. cheap radio sockets [2].<br>&#62; &#62; =
The base of this radio shield is a radio module from HopeRf - a rfm69cw-433=
s2.<br>&#62; &#62; <br>&#62; &#62; In the beginning, I conrolled the rf69 c=
hip by direct access via SPI, but I<br>&#62; &#62; figured out, that severa=
l tasks were hard to handle. Especially the following<br>&#62; &#62; points=
 were annoying:<br>&#62; &#62; * Just one process could open the SPI interf=
ace so just one process was<br>&#62; &#62; able to access the module<br>&#6=
2; &#62; * A simultaneous send and receive was very hard to implement<br>&#=
62; &#62; <br>&#62; &#62; Therefore I started to implement a driver.<br>&#6=
2; &#62; The drivers features:<br>&#62; &#62; * simple access/nice abstract=
ion of spi registers via open, close,<br>&#62; &#62; read, write and ioctl<=
br>&#62; &#62; * multiple applications can open<br>&#62; &#62; * tx request=
s are queued, so every app can send a tx request at any time<br>&#62; &#62;=
 * first app asking for rx will block other apps, also asking for rx until =
one<br>&#62; &#62; rx<br>&#62; &#62; cycle is complete<br>&#62; &#62; * rx =
cycle means listening on the air until something appears<br>&#62; &#62; * i=
f an app wants to tx during the driver is waiting in rx cycle, rx will be<b=
r>&#62; &#62; shortly interrupted to do the tx task<br>&#62; &#62; * for ea=
ch tx task a seperate configuration of the rf chip (bitrate,<br>&#62; &#62;=
 modulation, ...)<br>&#62; &#62; can be chosen<br>&#62; &#62; * wrtten in m=
odular architecture, allowing to extend for other products with<br>&#62; &#=
62; rf69 chip (e.g. rfm69hcw, ...) or even to support other HopeRf chips wi=
th<br>&#62; &#62; similar<br>&#62; &#62; interface (e. g. rfm12, rfm95, ...=
)<br>&#62; &#62; <br>&#62; &#62; In principle the driver was intended to be=
 used by my project (Smarthome-Pi),<br>&#62; &#62; only.<br>&#62; &#62; But=
 while having all this nice features, I was asked, whether I could offer th=
e<br>&#62; &#62; driver to the community. I never did that before, so I sta=
rted reading about<br>&#62; &#62; submitting drivers and figured out, that =
there is a lot of work to do, to meet<br>&#62; &#62; all<br>&#62; &#62; con=
cepts and ideas of complying to kernel code. I spend some days and modified=
<br>&#62; &#62; a lot, but still, a lot of things aren&#39;t perfect.<br>&#=
62; &#62; Already known tasks are:<br>&#62; &#62; <br>&#62; &#62; * coding =
style does not fully comply with the kernel style guide.<br>&#62; &#62; * s=
till TODOs, annotated in the code<br>&#62; &#62; * currently the code intro=
duces new IOCTLs. I&#39;m afraid this is a bad idea.<br>&#62; &#62; Replace=
 this with another interface, hints are welcome!<br>&#62; &#62; <br>&#62; &=
#62; I tested the patch on Raspbian with Kernel v4.12 and applied the patch=
 on<br>&#62; &#62; mainline Linux v4.12<br>&#62; &#62; <br>&#62; &#62; Is i=
t posibble to integrate into the staging area to ease further development?<=
br>&#62; <br>&#62; Sure, I&#39;m always glad to take new drivers, but can y=
ou submit it as just<br>&#62; a single patch, and keep it self-contained (i=
.e. nothing outside of<br>&#62; drivers/staging/YOUR_DRIVER/)?<br>&#62; <br=
>&#62; thanks,<br>&#62; <br>&#62; greg k-h<br>&#62; </div></body></html>
=20
------=_Part_65627_1469814005.1500117343632--
