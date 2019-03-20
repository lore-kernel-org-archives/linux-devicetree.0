Return-Path: <SRS0=3wvu=RX=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 2/3] hwmon: Add convience macro to define simple static sensors
Date: Wed, 20 Mar 2019 14:58:17 +0000
Message-ID: <20190320145818.30644-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

It takes a fair amount of boiler plate code to add new sensors, add a
macro that can be used to specify simple static sensors.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/linux/hwmon.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 99e0c1b0b5fb3..7a8cc06a0d61d 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -365,6 +365,14 @@ struct hwmon_channel_info {
 	const u32 *config;
 };
 
+#define HWMON_CHANNEL_INFO(stype, ...)	\
+	(&(struct hwmon_channel_info) {	\
+		.type = hwmon_##stype,	\
+		.config = (u32 []) {	\
+			__VA_ARGS__, 0	\
+		}			\
+	})
+
 /**
  * Chip configuration
  * @ops:	Pointer to hwmon operations.
-- 
2.11.0
