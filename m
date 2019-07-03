From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 3/3] iio: light: stk3310: Add device tree support
Date: Wed,  3 Jul 2019 20:05:59 +0200
Message-ID: <20190703180604.9840-3-luca@z3ntu.xyz>
References: <20190703180604.9840-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703180604.9840-1-luca@z3ntu.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Luca Weiss <luca@z3ntu.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Vivek Unune <npcomplete13@gmail.com>, Hannes Schmelzer <hannes.schmelzer@br-automation.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, Martijn Braam <martijn@brixit.nl>, devicetree@vger.kernel.or
List-Id: devicetree@vger.kernel.org

Add device tree support for the stk33xx family of ambient light sensors.

Tested-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/iio/light/stk3310.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index b955183edfe8..185c24a75ae6 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -679,9 +679,18 @@ static const struct acpi_device_id stk3310_acpi_id[] = {
 
 MODULE_DEVICE_TABLE(acpi, stk3310_acpi_id);
 
+static const struct of_device_id stk3310_of_match[] = {
+	{ .compatible = "sensortek,stk3310", },
+	{ .compatible = "sensortek,stk3311", },
+	{ .compatible = "sensortek,stk3335", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stk3310_of_match);
+
 static struct i2c_driver stk3310_driver = {
 	.driver = {
 		.name = "stk3310",
+		.of_match_table = stk3310_of_match,
 		.pm = STK3310_PM_OPS,
 		.acpi_match_table = ACPI_PTR(stk3310_acpi_id),
 	},
-- 
2.22.0
