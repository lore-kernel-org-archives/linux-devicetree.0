From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v3 2/7] iio: imu: adis16480: Add OF device ID table
Date: Wed, 27 Feb 2019 18:14:23 +0200
Message-ID: <1551284068-4882-3-git-send-email-stefan.popa@analog.com>
References: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The driver does not have a struct of_device_id table, but supported
devices are registered via Device Trees. This patch adds OF device ID
table.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 drivers/iio/imu/adis16480.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 98a23ac..150d814 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -991,9 +991,19 @@ static const struct spi_device_id adis16480_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, adis16480_ids);
 
+static const struct of_device_id adis16480_of_match[] = {
+	{ .compatible = "adi,adis16375" },
+	{ .compatible = "adi,adis16480" },
+	{ .compatible = "adi,adis16485" },
+	{ .compatible = "adi,adis16488" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, adis16480_of_match);
+
 static struct spi_driver adis16480_driver = {
 	.driver = {
 		.name = "adis16480",
+		.of_match_table = adis16480_of_match,
 	},
 	.id_table = adis16480_ids,
 	.probe = adis16480_probe,
-- 
2.7.4
