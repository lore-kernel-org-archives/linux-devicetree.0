From: Mickael Guene <mickael.guene@st.com>
Subject: [PATCH v2 0/2] Add support for MIPID02 CSI-2 to PARALLEL bridge I2C device
Date: Mon, 25 Mar 2019 08:55:08 +0100
Message-ID: <1553500510-153260-1-git-send-email-mickael.guene@st.com>
References: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: hugues.fruchet@st.com, Mickael Guene <mickael.guene@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Ben Kao <ben.kao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Ranostay <matt.ranostay@konsulko.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Mark Rutland <mark.rutland@arm.com>, Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

This is the v2 of my MIPID02 series which introduces support of
STMicroelectronics MIPID02 CSI-2 to PARALLEL I2C bridge. It allows using a CSI-2
sensor with a PARALLEL interface. Current driver implementation doesn't support
CSI-2 second input port usage. It doesn't support also YUV420, RGB565 and RGB444
input formats.

Thanks to Sakari for v1 series review.

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

 .../bindings/media/i2c/st,st-mipid02.txt           |  83 ++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  14 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/st-mipid02.c                     | 877 +++++++++++++++++++++
 5 files changed, 983 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
 create mode 100644 drivers/media/i2c/st-mipid02.c

-- 
2.7.4
