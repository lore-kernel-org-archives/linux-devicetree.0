From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 1/2] iio: gyro: bmg160: add device tree compatibility table
Date: Mon, 18 Mar 2019 16:14:14 +0100
Message-ID: <090c92487ada60e81fca341ef24e5de33a11ec4b.1552922054.git.hns@goldelico.com>
References: <cover.1552922054.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1552922054.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

Add of_match_table.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/iio/gyro/bmg160_i2c.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iio/gyro/bmg160_i2c.c b/drivers/iio/gyro/bmg160_i2c.c
index 90126a5a7663..934a092134f0 100644
--- a/drivers/iio/gyro/bmg160_i2c.c
+++ b/drivers/iio/gyro/bmg160_i2c.c
@@ -54,10 +54,19 @@ static const struct i2c_device_id bmg160_i2c_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, bmg160_i2c_id);
 
+static const struct of_device_id bmg160_of_match[] = {
+	{ .compatible = "bosch,bmg160" },
+	{ .compatible = "bosch,bmi055_gyro" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, bmg160_of_match);
+
 static struct i2c_driver bmg160_i2c_driver = {
 	.driver = {
 		.name	= "bmg160_i2c",
 		.acpi_match_table = ACPI_PTR(bmg160_acpi_match),
+		.of_match_table = bmg160_of_match,
 		.pm	= &bmg160_pm_ops,
 	},
 	.probe		= bmg160_i2c_probe,
-- 
2.19.1
