From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 0/2] iio: adc: Add Maxim MAX11100 driver
Date: Wed, 18 Jan 2017 17:30:51 +0100
Message-ID: <1484757053-7102-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello everyone,
  hopefully we have reached last iteration on this simple driver.

After having clarified the read_raw() measure unit question, I'm now sending
out v5 addressing Jonathan's comment on having spi destination aligned to
their own cache lines to support DMA-capable SPI controllers.

Also, I added indio_dev->name attribute, as suggested by Lars-Peter even if
the same value can be retrieved from of_node/name.


v1 -> v2:
    - incorporated pmeerw's review comments
    - retrieve vref from dts and use that to convert read_raw result
      to mV
    - add device tree bindings documentation

v2 -> v3:
    - add _SCALE bit of read_raw function and change _RAW bit accordingly
    - call regulator_get_voltage when accessing the _SCALE part of read_raw
      and not during probe
    - add back remove function as regulator has to be disabled when detaching
      the module. Do not use devm_ version of iio_register/unregister functions
      anymore but do unregister in the remove.
    - remove mutex as access to SPI bus is protected by SPI core. Thanks marex

v3 -> v4:
    - split device tree binding documentation and actual ADC driver
    - add "reg" to the list of required properties and use a better
      namimg for the adc device node in bindings documentation as suggested
      by Geert.

v4 -> v5:
    - make spi_read() destination buffer cacheline aligned
    - add indio_dev->name attribute.

Jacopo Mondi (2):
  iio: adc: Add Maxim MAX11100 driver
  dt-bindings: iio: document MAX11100 ADC

 .../devicetree/bindings/iio/adc/max11100.txt       |  19 ++
 drivers/iio/adc/Kconfig                            |   9 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/max11100.c                         | 192 +++++++++++++++++++++
 4 files changed, 221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/max11100.txt
 create mode 100644 drivers/iio/adc/max11100.c

-- 
2.7.4
