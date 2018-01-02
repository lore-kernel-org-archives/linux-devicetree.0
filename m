From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v5 17/20] hwmon: (core) Add hwmon_max to hwmon_sensor_types enumeration
Date: Tue,  2 Jan 2018 14:42:39 +0000
Message-ID: <1514904162-11201-18-git-send-email-sudeep.holla@arm.com>
References: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>, Loc Ho <lho@apm.com>, Alexey Klimov <klimov.linux@gmail.com>, Ryan Harkin <Ryan.Harkin@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-hwmon@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It's useful to know the maximum types of sensor supported by hwmon
framework. It can be used to allocate some data structures when sorting
the monitors based on their type.

This will be used by scmi hwmon support.

Cc: linux-hwmon@vger.kernel.org
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 include/linux/hwmon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index ceb751987c40..e5fd2707b6df 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -29,6 +29,7 @@ enum hwmon_sensor_types {
 	hwmon_humidity,
 	hwmon_fan,
 	hwmon_pwm,
+	hwmon_max,
 };
 
 enum hwmon_chip_attributes {
-- 
2.7.4
