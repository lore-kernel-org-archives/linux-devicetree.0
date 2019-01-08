From: Jan Kotas <jank@cadence.com>
Subject: [PATCH 0/2] rtc: Add a driver for Cadence RTC
Date: Tue, 8 Jan 2019 12:22:40 +0000
Message-ID: <20190108122242.12411-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patchset adds a driver support for Cadence RTC IP.
It supports time, date and wakeups from sleep.

Jan Kotas (2):
  dt-bindings: rtc: Add bindings for Cadence RTC
  rtc: Add Cadence RTC driver

 Documentation/devicetree/bindings/rtc/cdns,rtc.txt |  25 ++
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-cadence.c                          | 404 +++++++++++++++++++++
 4 files changed, 440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/cdns,rtc.txt
 create mode 100644 drivers/rtc/rtc-cadence.c

-- 
2.15.0
