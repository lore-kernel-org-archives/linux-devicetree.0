Return-Path: <SRS0=g+8A=G4=gmail.com=akinobu.mita@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 0/6] media: ov772x: support media controller, device tree probing, etc.
Date: Sun,  8 Apr 2018 00:48:04 +0900
Message-Id: <1523116090-13101-1-git-send-email-akinobu.mita@gmail.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This patchset includes support media controller, device tree probing and
other miscellanuous changes for ov772x driver.

Akinobu Mita (6):
  media: ov772x: allow i2c controllers without
    I2C_FUNC_PROTOCOL_MANGLING
  media: ov772x: add checks for register read errors
  media: ov772x: create subdevice device node
  media: ov772x: add media controller support
  media: ov772x: add device tree binding
  media: ov772x: support device tree probing

 .../devicetree/bindings/media/i2c/ov772x.txt       |  36 ++++++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov772x.c                         | 136 ++++++++++++++++-----
 3 files changed, 140 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt

Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Rob Herring <robh+dt@kernel.org>
-- 
2.7.4
