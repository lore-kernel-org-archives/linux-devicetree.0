From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/4] iio: adc: Maxim max9611 driver
Date: Mon, 27 Mar 2017 17:12:54 +0200
Message-ID: <1490627578-15938-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,
   fourth round for max9611 driver.

Biggest shift from v3 is change in locking, now performed only at
read_single() level.
No locking in read_raw, nor in read_csa_voltage(), as the only thing to
protect is the on-chip mux configuration between and I2c write and a read.
All other functions end up in calling this read_single() one, and they do not
share variables, so concurrent accesses to sysfs attributes should be safe.

Changed scale of temperature channel, and fixed shunt resistor names, that now
appears as properties of their respective power and current channels.

Ack on dt-bindings for "shunt-resistor-ohm" property pending from device
tree guardians.

Output of iio_info on Salvator-X board for max9611 chip installed on
VDD_0.8 lines.
The VDD_0.8 line powers the CPU cluster and on-board RAM.

        iio:device0: max9611
                5 channels found:
                        voltage0:  (input)
                        1 channel-specific attributes found:
                                attr 0: input value: 4.085000000
                        voltage1:  (input)
                        3 channel-specific attributes found:
                                attr 0: scale value: 14
                                attr 1: offset value: 1
                                attr 2: raw value: 59
                        power:  (input)
                        2 channel-specific attributes found:
                                attr 0: shunt_resistor value: 5000
                                attr 1: input value: 663.404000000
                        current:  (input)
                        2 channel-specific attributes found:
                                attr 0: shunt_resistor value: 5000
                                attr 1: input value: 817.000000000
                        temp:  (input)
                        2 channel-specific attributes found:
                                attr 0: scale value: 480.076812289
                                attr 1: raw value: 57

The collected information represent:

* voltage0 (current sense voltage) Vcsa
  voltage drop between RS+ and RS- input = 4,085 mV
* voltage1: (common input voltage) Vcim
  voltage at RS+ input = (59 - 1) * 14 = 812 mV
* current flowing on shunt resistor (Icsa)
  = Vcsa / Rshunt = 817 mA
* power load on the sensed line (Pload)
  = Vcim * Icsa = 663 m
* die temperature = (57 * 480.07) = 27360 milli Celsius

Thanks
   j

v1 -> v2:
- Drop wildcard (max961x) in driver, documentation and dt-bindings. Use
  max9611 instead.
- Make 3 processed channels for csa voltage, csa current and power load
- Remove wrapper functions around i2c buffer access
- Add locking in read_raw()
- Make 2 separate attributes for shunt resistor: current and power
- Renamed shunt resistor attribute
- Fixed several review comments

v2 -> v3:
- Incorporated Geert's suggestions on using a more generic name for ADC nodes
  in device tree
- Changed "maxim,shunt-resistor-uohm" to "shunt-resistor-uohm"
- Update documentation accordingly to the two previous changes

v3 -> v4:
- Move all locking to read_single() function
- Re-structure read_raw() with Jonathan's and Peter's comments
- Rename some defines pre-pending MAX9611 prefix
- Use values from .comaptible entries for device name
- Change temperature scale to have a value in milli Celsius
- Simplify init routine using read_single

Jacopo Mondi (4):
  Documentation: dt-bindings: iio: Add max9611 ADC
  iio: Documentation: Add max9611 sysfs documentation
  iio: adc: Add Maxim max9611 ADC driver
  arm64: dts: salvator-x: Add current sense amplifiers

 .../ABI/testing/sysfs-bus-iio-adc-max9611          |  17 +
 .../devicetree/bindings/iio/adc/max9611.txt        |  26 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  18 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/max9611.c                          | 583 +++++++++++++++++++++
 6 files changed, 655 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
 create mode 100644 Documentation/devicetree/bindings/iio/adc/max9611.txt
 create mode 100644 drivers/iio/adc/max9611.c

-- 
2.7.4
