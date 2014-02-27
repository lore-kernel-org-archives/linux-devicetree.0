From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH 0/3] Convert twl4030_madc_battery to IIO and add DT aupport
Date: Thu, 27 Feb 2014 22:29:27 +0100
Message-ID: <1393536570-29969-1-git-send-email-marek@goldelico.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, dbaryshkov@gmail.com, dwmw2@infradead.org, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, hns@goldelico.com, sre@ring0.de, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

This patches are based on Sebastian Reichel work [1] which convert twl4030_madc mfd to iio
framework. Patches was tested on gta04 board. twl4030_madc_battery driver is converted in
first patch to iio consumer and in next patches is added support for devicetree.

[1] - https://lkml.org/lkml/2014/2/26/482

Marek Belisko (3):
  power: twl4030-madc-battery: Convert to iio consumer.
  power: twl4030_madc_battery: Add device tree support.
  Documentation: DT: Document twl4030-madc-battery bindings.

 .../bindings/power_supply/twl4030_madc_battery.txt |  43 ++++++
 drivers/power/twl4030_madc_battery.c               | 155 ++++++++++++++++-----
 2 files changed, 165 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/twl4030_madc_battery.txt

-- 
1.8.3.2

