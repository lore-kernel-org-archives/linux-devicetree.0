From: Daniel Jeong <gshark.jeong@gmail.com>
Subject: [RFC 0/2]  backlight: add new tps611xx backlight driver
Date: Mon, 16 Jun 2014 11:17:21 +0900
Message-ID: <1402885043-3626-1-git-send-email-gshark.jeong@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, Bryan Wu <cooloney@gmail.com>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Daniel Jeong <daniel.jeong@ti.com>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Daniel Jeong <gshark.jeong@gmail.com>
List-Id: devicetree@vger.kernel.org

This driver a general version for tps611xx backlgiht chips of TI.
It supports tps61158, tps61161, tps61163 and tps61165 backlight driver
based on EasyScale protocol.

Daniel Jeong (2):
  backlight: add new tps611xx backlight driver
  backlight: add new tps611xx backlight device tree support

 .../video/backlight/tps611xx-backlight.txt         |   16 +
 drivers/video/backlight/Kconfig                    |    7 +
 drivers/video/backlight/Makefile                   |    1 +
 drivers/video/backlight/tps611xx_bl.c              |  486 ++++++++++++++++++++
 include/linux/platform_data/tps611xx_bl.h          |   30 ++
 5 files changed, 540 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
 create mode 100644 drivers/video/backlight/tps611xx_bl.c
 create mode 100644 include/linux/platform_data/tps611xx_bl.h

-- 
1.7.9.5

