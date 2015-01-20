From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: [PATCH V3 0/2]  Add device tree support for DA9063
Date: Tue, 20 Jan 2015 13:54:25 +0000
Message-ID: <cover.1421762065.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Dajun Chen <david.chen@diasemi.com>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Steve Twiss <stwiss.opensource@diasemi.com>, Support Opensource <support.opensource@diasemi.com>
Cc: DT <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Steve Twiss <stwiss.opensource@diasemi.com>

This patch set adds device tree support for the Dialog
Semiconductor DA9063 PMIC. Support is provided for the
Regulators; Real-Time Clock and Watchdog.

[PATCH V2 1/2]: kernel driver device tree support
[PATCH V2 2/2]: device tree bindings document

Change History:

[PATCH V3]: remove device tree information that explicitly
            identifies different silicon variants
[PATCH V2]: split into two patches and move the compatibility
            strings to the end of the structures.
[PATCH V1]: initial submission

Thank you,
Steve Twiss, Dialog Semiconductor Ltd.

S Twiss (2):
  mfd: da9063: Add device tree support
  devicetree: Add bindings for DA9063

 Documentation/devicetree/bindings/mfd/da9063.txt | 93 ++++++++++++++++++++++++
 drivers/mfd/da9063-core.c                        |  2 +
 drivers/mfd/da9063-i2c.c                         |  9 +++
 include/linux/mfd/da9063/core.h                  |  1 +
 4 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt

-- 
end-of-patch for PATCH V3
