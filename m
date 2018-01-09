From: Jae Hyun Yoo <jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH linux dev-4.10 5/6] Documentation: hwmon: Add a generic PECI hwmon
Date: Tue,  9 Jan 2018 14:31:25 -0800
Message-ID: <20180109223126.13093-6-jae.hyun.yoo@linux.intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jae Hyun Yoo <jae.hyun.yoo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jae Hyun Yoo <jae.hyun.yoo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

This commit add a document for a generic PECI hwmon driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 Documentation/hwmon/peci-hwmon | 74 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/hwmon/peci-hwmon

diff --git a/Documentation/hwmon/peci-hwmon b/Documentation/hwmon/peci-hwmon
new file mode 100644
index 0000000..e0155b5
--- /dev/null
+++ b/Documentation/hwmon/peci-hwmon
@@ -0,0 +1,74 @@
+Kernel driver peci-hwmon
+===============================
+
+Supported chips:
+	Generic BMC chips provide PECI controller
+
+Author:
+	Jae Hyun Yoo <jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
+
+
+Hardware Interfaces
+-------------------
+
+This driver uses a PECI misc driver as a controller interface so one of PECI
+misc drivers which provides compatible ioctls has to be enabled.
+
+
+Description
+-----------
+
+This driver implements a generic PECI hwmon feature which is running with a PECI
+controller driver supports native PECI Client Command Suite for retrieving
+temperatures of the CPU package, CPU cores and DIMM components.
+
+All temperature values are given in millidegree Celsius and will be measurable
+only when the target CPU is powered on.
+
+
+sysfs files
+-----------
+
+temp1_input		Provides current die temperature of the CPU package.
+temp1_max		Provides thermal control temperature of the CPU package
+			which is also known as Tcontrol.
+temp1_crit		Provides shutdown temperature of the CPU package which
+			is also known as the maximum processor junction
+			temperature, Tjmax or Tprochot.
+temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
+			the CPU package.
+
+temp2_input		Provides current DTS thermal margin to Tcontrol of the
+			CPU package. Value 0 means it reaches to Tcontrol
+			temperature. Sub-zero value means the die temperature
+			goes across Tconrtol to Tjmax.
+temp2_min		Provides the minimum DTS thermal margin to Tcontrol of
+			the CPU package.
+temp2_lcrit		Provides the value when the CPU package temperature
+			reaches to Tjmax.
+
+temp3_input		Provides current Tcontrol temperature of the CPU
+			package which is also known as Fan Temperature target.
+			Indicates the relative value from thermal monitor trip
+			temperature at which fans should be engaged.
+temp3_crit		Provides Tcontrol critical value of the CPU package
+			which is same to Tjmax.
+
+temp4_input		Provides current Tthrottle temperature of the CPU
+			package. Used for throttling temperature. If this value
+			is allowed and lower than Tjmax - the throttle will
+			occur and reported at lower than Tjmax.
+
+temp[100-127]_input	Provides current core temperature.
+temp[100-127]_max	Provides thermal control temperature of the core.
+temp[100-127]_crit	Provides shutdown temperature of the core.
+temp[100-127]_crit_hyst	Provides the hysteresis value from Tcontrol to Tjmax of
+			the core.
+
+Note:
+	Core temperature group will be appeared when probing the driver if CPU
+	is online or when the first reading on other attr happens because it
+	needs cpu info reading. The number of generated core attrs depends on
+	the number of cores of the cpu package.
+
+temp[200-215]_input	Provides current temperature of the DDR DIMM.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
