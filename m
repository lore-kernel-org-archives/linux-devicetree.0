Return-Path: <SRS0=mEvB=WS=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v9 00/13] Add TVP5150 features
Date: Thu, 22 Aug 2019 10:05:43 +0200
Message-Id: <20190822080556.17109-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

this version is exactly the same as my v8 [1]. I fixed only a leading semicolon
issue in patch ("media: v4l2-fwnode: add initial connector parsing support")
found by the kbuild test robot.

Regards,
  Marco

[1] https://www.spinics.net/lists/linux-media/msg156159.html

Javier Martinez Canillas (1):
  partial revert of "[media] tvp5150: add HW input connectors support"

Marco Felsch (11):
  dt-bindings: connector: analog: add sdtv standards property
  media: v4l2-fwnode: add v4l2_fwnode_connector
  media: v4l2-fwnode: add initial connector parsing support
  media: tvp5150: add input source selection of_graph support
  media: dt-bindings: tvp5150: Add input port connectors DT bindings
  media: tvp5150: add FORMAT_TRY support for get/set selection handlers
  media: tvp5150: add s_power callback
  media: dt-bindings: tvp5150: cleanup bindings stlye
  media: dt-bindings: tvp5150: add optional sdtv standards documentation
  media: tvp5150: add support to limit sdtv standards
  media: tvp5150: make debug output more readable

Michael Tretter (1):
  media: tvp5150: initialize subdev before parsing device tree

 .../display/connector/analog-tv-connector.txt |   6 +
 .../devicetree/bindings/media/i2c/tvp5150.txt | 146 +++-
 drivers/media/i2c/tvp5150.c                   | 649 +++++++++++++-----
 drivers/media/v4l2-core/v4l2-fwnode.c         | 133 ++++
 include/dt-bindings/display/sdtv-standards.h  |  76 ++
 include/dt-bindings/media/tvp5150.h           |   2 -
 include/media/v4l2-fwnode.h                   |  83 +++
 include/uapi/linux/videodev2.h                |   4 +
 8 files changed, 909 insertions(+), 190 deletions(-)
 create mode 100644 include/dt-bindings/display/sdtv-standards.h

-- 
2.20.1
