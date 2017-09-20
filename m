From: Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v3 0/4] BCM283x Camera Receiver driver
Date: Wed, 20 Sep 2017 17:07:53 +0100
Message-ID: <cover.1505916622.git.dave.stevenson@raspberrypi.org>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Hi All.

v3 of this patch set.
This addresses the DT issues raised by Rob, and the things raised by
Eric on the driver. More complete change details between v2 and v3
are in the individual patches.

Thanks
  Dave

Dave Stevenson (4):
  [media] v4l2-common: Add helper function for fourcc to string
  [media] dt-bindings: Document BCM283x CSI2/CCP2 receiver
  [media] bcm2835-unicam: Driver for CCP2/CSI2 camera interface
  MAINTAINERS: Add entry for BCM2835 camera driver

 .../devicetree/bindings/media/bcm2835-unicam.txt   |   85 +
 MAINTAINERS                                        |    7 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/bcm2835/Kconfig             |   14 +
 drivers/media/platform/bcm2835/Makefile            |    3 +
 drivers/media/platform/bcm2835/bcm2835-unicam.c    | 2192 ++++++++++++++++++++
 drivers/media/platform/bcm2835/vc4-regs-unicam.h   |  264 +++
 drivers/media/v4l2-core/v4l2-common.c              |   18 +
 include/media/v4l2-common.h                        |    3 +
 10 files changed, 2588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/bcm2835-unicam.txt
 create mode 100644 drivers/media/platform/bcm2835/Kconfig
 create mode 100644 drivers/media/platform/bcm2835/Makefile
 create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
 create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h

-- 
2.7.4
