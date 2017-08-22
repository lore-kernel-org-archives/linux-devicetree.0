From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/6] IIO driver for MCP3550/1/3
Date: Tue, 22 Aug 2017 15:33:00 +0200
Message-ID: <cover.1503407738.git.lukas@wunner.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Oskar Andero <oskar.andero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrea Galbusera <gizero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Manfred Schlaegl <manfred.schlaegl-RbZlAiThDcE@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Soeren Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Two fixes, one speedup & one cleanup for the mcp320x.c driver,
plus support for new chips:

The MCP3550/1/3 are 22 bit delta-sigma ADCs with high accuracy,
low noise characteristics and an extended temperature range.
It's the top-of-the-line SPI ADC in Microchip's portfolio.

The chip is used by the "Revolution Pi" family of open source PLCs
based on the Raspberry Pi (https://revolution.kunbus.com/).

Thanks,

Lukas


Lukas Wunner (6):
  iio: adc: mcp320x: Fix oops on module unload
  iio: adc: mcp320x: Fix readout of negative voltages
  iio: adc: mcp320x: Speed up readout of single-channel ADCs
  iio: adc: mcp320x: Drop unnecessary of_device_id attributes
  dt-bindings: iio: adc: mcp320x: Update for mcp3550/1/3
  iio: adc: mcp320x: Add support for mcp3550/1/3

 .../devicetree/bindings/iio/adc/mcp320x.txt        |  23 ++
 drivers/iio/adc/Kconfig                            |   5 +-
 drivers/iio/adc/mcp320x.c                          | 264 ++++++++++++++-------
 3 files changed, 202 insertions(+), 90 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
