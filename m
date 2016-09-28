From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH 3/3] mfd: cros_ec_spi: Add compatible string for NI version of cros-ec-spi
Date: Wed, 28 Sep 2016 09:59:21 -0700
Message-ID: <1475081961-3858-3-git-send-email-moritz.fischer@ettus.com>
References: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, emilio.lopez@collabora.co.uk, javier@osg.samsung.com, treding@nvidia.com, shawnguo@kernel.org, jarkko.sakkinen@linux.intel.com, dmitry.torokhov@gmail.com, antonynpavlov@gmail.com, devicetree@vger.kernel.org, moritz.fischer.private@gmail.com, julia@ni.com, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Add compatible string for NI version of cros-ec-spi.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 drivers/mfd/cros_ec_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cros_ec_spi.c b/drivers/mfd/cros_ec_spi.c
index ebe9b94..e4504ec 100644
--- a/drivers/mfd/cros_ec_spi.c
+++ b/drivers/mfd/cros_ec_spi.c
@@ -708,6 +708,7 @@ static SIMPLE_DEV_PM_OPS(cros_ec_spi_pm_ops, cros_ec_spi_suspend,
 			 cros_ec_spi_resume);
 
 static const struct of_device_id cros_ec_spi_of_match[] = {
+	{ .compatible = "ni,cros-ec-spi", },
 	{ .compatible = "google,cros-ec-spi", },
 	{ /* sentinel */ },
 };
-- 
2.7.4
