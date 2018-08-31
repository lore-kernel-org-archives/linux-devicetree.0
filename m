Return-Path: <SRS0=RcEj=LO=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] i2c: imx-lpi2c: Remove mx8dv compatible entry
Date: Fri, 31 Aug 2018 10:24:15 -0300
Message-Id: <1535721855-5595-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1535721855-5595-1-git-send-email-festevam@gmail.com>
References: <1535721855-5595-1-git-send-email-festevam@gmail.com>
To: wsa@the-dreams.de
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-imx@nxp.com, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

mx8dv never entered into production and there is no other place
in the kernel referring to this SoC, so remove it from the
driver's compatible entry.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 6d975f5..06c4c76 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -538,7 +538,6 @@ static const struct i2c_algorithm lpi2c_imx_algo = {
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-lpi2c" },
-	{ .compatible = "fsl,imx8dv-lpi2c" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
-- 
2.7.4
