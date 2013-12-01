From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v3 0/2] Add support for hym8563 rtcs
Date: Sun, 1 Dec 2013 20:47:02 +0100
Message-ID: <201312012047.02299.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, Mike Turquette <mturquette@linaro.org>, Richard Weinberger <richard.weinberger@gmail.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the Haoyu Microelectronics HYM8563 rtc. This
chip is often used in designs around the Cortex-A9 SoCs from Rockchip to
provide rtc functionality and the 32kHz suspend clock the SoC needs.

changes since v2:
- get size for devm_kzalloc from struct not from pointer
changes since v1:
- add haoyu prefix to vendor-prefixes.txt
- use gpio_to_irq to get the alarm interrupt instead of specifying it
  separately to the gpio itself

Heiko Stuebner (2):
  dt-bindings: add hym8563 binding
  rtc: add hym8563 rtc-driver

 .../devicetree/bindings/rtc/haoyu,hym8563.txt      |   27 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/rtc/Kconfig                                |   11 +
 drivers/rtc/Makefile                               |    1 +
 drivers/rtc/rtc-hym8563.c                          |  626 ++++++++++++++++++++
 5 files changed, 666 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
 create mode 100644 drivers/rtc/rtc-hym8563.c

-- 
1.7.10.4
