From: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Subject: [PATCH V2 0/2]  Add device tree support for DA9063
Date: Mon, 19 Jan 2015 16:29:51 +0000
Message-ID: <cover.1421684991.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Dajun Chen <david.chen@diasemi.com>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>, Pawel Moll <pawel.moll@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Support Opensource <support.opensource@diasemi.com>
Cc: DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Steve Twiss <stwiss.opensource@diasemi.com>

This patch set adds device tree support for the Dialog
Semiconductor DA9063 PMIC. Support is provided for the
Regulators; Real-Time Clock and Watchdog.

[PATCH V2 1/2]: kernel driver device tree support
[PATCH V2 2/2]: device tree bindings document

Thank you,
Steve Twiss, Dialog Semiconductor Ltd.

S Twiss (2):
  mfd: da9063: Add device tree support
  devicetree: Add bindings for DA9063

 Documentation/devicetree/bindings/mfd/da9063.txt | 94 ++++++++++++++++++++++++
 drivers/mfd/da9063-core.c                        |  2 +
 drivers/mfd/da9063-i2c.c                         | 11 +++
 include/linux/mfd/da9063/core.h                  |  1 +
 4 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt

-- 
end-of-patch for PATCH V2
