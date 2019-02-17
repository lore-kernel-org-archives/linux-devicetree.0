From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 1/2] iio: chemical: pms7003: extend supported sensors list
Date: Sun, 17 Feb 2019 20:22:12 +0100
Message-ID: <20190217192213.15803-2-tduszyns@gmail.com>
References: <20190217192213.15803-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217192213.15803-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Add other sensors to the compatible list.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 drivers/iio/chemical/pms7003.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
index db8e7b2327b3..23c9ab252470 100644
--- a/drivers/iio/chemical/pms7003.c
+++ b/drivers/iio/chemical/pms7003.c
@@ -321,7 +321,12 @@ static int pms7003_probe(struct serdev_device *serdev)
 }
 
 static const struct of_device_id pms7003_of_match[] = {
+	{ .compatible = "plantower,pms1003" },
+	{ .compatible = "plantower,pms3003" },
+	{ .compatible = "plantower,pms5003" },
+	{ .compatible = "plantower,pms6003" },
 	{ .compatible = "plantower,pms7003" },
+	{ .compatible = "plantower,pmsa003" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pms7003_of_match);
-- 
2.20.1
