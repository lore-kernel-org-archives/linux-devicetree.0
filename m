From: Mickael Guene <mickael.guene@st.com>
Subject: [PATCH v1 0/3] Add support for MIPID02 CSI-2 to PARALLEL bridge I2C device
Date: Tue, 12 Mar 2019 07:44:02 +0100
Message-ID: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mickael Guene <mickael.guene@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Todor Tomov <todor.tomov@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Ben Kao <ben.kao@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Ranostay <matt.ranostay@konsulko.com>, Wolfram Sang <wsa@the-dreams.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Akinobu Mita <akinobu.mita@gmail.com>, Hans
List-Id: devicetree@vger.kernel.org

This patchset introduces support of STMicroelectronics MIPID02 CSI-2 to PARALLEL
I2C bridge. It allows using a CSI-2 sensor with a PARALLEL interface.
Current driver implementation doesn't support CSI-2 second input port usage. It
doesn't support also YUV420, RGB565 and RGB444 input formats.


Mickael Guene (3):
  dt-bindings: Document MIPID02 bindings
  media:st-mipid02: MIPID02 CSI-2 to PARALLEL bridge driver
  media: MAINTAINERS: add entry for STMicroelectronics MIPID02 media
    driver

 .../bindings/media/i2c/st,st-mipid02.txt           |  69 ++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/st-mipid02.c                     | 878 +++++++++++++++++++++
 5 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
 create mode 100644 drivers/media/i2c/st-mipid02.c

-- 
2.7.4
