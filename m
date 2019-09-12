From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 0/2] backlight_lm3630a: add enable_gpios property
Date: Thu, 12 Sep 2019 23:32:55 +0200
Message-ID: <20190912213257.24147-1-andreas@kemnade.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

To be able to handle the HWEN pin of the lm3630a, add
an enable gpio to the driver and a property.

Tested on Kobo Clara HD.

Changes in v2:
simplification and reordering

Changes in v3:
added acked-by
removed legacy include

Changes in v4:
added reviewed-by
moved gpio to the right position in the bindings example

Andreas Kemnade (2):
  dt-bindings: backlight: lm3630a: add enable_gpios
  backlight: lm3630a: add an enable gpio for the HWEN pin

 .../bindings/leds/backlight/lm3630a-backlight.yaml       | 5 +++++
 drivers/video/backlight/lm3630a_bl.c                     | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
2.20.1
