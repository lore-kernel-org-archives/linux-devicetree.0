From: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/6] IIO driver for MCP3550/1/3
Date: Sat, 9 Sep 2017 20:32:41 +0200
Message-ID: <cover.1504807204.git.lukas@wunner.de>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Mathias Duckeck <m.duckeck-XB/JSsFECOqzQB+pC5nmwQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Oskar Andero <oskar.andero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrea Galbusera <gizero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Manfred Schlaegl <manfred.schlaegl-RbZlAiThDcE@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Soeren Andersen <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

One speedup, one cleanup, one kerneldoc patch for mcp320x.c
plus support for the MCP3550/1/3 used by the "Revolution Pi"
family of open source PLCs (https://revolution.kunbus.com/).

Changes since v1:
- Drop two patches which are now queued. (Jonathan)

- Move kerneldoc to separate patch. (Jonathan)

- Move support for continuous conversion mode to separate patch
  which is marked informational / not for merging.  Rename device
  property to "continuous" for consistency with the existing
  similar property of drivers/iio/light/us5182d.c. (Rob, Jonathan)

- Rework calculation of raw value in patch [5/6]:  Instead of
  byte-wise mangling, convert the big endian value clocked out
  by the chip to host byte order and mangle the resulting 32-bit
  value.  Reduces the amount of code and improves readability as
  the bit numbers referenced in the code comment and datasheet
  are used verbatim in the code.

- Use switch/case-statement instead of if-clause when applying
  chip-specific quirks in mcp320x_probe(). (Jonathan)

- Expand code comment explaining the two consecutive conversions
  in mcp320x_probe(). (Jonathan)

Thanks,

Lukas


Lukas Wunner (6):
  iio: adc: mcp320x: Speed up readout of single-channel ADCs
  iio: adc: mcp320x: Drop unnecessary of_device_id attributes
  iio: adc: mcp320x: Document struct mcp320x
  dt-bindings: iio: adc: mcp320x: Update for mcp3550/1/3
  iio: adc: mcp320x: Add support for mcp3550/1/3
  iio: adc: mcp320x: Support continuous conversion mode

 .../devicetree/bindings/iio/adc/mcp320x.txt        |  23 ++
 drivers/iio/adc/Kconfig                            |   5 +-
 drivers/iio/adc/mcp320x.c                          | 240 ++++++++++++++-------
 3 files changed, 188 insertions(+), 80 deletions(-)

-- 
2.11.0
