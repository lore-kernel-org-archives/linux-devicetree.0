From: Y Vo <yvo@apm.com>
Subject: [PATCH v2 RESEND 0/3] gpio: Add APM X-Gene standy platform GPIO driver
Date: Wed, 17 Dec 2014 12:10:47 +0700
Message-ID: <1418793050-26927-1-git-send-email-yvo@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

This patch add the GPIO standby controller in the APM X-Gene platform.

v1 Change:
	1. Do not access GIC register from driver.
	2. Duplicate gpio probe funtion.
	3. Function gpiochip_remove doesn't return value.

Y Vo (3):
  gpio: Add APM X-Gene standby GPIO controller driver
  Documentation: gpio: Add APM X-Gene standby GPIO controller DTS
    binding
  arm64:dts: Add APM X-Gene standby GPIO controller DTS entries

 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |  31 +++
 arch/arm64/boot/dts/apm-storm.dtsi                 |  13 ++
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-xgene-sb.c                       | 217 +++++++++++++++++++++
 5 files changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
 create mode 100644 drivers/gpio/gpio-xgene-sb.c

-- 
2.2.0

