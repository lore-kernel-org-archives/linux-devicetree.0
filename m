From: "Wolf Entwicklungen" <Marcus.Wolf-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org>
Subject: [PATCH 1/1] drivers/staging/pi433: New driver
Date: Sun, 16 Jul 2017 11:52:32 +0200
Message-ID: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
References: <20170712074305.GA20198@kroah.com>
    <197075499.65628.1500117344413@ox.hosteurope.de>
    <20170715112454.GB1753@kroah.com>
    <89433969.66090.1500123565835@ox.hosteurope.de>
    <20170715130220.GA22977@kroah.com>
    <826180465.66159.1500124248340@ox.hosteurope.de>
    <20170715131628.GA29222@kroah.com>
    <1152815224.66246.1500126030682@ox.hosteurope.de>
    <20170715134739.GA20360@kroah.com>
    <8d152de9387d8ebae5b3cd11277e8ada-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheXH4CVVE=-webmailer1@server05.webmailer.hosteurope.de>
    <20170716064546.GA11484@kroah.com>
Reply-To: Marcus.Wolf-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170716064546.GA11484-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Marcus Wolf <linux-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org>
Date: Tue,16 Jul 2017 11:52:06 +0100
Subject: [PATCH 1/1] drivers/staging/pi433: New driver

Added a driver for the pi433 radio module
(see https://www.pi433.de/en.html for details).

Signed-off-by: Marcus Wolf <linux-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org>
---
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 268d4e6..fdf060c 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -110,4 +110,6 @@ source "drivers/staging/ccree/Kconfig"

 source "drivers/staging/typec/Kconfig"

+source "drivers/staging/pi433/Kconfig"
+
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index b93e6f5..998f644 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -44,3 +44,4 @@ obj-$(CONFIG_KS7010)		+= ks7010/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= vc04_services/
 obj-$(CONFIG_CRYPTO_DEV_CCREE)	+= ccree/
+obj-$(CONFIG_PI433)		+= pi433/
diff --git a/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts b/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
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
+        compatible = "bcm,bcm2835", "bcm,bcm2708", "bcm,bcm2709";
+
+        fragment@0 {
+                target = <&spi0>;
+                __overlay__ {
+                        status = "okay";
+
+                        spidev@0{
+                                status = "disabled";
+                        };
+
+                        spidev@1{
+                                status = "disabled";
+                        };
+                };
+        };
+
+	fragment@1 {
+		target = <&gpio>;
+		__overlay__ {
+			pi433_pins: pi433_pins {
+				brcm,pins = <7 25 24>;
+				brcm,function = <0 0 0>; // in in in
+			};
+		};
+	};
+
+	fragment@2 {
+		target = <&spi0>;
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			pi433: pi433@0 {
+				compatible = "Smarthome-Wolf,pi433";
+				reg = <0>;
+				spi-max-frequency = <10000000>;
+				status = "okay";
+
+				pinctrl-0 = <&pi433_pins>;
+				DIO0-gpio = <&gpio 24 0>;
+				DIO1-gpio = <&gpio 25 0>;
+				DIO2-gpio = <&gpio  7 0>;
+			};
+		};
+	};
+};
diff --git a/drivers/staging/pi433/Documentation/devicetree/pi433.txt b/drivers/staging/pi433/Documentation/devicetree/pi433.txt
new file mode 100644
index 0000000..14197c6
--- /dev/null
+++ b/drivers/staging/pi433/Documentation/devicetree/pi433.txt
@@ -0,0 +1,62 @@
+* Smarthome-Wolf Pi433 - a 433MHz radio module/shield for Raspberry Pi (see www.pi433.de)
+
+Required properties:
+- compatible: must be "Smarthome-Wolf,pi433"
+- reg: chip select of SPI Interface
+- DIOx-gpio must be dedicated to the GPIO, connected with DIOx of the RFM69 module
+
+
+Example:
+
+With the following lines in gpio-section, the gpio pins, connected with pi433 are
+reserved/declared.
+
+&gpio{
+	[...]
+
+	pi433_pins: pi433_pins {
+		brcm,pins = <7 25 24>;
+		brcm,function = <0 0 0>; // in in in
+	};
+
+	[...]
+}
+
+With the following lines in spi section, the device pi433 is declared.
+It consists of the three gpio pins and an spi interface (here chip select 0)
+
+&spi0{
+	[...]
+
+	pi433: pi433@0 {
+		compatible = "Smarthome-Wolf,pi433";
+		reg = <0>; /* CE 0 */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		spi-max-frequency = <10000000>;
+
+		pinctrl-0 = <&pi433_pins>;
+		DIO0-gpio = <&gpio 24 0>;
+		DIO1-gpio = <&gpio 25 0>;
+		DIO2-gpio = <&gpio  7 0>;
+	};
+}
+
+
+
+For Raspbian users only
+=======================
+Since Raspbian supports device tree overlays, you may use and overlay, instead
+of editing your boards device tree.
+For using the overlay, you need to compile the file pi433-overlay.dts you can
+find aside to this documentation.
+The file needs to be compiled - either manually or by integration in your kernel
+source tree. For a manual compile, you may use a command line like the following:
+'linux/scripts/dtc/dtc -@ -I dts -O dtb -o pi433.dtbo pi433-overlay.dts'
+
+For compiling inside of the kernel tree, you need to copy pi433-overlay.dts to
+arch/arm/boot/dts/overlays and you need to add the file to the list of files
+in the Makefile over there. Execute 'make dtbs' in kernel tree root to make the
+kernel make files compile the device tree overlay for you.
+
+
diff --git a/drivers/staging/pi433/Documentation/pi433.txt b/drivers/staging/pi433/Documentation/pi433.txt
new file mode 100644
index 0000000..860dd0f
--- /dev/null
+++ b/drivers/staging/pi433/Documentation/pi433.txt
@@ -0,0 +1,274 @@
+=====
+Pi433
+=====
+
+
+Introduction
+============
+This driver is for controlling pi433, a radio module for the Raspberry Pi
+(www.pi433.de). It supports transmission and reception. It can be opened
+by multiple applications for transmission and reception. While transmit
+jobs were queued and process automatically in the background, the first
+application asking for reception will block out all other applications
+until something gets received terminates the read request.
+The driver supports on the fly reloading of the hardware fifo of the rf
+chip, thus enabling for much longer telegrams then hardware fifo size.
+
+Discription of driver operation
+===============================
+
+a) transmission
+
+Each transmission can take place with a different configuration of the rf
+module. Therfore each application can set its own set of parameters. The driver
+takes care, that each transmission takes place with the parameterset of the
+application, that requests the transmission. To allow the transmission to take
+place in the background, a tx thread is introduced.
+The transfer of data from the main thread to the tx thread is realised by a
+kfifo. With each write request of an application, the passed in data and the
+corresponding parameter set gets written to the kfifo.
+On the other "side" of the kfifo, the tx thread continuously checks, whether the
+kfifo is empty. If not, it gets one set of config and data from the kfifo. If
+there is no receive request or the receiver is still waiting for something in
+the air, the rf module is set to standby, the parameters for transmission gets
+set, the hardware fifo of the rf chip gets preloaded and the transmission gets
+started. Upon hardware fifo threshold interrupt it gets reloaded, thus enabling
+much longer telegrams then hardware fifo size. If the telegram is send and there
+is more data available in the kfifo, the procedure is repeated. If not the
+transmission cycle ends.
+
+b) reception
+
+Since there is only one application allowed to receive data at a time, for
+reception there is only one configuration set.
+As soon as an application sets an request for receiving a telegram, the reception
+configuration set is written to the rf module and it gets set into receiving mode.
+Now the driver is waiting, that a predefined RSSI level (signal strength at the
+receiver) is reached. Until this hasn't happened, the reception can be
+interrupted by the transmission thread at any time to insert a transmission cycle.
+As soon as the predefined RSSI level is meat, a receiving cycle starts. Similar
+as described for the transmission cycle the read out of the hardware fifo is done
+dynamically. Upon each hardware fifo threshold interrupt, a portion of data gets
+read. So also for reception it is possible to receive more data then the hardware
+fifo can hold.
+
+
+Driver API
+==========
+
+The driver is currently implemented as a character device. Therefore it supports
+the calls open, ioctl, read, write and close.
+
+
+params for ioctl
+----------------
+
+There are four options:
+PI433_IOC_RD_TX_CFG - get the transmission parameters from the driver
+PI433_IOC_WR_TX_CFG - set the transmission parameters
+PI433_IOC_RD_RX_CFG - get the receiving parameters from the driver
+PI433_IOC_WR_RX_CFG - set the receiving parameters
+
+The tx configuration is transfered via struct pi433_tx_cfg, the parameterset for transmission.
+It is devided into two sections: rf parameters and packet format.
+
+rf params:
+	frequency
+		frequency used for transmission.
+		Allowed values: 433050000...434790000
+	bit_rate
+		bit rate used for transmission.
+		Allowed values: #####
+	dev_frequency
+		frequency deviation in case of FSK.
+		Allowed values: 600...500000
+	modulation
+		FSK - frequency shift key
+		OOK - On-Off-key
+	modShaping
+		shapingOff	- no shaping
+		shaping1_0	- gauss filter with BT 1 (FSK only)
+		shaping0_5	- gauss filter with BT 0.5 (FSK only)
+		shaping0_3	- gauss filter with BT 0.3 (FSK only)
+		shapingBR	- filter cut off at BR (OOK only)
+		shaping2BR	- filter cut off at 2*BR (OOK only)
+	paRamp (FSK only)
+		ramp3400	- amp ramps up in 3.4ms
+		ramp2000	- amp ramps up in 2.0ms
+		ramp1000	- amp ramps up in 1ms
+		ramp500		- amp ramps up in 500us
+		ramp250		- amp ramps up in 250us
+		ramp125		- amp ramps up in 125us
+		ramp100		- amp ramps up in 100us
+		ramp62		- amp ramps up in 62us
+		ramp50		- amp ramps up in 50us
+		ramp40		- amp ramps up in 40us
+		ramp31		- amp ramps up in 31us
+		ramp25		- amp ramps up in 25us
+		ramp20		- amp ramps up in 20us
+		ramp15		- amp ramps up in 15us
+		ramp12		- amp ramps up in 12us
+		ramp10		- amp ramps up in 10us
+	tx_start_condition
+		fifoLevel	- transmission starts, if fifo is filled to
+				  threshold level
+		fifoNotEmpty	- transmission starts, as soon as there is one
+				  byte in internal fifo
+	repetitions
+		This gives the option, to send a telegram multiple times. Default: 1
+
+packet format:
+	enable_preamble
+		optionOn	- a preamble will be automatically generated
+		optionOff	- no preamble will be generated
+	enable_sync
+		optionOn	- a sync word will be automatically added to
+				  the telegram after preamble
+		optionOff	- no sync word will be added
+		Attention: While possible to generate sync without preamble, the
+		receiver won't be able to detect the sync without preamble.
+	enable_length_byte
+		optionOn	- the length of the telegram will be automatically
+				  added to the telegram. It's part of the payload
+		optionOff	- no length information will be automatically added
+				  to the telegram.
+		Attention: For telegram length over 255 bytes, this option can't be used
+		Attention: should be used in combination with sync, only
+	enable_address_byte
+		optionOn	- the address byte will be automatically added to the
+				  telgram. It's part of the payload
+		optionOff	- the address byte will not be added to the telegram.
+		The address byte can be used for address filtering, so the receiver
+		will only receive telegrams with a given address byte.
+		Attention: should be used in combination with sync, only
+	enable_crc
+		optionOn	- an crc will be automatically calculated over the
+				  payload of the telegram and added to the telegram
+				  after payload.
+		optionOff	- no crc will be calculated
+	preamble_length
+		length of the preamble. Allowed values: 0...65536
+	sync_length
+		length of the sync word. Allowed values: 0...8
+	fixed_message_length
+		length of the payload of the telegram. Will override the length
+		given by the buffer, passed in with the write command. Will be
+		ignored if set to zero.
+	sync_pattern[8]
+		contains up to eight values, that are used as the sync pattern
+		on sync option
+	address_byte
+		one byte, used as address byte on address byte option.
+
+
+The rx configuration is transfered via struct pi433_rx_cfg, the parameterset for receiving. It is devided into two sections: rf parameters and packet format.
+
+rf params:
+	frequency
+		frequency used for transmission.
+		Allowed values: 433050000...434790000
+	bit_rate
+		bit rate used for transmission.
+		Allowed values: #####
+	dev_frequency
+		frequency deviation in case of FSK.
+		Allowed values: 600...500000
+	modulation
+		FSK - frequency shift key
+		OOK - on off key
+	rssi_threshold
+		threshold value for the signal strength on the receiver input.
+		If this value is exeeded, a reception cycle starts
+		Allowed values: 0...255
+	thresholdDecrement
+		in order to adapt to different levels of singnal strength, over
+		time the receiver gets more and more sensitive. This value
+		determs, how fast the sensitivity increases.
+		step_0_5db	- increase in 0,5dB steps
+		step_1_0db	- increase in 1 db steps
+		step_1_5db	- increase in 1,5dB steps
+		step_2_0db	- increase in 2 db steps
+		step_3_0db	- increase in 3 db steps
+		step_4_0db	- increase in 4 db steps
+		step_5_0db	- increase in 5 db steps
+		step_6_0db	- increase in 6 db steps
+	antennaImpedance
+		sets the electrical adoption of the antenna
+		fiftyOhm	- for antennas with an impedance of 50Ohm
+		twohundretOhm	- for antennas with an impedance of 200Ohm
+	lnaGain
+		sets the gain of the low noise amp
+		automatic	- lna gain is determed by an agc
+		max		- lna gain is set to maximum
+		maxMinus6	- lna gain is set to  6db below max
+		maxMinus12	- lna gain is set to 12db below max
+		maxMinus24	- lna gain is set to 24db below max
+		maxMinus36	- lna gain is set to 36db below max
+		maxMinus48	- lna gain is set to 48db below max
+	bw_mantisse
+		sets the bandwidth of the channel filter - part one: mantisse.
+		mantisse16	- mantisse is set to 16
+		mantisse20	- mantisse is set to 20
+		mantisse24	- mantisse is set to 24
+	bw_exponent
+		sets the bandwidth of the channel filter - part two: exponent.
+		Allowd values: 0...7
+	dagc;
+		operation mode of the digital automatic gain control
+		normalMode
+		improve
+		improve4LowModulationIndex
+
+ packet format:
+	enable_sync
+		optionOn  - sync detection is enabled. If configured sync pattern
+			    isn't found, telegram will be internally discarded
+		optionOff - sync detection is disabled.
+	enable_length_byte
+		optionOn   - First byte of payload will be used as length byte,
+			     regardless of the amount of bytes that were requested
+			     by the read request.
+		optionOff  - Number of bytes to be read will be set according to
+			     amount of bytes that were requested by the read request.
+		Attention: should be used in combination with sync, only
+	enable_address_filtering;
+		filteringOff		- no adress filtering will take place
+		nodeAddress		- all telegrams, not matching the node
+					  address will be internally discarded
+		nodeOrBroadcastAddress	- all telegrams, neither matching the
+					  node, nor the broadcast address will
+					  be internally discarded
+		Attention: Sync option must be enabled in order to use this feature
+	enable_crc
+		optionOn	- a crc will be calculated over the payload of
+				  the telegram, that was received. If the
+				  calculated crc doesn't match to two bytes,
+				  that follow the payload, the telegram will be
+				  internally discarded.
+		Attention: This option is only operational, if sync on and fixed length
+		or length byte is used
+	sync_length
+		Gives the length of the payload.
+		Attention: This setting must meet the setting of the transmitter,
+		if sync option is used.
+	fixed_message_length
+		Overrides the telegram length either given by the first byte of
+		payload or by the read request.
+	bytes_to_drop
+		gives the number of bytes, that will be dropped before transfering
+		data to the read buffer
+		This option is only usefull, if all packet helper are switched
+		off and the rf chip is used in raw receiving mode. This may be
+		needed, if a telegram of a third party device should be received,
+		using a protocol not compatible with the packet engine of the rf69 chip.
+	sync_pattern[8]
+		contains up to eight values, that are used as the sync pattern
+		on sync option.
+		This setting must meet the configuration of the transmitting device,
+		if sync option is enabled.
+	node_address
+		one byte, used as node address byte on address byte option.
+	broadcast_address
+		one byte, used as broadcast address byte on address byte option.
+
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
+          This option allows you to enable support for the radio module Pi433.
+
+          Pi433 is a shield that fits onto the GPIO header of a Raspberry Pi
+          or compatible. It extends the Raspberry Pi with the option, to
+          send and receive data in the 433MHz ISM band - for example to
+          communicate between two systems without using ethernet or bluetooth
+          or for control or read sockets, actors, sensors, widely available
+          for low price.
+
+          For details or the option to buy, please visit https://pi433.de/en.html
+
+          If in doubt, say N here, but saying yes most probably won't hurt
diff --git a/drivers/staging/pi433/Makefile b/drivers/staging/pi433/Makefile
new file mode 100644
index 0000000..417f3e4
--- /dev/null
+++ b/drivers/staging/pi433/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_PI433) += pi433.o
+
+pi433-objs := pi433_if.o rf69.o
diff --git a/drivers/staging/pi433/TODO b/drivers/staging/pi433/TODO
new file mode 100644
index 0000000..63a40bf
--- /dev/null
+++ b/drivers/staging/pi433/TODO
@@ -0,0 +1,5 @@
+* coding style does not fully comply with the kernel style guide.
+* still TODOs, annotated in the code
+* currently the code introduces new IOCTLs. I'm afraid this is a bad idea.
+  -> Replace this with another interface, hints are welcome!
+* Some missing data (marked with ###) needs to be added in the documentation
diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
new file mode 100644
index 0000000..541ca78
--- /dev/null
+++ b/drivers/staging/pi433/pi433_if.c
@@ -0,0 +1,1314 @@
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
+ *	Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
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
+#define N_PI433_MINORS			(1U << MINORBITS) /*32*/	/* ... up to 256 */
+#define MAX_MSG_SIZE			900	/* min: FIFO_SIZE! */
+#define MSG_FIFO_SIZE			65536   /* 65536 = 2^16  */
+#define NUM_DIO				2
+
+static dev_t pi433_dev;
+static DEFINE_IDR(pi433_idr);
+static DEFINE_MUTEX(minor_lock); /* Protect idr accesses */
+
+static struct class *pi433_class; /* mainly for udev to create /dev/pi433 */
+
+/* tx config is instance specific
+	so with each open a new tx config struct is needed */
+/* rx config is device specific
+	so we have just one rx config, ebedded in device struct */
+struct pi433_device {
+	/* device handling related values */
+	dev_t			devt;
+	int			minor;
+	struct device		*dev;
+	struct cdev		*cdev;
+	struct spi_device	*spi;
+	unsigned		users;
+
+	/* irq related values */
+	struct gpio_desc	*gpiod[NUM_DIO];
+	int			irq_num[NUM_DIO];
+	u8			irq_state[NUM_DIO];
+
+	/* tx related values */
+	STRUCT_KFIFO_REC_1(MSG_FIFO_SIZE) tx_fifo;
+	struct mutex		tx_fifo_lock; // TODO: check, whether necessary or obsolete
+	struct task_struct	*tx_task_struct;
+	wait_queue_head_t	tx_wait_queue;
+	u8			free_in_fifo;
+
+	/* rx related values */
+	struct pi433_rx_cfg	rx_cfg;
+	u8			*rx_buffer;
+	unsigned int		rx_buffer_size;
+	u32			rx_bytes_to_drop;
+	u32			rx_bytes_dropped;
+	unsigned int		rx_position;
+	struct mutex		rx_lock;
+	wait_queue_head_t	rx_wait_queue;
+
+	/* fifo wait queue */
+	struct task_struct	*fifo_task_struct;
+	wait_queue_head_t	fifo_wait_queue;
+
+	/* flags */
+	bool			rx_active;
+	bool			tx_active;
+	bool			interrupt_rx_allowed;
+};
+
+struct pi433_instance {
+	struct pi433_device	*device;
+	struct pi433_tx_cfg	tx_cfg;
+};
+
+/*-------------------------------------------------------------------------*/
+
+/* macro for checked access of registers of radio module */
+#define SET_CHECKED(retval) \
+	if (retval < 0) \
+		return retval;
+
+/*-------------------------------------------------------------------------*/
+
+/* GPIO interrupt handlers */
+static irq_handler_t
+DIO0_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
+{
+	struct pi433_device *device = dev_id;
+
+	if      (device->irq_state[DIO0] == DIO_PacketSent)
+	{
+		device->free_in_fifo = FIFO_SIZE;
+		printk("DIO0 irq: Packet sent\n"); // TODO: printk() should include KERN_ facility level
+		wake_up_interruptible(&device->fifo_wait_queue);
+	}
+	else if (device->irq_state[DIO0] == DIO_Rssi_DIO0)
+	{
+		printk("DIO0 irq: RSSI level over threshold\n");
+		wake_up_interruptible(&device->rx_wait_queue);
+	}
+	else if (device->irq_state[DIO0] == DIO_PayloadReady)
+	{
+		printk("DIO0 irq: PayloadReady\n");
+		device->free_in_fifo = 0;
+		wake_up_interruptible(&device->fifo_wait_queue);
+	}
+
+	return (irq_handler_t) IRQ_HANDLED;
+}
+
+static irq_handler_t
+DIO1_irq_handler(unsigned int irq, void *dev_id, struct pt_regs *regs)
+{
+	struct pi433_device *device = dev_id;
+
+	if      (device->irq_state[DIO1] == DIO_FifoNotEmpty_DIO1)
+	{
+		device->free_in_fifo = FIFO_SIZE;
+	}
+	else if (device->irq_state[DIO1] == DIO_FifoLevel)
+	{
+		if (device->rx_active)	device->free_in_fifo = FIFO_THRESHOLD - 1;
+		else			device->free_in_fifo = FIFO_SIZE - FIFO_THRESHOLD - 1;
+	}
+	printk("DIO1 irq: %d bytes free in fifo\n", device->free_in_fifo); // TODO: printk() should include KERN_ facility level
+	wake_up_interruptible(&device->fifo_wait_queue);
+
+	return (irq_handler_t) IRQ_HANDLED;
+}
+
+static void *DIO_irq_handler[NUM_DIO] = {
+	DIO0_irq_handler,
+	DIO1_irq_handler
+};
+
+/*-------------------------------------------------------------------------*/
+
+static int
+rf69_set_rx_cfg(struct pi433_device *dev, struct pi433_rx_cfg *rx_cfg)
+{
+	int payload_length;
+
+	/* receiver config */
+	SET_CHECKED(rf69_set_frequency	(dev->spi, rx_cfg->frequency));
+	SET_CHECKED(rf69_set_bit_rate	(dev->spi, rx_cfg->bit_rate));
+	SET_CHECKED(rf69_set_modulation	(dev->spi, rx_cfg->modulation));
+	SET_CHECKED(rf69_set_antenna_impedance	 (dev->spi, rx_cfg->antenna_impedance));
+	SET_CHECKED(rf69_set_rssi_threshold	 (dev->spi, rx_cfg->rssi_threshold));
+	SET_CHECKED(rf69_set_ook_threshold_dec	 (dev->spi, rx_cfg->thresholdDecrement));
+	SET_CHECKED(rf69_set_bandwidth 		 (dev->spi, rx_cfg->bw_mantisse, rx_cfg->bw_exponent));
+	SET_CHECKED(rf69_set_bandwidth_during_afc(dev->spi, rx_cfg->bw_mantisse, rx_cfg->bw_exponent));
+	SET_CHECKED(rf69_set_dagc 		 (dev->spi, rx_cfg->dagc));
+
+	dev->rx_bytes_to_drop = rx_cfg->bytes_to_drop;
+
+	/* packet config */
+	/* enable */
+	SET_CHECKED(rf69_set_sync_enable(dev->spi, rx_cfg->enable_sync));
+	if (rx_cfg->enable_sync == optionOn)
+	{
+		SET_CHECKED(rf69_set_fifo_fill_condition(dev->spi, afterSyncInterrupt));
+	}
+	else
+	{
+		SET_CHECKED(rf69_set_fifo_fill_condition(dev->spi, always));
+	}
+	SET_CHECKED(rf69_set_packet_format  (dev->spi, rx_cfg->enable_length_byte));
+	SET_CHECKED(rf69_set_adressFiltering(dev->spi, rx_cfg->enable_address_filtering));
+	SET_CHECKED(rf69_set_crc_enable	    (dev->spi, rx_cfg->enable_crc));
+
+	/* lengths */
+	SET_CHECKED(rf69_set_sync_size(dev->spi, rx_cfg->sync_length));
+	if (rx_cfg->enable_length_byte == optionOn)
+	{
+		SET_CHECKED(rf69_set_payload_length(dev->spi, 0xff));
+	}
+	else if (rx_cfg->fixed_message_length != 0)
+	{
+		payload_length = rx_cfg->fixed_message_length;
+		if (rx_cfg->enable_length_byte  == optionOn) payload_length++;
+		if (rx_cfg->enable_address_filtering != filteringOff) payload_length++;
+		SET_CHECKED(rf69_set_payload_length(dev->spi, payload_length));
+	}
+	else
+	{
+		SET_CHECKED(rf69_set_payload_length(dev->spi, 0));
+	}
+
+	/* values */
+	if (rx_cfg->enable_sync == optionOn)
+	{
+		SET_CHECKED(rf69_set_sync_values(dev->spi, rx_cfg->sync_pattern));
+	}
+	if (rx_cfg->enable_address_filtering != filteringOff)
+	{
+		SET_CHECKED(rf69_set_node_address     (dev->spi, rx_cfg->node_address));
+		SET_CHECKED(rf69_set_broadcast_address(dev->spi, rx_cfg->broadcast_address));
+	}
+
+	return 0;
+}
+
+static int
+rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
+{
+	SET_CHECKED(rf69_set_frequency	(dev->spi, tx_cfg->frequency));
+	SET_CHECKED(rf69_set_bit_rate	(dev->spi, tx_cfg->bit_rate));
+	SET_CHECKED(rf69_set_modulation	(dev->spi, tx_cfg->modulation));
+	SET_CHECKED(rf69_set_deviation	(dev->spi, tx_cfg->dev_frequency));
+	SET_CHECKED(rf69_set_pa_ramp	(dev->spi, tx_cfg->pa_ramp));
+	SET_CHECKED(rf69_set_modulation_shaping(dev->spi, tx_cfg->modShaping));
+	SET_CHECKED(rf69_set_tx_start_condition(dev->spi, tx_cfg->tx_start_condition));
+
+	/* packet format enable */
+	if (tx_cfg->enable_preamble == optionOn)
+	{
+		SET_CHECKED(rf69_set_preamble_length(dev->spi, tx_cfg->preamble_length));
+	}
+	else
+	{
+		SET_CHECKED(rf69_set_preamble_length(dev->spi, 0));
+	}
+	SET_CHECKED(rf69_set_sync_enable  (dev->spi, tx_cfg->enable_sync));
+	SET_CHECKED(rf69_set_packet_format(dev->spi, tx_cfg->enable_length_byte));
+	SET_CHECKED(rf69_set_crc_enable	  (dev->spi, tx_cfg->enable_crc));
+
+	/* configure sync, if enabled */
+	if (tx_cfg->enable_sync == optionOn)
+	{
+		SET_CHECKED(rf69_set_sync_size(dev->spi, tx_cfg->sync_length));
+		SET_CHECKED(rf69_set_sync_values(dev->spi, tx_cfg->sync_pattern));
+	}
+
+	return 0;
+}
+
+/*-------------------------------------------------------------------------*/
+
+static int
+pi433_start_rx(struct pi433_device *dev)
+{
+	int retval;
+
+	/* return without action, if no pending read request */
+	if (!dev->rx_active)
+		return 0;
+
+	/* setup for receiving */
+	retval = rf69_set_rx_cfg(dev, &dev->rx_cfg);
+	if (retval) return retval;
+
+	/* setup rssi irq */
+	SET_CHECKED(rf69_set_dio_mapping(dev->spi, DIO0, DIO_Rssi_DIO0));
+	dev->irq_state[DIO0] = DIO_Rssi_DIO0;
+	irq_set_irq_type(dev->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
+
+	/* setup fifo level interrupt */
+	SET_CHECKED(rf69_set_fifo_threshold(dev->spi, FIFO_SIZE - FIFO_THRESHOLD));
+	SET_CHECKED(rf69_set_dio_mapping(dev->spi, DIO1, DIO_FifoLevel));
+	dev->irq_state[DIO1] = DIO_FifoLevel;
+	irq_set_irq_type(dev->irq_num[DIO1], IRQ_TYPE_EDGE_RISING);
+
+	/* set module to receiving mode */
+	SET_CHECKED(rf69_set_mode(dev->spi, receive));
+
+	return 0;
+}
+
+
+/*-------------------------------------------------------------------------*/
+
+int
+pi433_receive(void *data)
+{
+	struct pi433_device *dev = data;
+	struct spi_device *spi = dev->spi; /* needed for SET_CHECKED */
+	int bytes_to_read, bytes_total;
+	int retval;
+
+	dev->interrupt_rx_allowed = false;
+
+	/* wait for any tx to finish */
+	dev_dbg(dev->dev,"rx: going to wait for any tx to finish");
+	retval = wait_event_interruptible(dev->rx_wait_queue, !dev->tx_active);
+	if(retval) /* wait was interrupted */
+	{
+		dev->interrupt_rx_allowed = true;
+		wake_up_interruptible(&dev->tx_wait_queue);
+		return retval;
+	}
+
+	/* prepare status vars */
+	dev->free_in_fifo = FIFO_SIZE;
+	dev->rx_position = 0;
+	dev->rx_bytes_dropped = 0;
+
+	/* setup radio module to listen for something "in the air" */
+	retval = pi433_start_rx(dev);
+	if (retval)
+		return retval;
+
+	/* now check RSSI, if low wait for getting high (RSSI interrupt) */
+	while ( !rf69_get_flag(dev->spi, rssiExceededThreshold) )
+	{
+		/* allow tx to interrupt us while waiting for high RSSI */
+		dev->interrupt_rx_allowed = true;
+		wake_up_interruptible(&dev->tx_wait_queue);
+
+		/* wait for RSSI level to become high */
+		dev_dbg(dev->dev, "rx: going to wait for high RSSI level");
+		retval = wait_event_interruptible(dev->rx_wait_queue,
+			                          rf69_get_flag(dev->spi,
+		                                                rssiExceededThreshold));
+		if (retval) goto abort; /* wait was interrupted */
+		dev->interrupt_rx_allowed = false;
+
+		/* cross check for ongoing tx */
+		if (!dev->tx_active) break;
+	}
+
+	/* configure payload ready irq */
+	SET_CHECKED(rf69_set_dio_mapping(spi, DIO0, DIO_PayloadReady));
+	dev->irq_state[DIO0] = DIO_PayloadReady;
+	irq_set_irq_type(dev->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
+
+	/* fixed or unlimited length? */
+	if (dev->rx_cfg.fixed_message_length != 0)
+	{
+		if (dev->rx_cfg.fixed_message_length > dev->rx_buffer_size)
+		{
+			retval = -1;
+			goto abort;
+		}
+		bytes_total = dev->rx_cfg.fixed_message_length;
+		dev_dbg(dev->dev,"rx: msg len set to %d by fixed length", bytes_total);
+	}
+	else
+	{
+		bytes_total = dev->rx_buffer_size;
+		dev_dbg(dev->dev, "rx: msg len set to %d as requested by read", bytes_total);
+	}
+
+	/* length byte enabled? */
+	if (dev->rx_cfg.enable_length_byte == optionOn)
+	{
+		retval = wait_event_interruptible(dev->fifo_wait_queue,
+						  dev->free_in_fifo < FIFO_SIZE);
+		if (retval) goto abort; /* wait was interrupted */
+
+		rf69_read_fifo(spi, (u8 *)&bytes_total, 1);
+		if (bytes_total > dev->rx_buffer_size)
+		{
+			retval = -1;
+			goto abort;
+		}
+		dev->free_in_fifo++;
+		dev_dbg(dev->dev, "rx: msg len reset to %d due to length byte", bytes_total);
+	}
+
+	/* address byte enabled? */
+	if (dev->rx_cfg.enable_address_filtering != filteringOff)
+	{
+		u8 dummy;
+
+		bytes_total--;
+
+		retval = wait_event_interruptible(dev->fifo_wait_queue,
+						  dev->free_in_fifo < FIFO_SIZE);
+		if (retval) goto abort; /* wait was interrupted */
+
+		rf69_read_fifo(spi, &dummy, 1);
+		dev->free_in_fifo++;
+		dev_dbg(dev->dev, "rx: address byte stripped off");
+	}
+
+	/* get payload */
+	while (dev->rx_position < bytes_total)
+	{
+		if ( !rf69_get_flag(dev->spi, payloadReady) )
+		{
+			retval = wait_event_interruptible(dev->fifo_wait_queue,
+							  dev->free_in_fifo < FIFO_SIZE);
+			if (retval) goto abort; /* wait was interrupted */
+		}
+
+		/* need to drop bytes or acquire? */
+		if (dev->rx_bytes_to_drop > dev->rx_bytes_dropped)
+			bytes_to_read = dev->rx_bytes_to_drop - dev->rx_bytes_dropped;
+		else
+			bytes_to_read = bytes_total - dev->rx_position;
+
+
+		/* access the fifo */
+		if (bytes_to_read > FIFO_SIZE - dev->free_in_fifo)
+			bytes_to_read = FIFO_SIZE - dev->free_in_fifo;
+		retval = rf69_read_fifo(spi,
+					&dev->rx_buffer[dev->rx_position],
+					bytes_to_read);
+		if (retval) goto abort; /* read failed */
+		dev->free_in_fifo += bytes_to_read;
+
+		/* adjust status vars */
+		if (dev->rx_bytes_to_drop > dev->rx_bytes_dropped)
+			dev->rx_bytes_dropped += bytes_to_read;
+		else
+			dev->rx_position += bytes_to_read;
+	}
+
+
+	/* rx done, wait was interrupted or error occured */
+abort:
+	dev->interrupt_rx_allowed = true;
+	SET_CHECKED(rf69_set_mode(dev->spi, standby));
+	wake_up_interruptible(&dev->tx_wait_queue);
+
+	if (retval)
+		return retval;
+	else
+		return bytes_total;
+}
+
+int
+pi433_tx_thread(void *data)
+{
+	struct pi433_device *device = data;
+	struct spi_device *spi = device->spi; /* needed for SET_CHECKED */
+	struct pi433_tx_cfg tx_cfg;
+	u8     buffer[MAX_MSG_SIZE];
+	size_t size;
+	bool   rx_interrupted = false;
+	int    position, repetitions;
+	int    retval;
+
+	while (1)
+	{
+		/* wait for fifo to be populated or for request to terminate*/
+		dev_dbg(device->dev, "thread: going to wait for new messages");
+		wait_event_interruptible(device->tx_wait_queue,
+					 ( !kfifo_is_empty(&device->tx_fifo) ||
+					    kthread_should_stop() ));
+		if ( kthread_should_stop() )
+			return 0;
+
+		/* get data from fifo in the following order:
+		   - tx_cfg
+		   - size of message
+		   - message */
+		mutex_lock(&device->tx_fifo_lock);
+
+		retval = kfifo_out(&device->tx_fifo, &tx_cfg, sizeof(tx_cfg));
+		if (retval != sizeof(tx_cfg))
+		{
+			dev_dbg(device->dev, "reading tx_cfg from fifo failed: got %d byte(s), expected %d", retval, (unsigned int)sizeof(tx_cfg) );
+			mutex_unlock(&device->tx_fifo_lock);
+			continue;
+		}
+
+		retval = kfifo_out(&device->tx_fifo, &size, sizeof(size_t));
+		if (retval != sizeof(size_t))
+		{
+			dev_dbg(device->dev, "reading msg size from fifo failed: got %d, expected %d", retval, (unsigned int)sizeof(size_t) );
+			mutex_unlock(&device->tx_fifo_lock);
+			continue;
+		}
+
+		/* use fixed message length, if requested */
+		if (tx_cfg.fixed_message_length != 0)
+			size = tx_cfg.fixed_message_length;
+
+		/* increase size, if len byte is requested */
+		if (tx_cfg.enable_length_byte == optionOn)
+			size++;
+
+		/* increase size, if adr byte is requested */
+		if (tx_cfg.enable_address_byte == optionOn)
+			size++;
+
+		/* prime buffer */
+		memset(buffer, 0, size);
+		position = 0;
+
+		/* add length byte, if requested */
+		if (tx_cfg.enable_length_byte  == optionOn)
+			buffer[position++] = size-1; /* according to spec length byte itself must be excluded from the length calculation */
+
+		/* add adr byte, if requested */
+		if (tx_cfg.enable_address_byte == optionOn)
+			buffer[position++] = tx_cfg.address_byte;
+
+		/* finally get message data from fifo */
+		retval = kfifo_out(&device->tx_fifo, &buffer[position], sizeof(buffer)-position );
+		dev_dbg(device->dev, "read %d message byte(s) from fifo queue.", retval);
+		mutex_unlock(&device->tx_fifo_lock);
+
+		/* if rx is active, we need to interrupt the waiting for
+		   incoming telegrams, to be able to send something.
+		   We are only allowed, if currently no reception takes
+		   place otherwise we need to  wait for the incoming telegram
+		   to finish */
+		wait_event_interruptible(device->tx_wait_queue,
+					 !device->rx_active ||
+					  device->interrupt_rx_allowed == true);
+
+		/* prevent race conditions
+		   irq will be reenabled after tx config is set */
+		disable_irq(device->irq_num[DIO0]);
+		device->tx_active = true;
+
+		if (device->rx_active && rx_interrupted == false)
+		{
+			/* rx is currently waiting for a telegram;
+			   we need to set the radio module to standby */
+			SET_CHECKED(rf69_set_mode(device->spi, standby));
+			rx_interrupted = true;
+		}
+
+		/* clear fifo, set fifo threshold, set payload length */
+		SET_CHECKED(rf69_set_mode(spi, standby)); /* this clears the fifo */
+		SET_CHECKED(rf69_set_fifo_threshold(spi, FIFO_THRESHOLD));
+		if (tx_cfg.enable_length_byte == optionOn)
+		{
+			SET_CHECKED(rf69_set_payload_length(spi, size * tx_cfg.repetitions));
+		}
+		else
+		{
+			SET_CHECKED(rf69_set_payload_length(spi, 0));
+		}
+
+		/* configure the rf chip */
+		rf69_set_tx_cfg(device, &tx_cfg);
+
+		/* enable fifo level interrupt */
+		SET_CHECKED(rf69_set_dio_mapping(spi, DIO1, DIO_FifoLevel));
+		device->irq_state[DIO1] = DIO_FifoLevel;
+		irq_set_irq_type(device->irq_num[DIO1], IRQ_TYPE_EDGE_FALLING);
+
+		/* enable packet sent interrupt */
+		SET_CHECKED(rf69_set_dio_mapping(spi, DIO0, DIO_PacketSent));
+		device->irq_state[DIO0] = DIO_PacketSent;
+		irq_set_irq_type(device->irq_num[DIO0], IRQ_TYPE_EDGE_RISING);
+		enable_irq(device->irq_num[DIO0]); /* was disabled by rx active check */
+
+		/* enable transmission */
+		SET_CHECKED(rf69_set_mode(spi, transmit));
+
+		/* transfer this msg (and repetitions) to chip fifo */
+		device->free_in_fifo = FIFO_SIZE;
+		position = 0;
+		repetitions = tx_cfg.repetitions;
+		while( (repetitions > 0) && (size > position) )
+		{
+			if ( (size - position) > device->free_in_fifo)
+			{	/* msg to big for fifo - take a part */
+				int temp = device->free_in_fifo;
+				device->free_in_fifo = 0;
+				rf69_write_fifo(spi,
+				                &buffer[position],
+				                temp);
+				position +=temp;
+			}
+			else
+			{	/* msg fits into fifo - take all */
+				device->free_in_fifo -= size;
+				repetitions--;
+				rf69_write_fifo(spi,
+						&buffer[position],
+						(size - position) );
+				position = 0; /* reset for next repetition */
+			}
+
+			retval = wait_event_interruptible(device->fifo_wait_queue,
+							  device->free_in_fifo > 0);
+			if (retval) { printk("ABORT\n"); goto abort; }
+		}
+
+		/* we are done. Wait for packet to get sent */
+		dev_dbg(device->dev, "thread: wiat for packet to get sent/fifo to be empty");
+		wait_event_interruptible(device->fifo_wait_queue,
+					 device->free_in_fifo == FIFO_SIZE ||
+					 kthread_should_stop() );
+		if ( kthread_should_stop() )	printk("ABORT\n");
+
+
+		/* STOP_TRANSMISSION */
+		dev_dbg(device->dev, "thread: Packet sent. Set mode to stby.");
+		SET_CHECKED(rf69_set_mode(spi, standby));
+
+		/* everything sent? */
+		if ( kfifo_is_empty(&device->tx_fifo) )
+		{
+abort:
+			if (rx_interrupted)
+			{
+				rx_interrupted = false;
+				pi433_start_rx(device);
+			}
+			device->tx_active = false;
+			wake_up_interruptible(&device->rx_wait_queue);
+		}
+	}
+}
+
+/*-------------------------------------------------------------------------*/
+
+static ssize_t
+pi433_read(struct file *filp, char __user *buf, size_t size, loff_t *f_pos)
+{
+	struct pi433_instance	*instance;
+	struct pi433_device	*device;
+	int			bytes_received;
+	ssize_t			retval;
+
+	/* check, whether internal buffer is big enough for requested size */
+	if (size > MAX_MSG_SIZE)
+		return -EMSGSIZE;
+
+	instance = filp->private_data;
+	device = instance->device;
+
+	/* just one read request at a time */
+	mutex_lock(&device->rx_lock);
+	if (device->rx_active)
+	{
+		mutex_unlock(&device->rx_lock);
+		return -EAGAIN;
+	}
+	else
+	{
+		device->rx_active = true;
+		mutex_unlock(&device->rx_lock);
+	}
+
+	/* start receiving */
+	/* will block until something was received*/
+	device->rx_buffer_size = size;
+	bytes_received = pi433_receive(device);
+
+	/* release rx */
+	mutex_lock(&device->rx_lock);
+	device->rx_active = false;
+	mutex_unlock(&device->rx_lock);
+
+	/* if read was successful copy to user space*/
+	if (bytes_received > 0)
+	{
+		retval = copy_to_user(buf, device->rx_buffer, bytes_received);
+		if (retval)
+			return retval;
+	}
+
+	return bytes_received;
+}
+
+
+static ssize_t
+pi433_write(struct file *filp, const char __user *buf,
+		size_t count, loff_t *f_pos)
+{
+	struct pi433_instance	*instance;
+	struct pi433_device	*device;
+	int                     copied, retval;
+
+	instance = filp->private_data;
+	device = instance->device;
+
+	/* check, whether internal buffer (tx thread) is big enough for requested size */
+	if (count > MAX_MSG_SIZE)
+		return -EMSGSIZE;
+
+	/* write the following sequence into fifo:
+	   - tx_cfg
+	   - size of message
+	   - message */
+	mutex_lock(&device->tx_fifo_lock);
+	retval = kfifo_in(&device->tx_fifo, &instance->tx_cfg, sizeof(instance->tx_cfg));
+	if ( retval != sizeof(instance->tx_cfg) )
+		goto abort;
+
+	retval = kfifo_in (&device->tx_fifo, &count, sizeof(size_t));
+	if ( retval != sizeof(size_t) )
+		goto abort;
+
+	retval = kfifo_from_user(&device->tx_fifo, buf, count, &copied);
+	if (retval || copied != count)
+		goto abort;
+
+	mutex_unlock(&device->tx_fifo_lock);
+
+	/* start transfer */
+	wake_up_interruptible(&device->tx_wait_queue);
+	dev_dbg(device->dev, "write: generated new msg with %d bytes.", copied);
+
+	return 0;
+
+abort:
+	dev_dbg(device->dev, "write to fifo failed: 0x%x", retval);
+	kfifo_reset(&device->tx_fifo); // TODO: maybe find a solution, not to discard already stored, valid entries
+	mutex_unlock(&device->tx_fifo_lock);
+	return -EAGAIN;
+}
+
+
+static long
+pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	int			err = 0;
+	int			retval = 0;
+	struct pi433_instance	*instance;
+	struct pi433_device	*device;
+	u32			tmp;
+
+	/* Check type and command number */
+	if (_IOC_TYPE(cmd) != PI433_IOC_MAGIC)
+		return -ENOTTY;
+
+	/* Check access direction once here; don't repeat below.
+	 * IOC_DIR is from the user perspective, while access_ok is
+	 * from the kernel perspective; so they look reversed.
+	 */
+	if (_IOC_DIR(cmd) & _IOC_READ)
+		err = !access_ok(VERIFY_WRITE,
+				 (void __user *)arg,
+				 _IOC_SIZE(cmd));
+
+	if (err == 0 && _IOC_DIR(cmd) & _IOC_WRITE)
+		err = !access_ok(VERIFY_READ,
+				 (void __user *)arg,
+				 _IOC_SIZE(cmd));
+	if (err)
+		return -EFAULT;
+
+	/* TODO? guard against device removal before, or while,
+	 * we issue this ioctl. --> device_get()
+	 */
+	instance = filp->private_data;
+	device = instance->device;
+
+	if (device == NULL)
+		return -ESHUTDOWN;
+
+	switch (cmd) {
+	case PI433_IOC_RD_TX_CFG:
+		tmp = _IOC_SIZE(cmd);
+		if ( (tmp == 0) || ((tmp % sizeof(struct pi433_tx_cfg)) != 0) )
+		{
+			retval = -EINVAL;
+			break;
+		}
+
+		if (__copy_to_user((void __user *)arg,
+				    &instance->tx_cfg,
+				    tmp))
+		{
+			retval = -EFAULT;
+			break;
+		}
+
+		break;
+	case PI433_IOC_WR_TX_CFG:
+		tmp = _IOC_SIZE(cmd);
+		if ( (tmp == 0) || ((tmp % sizeof(struct pi433_tx_cfg)) != 0) )
+		{
+			retval = -EINVAL;
+			break;
+		}
+
+		if (__copy_from_user(&instance->tx_cfg,
+				     (void __user *)arg,
+				     tmp))
+		{
+			retval = -EFAULT;
+			break;
+		}
+
+		break;
+
+	case PI433_IOC_RD_RX_CFG:
+		tmp = _IOC_SIZE(cmd);
+		if ( (tmp == 0) || ((tmp % sizeof(struct pi433_rx_cfg)) != 0) ) {
+			retval = -EINVAL;
+			break;
+		}
+
+		if (__copy_to_user((void __user *)arg,
+				   &device->rx_cfg,
+				   tmp))
+		{
+			retval = -EFAULT;
+			break;
+		}
+
+		break;
+	case PI433_IOC_WR_RX_CFG:
+		tmp = _IOC_SIZE(cmd);
+		mutex_lock(&device->rx_lock);
+
+		/* during pendig read request, change of config not allowed */
+		if (device->rx_active) {
+			retval = -EAGAIN;
+			mutex_unlock(&device->rx_lock);
+			break;
+		}
+
+		if ( (tmp == 0) || ((tmp % sizeof(struct pi433_rx_cfg)) != 0) ) {
+			retval = -EINVAL;
+			mutex_unlock(&device->rx_lock);
+			break;
+		}
+
+		if (__copy_from_user(&device->rx_cfg,
+				     (void __user *)arg,
+				     tmp))
+		{
+			retval = -EFAULT;
+			mutex_unlock(&device->rx_lock);
+			break;
+		}
+
+		mutex_unlock(&device->rx_lock);
+		break;
+	default:
+		retval = -EINVAL;
+	}
+
+	return retval;
+}
+
+#ifdef CONFIG_COMPAT
+static long
+pi433_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	return pi433_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
+}
+#else
+#define pi433_compat_ioctl NULL
+#endif /* CONFIG_COMPAT */
+
+/*-------------------------------------------------------------------------*/
+
+static int pi433_open(struct inode *inode, struct file *filp)
+{
+	struct pi433_device	*device;
+	struct pi433_instance	*instance;
+
+	mutex_lock(&minor_lock);
+	device = idr_find(&pi433_idr, iminor(inode));
+	mutex_unlock(&minor_lock);
+	if (!device) {
+		pr_debug("device: minor %d unknown.\n", iminor(inode));
+		return -ENODEV;
+	}
+
+	if (!device->rx_buffer) {
+		device->rx_buffer = kmalloc(MAX_MSG_SIZE, GFP_KERNEL);
+		if (!device->rx_buffer)
+		{
+			dev_dbg(device->dev, "open/ENOMEM\n");
+			return -ENOMEM;
+		}
+	}
+
+	device->users++;
+	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
+	if (!instance)
+	{
+		kfree(device->rx_buffer);
+		device->rx_buffer = NULL;
+		return -ENOMEM;
+	}
+
+	/* setup instance data*/
+	instance->device = device;
+	instance->tx_cfg.bit_rate = 4711;
+	// TODO: fill instance->tx_cfg;
+
+	/* instance data as context */
+	filp->private_data = instance;
+	nonseekable_open(inode, filp);
+
+	return 0;
+}
+
+static int pi433_release(struct inode *inode, struct file *filp)
+{
+	struct pi433_instance	*instance;
+	struct pi433_device	*device;
+
+	instance = filp->private_data;
+	device = instance->device;
+	kfree(instance);
+	filp->private_data = NULL;
+
+	/* last close? */
+	device->users--;
+
+	if (!device->users) {
+		kfree(device->rx_buffer);
+		device->rx_buffer = NULL;
+		if (device->spi == NULL)
+			kfree(device);
+	}
+
+	return 0;
+}
+
+
+/*-------------------------------------------------------------------------*/
+
+static int setup_GPIOs(struct pi433_device *device)
+{
+	char 	name[5];
+	int	retval;
+	int	i;
+
+	for (i=0; i<NUM_DIO; i++)
+	{
+		/* "construct" name and get the gpio descriptor */
+		snprintf(name, sizeof(name), "DIO%d", i);
+		device->gpiod[i] = gpiod_get(&device->spi->dev, name, 0 /*GPIOD_IN*/);
+
+		if (device->gpiod[i] == ERR_PTR(-ENOENT))
+		{
+			dev_dbg(&device->spi->dev, "Could not find entry for %s. Ignoring.", name);
+			continue;
+		}
+
+		if (device->gpiod[i] == ERR_PTR(-EBUSY))
+			dev_dbg(&device->spi->dev, "%s is busy.", name);
+
+		if ( IS_ERR(device->gpiod[i]) )
+		{
+			retval = PTR_ERR(device->gpiod[i]);
+			/* release already allocated gpios */
+			for (i--; i>=0; i--)
+			{
+				free_irq(device->irq_num[i], device);
+				gpiod_put(device->gpiod[i]);
+			}
+			return retval;
+		}
+
+
+		/* configure the pin */
+		gpiod_unexport(device->gpiod[i]);
+		retval = gpiod_direction_input(device->gpiod[i]);
+		if (retval) return retval;
+
+
+		/* configure irq */
+		device->irq_num[i] = gpiod_to_irq(device->gpiod[i]);
+		if (device->irq_num[i] < 0)
+		{
+			device->gpiod[i] = ERR_PTR(-EINVAL);//(struct gpio_desc *)device->irq_num[i];
+			return device->irq_num[i];
+		}
+		retval = request_irq(device->irq_num[i],
+				     DIO_irq_handler[i],
+				     0, /* flags */
+				     name,
+				     device);
+
+		if (retval)
+			return retval;
+
+		dev_dbg(&device->spi->dev, "%s succesfully configured", name);
+	}
+
+	return 0;
+}
+
+static void free_GPIOs(struct pi433_device *device)
+{
+	int i;
+
+	for (i=0; i<NUM_DIO; i++)
+	{
+		/* check if gpiod is valid */
+		if ( IS_ERR(device->gpiod[i]) )
+			continue;
+
+		free_irq(device->irq_num[i], device);
+		gpiod_put(device->gpiod[i]);
+	}
+	return;
+}
+
+static int pi433_get_minor(struct pi433_device *device)
+{
+	int retval = -ENOMEM;
+
+	mutex_lock(&minor_lock);
+	retval = idr_alloc(&pi433_idr, device, 0, N_PI433_MINORS, GFP_KERNEL);
+	if (retval >= 0) {
+		device->minor = retval;
+		retval = 0;
+	} else if (retval == -ENOSPC) {
+		dev_err(device->dev, "too many pi433 devices\n");
+		retval = -EINVAL;
+	}
+	mutex_unlock(&minor_lock);
+	return retval;
+}
+
+static void pi433_free_minor(struct pi433_device *dev)
+{
+	mutex_lock(&minor_lock);
+	idr_remove(&pi433_idr, dev->minor);
+	mutex_unlock(&minor_lock);
+}
+/*-------------------------------------------------------------------------*/
+
+static const struct file_operations pi433_fops = {
+	.owner =	THIS_MODULE,
+	/* REVISIT switch to aio primitives, so that userspace
+	 * gets more complete API coverage.  It'll simplify things
+	 * too, except for the locking.
+	 */
+	.write =	pi433_write,
+	.read =		pi433_read,
+	.unlocked_ioctl = pi433_ioctl,
+	.compat_ioctl = pi433_compat_ioctl,
+	.open =		pi433_open,
+	.release =	pi433_release,
+	.llseek =	no_llseek,
+};
+
+/*-------------------------------------------------------------------------*/
+
+static int pi433_probe(struct spi_device *spi)
+{
+	struct pi433_device	*device;
+	int			retval;
+
+	/* setup spi parameters */
+	spi->mode = 0x00;
+	spi->bits_per_word = 8;
+	/* spi->max_speed_hz = 10000000;  1MHz already set by device tree overlay */
+
+	retval = spi_setup(spi);
+	if (retval)
+	{
+		dev_dbg(&spi->dev, "configuration of SPI interface failed!\n");
+		return retval;
+	}
+	else
+	{
+		dev_dbg(&spi->dev,
+			"spi interface setup: mode 0x%2x, %d bits per word, %dhz max speed",
+			spi->mode, spi->bits_per_word, spi->max_speed_hz);
+	}
+
+	/* Ping the chip by reading the version register */
+	retval = spi_w8r8(spi, 0x10);
+	if (retval < 0)
+		return retval;
+
+	switch(retval)
+	{
+		case 0x24:
+			dev_dbg(&spi->dev, "fonud pi433 (ver. 0x%x)", retval);
+			break;
+		default:
+			dev_dbg(&spi->dev, "unknown chip version: 0x%x", retval);
+			return -ENODEV;
+	}
+
+	/* Allocate driver data */
+	device = kzalloc(sizeof(*device), GFP_KERNEL);
+	if (!device)
+		return -ENOMEM;
+
+	/* Initialize the driver data */
+	device->spi = spi;
+	device->rx_active = false;
+	device->tx_active = false;
+	device->interrupt_rx_allowed = false;
+
+	/* init wait queues */
+	init_waitqueue_head(&device->tx_wait_queue);
+	init_waitqueue_head(&device->rx_wait_queue);
+	init_waitqueue_head(&device->fifo_wait_queue);
+
+	/* init fifo */
+	INIT_KFIFO(device->tx_fifo);
+
+	/* init mutexes and locks */
+	mutex_init(&device->tx_fifo_lock);
+	mutex_init(&device->rx_lock);
+
+	/* setup GPIO (including irq_handler) for the different DIOs */
+	retval = setup_GPIOs(device);
+	if (retval)
+	{
+		dev_dbg(&spi->dev, "setup of GPIOs failed");
+		goto GPIO_failed;
+	}
+
+	/* setup the radio module */
+	SET_CHECKED(rf69_set_mode		(spi, standby));
+	SET_CHECKED(rf69_set_data_mode		(spi, packet));
+	SET_CHECKED(rf69_set_amplifier_0	(spi, optionOn));
+	SET_CHECKED(rf69_set_amplifier_1	(spi, optionOff));
+	SET_CHECKED(rf69_set_amplifier_2	(spi, optionOff));
+	SET_CHECKED(rf69_set_output_power_level	(spi, 13));
+	SET_CHECKED(rf69_set_antenna_impedance	(spi, fiftyOhm));
+
+	/* start tx thread */
+	device->tx_task_struct = kthread_run(pi433_tx_thread,
+					     device,
+					     "pi433_tx_task");
+	if (device->tx_task_struct < 0)
+	{
+		dev_dbg(device->dev, "start of send thread failed");
+		goto send_thread_failed;
+	}
+
+	/* determ minor number */
+	retval = pi433_get_minor(device);
+	if (retval)
+	{
+		dev_dbg(device->dev, "get of minor number failed");
+		goto minor_failed;
+	}
+
+	/* create device */
+	device->devt = MKDEV(MAJOR(pi433_dev), device->minor);
+	device->dev = device_create(pi433_class,
+				    &spi->dev,
+				    device->devt,
+				    device,
+				    "pi433");
+	if (IS_ERR(device->dev)) {
+		pr_err("pi433: device register failed\n");
+		retval = PTR_ERR(device->dev);
+		goto device_create_failed;
+	}
+	else {
+		dev_dbg(device->dev,
+			"created device for major %d, minor %d\n",
+			MAJOR(pi433_dev),
+			device->minor);
+	}
+
+	/* create cdev */
+	device->cdev = cdev_alloc();
+	device->cdev->owner = THIS_MODULE;
+	cdev_init(device->cdev, &pi433_fops);
+	retval = cdev_add(device->cdev, device->devt, 1);
+	if (retval)
+	{
+		dev_dbg(device->dev, "register of cdev failed");
+		goto cdev_failed;
+	}
+
+	/* spi setup */
+	spi_set_drvdata(spi, device);
+
+	return 0;
+
+cdev_failed:
+	device_destroy(pi433_class, device->devt);
+device_create_failed:
+	pi433_free_minor(device);
+minor_failed:
+	kthread_stop(device->tx_task_struct);
+send_thread_failed:
+	free_GPIOs(device);
+GPIO_failed:
+	kfree(device);
+
+	return retval;
+}
+
+static int pi433_remove(struct spi_device *spi)
+{
+	struct pi433_device	*device = spi_get_drvdata(spi);
+
+	/* free GPIOs */
+	free_GPIOs(device);
+
+	/* make sure ops on existing fds can abort cleanly */
+	device->spi = NULL;
+
+	kthread_stop(device->tx_task_struct);
+
+	device_destroy(pi433_class, device->devt);
+
+	cdev_del(device->cdev);
+
+	pi433_free_minor(device);
+
+	if (device->users == 0)
+		kfree(device);
+
+	return 0;
+}
+
+static const struct of_device_id pi433_dt_ids[] = {
+	{ .compatible = "Smarthome-Wolf,pi433" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, pi433_dt_ids);
+
+static struct spi_driver pi433_spi_driver = {
+	.driver = {
+		.name =		"pi433",
+		.owner =	THIS_MODULE,
+		.of_match_table = of_match_ptr(pi433_dt_ids),
+	},
+	.probe =	pi433_probe,
+	.remove =	pi433_remove,
+
+	/* NOTE:  suspend/resume methods are not necessary here.
+	 * We don't do anything except pass the requests to/from
+	 * the underlying controller.  The refrigerator handles
+	 * most issues; the controller driver handles the rest.
+	 */
+};
+
+/*-------------------------------------------------------------------------*/
+
+static int __init pi433_init(void)
+{
+	int status;
+
+	/* If MAX_MSG_SIZE is smaller then FIFO_SIZE, the driver won't
+           work stable - risk of buffer overflow */
+	if (MAX_MSG_SIZE < FIFO_SIZE)
+		return -EINVAL;
+
+	/* Claim device numbers.  Then register a class
+	 * that will key udev/mdev to add/remove /dev nodes.  Last, register
+	 * Last, register the driver which manages those device numbers.
+	 */
+	status = alloc_chrdev_region(&pi433_dev, 0 /*firstminor*/, N_PI433_MINORS /*count*/, "pi433" /*name*/);
+	if (status < 0)
+		return status;
+
+	pi433_class = class_create(THIS_MODULE, "pi433");
+	if (IS_ERR(pi433_class))
+	{
+		unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+		return PTR_ERR(pi433_class);
+	}
+
+	status = spi_register_driver(&pi433_spi_driver);
+	if (status < 0)
+	{
+		class_destroy(pi433_class);
+		unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+	}
+
+	return status;
+}
+
+module_init(pi433_init);
+
+static void __exit pi433_exit(void)
+{
+	spi_unregister_driver(&pi433_spi_driver);
+	class_destroy(pi433_class);
+	unregister_chrdev(MAJOR(pi433_dev), pi433_spi_driver.driver.name);
+}
+module_exit(pi433_exit);
+
+MODULE_AUTHOR("Marcus Wolf, <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>");
+MODULE_DESCRIPTION("Driver for Pi433");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("spi:pi433");
diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
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
+ *	Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
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
+/*---------------------------------------------------------------------------*/
+
+
+/*---------------------------------------------------------------------------*/
+
+/* IOCTL structs and commands */
+
+/**
+ * struct pi433_tx_config - describes the configuration of the radio module for sending
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
+#define PI433_TX_CFG_IOCTL_NR 	0
+struct pi433_tx_cfg
+{
+	__u32			frequency;
+	__u16			bit_rate;
+	__u32			dev_frequency;
+	enum modulation		modulation;
+	enum modShaping		modShaping;
+
+	enum paRamp		pa_ramp;
+
+	enum txStartCondition	tx_start_condition;
+
+	__u16			repetitions;
+
+
+	/* packet format */
+	enum optionOnOff	enable_preamble;
+	enum optionOnOff	enable_sync;
+	enum optionOnOff	enable_length_byte;
+	enum optionOnOff	enable_address_byte;
+	enum optionOnOff	enable_crc;
+
+	__u16			preamble_length;
+	__u8			sync_length;
+	__u8			fixed_message_length;
+
+	__u8			sync_pattern[8];
+	__u8			address_byte;
+};
+
+
+/**
+ * struct pi433_rx_config - describes the configuration of the radio module for sending
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
+#define PI433_RX_CFG_IOCTL_NR 	1
+struct pi433_rx_cfg {
+	__u32			frequency;
+	__u16			bit_rate;
+	__u32			dev_frequency;
+
+	enum modulation		modulation;
+
+	__u8			rssi_threshold;
+	enum thresholdDecrement	thresholdDecrement;
+	enum antennaImpedance	antenna_impedance;
+	enum lnaGain		lna_gain;
+	enum mantisse		bw_mantisse;	/* normal: 0x50 */
+	__u8			bw_exponent;	/* during AFC: 0x8b */
+	enum dagc		dagc;
+
+
+
+	/* packet format */
+	enum optionOnOff	enable_sync;
+	enum optionOnOff	enable_length_byte;	  /* should be used in combination with sync, only */
+	enum addressFiltering	enable_address_filtering; /* operational with sync, only */
+	enum optionOnOff	enable_crc;		  /* only operational, if sync on and fixed length or length byte is used */
+
+	__u8			sync_length;
+	__u8			fixed_message_length;
+	__u32			bytes_to_drop;
+
+	__u8			sync_pattern[8];
+	__u8			node_address;
+	__u8			broadcast_address;
+};
+
+
+#define PI433_IOC_MAGIC			'r'
+
+#define PI433_IOC_RD_TX_CFG	_IOR(PI433_IOC_MAGIC, PI433_TX_CFG_IOCTL_NR, char[sizeof(struct pi433_tx_cfg)])
+#define PI433_IOC_WR_TX_CFG	_IOW(PI433_IOC_MAGIC, PI433_TX_CFG_IOCTL_NR, char[sizeof(struct pi433_tx_cfg)])
+
+#define PI433_IOC_RD_RX_CFG	_IOR(PI433_IOC_MAGIC, PI433_RX_CFG_IOCTL_NR, char[sizeof(struct pi433_rx_cfg)])
+#define PI433_IOC_WR_RX_CFG	_IOW(PI433_IOC_MAGIC, PI433_RX_CFG_IOCTL_NR, char[sizeof(struct pi433_rx_cfg)])
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
+ *	Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
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
+#define F_OSC	  32000000 /* in Hz */
+#define FIFO_SIZE 66 	   /* in byte */
+
+/*-------------------------------------------------------------------------*/
+
+#define READ_REG(x)	rf69_read_reg (spi, x)
+#define WRITE_REG(x,y)	rf69_write_reg(spi, x, y)
+#define INVALID_PARAM \
+	{ \
+		dev_dbg(&spi->dev, "set: illegal input param"); \
+		return -EINVAL; \
+	}
+
+/*-------------------------------------------------------------------------*/
+
+int rf69_set_mode(struct spi_device *spi, enum mode mode)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: mode");
+	#endif
+
+	switch (mode){
+	case transmit:	  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_TRANSMIT);
+	case receive:	  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_RECEIVE);
+	case synthesizer: return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_SYNTHESIZER);
+	case standby:	  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_STANDBY);
+	case mode_sleep:  return WRITE_REG(REG_OPMODE, (READ_REG(REG_OPMODE) & ~MASK_OPMODE_MODE) | OPMODE_MODE_SLEEP);
+	default:	  INVALID_PARAM;
+	}
+
+	// we are using packet mode, so this check is not really needed
+	// but waiting for mode ready is necessary when going from sleep because the FIFO may not be immediately available from previous mode
+	//while (_mode == RF69_MODE_SLEEP && (READ_REG(REG_IRQFLAGS1) & RF_IRQFLAGS1_MODEREADY) == 0x00); // Wait for ModeReady
+
+}
+
+int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: data mode");
+	#endif
+
+	switch (dataMode) {
+	case packet:		return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_PACKET);
+	case continuous:	return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_CONTINUOUS);
+	case continuousNoSync:  return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODE) | DATAMODUL_MODE_CONTINUOUS_NOSYNC);
+	default:		INVALID_PARAM;
+	}
+}
+
+int rf69_set_modulation(struct spi_device *spi, enum modulation modulation)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: modulation");
+	#endif
+
+	switch (modulation) {
+	case OOK:   return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_OOK);
+	case FSK:   return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_TYPE) | DATAMODUL_MODULATION_TYPE_FSK);
+	default:    INVALID_PARAM;
+	}
+}
+
+enum modulation rf69_get_modulation(struct spi_device *spi)
+{
+	u8 currentValue;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "get: mode");
+	#endif
+
+	currentValue = READ_REG(REG_DATAMODUL);
+
+	switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE >> 3)  // TODO improvement: change 3 to define
+	{
+	case DATAMODUL_MODULATION_TYPE_OOK: return OOK;
+	case DATAMODUL_MODULATION_TYPE_FSK: return FSK;
+	default:			    return undefined;
+	}
+}
+
+int rf69_set_modulation_shaping(struct spi_device *spi, enum modShaping modShaping)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: mod shaping");
+	#endif
+
+	if (rf69_get_modulation(spi) == FSK)
+	{
+		switch (modShaping) {
+		case shapingOff: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_NONE);
+		case shaping1_0: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_1_0);
+		case shaping0_5: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_0_3);
+		case shaping0_3: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_0_5);
+		default:	 INVALID_PARAM;
+		}
+	}
+	else
+	{
+		switch (modShaping) {
+		case shapingOff: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_NONE);
+		case shapingBR:	 return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_BR);
+		case shaping2BR: return WRITE_REG(REG_DATAMODUL, (READ_REG(REG_DATAMODUL) & ~MASK_DATAMODUL_MODULATION_SHAPE) | DATAMODUL_MODULATION_SHAPE_2BR);
+		default:	 INVALID_PARAM;
+		}
+	}
+}
+
+int rf69_set_bit_rate(struct spi_device *spi, u16 bitRate)
+{
+	int retval;
+	u32 bitRate_min;
+	u32 bitRate_reg;
+	u8 msb;
+	u8 lsb;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: bit rate");
+	#endif
+
+	// check input value
+	bitRate_min = F_OSC / 8388608; // 8388608 = 2^23;
+	if (bitRate < bitRate_min)
+	{
+		dev_dbg(&spi->dev, "setBitRate: illegal input param");
+		INVALID_PARAM;
+	}
+
+	// calculate reg settings
+	bitRate_reg = (F_OSC / bitRate);
+
+	msb = (bitRate_reg&0xff00)   >>  8;
+	lsb = (bitRate_reg&0xff);
+
+	// transmit to RF 69
+	retval = WRITE_REG(REG_BITRATE_MSB, msb);
+	if (retval)  return retval;
+	retval = WRITE_REG(REG_BITRATE_LSB, lsb);
+	if (retval)  return retval;
+
+	return 0;
+}
+
+int rf69_set_deviation(struct spi_device *spi, u32 deviation)
+{
+	int retval;
+//	u32 f_max; TODO: Abhängigkeit von Bitrate beachten!!
+	u64 f_reg;
+	u64 f_step;
+	u8 msb;
+	u8 lsb;
+	u64 factor = 1000000; // to improve precision of calculation
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: deviation");
+	#endif
+
+	if (deviation < 600 || deviation > 500000) //TODO: Abhängigkeit von Bitrate beachten!!
+	{
+		dev_dbg(&spi->dev, "set_deviation: illegal input param");
+		INVALID_PARAM;
+	}
+
+	// calculat f step
+	f_step = F_OSC * factor;
+	do_div(f_step, 524288); //  524288 = 2^19
+
+	// calculate register settings
+	f_reg = deviation * factor;
+	do_div(f_reg  , f_step);
+
+	msb = (f_reg&0xff00)   >>  8;
+	lsb = (f_reg&0xff);
+
+	// check msb
+	if (msb & !FDEVMASB_MASK)
+	{
+		dev_dbg(&spi->dev, "set_deviation: err in calc of msb");
+		INVALID_PARAM;
+	}
+
+	// write to chip
+	retval = WRITE_REG(REG_FDEV_MSB, msb);
+	if (retval)  return retval;
+	retval = WRITE_REG(REG_FDEV_LSB, lsb);
+	if (retval)  return retval;
+
+	return 0;
+}
+
+int rf69_set_frequency(struct spi_device *spi, u32 frequency)
+{
+	int retval;
+	u32 f_max;
+	u64 f_reg;
+	u64 f_step;
+	u8 msb;
+	u8 mid;
+	u8 lsb;
+	u64 factor = 1000000; // to improve precision of calculation
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: frequency");
+	#endif
+
+	// calculat f step
+	f_step = F_OSC * factor;
+	do_div(f_step, 524288); //  524288 = 2^19
+
+	// check input value
+	f_max = f_step * 8388608 / factor;
+	if (frequency > f_max)
+	{
+		dev_dbg(&spi->dev, "setFrequency: illegal input param");
+		INVALID_PARAM;
+	}
+
+	// calculate reg settings
+	f_reg = frequency * factor;
+	do_div(f_reg  , f_step);
+
+	msb = (f_reg&0xff0000) >> 16;
+	mid = (f_reg&0xff00)   >>  8;
+	lsb = (f_reg&0xff);
+
+	// write to chip
+	retval = WRITE_REG(REG_FRF_MSB, msb);
+	if (retval)  return retval;
+	retval = WRITE_REG(REG_FRF_MID, mid);
+	if (retval)  return retval;
+	retval = WRITE_REG(REG_FRF_LSB, lsb);
+	if (retval)  return retval;
+
+	return 0;
+}
+
+int rf69_set_amplifier_0(struct spi_device *spi, enum optionOnOff optionOnOff)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: amp #0");
+	#endif
+
+	switch(optionOnOff) {
+	case optionOn:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |  MASK_PALEVEL_PA0) );
+	case optionOff:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_PA0) );
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOff optionOnOff)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: amp #1");
+	#endif
+
+	switch(optionOnOff) {
+	case optionOn:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |  MASK_PALEVEL_PA1) );
+	case optionOff: return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_PA1) );
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_amplifier_2(struct spi_device *spi, enum optionOnOff optionOnOff)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: amp #2");
+	#endif
+
+	switch(optionOnOff) {
+	case optionOn:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) |  MASK_PALEVEL_PA2) );
+	case optionOff:	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_PA2) );
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_output_power_level(struct spi_device *spi, u8 powerLevel)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: power level");
+	#endif
+
+	powerLevel +=18; // TODO Abhängigkeit von PA0,1,2 setting
+
+	// check input value
+	if (powerLevel > 0x1f)
+		INVALID_PARAM;
+
+	// write value
+	return WRITE_REG(REG_PALEVEL, (READ_REG(REG_PALEVEL) & ~MASK_PALEVEL_OUTPUT_POWER) | powerLevel);
+}
+
+int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paRamp)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: pa ramp");
+	#endif
+
+	switch(paRamp) {
+	case ramp3400:	return WRITE_REG(REG_PARAMP, PARAMP_3400);
+	case ramp2000:	return WRITE_REG(REG_PARAMP, PARAMP_2000);
+	case ramp1000:	return WRITE_REG(REG_PARAMP, PARAMP_1000);
+	case ramp500:	return WRITE_REG(REG_PARAMP, PARAMP_500);
+	case ramp250:	return WRITE_REG(REG_PARAMP, PARAMP_250);
+	case ramp125:	return WRITE_REG(REG_PARAMP, PARAMP_125);
+	case ramp100:	return WRITE_REG(REG_PARAMP, PARAMP_100);
+	case ramp62:	return WRITE_REG(REG_PARAMP, PARAMP_62);
+	case ramp50:	return WRITE_REG(REG_PARAMP, PARAMP_50);
+	case ramp40:	return WRITE_REG(REG_PARAMP, PARAMP_40);
+	case ramp31:	return WRITE_REG(REG_PARAMP, PARAMP_31);
+	case ramp25:	return WRITE_REG(REG_PARAMP, PARAMP_25);
+	case ramp20:	return WRITE_REG(REG_PARAMP, PARAMP_20);
+	case ramp15:	return WRITE_REG(REG_PARAMP, PARAMP_15);
+	case ramp12:	return WRITE_REG(REG_PARAMP, PARAMP_12);
+	case ramp10:	return WRITE_REG(REG_PARAMP, PARAMP_10);
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedance antennaImpedance)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: antenna impedance");
+	#endif
+
+	switch(antennaImpedance) {
+	case fiftyOhm:	    return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) & ~MASK_LNA_ZIN) );
+	case twohundretOhm: return WRITE_REG(REG_LNA, (READ_REG(REG_LNA) |  MASK_LNA_ZIN) );
+	default:	    INVALID_PARAM;
+	}
+}
+
+int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: lna gain");
+	#endif
+
+	switch(lnaGain) {
+	case automatic:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_AUTO) );
+	case max:	 return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX) );
+	case maxMinus6:  return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_6) );
+	case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_12) );
+	case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_24) );
+	case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_36) );
+	case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_48) );
+	default:	 INVALID_PARAM;
+	}
+}
+
+enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
+{
+	u8 currentValue;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "get: lna gain");
+	#endif
+
+	currentValue = READ_REG(REG_LNA);
+
+	switch (currentValue & MASK_LNA_CURRENT_GAIN >> 3)  // improvement: change 3 to define
+	{
+	case LNA_GAIN_AUTO:	    return automatic;
+	case LNA_GAIN_MAX:	    return max;
+	case LNA_GAIN_MAX_MINUS_6:  return maxMinus6;
+	case LNA_GAIN_MAX_MINUS_12: return maxMinus12;
+	case LNA_GAIN_MAX_MINUS_24: return maxMinus24;
+	case LNA_GAIN_MAX_MINUS_36: return maxMinus36;
+	case LNA_GAIN_MAX_MINUS_48: return maxMinus48;
+	default:		    return undefined;
+	}
+}
+
+int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi ,u8 reg, enum dccPercent dccPercent)
+{
+	switch (dccPercent) {
+	case dcc16Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_16_PERCENT) );
+	case dcc8Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_8_PERCENT) );
+	case dcc4Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_4_PERCENT) );
+	case dcc2Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_2_PERCENT) );
+	case dcc1Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_1_PERCENT) );
+	case dcc0_5Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_0_5_PERCENT) );
+	case dcc0_25Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_0_25_PERCENT) );
+	case dcc0_125Percent:	return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ) | BW_DCC_0_125_PERCENT) );
+	default:		INVALID_PARAM;
+	}
+}
+
+int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent dccPercent)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: cut off freq");
+	#endif
+
+	return rf69_set_dc_cut_off_frequency_intern(spi, REG_RXBW, dccPercent);
+}
+
+int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercent dccPercent)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: cut off freq during afc");
+	#endif
+
+	return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
+}
+
+int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse mantisse, u8 exponent)
+{
+	u8 newValue;
+
+	// check value for mantisse and exponent
+	if (exponent > 7)   INVALID_PARAM;
+	if ( (mantisse!=mantisse16) &&
+	     (mantisse!=mantisse20) &&
+             (mantisse!=mantisse24) ) INVALID_PARAM;
+
+	// read old value
+	newValue = READ_REG(reg);
+
+	// "delete" mantisse and exponent = just keep the DCC setting
+	newValue = newValue & MASK_BW_DCC_FREQ;
+
+	// add new mantisse
+	switch(mantisse) {
+	case mantisse16: newValue = newValue | BW_MANT_16;	break;
+	case mantisse20: newValue = newValue | BW_MANT_20;	break;
+	case mantisse24: newValue = newValue | BW_MANT_24;	break;
+	}
+
+	// add new exponent
+	newValue = newValue | exponent;
+
+	// write back
+	return WRITE_REG(reg, newValue);
+}
+
+int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8 exponent)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: band width");
+	#endif
+
+	return rf69_set_bandwidth_intern(spi, REG_RXBW, mantisse, exponent);
+}
+
+int rf69_set_bandwidth_during_afc(struct spi_device *spi, enum mantisse mantisse, u8 exponent)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: band width during afc");
+	#endif
+
+	return rf69_set_bandwidth_intern(spi, REG_AFCBW, mantisse, exponent);
+}
+
+int rf69_set_ook_threshold_type(struct spi_device *spi, enum thresholdType thresholdType)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: threshold type");
+	#endif
+
+	switch (thresholdType)
+	{
+	case fixed:	return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_FIXED) );
+	case peak:	return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_PEAK) );
+	case average:	return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESTYPE) | OOKPEAK_THRESHTYPE_AVERAGE) );
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_ook_threshold_step(struct spi_device *spi, enum thresholdStep thresholdStep)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: threshold step");
+	#endif
+
+	switch (thresholdStep) {
+	case step_0_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_0_5_DB) );
+	case step_1_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_0_DB) );
+	case step_1_5db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_1_5_DB) );
+	case step_2_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_2_0_DB) );
+	case step_3_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_3_0_DB) );
+	case step_4_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_4_0_DB) );
+	case step_5_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_5_0_DB) );
+	case step_6_0db: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESSTEP) | OOKPEAK_THRESHSTEP_6_0_DB) );
+	default:	 INVALID_PARAM;
+	}
+}
+
+int rf69_set_ook_threshold_dec(struct spi_device *spi, enum thresholdDecrement thresholdDecrement)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: threshold decrement");
+	#endif
+
+	switch (thresholdDecrement) {
+	case dec_every8th: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_8TH) );
+	case dec_every4th: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_4TH) );
+	case dec_every2nd: return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_EVERY_2ND) );
+	case dec_once:	   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_ONCE) );
+	case dec_twice:	   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_TWICE) );
+	case dec_4times:   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_4_TIMES) );
+	case dec_8times:   return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_8_TIMES) );
+	case dec_16times:  return WRITE_REG(REG_OOKPEAK, ( (READ_REG(REG_OOKPEAK) & ~MASK_OOKPEAK_THRESDEC) | OOKPEAK_THRESHDEC_16_TIMES) );
+	default:	   INVALID_PARAM;
+	}
+}
+
+int rf69_set_dio_mapping(struct spi_device *spi, u8 DIONumber, u8 value)
+{
+	u8 mask;
+	u8 shift;
+	u8 regaddr;
+	u8 regValue;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: DIO mapping");
+	#endif
+
+	// check DIO number
+	if (DIONumber > 5) INVALID_PARAM;
+
+	switch (DIONumber) {
+	case 0: mask=MASK_DIO0; shift=SHIFT_DIO0; regaddr=REG_DIOMAPPING1; break;
+	case 1: mask=MASK_DIO1; shift=SHIFT_DIO1; regaddr=REG_DIOMAPPING1; break;
+	case 2: mask=MASK_DIO2; shift=SHIFT_DIO2; regaddr=REG_DIOMAPPING1; break;
+	case 3: mask=MASK_DIO3; shift=SHIFT_DIO3; regaddr=REG_DIOMAPPING1; break;
+	case 4: mask=MASK_DIO4; shift=SHIFT_DIO4; regaddr=REG_DIOMAPPING2; break;
+	case 5: mask=MASK_DIO5; shift=SHIFT_DIO5; regaddr=REG_DIOMAPPING2; break;
+	}
+
+	// read reg
+	regValue=READ_REG(regaddr);
+	// delete old value
+	regValue = regValue & ~mask;
+	// add new value
+	regValue = regValue | value << shift;
+	// write back
+	return WRITE_REG(regaddr,regValue);
+}
+
+bool rf69_get_flag(struct spi_device *spi, enum flag flag)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "get: flag");
+	#endif
+
+	switch(flag) {
+	case modeSwitchCompleted:     return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_MODE_READY);
+	case readyToReceive:	      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_RX_READY);
+	case readyToSend:	      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_TX_READY);
+	case pllLocked:		      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_PLL_LOCK);
+	case rssiExceededThreshold:   return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_RSSI);
+	case timeout:		      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_TIMEOUT);
+	case automode:		      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_AUTOMODE);
+	case syncAddressMatch:	      return (READ_REG(REG_IRQFLAGS1) & MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
+	case fifoFull:		      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_FULL);
+/*	case fifoNotEmpty:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_NOT_EMPTY); */
+	case fifoEmpty:		      return !(READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_NOT_EMPTY);
+	case fifoLevelBelowThreshold: return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_LEVEL);
+	case fifoOverrun:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_FIFO_OVERRUN);
+	case packetSent:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_PACKET_SENT);
+	case payloadReady:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_PAYLOAD_READY);
+	case crcOk:		      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_CRC_OK);
+	case batteryLow:	      return (READ_REG(REG_IRQFLAGS2) & MASK_IRQFLAGS2_LOW_BAT);
+	default:		      return false;
+	}
+}
+
+int rf69_reset_flag(struct spi_device *spi, enum flag flag)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "reset: flag");
+	#endif
+
+	switch(flag) {
+	case rssiExceededThreshold: return WRITE_REG(REG_IRQFLAGS1, MASK_IRQFLAGS1_RSSI);
+	case syncAddressMatch:	    return WRITE_REG(REG_IRQFLAGS1, MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH);
+	case fifoOverrun:	    return WRITE_REG(REG_IRQFLAGS2, MASK_IRQFLAGS2_FIFO_OVERRUN);
+	default:		    INVALID_PARAM;
+	}
+}
+
+int rf69_set_rssi_threshold(struct spi_device *spi, u8 threshold)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: rssi threshold");
+	#endif
+
+	/* no value check needed - u8 exactly matches register size */
+
+	return WRITE_REG(REG_RSSITHRESH, threshold);
+}
+
+int rf69_set_rx_start_timeout(struct spi_device *spi, u8 timeout)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: start timeout");
+	#endif
+
+	/* no value check needed - u8 exactly matches register size */
+
+	return WRITE_REG(REG_RXTIMEOUT1, timeout);
+}
+
+int rf69_set_rssi_timeout(struct spi_device *spi, u8 timeout)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: rssi timeout");
+	#endif
+
+	/* no value check needed - u8 exactly matches register size */
+
+	return WRITE_REG(REG_RXTIMEOUT2, timeout);
+}
+
+int rf69_set_preamble_length(struct spi_device *spi, u16 preambleLength)
+{
+	int retval;
+	u8 msb, lsb;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: preample length");
+	#endif
+
+	/* no value check needed - u16 exactly matches register size */
+
+	/* calculate reg settings */
+	msb = (preambleLength&0xff00)   >>  8;
+	lsb = (preambleLength&0xff);
+
+	/* transmit to chip */
+	retval = WRITE_REG(REG_PREAMBLE_MSB, msb);
+	if (retval) return retval;
+	retval = WRITE_REG(REG_PREAMBLE_LSB, lsb);
+
+	return retval;
+}
+
+int rf69_set_sync_enable(struct spi_device *spi, enum optionOnOff optionOnOff)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: sync enable");
+	#endif
+
+	switch(optionOnOff) {
+	case optionOn:	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) |  MASK_SYNC_CONFIG_SYNC_ON) );
+	case optionOff:	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_ON) );
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_fifo_fill_condition(struct spi_device *spi, enum fifoFillCondition fifoFillCondition)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: fifo fill condition");
+	#endif
+
+	switch(fifoFillCondition) {
+	case always:		 return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) |  MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );
+	case afterSyncInterrupt: return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_FIFO_FILL_CONDITION) );
+	default:		 INVALID_PARAM;
+	}
+}
+
+int rf69_set_sync_size(struct spi_device *spi, u8 syncSize)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: sync size");
+	#endif
+
+	// check input value
+	if (syncSize > 0x07)
+		INVALID_PARAM;
+
+	// write value
+	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_SIZE) | (syncSize << 3) );
+}
+
+int rf69_set_sync_tolerance(struct spi_device *spi, u8 syncTolerance)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: sync tolerance");
+	#endif
+
+	// check input value
+	if (syncTolerance > 0x07)
+		INVALID_PARAM;
+
+	// write value
+	return WRITE_REG(REG_SYNC_CONFIG, (READ_REG(REG_SYNC_CONFIG) & ~MASK_SYNC_CONFIG_SYNC_SIZE) | syncTolerance);
+}
+
+int rf69_set_sync_values(struct spi_device *spi, u8 syncValues[8])
+{
+	int retval = 0;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: sync values");
+	#endif
+
+	retval += WRITE_REG(REG_SYNCVALUE1, syncValues[0]);
+	retval += WRITE_REG(REG_SYNCVALUE2, syncValues[1]);
+	retval += WRITE_REG(REG_SYNCVALUE3, syncValues[2]);
+	retval += WRITE_REG(REG_SYNCVALUE4, syncValues[3]);
+	retval += WRITE_REG(REG_SYNCVALUE5, syncValues[4]);
+	retval += WRITE_REG(REG_SYNCVALUE6, syncValues[5]);
+	retval += WRITE_REG(REG_SYNCVALUE7, syncValues[6]);
+	retval += WRITE_REG(REG_SYNCVALUE8, syncValues[7]);
+
+	return retval;
+}
+
+int rf69_set_packet_format(struct spi_device * spi, enum packetFormat packetFormat)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: packet format");
+	#endif
+
+	switch(packetFormat) {
+	case packetLengthVar: return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) |  MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE) );
+	case packetLengthFix: return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE) );
+	default:	      INVALID_PARAM;
+	}
+}
+
+int rf69_set_crc_enable(struct spi_device *spi, enum optionOnOff optionOnOff)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: crc enable");
+	#endif
+
+	switch(optionOnOff) {
+	case optionOn:	return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) |  MASK_PACKETCONFIG1_CRC_ON) );
+	case optionOff:	return WRITE_REG(REG_PACKETCONFIG1, (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_CRC_ON) );
+	default:	INVALID_PARAM;
+	}
+}
+
+int rf69_set_adressFiltering(struct spi_device *spi, enum addressFiltering addressFiltering)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: address filtering");
+	#endif
+
+	switch (addressFiltering) {
+	case filteringOff:	     return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_OFF) );
+	case nodeAddress:	     return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_NODE) );
+	case nodeOrBroadcastAddress: return WRITE_REG(REG_PACKETCONFIG1, ( (READ_REG(REG_PACKETCONFIG1) & ~MASK_PACKETCONFIG1_ADDRESSFILTERING) | PACKETCONFIG1_ADDRESSFILTERING_NODEBROADCAST) );
+	default:		     INVALID_PARAM;
+	}
+}
+
+int rf69_set_payload_length(struct spi_device *spi, u8 payloadLength)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: payload length");
+	#endif
+
+	return WRITE_REG(REG_PAYLOAD_LENGTH, payloadLength);
+}
+
+u8  rf69_get_payload_length(struct spi_device *spi)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "get: payload length");
+	#endif
+
+	return (u8) READ_REG(REG_PAYLOAD_LENGTH);
+}
+
+int rf69_set_node_address(struct spi_device *spi, u8 nodeAddress)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: node address");
+	#endif
+
+	return WRITE_REG(REG_NODEADRS, nodeAddress);
+}
+
+int rf69_set_broadcast_address(struct spi_device *spi, u8 broadcastAddress)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: broadcast address");
+	#endif
+
+	return WRITE_REG(REG_BROADCASTADRS, broadcastAddress);
+}
+
+int rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCondition txStartCondition)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: start condition");
+	#endif
+
+	switch(txStartCondition) {
+	case fifoLevel:	   return WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) & ~MASK_FIFO_THRESH_TXSTART) );
+	case fifoNotEmpty: return WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) |  MASK_FIFO_THRESH_TXSTART) );
+	default:	   INVALID_PARAM;
+	}
+}
+
+int rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold)
+{
+	int retval;
+
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: fifo threshold");
+	#endif
+
+	// check input value
+	if (threshold & 0x80)
+		INVALID_PARAM;
+
+	// write value
+	retval = WRITE_REG(REG_FIFO_THRESH, (READ_REG(REG_FIFO_THRESH) & ~MASK_FIFO_THRESH_VALUE) | threshold);
+	if (retval)
+		return retval;
+
+	// access the fifo to activate new threshold
+	return rf69_read_fifo (spi, (u8*) &retval, 1); // retval used as buffer
+}
+
+int rf69_set_dagc(struct spi_device *spi, enum dagc dagc)
+{
+	#ifdef DEBUG
+		dev_dbg(&spi->dev, "set: dagc");
+	#endif
+
+	switch(dagc) {
+	case normalMode:		 return WRITE_REG(REG_TESTDAGC, DAGC_NORMAL);
+	case improve:			 return WRITE_REG(REG_TESTDAGC, DAGC_IMPROVED_LOWBETA0);
+	case improve4LowModulationIndex: return WRITE_REG(REG_TESTDAGC, DAGC_IMPROVED_LOWBETA1);
+	default:			 INVALID_PARAM;
+	}
+}
+
+/*-------------------------------------------------------------------------*/
+
+int rf69_read_fifo (struct spi_device *spi, u8 *buffer, unsigned int size)
+{
+	#ifdef DEBUG_FIFO_ACCESS
+		int i;
+	#endif
+	struct spi_transfer transfer;
+	u8 local_buffer[FIFO_SIZE + 1];
+	int retval;
+
+	if (size > FIFO_SIZE)
+	{
+		#ifdef DEBUG
+			dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then internal buffer \n");
+		#endif
+		return -EMSGSIZE;
+	}
+
+	/* prepare a bidirectional transfer */
+	local_buffer[0] = REG_FIFO;
+	memset(&transfer, 0, sizeof(transfer));
+  	transfer.tx_buf = local_buffer;
+  	transfer.rx_buf = local_buffer;
+	transfer.len	= size+1;
+
+	retval = spi_sync_transfer(spi, &transfer, 1);
+
+	#ifdef DEBUG_FIFO_ACCESS
+		for (i=0; i<size; i++)
+			dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i+1]);
+	#endif
+
+	memcpy(buffer, &local_buffer[1], size);  // TODO: ohne memcopy wäre schöner
+
+	return retval;
+}
+
+int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
+{
+	#ifdef DEBUG_FIFO_ACCESS
+		int i;
+	#endif
+	char spi_address = REG_FIFO | WRITE_BIT;
+	u8 local_buffer[FIFO_SIZE + 1];
+
+	if (size > FIFO_SIZE)
+	{
+		#ifdef DEBUG
+			dev_dbg(&spi->dev, "read fifo: passed in buffer bigger then internal buffer \n");
+		#endif
+		return -EMSGSIZE;
+	}
+
+	local_buffer[0] = spi_address;
+	memcpy(&local_buffer[1], buffer, size);  // TODO: ohne memcopy wäre schöner
+
+	#ifdef DEBUG_FIFO_ACCESS
+		for (i=0; i<size; i++)
+			dev_dbg(&spi->dev, "0x%x\n",buffer[i]);
+	#endif
+
+	return spi_write (spi, local_buffer, size + 1);
+}
+
+/*-------------------------------------------------------------------------*/
+
+u8 rf69_read_reg(struct spi_device *spi, u8 addr)
+{
+	int retval;
+
+	retval = spi_w8r8(spi, addr);
+
+	#ifdef DEBUG_VALUES
+		if (retval < 0)
+			/* should never happen, since we already checked,
+			   that module is connected. Therefore no error
+			   handling, just an optional error message... */
+			dev_dbg(&spi->dev, "read 0x%x FAILED\n",
+				addr);
+		else
+			dev_dbg(&spi->dev, "read 0x%x from reg 0x%x\n",
+				retval,
+				addr);
+	#endif
+
+	return retval;
+}
+
+int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value)
+{
+	int retval;
+	char buffer[2];
+
+	buffer[0] = addr | WRITE_BIT;
+	buffer[1] = value;
+
+	retval = spi_write(spi, &buffer, 2);
+
+	#ifdef DEBUG_VALUES
+		if (retval < 0)
+			/* should never happen, since we already checked,
+			   that module is connected. Therefore no error
+			   handling, just an optional error message... */
+			dev_dbg(&spi->dev, "write 0x%x to 0x%x FAILED\n",
+				value,
+				addr);
+		else
+			dev_dbg(&spi->dev, "wrote 0x%x to reg 0x%x\n",
+				value,
+				addr);
+	#endif
+
+	return retval;
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
+ *	Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
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
+#define F_OSC 		32000000  /* in Hz */
+#define FREQUENCY	433920000 /* in Hz, modifying this value impacts CE certification */
+#define FIFO_SIZE 	66        /* in byte */
+#define FIFO_THRESHOLD	15 	  /* in byte */
+
+int rf69_set_mode(struct spi_device *spi, enum mode mode);
+int rf69_set_data_mode(struct spi_device *spi, enum dataMode dataMode);
+int rf69_set_modulation(struct spi_device *spi, enum modulation modulation);
+enum modulation rf69_get_modulation(struct spi_device *spi);
+int rf69_set_modulation_shaping(struct spi_device *spi, enum modShaping modShaping);
+int rf69_set_bit_rate(struct spi_device *spi, u16 bitRate);
+int rf69_set_deviation(struct spi_device *spi, u32 deviation);
+int rf69_set_frequency(struct spi_device *spi, u32 frequency);
+int rf69_set_amplifier_0(struct spi_device *spi, enum optionOnOff optionOnOff);
+int rf69_set_amplifier_1(struct spi_device *spi, enum optionOnOff optionOnOff);
+int rf69_set_amplifier_2(struct spi_device *spi, enum optionOnOff optionOnOff);
+int rf69_set_output_power_level(struct spi_device *spi, u8 powerLevel);
+int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp paRamp);
+int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedance antennaImpedance);
+int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain);
+enum lnaGain rf69_get_lna_gain(struct spi_device *spi);
+int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi, u8 reg, enum dccPercent dccPercent);
+int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent dccPercent);
+int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPercent dccPercent);
+int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8 exponent);
+int rf69_set_bandwidth_during_afc(struct spi_device *spi, enum mantisse mantisse, u8 exponent);
+int rf69_set_ook_threshold_type(struct spi_device *spi, enum thresholdType thresholdType);
+int rf69_set_ook_threshold_step(struct spi_device *spi, enum thresholdStep thresholdStep);
+int rf69_set_ook_threshold_dec(struct spi_device *spi, enum thresholdDecrement thresholdDecrement);
+int rf69_set_dio_mapping(struct spi_device *spi, u8 DIONumber, u8 value);
+bool rf69_get_flag(struct spi_device *spi, enum flag flag);
+int rf69_reset_flag(struct spi_device *spi, enum flag flag);
+int rf69_set_rssi_threshold(struct spi_device *spi, u8 threshold);
+int rf69_set_rx_start_timeout(struct spi_device *spi, u8 timeout);
+int rf69_set_rssi_timeout(struct spi_device *spi, u8 timeout);
+int rf69_set_preamble_length(struct spi_device *spi, u16 preambleLength);
+int rf69_set_sync_enable(struct spi_device *spi, enum optionOnOff optionOnOff);
+int rf69_set_fifo_fill_condition(struct spi_device *spi, enum fifoFillCondition fifoFillCondition);
+int rf69_set_sync_size(struct spi_device *spi, u8 sync_size);
+int rf69_set_sync_tolerance(struct spi_device *spi, u8 syncTolerance);
+int rf69_set_sync_values(struct spi_device *spi, u8 syncValues[8]);
+int rf69_set_packet_format(struct spi_device * spi, enum packetFormat packetFormat);
+int rf69_set_crc_enable(struct spi_device *spi, enum optionOnOff optionOnOff);
+int rf69_set_adressFiltering(struct spi_device *spi, enum addressFiltering addressFiltering);
+int rf69_set_payload_length(struct spi_device *spi, u8 payloadLength);
+u8  rf69_get_payload_length(struct spi_device *spi);
+int rf69_set_node_address(struct spi_device *spi, u8 nodeAddress);
+int rf69_set_broadcast_address(struct spi_device *spi, u8 broadcastAddress);
+int rf69_set_tx_start_condition(struct spi_device *spi, enum txStartCondition txStartCondition);
+int rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold);
+int rf69_set_dagc(struct spi_device *spi, enum dagc dagc);
+
+int rf69_read_fifo (struct spi_device *spi, u8 *buffer, unsigned int size);
+int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size);
+
+u8  rf69_read_reg (struct spi_device *spi, u8 addr);
+int rf69_write_reg(struct spi_device *spi, u8 addr, u8 value);
+
+
+#endif
diff --git a/drivers/staging/pi433/rf69_enum.h b/drivers/staging/pi433/rf69_enum.h
new file mode 100644
index 0000000..fbfb59b
--- /dev/null
+++ b/drivers/staging/pi433/rf69_enum.h
@@ -0,0 +1,201 @@
+/*
+ * enumerations for HopeRf rf69 radio module
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *	Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
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
+//    fifoNotEmpty, collision with next enum; replaced by following enum...
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
diff --git a/drivers/staging/pi433/rf69_registers.h b/drivers/staging/pi433/rf69_registers.h
new file mode 100644
index 0000000..d0c4992
--- /dev/null
+++ b/drivers/staging/pi433/rf69_registers.h
@@ -0,0 +1,489 @@
+/*
+ * register description for HopeRf rf69 radio module
+ *
+ * Copyright (C) 2016 Wolf-Entwicklungen
+ *	Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
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
+/* RF69 register addresses		   */
+/*******************************************/
+#define  REG_FIFO			0x00
+#define  REG_OPMODE			0x01
+#define  REG_DATAMODUL			0x02
+#define  REG_BITRATE_MSB		0x03
+#define  REG_BITRATE_LSB		0x04
+#define  REG_FDEV_MSB			0x05
+#define  REG_FDEV_LSB			0x06
+#define  REG_FRF_MSB			0x07
+#define  REG_FRF_MID			0x08
+#define  REG_FRF_LSB			0x09
+#define  REG_OSC1			0x0A
+#define  REG_AFCCTRL			0x0B
+#define  REG_LOWBAT			0x0C
+#define  REG_LISTEN1			0x0D
+#define  REG_LISTEN2			0x0E
+#define  REG_LISTEN3			0x0F
+#define  REG_VERSION			0x10
+#define  REG_PALEVEL			0x11
+#define  REG_PARAMP			0x12
+#define  REG_OCP			0x13
+#define  REG_AGCREF			0x14 /* not available on RF69 */
+#define  REG_AGCTHRESH1			0x15 /* not available on RF69 */
+#define  REG_AGCTHRESH2			0x16 /* not available on RF69 */
+#define  REG_AGCTHRESH3			0x17 /* not available on RF69 */
+#define  REG_LNA			0x18
+#define  REG_RXBW			0x19
+#define  REG_AFCBW			0x1A
+#define  REG_OOKPEAK			0x1B
+#define  REG_OOKAVG			0x1C
+#define  REG_OOKFIX			0x1D
+#define  REG_AFCFEI			0x1E
+#define  REG_AFCMSB			0x1F
+#define  REG_AFCLSB			0x20
+#define  REG_FEIMSB			0x21
+#define  REG_FEILSB			0x22
+#define  REG_RSSICONFIG			0x23
+#define  REG_RSSIVALUE			0x24
+#define  REG_DIOMAPPING1		0x25
+#define  REG_DIOMAPPING2		0x26
+#define  REG_IRQFLAGS1			0x27
+#define  REG_IRQFLAGS2			0x28
+#define  REG_RSSITHRESH			0x29
+#define  REG_RXTIMEOUT1			0x2A
+#define  REG_RXTIMEOUT2			0x2B
+#define  REG_PREAMBLE_MSB		0x2C
+#define  REG_PREAMBLE_LSB		0x2D
+#define  REG_SYNC_CONFIG		0x2E
+#define  REG_SYNCVALUE1			0x2F
+#define  REG_SYNCVALUE2			0x30
+#define  REG_SYNCVALUE3			0x31
+#define  REG_SYNCVALUE4			0x32
+#define  REG_SYNCVALUE5			0x33
+#define  REG_SYNCVALUE6			0x34
+#define  REG_SYNCVALUE7			0x35
+#define  REG_SYNCVALUE8			0x36
+#define  REG_PACKETCONFIG1		0x37
+#define  REG_PAYLOAD_LENGTH		0x38
+#define  REG_NODEADRS			0x39
+#define  REG_BROADCASTADRS		0x3A
+#define  REG_AUTOMODES			0x3B
+#define  REG_FIFO_THRESH		0x3C
+#define  REG_PACKETCONFIG2		0x3D
+#define  REG_AESKEY1			0x3E
+#define  REG_AESKEY2			0x3F
+#define  REG_AESKEY3			0x40
+#define  REG_AESKEY4			0x41
+#define  REG_AESKEY5			0x42
+#define  REG_AESKEY6			0x43
+#define  REG_AESKEY7			0x44
+#define  REG_AESKEY8			0x45
+#define  REG_AESKEY9			0x46
+#define  REG_AESKEY10			0x47
+#define  REG_AESKEY11			0x48
+#define  REG_AESKEY12			0x49
+#define  REG_AESKEY13			0x4A
+#define  REG_AESKEY14			0x4B
+#define  REG_AESKEY15			0x4C
+#define  REG_AESKEY16			0x4D
+#define  REG_TEMP1			0x4E
+#define  REG_TEMP2			0x4F
+#define  REG_TESTPA1			0x5A /* only present on RFM69HW */
+#define  REG_TESTPA2			0x5C /* only present on RFM69HW */
+#define  REG_TESTDAGC			0x6F
+
+/******************************************************/
+/* RF69/SX1231 bit definition				*/
+/******************************************************/
+/* write bit */
+#define WRITE_BIT				0x80
+
+/* RegOpMode */
+#define  MASK_OPMODE_SEQUENCER_OFF		0x80
+#define  MASK_OPMODE_LISTEN_ON			0x40
+#define  MASK_OPMODE_LISTEN_ABORT		0x20
+#define  MASK_OPMODE_MODE			0x1C
+
+#define  OPMODE_MODE_SLEEP			0x00
+#define  OPMODE_MODE_STANDBY			0x04 /* default */
+#define  OPMODE_MODE_SYNTHESIZER		0x08
+#define  OPMODE_MODE_TRANSMIT			0x0C
+#define  OPMODE_MODE_RECEIVE			0x10
+
+/* RegDataModul */
+#define  MASK_DATAMODUL_MODE			0x06
+#define  MASK_DATAMODUL_MODULATION_TYPE		0x18
+#define  MASK_DATAMODUL_MODULATION_SHAPE	0x03
+
+#define  DATAMODUL_MODE_PACKET			0x00 /* default */
+#define  DATAMODUL_MODE_CONTINUOUS		0x40
+#define  DATAMODUL_MODE_CONTINUOUS_NOSYNC	0x60
+
+#define  DATAMODUL_MODULATION_TYPE_FSK		0x00 /* default */
+#define  DATAMODUL_MODULATION_TYPE_OOK		0x08
+
+#define  DATAMODUL_MODULATION_SHAPE_NONE	0x00 /* default */
+#define  DATAMODUL_MODULATION_SHAPE_1_0		0x01
+#define  DATAMODUL_MODULATION_SHAPE_0_5		0x02
+#define  DATAMODUL_MODULATION_SHAPE_0_3		0x03
+#define  DATAMODUL_MODULATION_SHAPE_BR		0x01
+#define  DATAMODUL_MODULATION_SHAPE_2BR		0x02
+
+/* RegFDevMsb (0x05)*/
+#define FDEVMASB_MASK				0x3f
+
+/*
+// RegOsc1
+#define  OSC1_RCCAL_START			0x80
+#define  OSC1_RCCAL_DONE			0x40
+
+// RegLowBat
+#define  LOWBAT_MONITOR				0x10
+#define  LOWBAT_ON				0x08
+#define  LOWBAT_OFF				0x00  // Default
+
+#define  LOWBAT_TRIM_1695			0x00
+#define  LOWBAT_TRIM_1764			0x01
+#define  LOWBAT_TRIM_1835			0x02  // Default
+#define  LOWBAT_TRIM_1905			0x03
+#define  LOWBAT_TRIM_1976			0x04
+#define  LOWBAT_TRIM_2045			0x05
+#define  LOWBAT_TRIM_2116			0x06
+#define  LOWBAT_TRIM_2185			0x07
+
+
+// RegListen1
+#define  LISTEN1_RESOL_64			0x50
+#define  LISTEN1_RESOL_4100			0xA0  // Default
+#define  LISTEN1_RESOL_262000			0xF0
+
+#define  LISTEN1_CRITERIA_RSSI			0x00  // Default
+#define  LISTEN1_CRITERIA_RSSIANDSYNC		0x08
+
+#define  LISTEN1_END_00				0x00
+#define  LISTEN1_END_01				0x02  // Default
+#define  LISTEN1_END_10				0x04
+
+
+// RegListen2
+#define  LISTEN2_COEFIDLE_VALUE			0xF5 // Default
+
+// RegListen3
+#define  LISTEN3_COEFRX_VALUE			0x20 // Default
+*/
+
+// RegPaLevel
+#define  MASK_PALEVEL_PA0			0x80
+#define  MASK_PALEVEL_PA1			0x40
+#define  MASK_PALEVEL_PA2			0x20
+#define  MASK_PALEVEL_OUTPUT_POWER		0x1F
+
+
+
+// RegPaRamp
+#define  PARAMP_3400				0x00
+#define  PARAMP_2000				0x01
+#define  PARAMP_1000				0x02
+#define  PARAMP_500				0x03
+#define  PARAMP_250				0x04
+#define  PARAMP_125				0x05
+#define  PARAMP_100				0x06
+#define  PARAMP_62				0x07
+#define  PARAMP_50				0x08
+#define  PARAMP_40				0x09 /* default */
+#define  PARAMP_31				0x0A
+#define  PARAMP_25				0x0B
+#define  PARAMP_20				0x0C
+#define  PARAMP_15				0x0D
+#define  PARAMP_12				0x0E
+#define  PARAMP_10				0x0F
+
+#define  MASK_PARAMP				0x0F
+
+/*
+// RegOcp
+#define  OCP_OFF				0x0F
+#define  OCP_ON					0x1A  // Default
+
+#define  OCP_TRIM_45				0x00
+#define  OCP_TRIM_50				0x01
+#define  OCP_TRIM_55				0x02
+#define  OCP_TRIM_60				0x03
+#define  OCP_TRIM_65				0x04
+#define  OCP_TRIM_70				0x05
+#define  OCP_TRIM_75				0x06
+#define  OCP_TRIM_80				0x07
+#define  OCP_TRIM_85				0x08
+#define  OCP_TRIM_90				0x09
+#define  OCP_TRIM_95				0x0A
+#define  OCP_TRIM_100				0x0B  // Default
+#define  OCP_TRIM_105				0x0C
+#define  OCP_TRIM_110				0x0D
+#define  OCP_TRIM_115				0x0E
+#define  OCP_TRIM_120				0x0F
+*/
+
+/* RegLna (0x18) */
+#define  MASK_LNA_ZIN				0x80
+#define  MASK_LNA_CURRENT_GAIN			0x38
+#define  MASK_LNA_GAIN				0x07
+
+#define  LNA_GAIN_AUTO				0x00 /* default */
+#define  LNA_GAIN_MAX				0x01
+#define  LNA_GAIN_MAX_MINUS_6			0x02
+#define  LNA_GAIN_MAX_MINUS_12			0x03
+#define  LNA_GAIN_MAX_MINUS_24			0x04
+#define  LNA_GAIN_MAX_MINUS_36			0x05
+#define  LNA_GAIN_MAX_MINUS_48			0x06
+
+
+/* RegRxBw (0x19) and RegAfcBw (0x1A) */
+#define  MASK_BW_DCC_FREQ			0xE0
+#define  MASK_BW_MANTISSE			0x18
+#define  MASK_BW_EXPONENT			0x07
+
+#define  BW_DCC_16_PERCENT			0x00
+#define  BW_DCC_8_PERCENT			0x20
+#define  BW_DCC_4_PERCENT			0x40 /* default */
+#define  BW_DCC_2_PERCENT			0x60
+#define  BW_DCC_1_PERCENT			0x80
+#define  BW_DCC_0_5_PERCENT			0xA0
+#define  BW_DCC_0_25_PERCENT			0xC0
+#define  BW_DCC_0_125_PERCENT			0xE0
+
+#define  BW_MANT_16				0x00
+#define  BW_MANT_20				0x08
+#define  BW_MANT_24				0x10 /* default */
+
+
+/* RegOokPeak (0x1B) */
+#define  MASK_OOKPEAK_THRESTYPE			0xc0
+#define  MASK_OOKPEAK_THRESSTEP			0x38
+#define  MASK_OOKPEAK_THRESDEC			0x07
+
+#define  OOKPEAK_THRESHTYPE_FIXED		0x00
+#define  OOKPEAK_THRESHTYPE_PEAK		0x40 /* default */
+#define  OOKPEAK_THRESHTYPE_AVERAGE		0x80
+
+#define  OOKPEAK_THRESHSTEP_0_5_DB		0x00 /* default */
+#define  OOKPEAK_THRESHSTEP_1_0_DB		0x08
+#define  OOKPEAK_THRESHSTEP_1_5_DB		0x10
+#define  OOKPEAK_THRESHSTEP_2_0_DB		0x18
+#define  OOKPEAK_THRESHSTEP_3_0_DB		0x20
+#define  OOKPEAK_THRESHSTEP_4_0_DB		0x28
+#define  OOKPEAK_THRESHSTEP_5_0_DB		0x30
+#define  OOKPEAK_THRESHSTEP_6_0_DB		0x38
+
+#define  OOKPEAK_THRESHDEC_ONCE			0x00 /* default */
+#define  OOKPEAK_THRESHDEC_EVERY_2ND		0x01
+#define  OOKPEAK_THRESHDEC_EVERY_4TH		0x02
+#define  OOKPEAK_THRESHDEC_EVERY_8TH		0x03
+#define  OOKPEAK_THRESHDEC_TWICE		0x04
+#define  OOKPEAK_THRESHDEC_4_TIMES		0x05
+#define  OOKPEAK_THRESHDEC_8_TIMES		0x06
+#define  OOKPEAK_THRESHDEC_16_TIMES		0x07
+
+/*
+// RegOokAvg
+#define  OOKAVG_AVERAGETHRESHFILT_00		0x00
+#define  OOKAVG_AVERAGETHRESHFILT_01		0x40
+#define  OOKAVG_AVERAGETHRESHFILT_10		0x80  // Default
+#define  OOKAVG_AVERAGETHRESHFILT_11		0xC0
+
+
+// RegAfcFei
+#define  AFCFEI_FEI_DONE			0x40
+#define  AFCFEI_FEI_START			0x20
+#define  AFCFEI_AFC_DONE			0x10
+#define  AFCFEI_AFCAUTOCLEAR_ON			0x08
+#define  AFCFEI_AFCAUTOCLEAR_OFF		0x00  // Default
+
+#define  AFCFEI_AFCAUTO_ON			0x04
+#define  AFCFEI_AFCAUTO_OFF			0x00  // Default
+
+#define  AFCFEI_AFC_CLEAR			0x02
+#define  AFCFEI_AFC_START			0x01
+
+// RegRssiConfig
+#define  RSSI_FASTRX_ON				0x08
+#define  RSSI_FASTRX_OFF			0x00  // Default
+#define  RSSI_DONE				0x02
+#define  RSSI_START				0x01
+*/
+
+/* RegDioMapping1 */
+#define  MASK_DIO0				0xC0
+#define  MASK_DIO1				0x30
+#define  MASK_DIO2				0x0C
+#define  MASK_DIO3				0x03
+#define  SHIFT_DIO0				6
+#define  SHIFT_DIO1				4
+#define  SHIFT_DIO2				2
+#define  SHIFT_DIO3				0
+
+/* RegDioMapping2 */
+#define  MASK_DIO4				0xC0
+#define  MASK_DIO5				0x30
+#define  SHIFT_DIO4				6
+#define  SHIFT_DIO5				4
+
+/* DIO numbers */
+#define  DIO0					0
+#define  DIO1					1
+#define  DIO2					2
+#define  DIO3					3
+#define  DIO4					4
+#define  DIO5					5
+
+/* DIO Mapping values (packet mode) */
+#define  DIO_ModeReady_DIO4			0x00
+#define  DIO_ModeReady_DIO5			0x03
+#define  DIO_ClkOut				0x00
+#define  DIO_Data				0x01
+#define  DIO_TimeOut_DIO1			0x03
+#define  DIO_TimeOut_DIO4			0x00
+#define  DIO_Rssi_DIO0				0x03
+#define  DIO_Rssi_DIO3_4			0x01
+#define  DIO_RxReady				0x02
+#define  DIO_PLLLock				0x03
+#define  DIO_TxReady				0x01
+#define  DIO_FifoFull_DIO1			0x01
+#define  DIO_FifoFull_DIO3			0x00
+#define  DIO_SyncAddress			0x02
+#define  DIO_FifoNotEmpty_DIO1			0x02
+#define  DIO_FifoNotEmpty_FIO2			0x00
+#define  DIO_Automode				0x04
+#define  DIO_FifoLevel				0x00
+#define  DIO_CrcOk				0x00
+#define  DIO_PayloadReady			0x01
+#define  DIO_PacketSent				0x00
+#define  DIO_Dclk				0x00
+
+/* RegDioMapping2 CLK_OUT part */
+#define  MASK_DIOMAPPING2_CLK_OUT		0x07
+
+#define  DIOMAPPING2_CLK_OUT_NO_DIV		0x00
+#define  DIOMAPPING2_CLK_OUT_DIV_2		0x01
+#define  DIOMAPPING2_CLK_OUT_DIV_4		0x02
+#define  DIOMAPPING2_CLK_OUT_DIV_8		0x03
+#define  DIOMAPPING2_CLK_OUT_DIV_16		0x04
+#define  DIOMAPPING2_CLK_OUT_DIV_32		0x05
+#define  DIOMAPPING2_CLK_OUT_RC			0x06
+#define  DIOMAPPING2_CLK_OUT_OFF		0x07 /* default */
+
+/* RegIrqFlags1 */
+#define  MASK_IRQFLAGS1_MODE_READY		0x80
+#define  MASK_IRQFLAGS1_RX_READY		0x40
+#define  MASK_IRQFLAGS1_TX_READY		0x20
+#define  MASK_IRQFLAGS1_PLL_LOCK		0x10
+#define  MASK_IRQFLAGS1_RSSI			0x08
+#define  MASK_IRQFLAGS1_TIMEOUT			0x04
+#define  MASK_IRQFLAGS1_AUTOMODE		0x02
+#define  MASK_IRQFLAGS1_SYNC_ADDRESS_MATCH	0x01
+
+/* RegIrqFlags2 */
+#define  MASK_IRQFLAGS2_FIFO_FULL		0x80
+#define  MASK_IRQFLAGS2_FIFO_NOT_EMPTY		0x40
+#define  MASK_IRQFLAGS2_FIFO_LEVEL		0x20
+#define  MASK_IRQFLAGS2_FIFO_OVERRUN		0x10
+#define  MASK_IRQFLAGS2_PACKET_SENT		0x08
+#define  MASK_IRQFLAGS2_PAYLOAD_READY		0x04
+#define  MASK_IRQFLAGS2_CRC_OK			0x02
+#define  MASK_IRQFLAGS2_LOW_BAT			0x01
+
+/* RegSyncConfig */
+#define  MASK_SYNC_CONFIG_SYNC_ON		0x80 /* default */
+#define  MASK_SYNC_CONFIG_FIFO_FILL_CONDITION	0x40
+#define  MASK_SYNC_CONFIG_SYNC_SIZE		0x38
+#define  MASK_SYNC_CONFIG_SYNC_TOLERANCE	0x07
+
+/* RegPacketConfig1 */
+#define  MASK_PACKETCONFIG1_PAKET_FORMAT_VARIABLE	0x80
+#define  MASK_PACKETCONFIG1_DCFREE			0x60
+#define  MASK_PACKETCONFIG1_CRC_ON			0x10 /* default */
+#define  MASK_PACKETCONFIG1_CRCAUTOCLEAR_OFF		0x08
+#define  MASK_PACKETCONFIG1_ADDRESSFILTERING		0x06
+
+#define  PACKETCONFIG1_DCFREE_OFF			0x00 /* default */
+#define  PACKETCONFIG1_DCFREE_MANCHESTER		0x20
+#define  PACKETCONFIG1_DCFREE_WHITENING			0x40
+#define  PACKETCONFIG1_ADDRESSFILTERING_OFF		0x00 /* default */
+#define  PACKETCONFIG1_ADDRESSFILTERING_NODE		0x02
+#define  PACKETCONFIG1_ADDRESSFILTERING_NODEBROADCAST	0x04
+
+/*
+// RegAutoModes
+#define  AUTOMODES_ENTER_OFF			0x00  // Default
+#define  AUTOMODES_ENTER_FIFONOTEMPTY		0x20
+#define  AUTOMODES_ENTER_FIFOLEVEL		0x40
+#define  AUTOMODES_ENTER_CRCOK			0x60
+#define  AUTOMODES_ENTER_PAYLOADREADY		0x80
+#define  AUTOMODES_ENTER_SYNCADRSMATCH		0xA0
+#define  AUTOMODES_ENTER_PACKETSENT		0xC0
+#define  AUTOMODES_ENTER_FIFOEMPTY		0xE0
+
+#define  AUTOMODES_EXIT_OFF			0x00  // Default
+#define  AUTOMODES_EXIT_FIFOEMPTY		0x04
+#define  AUTOMODES_EXIT_FIFOLEVEL		0x08
+#define  AUTOMODES_EXIT_CRCOK			0x0C
+#define  AUTOMODES_EXIT_PAYLOADREADY		0x10
+#define  AUTOMODES_EXIT_SYNCADRSMATCH		0x14
+#define  AUTOMODES_EXIT_PACKETSENT		0x18
+#define  AUTOMODES_EXIT_RXTIMEOUT		0x1C
+
+#define  AUTOMODES_INTERMEDIATE_SLEEP		0x00  // Default
+#define  AUTOMODES_INTERMEDIATE_STANDBY		0x01
+#define  AUTOMODES_INTERMEDIATE_RECEIVER	0x02
+#define  AUTOMODES_INTERMEDIATE_TRANSMITTER	0x03
+
+*/
+/* RegFifoThresh (0x3c) */
+#define  MASK_FIFO_THRESH_TXSTART		0x80
+#define  MASK_FIFO_THRESH_VALUE			0x7F
+
+/*
+
+// RegPacketConfig2
+#define  PACKET2_RXRESTARTDELAY_1BIT		0x00  // Default
+#define  PACKET2_RXRESTARTDELAY_2BITS		0x10
+#define  PACKET2_RXRESTARTDELAY_4BITS		0x20
+#define  PACKET2_RXRESTARTDELAY_8BITS		0x30
+#define  PACKET2_RXRESTARTDELAY_16BITS		0x40
+#define  PACKET2_RXRESTARTDELAY_32BITS		0x50
+#define  PACKET2_RXRESTARTDELAY_64BITS		0x60
+#define  PACKET2_RXRESTARTDELAY_128BITS		0x70
+#define  PACKET2_RXRESTARTDELAY_256BITS		0x80
+#define  PACKET2_RXRESTARTDELAY_512BITS		0x90
+#define  PACKET2_RXRESTARTDELAY_1024BITS	0xA0
+#define  PACKET2_RXRESTARTDELAY_2048BITS	0xB0
+#define  PACKET2_RXRESTARTDELAY_NONE		0xC0
+#define  PACKET2_RXRESTART			0x04
+
+#define  PACKET2_AUTORXRESTART_ON		0x02  // Default
+#define  PACKET2_AUTORXRESTART_OFF		0x00
+
+#define  PACKET2_AES_ON				0x01
+#define  PACKET2_AES_OFF			0x00  // Default
+
+
+// RegTemp1
+#define  TEMP1_MEAS_START			0x08
+#define  TEMP1_MEAS_RUNNING			0x04
+#define  TEMP1_ADCLOWPOWER_ON			0x01  // Default
+#define  TEMP1_ADCLOWPOWER_OFF			0x00
+*/
+
+// RegTestDagc (0x6F)
+#define  DAGC_NORMAL				0x00 /* Reset value */
+#define  DAGC_IMPROVED_LOWBETA1			0x20
+#define  DAGC_IMPROVED_LOWBETA0			0x30 /* Recommended val */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
