From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] Add more recommended generic node names
Date: Fri, 20 Jan 2017 16:29:32 -0600
Message-ID: <20170120222932.14753-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT usage and hardware types have evolved quite a bit and the generic
node names list is quite out of date. Add new entries to the list based
on dumping out node names from dts files. This is by no means complete,
but is low hanging fruit.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 source/devicetree-basics.rst | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
index be80af3d825b..93cea8e82a64 100644
--- a/source/devicetree-basics.rst
+++ b/source/devicetree-basics.rst
@@ -182,44 +182,95 @@ name should be one of the following choices:
 .. hlist::
    :columns: 3
 
+   * adc
+   * accelerometer
    * atm
+   * audio-codec
+   * audio-controller
+   * backlight
+   * bluetooth
+   * bus
    * cache-controller
+   * camera
+   * can
+   * charger
+   * clock
+   * clock-controller
    * compact-flash
    * can
    * cpu
+   * cpus
    * crypto
    * disk
    * display
    * dma-controller
+   * dsp
+   * eeprom
+   * efuse
+   * endpoint
    * ethernet
    * ethernet-phy
    * fdc
    * flash
    * gpio
+   * gpu
+   * gyrometer
+   * hdmi
    * i2c
    * ide
    * interrupt-controller
    * isa
    * keyboard
+   * key
+   * keys
+   * lcd-controller
+   * led
+   * leds
+   * led-controller
+   * light-sensor
+   * magnetometer
+   * mailbox
    * mdio
    * memory
    * memory-controller
+   * mmc
+   * mmc-slot
    * mouse
+   * nand-controller
    * nvram
+   * oscillator
    * parallel
    * pc-card
    * pci
    * pcie
+   * phy
+   * pinctrl
+   * pmic
+   * pmu
+   * port
+   * ports
+   * pwm
+   * regulator
+   * reset-controller
    * rtc
    * sata
    * scsi
    * serial
    * sound
    * spi
+   * sram-controller
+   * ssi-controller
+   * syscon
+   * temperature-sensor
    * timer
+   * touchscreen
    * usb
+   * usb-hub
+   * usb-phy
+   * video-codec
    * vme
    * watchdog
+   * wifi
 
 Path Names
 ~~~~~~~~~~
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
