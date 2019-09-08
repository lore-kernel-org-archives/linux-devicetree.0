From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] backlight_lm3630a: add enable_gpios property
Date: Sun,  8 Sep 2019 22:37:02 +0200
Message-ID: <20190908203704.30147-1-andreas@kemnade.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

To be able to handle the HWEN pin of the lm3630a, add
an enable gpio to the driver and a property.

Tested on Kobo Clara HD

Andreas Kemnade (2):
  backlight: lm3630a: add an enable gpio for the HWEN pin
  dt-bindings: backlight: lm3630a: add enable_gpios

 .../leds/backlight/lm3630a-backlight.yaml      |  4 ++++
 drivers/video/backlight/lm3630a_bl.c           | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.20.1
