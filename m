From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 1/3] hwmon: Fix HWMON_P_MIN_ALARM mask
Date: Tue, 24 Sep 2019 14:49:43 +0200
Message-ID: <20190924124945.491326-2-nuno.sa@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190924124945.491326-1-nuno.sa@analog.com>
Sender: stable-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Both HWMON_P_MIN_ALARM and HWMON_P_MAX_ALARM were using
BIT(hwmon_power_max_alarm).

Fixes: aa7f29b07c870 ("hwmon: Add support for power min, lcrit, min_alarm and lcrit_alarm")
CC: <stable@vger.kernel.org>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 include/linux/hwmon.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 04c36b7a61dd..72579168189d 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -235,7 +235,7 @@ enum hwmon_power_attributes {
 #define HWMON_P_LABEL			BIT(hwmon_power_label)
 #define HWMON_P_ALARM			BIT(hwmon_power_alarm)
 #define HWMON_P_CAP_ALARM		BIT(hwmon_power_cap_alarm)
-#define HWMON_P_MIN_ALARM		BIT(hwmon_power_max_alarm)
+#define HWMON_P_MIN_ALARM		BIT(hwmon_power_min_alarm)
 #define HWMON_P_MAX_ALARM		BIT(hwmon_power_max_alarm)
 #define HWMON_P_LCRIT_ALARM		BIT(hwmon_power_lcrit_alarm)
 #define HWMON_P_CRIT_ALARM		BIT(hwmon_power_crit_alarm)
-- 
2.23.0
