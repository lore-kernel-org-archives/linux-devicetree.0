From: gyungoh@gmail.com
Subject: [RESUBMIT PATCH v7 9/9] regulator: sky81452: Modify dependent Kconfig symbol
Date: Mon, 17 Nov 2014 17:33:10 +0900
Message-ID: <1416213190-20935-10-git-send-email-jack.yoo@skyworksinc.com>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

From: Gyungoh Yoo <jack.yoo@skyworksinc.com>

Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
---
Changes v7:
Splitted Kconfig renaming from DT patch

 drivers/regulator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 55d7b7b..fe84bd4 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -547,7 +547,7 @@ config REGULATOR_S5M8767
 
 config REGULATOR_SKY81452
 	tristate "Skyworks Solutions SKY81452 voltage regulator"
-	depends on SKY81452
+	depends on MFD_SKY81452
 	help
 	  This driver supports Skyworks SKY81452 voltage output regulator
 	  via I2C bus. SKY81452 has one voltage linear regulator can be
-- 
1.9.1
