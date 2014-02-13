From: Adam Thomson <adam.thomson@diasemi.com>
Subject: [PATCH 1/2] mfd: da9055: Add DT support for PMIC
Date: Thu, 13 Feb 2014 10:45:50 +0000
Message-ID: <e11bde69763b77a6b17b851c7d18a892d193411f.1392286537.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1392286537.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1392286537.git.Adam.Thomson.Opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 drivers/mfd/da9055-i2c.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/da9055-i2c.c b/drivers/mfd/da9055-i2c.c
index 8103e43..d4d4c16 100644
--- a/drivers/mfd/da9055-i2c.c
+++ b/drivers/mfd/da9055-i2c.c
@@ -15,6 +15,8 @@
 #include <linux/device.h>
 #include <linux/i2c.h>
 #include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_device.h>

 #include <linux/mfd/da9055/core.h>

@@ -66,6 +68,11 @@ static struct i2c_device_id da9055_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, da9055_i2c_id);

+static const struct of_device_id da9055_of_match[] = {
+       { .compatible = "dlg,da9055-pmic", },
+       { }
+};
+
 static struct i2c_driver da9055_i2c_driver = {
        .probe = da9055_i2c_probe,
        .remove = da9055_i2c_remove,
@@ -73,6 +80,7 @@ static struct i2c_driver da9055_i2c_driver = {
        .driver = {
                .name = "da9055-pmic",
                .owner = THIS_MODULE,
+               .of_match_table = of_match_ptr(da9055_of_match),
        },
 };

--
1.7.0.4

Legal Disclaimer: This e-mail communication (and any attachment/s) is confidential and contains proprietary information, some or all of which may be legally privileged. It is intended solely for the use of the individual or entity to which it is addressed. Access to this email by anyone else is unauthorized. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited and may be unlawful.

Please consider the environment before printing this e-mail
