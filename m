Return-Path: <SRS0=pcha=WL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v7 00/13] Add TVP5150 features
Date: Thu, 15 Aug 2019 13:57:34 +0200
Message-Id: <20190815115747.24018-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

many thanks to Mauro, Hans, Jacopo and Laurent for the
feedack :)
Hopefully I got all the comments and concerns and fixed those
with this v7.

In short:
 - v4l2-connector label isn't set anymore if not specified
 - tvp5150 connectors are now static
   -> reduces code and is easier to review and maintain

Each changed patch contains a more detailed changelog.

Hopefully we get this series done :)

Regards,
  Marco

Javier Martinez Canillas (1):
  partial revert of "[media] tvp5150: add HW input connectors support"

Marco Felsch (11):
  dt-bindings: connector: analog: add tv norms property
  media: v4l2-fwnode: add v4l2_fwnode_connector
  media: v4l2-fwnode: add initial connector parsing support
  media: tvp5150: add input source selection of_graph support
  media: dt-bindings: tvp5150: Add input port connectors DT bindings
  media: tvp5150: add FORMAT_TRY support for get/set selection handlers
  media: tvp5150: add s_power callback
  media: dt-bindings: tvp5150: cleanup bindings stlye
  media: dt-bindings: tvp5150: add optional tvnorms documentation
  media: tvp5150: add support to limit tv norms on connector
  media: tvp5150: make debug output more readable

Michael Tretter (1):
  media: tvp5150: initialize subdev before parsing device tree

 .../display/connector/analog-tv-connector.txt |   4 +
 .../devicetree/bindings/media/i2c/tvp5150.txt | 145 +++-
 drivers/media/i2c/tvp5150.c                   | 644 +++++++++++++-----
 drivers/media/v4l2-core/v4l2-fwnode.c         | 137 ++++
 include/dt-bindings/media/tvnorms.h           |  72 ++
 include/dt-bindings/media/tvp5150.h           |   2 -
 include/media/v4l2-fwnode.h                   |  83 +++
 7 files changed, 895 insertions(+), 192 deletions(-)
 create mode 100644 include/dt-bindings/media/tvnorms.h

-- 
2.20.1
