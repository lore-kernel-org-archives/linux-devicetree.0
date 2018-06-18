Return-Path: <SRS0=17fZ=JE=st.com=hugues.fruchet@kernel.org>
From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v2 0/3] OV5640 hflip, vflip and module orientation support
Date: Mon, 18 Jun 2018 12:29:16 +0200
Message-ID: <1529317759-28657-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>, "Mauro Carvalho Chehab  <mchehab@kernel.org>, Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, "Hugues Fruchet  <hugues.fruchet@st.com>, Benjamin Gaignard" <benjamin.gaignard@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

This patch serie relates to flip and mirror at sensor level through
registers "TIMING TC REG20/REG21".

The first commit implements HFLIP and VFLIP V4L2 controls
allowing V4L2 client to change horizontal and vertical flip
before or during streaming.

The second & third commit allows to inform driver of the physical
orientation of the sensor module through devicetree "rotation"
optional properties as defined by Sakari in media/video-interfaces.txt:
https://www.mail-archive.com/linux-media@vger.kernel.org/msg132345.html

===========
= history =
===========
version 2:
  - Fix remarks from Rob Hering on devicetree part (new commit for binding
    and reference to video-interfaces.txt common bindings):
    https://www.spinics.net/lists/linux-media/msg136048.html

Hugues Fruchet (3):
  media: ov5640: add HFLIP/VFLIP controls support
  dt-bindings: ov5640: Add "rotation" property
  media: ov5640: add support of module orientation

 .../devicetree/bindings/media/i2c/ov5640.txt       |   5 +
 drivers/media/i2c/ov5640.c                         | 127 ++++++++++++++++++---
 2 files changed, 114 insertions(+), 18 deletions(-)

-- 
1.9.1
