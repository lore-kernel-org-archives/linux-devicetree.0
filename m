From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v3 2/5] iio: light: vcnl4000 add devicetree hooks
Date: Thu, 21 Mar 2019 08:40:44 -0700
Message-ID: <20190321154047.23236-3-angus@akkea.ca>
References: <20190321154047.23236-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321154047.23236-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Tomas Novotny <tomas@novotny.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an of_match table for devicetree probing.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 drivers/iio/light/vcnl4000.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 5e0a8eb83ebc..308cb2d2b641 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -363,9 +363,31 @@ static int vcnl4000_probe(struct i2c_client *client,
 	return devm_iio_device_register(&client->dev, indio_dev);
 }
 
+static const struct of_device_id vcnl_4000_of_match[] = {
+	{
+		.compatible = "vishay,vcnl4000",
+		.data = "VCNL4000",
+	},
+	{
+		.compatible = "vishay,vcnl4010",
+		.data = "VCNL4010",
+	},
+	{
+		.compatible = "vishay,vcnl4010",
+		.data = "VCNL4020",
+	},
+	{
+		.compatible = "vishay,vcnl4200",
+		.data = "VCNL4200",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, vcnl4000_of_match);
+
 static struct i2c_driver vcnl4000_driver = {
 	.driver = {
 		.name   = VCNL4000_DRV_NAME,
+		.of_match_table = of_match_ptr(vcnl_4000_of_match),
 	},
 	.probe  = vcnl4000_probe,
 	.id_table = vcnl4000_id,
-- 
2.17.1
