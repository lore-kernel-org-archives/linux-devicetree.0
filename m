From: Mickael Guene <mickael.guene@st.com>
Subject: [PATCH v5 0/3] Add support for MIPID02 CSI-2 to PARALLEL bridge I2C device
Date: Tue, 9 Apr 2019 08:15:46 +0200
Message-ID: <1554790549-795-1-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: hugues.fruchet@st.com, Mickael Guene <mickael.guene@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matt Ranostay <matt.ranostay@konsulko.com>, devicetree@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todor Tomov <todor.tomov@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Rui Miguel Silva <rui.silva@linaro.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mark Rutland <mark.rutland@arm.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>Hans
List-Id: devicetree@vger.kernel.org

Hi,

This is the v5 of my MIPID02 series which introduces support of
STMicroelectronics MIPID02 CSI-2 to PARALLEL I2C bridge. It allows using a CSI-2
sensor with a PARALLEL interface. Current driver implementation doesn't support
CSI-2 second input port usage. It doesn't support also YUV420, RGB565 and RGB444
input formats.

Thanks to Sakari for review.

Changes in v5:
- Typo
- Remove useless MEDIA_CONTROLLER from Kconfig
- Replace v4l2_fwnode_endpoint_alloc_parse usage by v4l2_fwnode_endpoint_parse
  since not more variable size data usage
- Add missing mutex_destroy calls
- Switch to probe_new since I²C ID table is not used
- Add new patch to add MEDIA_BUS_FMT_BGR888_3X8 needed output format
- Add MEDIA_BUS_FMT_BGR888_3X8 usage in serial_to_parallel_code

Changes in v4:
- Fix and clarify endpoints properties documentation
- Add support of enum_mbus_code
- Only use V4L2_CID_PIXEL_RATE to compute link speed
- Use MEDIA_BUS_FMT_UYVY8_1X16 instead of MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2 link
- Fix miscellaneous typos
- Fix wrong code behavior for set_fmt and get_fmt

Changes in v3:
- Fix potential wrong error code for mipid02_stream_disable and mipid02_stream_enable
- Remove useless memset for ep in mipid02_parse_rx_ep and mipid02_parse_tx_ep
- Add second CSI-2 input pad even if it's not yet supported
- Add support of get_fmt, set_fmt and link_validate and only access subdev connected to mipid02

Changes in v2:
- Add precision about first CSI-2 port data rate
- Document endpoints supported properties
- Rename 'mipid02@14' into generic 'csi2rx@14' in example
- Merge MAINTAINERS patch 3 into patch 1 and 2
- Fix line too long in Kconfig
- Add missing delay after reset release
- Various style fixes
- Fix mipid02_stream_enable returning no error when mipid02_find_sensor failed

Mickael Guene (3):
  media: uapi: Add MEDIA_BUS_FMT_BGR888_3X8 media bus format
  dt-bindings: Document MIPID02 bindings
  media: st-mipid02: MIPID02 CSI-2 to PARALLEL bridge driver

 .../bindings/media/i2c/st,st-mipid02.txt           |   82 ++
 Documentation/media/uapi/v4l/subdev-formats.rst    |  107 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/st-mipid02.c                     | 1033 ++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |    3 +-
 7 files changed, 1246 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
 create mode 100644 drivers/media/i2c/st-mipid02.c

-- 
2.7.4
