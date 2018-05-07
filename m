Return-Path: <SRS0=LUPS=H2=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/4] media: ov2680: follow up from initial version
Date: Mon,  7 May 2018 16:56:51 +0100
Message-Id: <20180507155655.1555-1-rui.silva@linaro.org>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, Rob Herring <robh+dt@kernel.org>
Cc: linux-media@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Ryan Harkin <ryan.harkin@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Sorry I have Out-of-Office some part of last week, I had v6 of the original
series ready but since I have received the notification from patchwork that the
v5 was accepted, I am sending this as a follow up tha address Fabio comments.

- this adds the power supplies to this sensor
- fix gpio polarity and naming.

Cheers,
   Rui


Rui Miguel Silva (4):
  media: ov2680: dt: add voltage supplies as required
  media: ov2680: dt: rename gpio to reset and fix polarity
  media: ov2680: rename powerdown gpio and fix polarity
  media: ov2680: add regulators to supply control

 .../devicetree/bindings/media/i2c/ov2680.txt  | 18 ++++--
 drivers/media/i2c/ov2680.c                    | 55 +++++++++++++++----
 2 files changed, 57 insertions(+), 16 deletions(-)

-- 
2.17.0
