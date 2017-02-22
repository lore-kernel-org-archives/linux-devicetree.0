From: thor.thayer@linux.intel.com
Subject: [PATCHv2 4/5] mfd: altr_a10sr: Add Arria10 DevKit Reset Controller
Date: Wed, 22 Feb 2017 11:10:18 -0600
Message-ID: <1487783419-10912-5-git-send-email-thor.thayer@linux.intel.com>
References: <1487783419-10912-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487783419-10912-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, linux@armlinux.org.uk, p.zabel@pengutronix.de
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add Peripheral PHY Reset Controller to the Arria10
Development Kit System Resource Chip's MFD.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2  Changes to commit header & body for clarification.
---
 drivers/mfd/altera-a10sr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
index 06e1f7f..96e7d2c 100644
--- a/drivers/mfd/altera-a10sr.c
+++ b/drivers/mfd/altera-a10sr.c
@@ -33,6 +33,10 @@
 		.name = "altr_a10sr_gpio",
 		.of_compatible = "altr,a10sr-gpio",
 	},
+	{
+		.name = "altr_a10sr_reset",
+		.of_compatible = "altr,a10sr-reset",
+	},
 };
 
 static bool altr_a10sr_reg_readable(struct device *dev, unsigned int reg)
-- 
1.9.1
