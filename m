From: Mickael Guene <mickael.guene@st.com>
Subject: [PATCH v3 0/2] Add support for MIPID02 CSI-2 to PARALLEL bridge I2C device
Date: Tue, 26 Mar 2019 11:03:38 +0100
Message-ID: <1553594620-88280-1-git-send-email-mickael.guene@st.com>
References: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: hugues.fruchet@st.com, Mickael Guene <mickael.guene@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Ben Kao <ben.kao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Ranostay <matt.ranostay@konsulko.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Cvek <petrcvekcz@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, Mark Rutland <mark.rutland@arm.com>, Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Akinobu Mita <akinobu.mita@g>
List-Id: devicetree@vger.kernel.org

Hi,

This is the v3 of my MIPID02 series which introduces support of
STMicroelectronics MIPID02 CSI-2 to PARALLEL I2C bridge. It allows using a CSI-2
sensor with a PARALLEL interface. Current driver implementation doesn't support
CSI-2 second input port usage. It doesn't support also YUV420, RGB565 and RGB444
input formats.

Thanks to Sakari for review.

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

Mickael Guene (2):
  dt-bindings: Document MIPID02 bindings
  media:st-mipid02: MIPID02 CSI-2 to PARALLEL bridge driver

 .../bindings/media/i2c/st,st-mipid02.txt           |   83 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/st-mipid02.c                     | 1012 ++++++++++++++++++++
 5 files changed, 1118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
 create mode 100644 drivers/media/i2c/st-mipid02.c

-- 
2.7.4
