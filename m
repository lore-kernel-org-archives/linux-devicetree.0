Return-Path: <SRS0=pBn+=OG=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 0/6] media: mt9m111 features
Date: Tue, 27 Nov 2018 11:02:47 +0100
Message-Id: <20181127100253.30845-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: enrico.scholz@sigma-chemnitz.de, devicetree@vger.kernel.org, akinobu.mita@gmail.com, linux-media@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

this v3 integrate the review  of my v2 [1]. I reordered the series as
mentioned by Sakari.

The patches are rebased on top of the actual media-tree/master.

[1] https://www.mail-archive.com/linux-media@vger.kernel.org/msg135932.html

Regards,
Marco


Enrico Scholz (1):
  media: mt9m111: allow to setup pixclk polarity

Marco Felsch (3):
  media: mt9m111: add s_stream callback
  dt-bindings: media: mt9m111: adapt documentation to be more clear
  dt-bindings: media: mt9m111: add pclk-sample property

Michael Grzeschik (2):
  media: mt9m111: add streaming check to set_fmt
  media: mt9m111: add support to select formats and fps for {Q,SXGA}

 .../devicetree/bindings/media/i2c/mt9m111.txt |  13 +-
 drivers/media/i2c/mt9m111.c                   | 224 +++++++++++++++++-
 2 files changed, 232 insertions(+), 5 deletions(-)

-- 
2.19.1
