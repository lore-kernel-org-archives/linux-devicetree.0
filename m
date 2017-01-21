From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
Date: Sat, 21 Jan 2017 11:20:09 -0800
Message-ID: <20170121192010.30681-2-f.fainelli@gmail.com>
References: <20170121192010.30681-1-f.fainelli@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170121192010.30681-1-f.fainelli@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

We have a device reference, utilize it instead of pr_warn().

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/hwmon/lm70.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index d6ecd1a4be59..52c5cdd00448 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -72,7 +72,8 @@ static ssize_t temp1_input_show(struct device *dev,
 	 */
 	status = spi_write_then_read(spi, NULL, 0, &rxbuf[0], 2);
 	if (status < 0) {
-		pr_warn("spi_write_then_read failed with status %d\n", status);
+		dev_warn(dev, "spi_write_then_read failed with status %d\n",
+			 status);
 		goto out;
 	}
 	raw = (rxbuf[0] << 8) + rxbuf[1];
-- 
2.9.3

