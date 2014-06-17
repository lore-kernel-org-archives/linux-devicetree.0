From: George Cherian <george.cherian@ti.com>
Subject: [PATCH 0/2] Add devicetree support for extcon-gpio
Date: Tue, 17 Jun 2014 09:28:18 +0530
Message-ID: <1402977500-19987-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: cw00.choi@samsung.com, myungjoo.ham@samsung.com, grant.likely@linaro.org, rdunlap@infradead.org, galak@codeaurora.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, george.cherian@ti.com
List-Id: devicetree@vger.kernel.org

This serires adds devicetree support for extcon-gpio driver.

Patch 1 - Addreses minor cleanups
Patch 2 - Adds devicetree support for esxtcon-gpio driver.
 
George Cherian (2):
  extcon: gpio: Minor cleanups
  extcon: gpio: Add dt support for the driver.

 .../devicetree/bindings/extcon/extcon-gpio.txt     | 34 +++++++++++++++++++
 drivers/extcon/extcon-gpio.c                       | 39 +++++++++++++++++++---
 include/linux/extcon/extcon-gpio.h                 |  4 ++-
 3 files changed, 71 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt

-- 
1.8.3.1

