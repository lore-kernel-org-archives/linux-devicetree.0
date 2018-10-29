Return-Path: <SRS0=pxxc=NJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/6] media: mt9m111 features
Date: Mon, 29 Oct 2018 19:24:04 +0100
Message-Id: <20181029182410.18783-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: enrico.scholz@sigma-chemnitz.de, akinobu.mita@gmail.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

this is the v2 of [1]. I fixed some issues I made during converting
Enrico's and Michael's patches and rebased it on top of
media-tree/master. Please see commit comments for further information.

The dt-bindings patches are new as result of Sakari's review [2].

[1] https://www.spinics.net/lists/linux-media/msg141975.html
[2] https://www.spinics.net/lists/linux-media/msg141987.html

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

 .../devicetree/bindings/media/i2c/mt9m111.txt |  16 +-
 drivers/media/i2c/mt9m111.c                   | 222 +++++++++++++++++-
 2 files changed, 233 insertions(+), 5 deletions(-)

-- 
2.19.1
