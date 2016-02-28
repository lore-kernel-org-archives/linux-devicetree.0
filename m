From: Joseph <jmcna06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] hwmon: (ntc_thermistor) Add support for ncpXXxh103
Date: Sun, 28 Feb 2016 22:31:23 +0000
Message-ID: <1456698683-18502-1-git-send-email-jmcna06@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joseph McNally <jmcna06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Joseph McNally <jmcna06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds support for the Murata NCP15XH103 thermistor series.

Signed-off-by: Joseph McNally <jmcna06-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/hwmon/ntc_thermistor.txt   |  1 +
 Documentation/hwmon/ntc_thermistor                 |  4 +-
 drivers/hwmon/Kconfig                              |  2 +-
 drivers/hwmon/ntc_thermistor.c                     | 44 ++++++++++++++++++++++
 include/linux/platform_data/ntc_thermistor.h       |  1 +
 5 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
index a04a80f..c3b9c4c 100644
--- a/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
+++ b/Documentation/devicetree/bindings/hwmon/ntc_thermistor.txt
@@ -10,6 +10,7 @@ Requires node properties:
 	"murata,ncp03wb473"
 	"murata,ncp15wl333"
 	"murata,ncp03wf104"
+	"murata,ncp15xh103"
 
 /* Usage of vendor name "ntc" is deprecated */
 <DEPRECATED>	"ntc,ncp15wb473"
diff --git a/Documentation/hwmon/ntc_thermistor b/Documentation/hwmon/ntc_thermistor
index 1d4cc84..8b9ff23 100644
--- a/Documentation/hwmon/ntc_thermistor
+++ b/Documentation/hwmon/ntc_thermistor
@@ -3,9 +3,9 @@ Kernel driver ntc_thermistor
 
 Supported thermistors from Murata:
 * Murata NTC Thermistors NCP15WB473, NCP18WB473, NCP21WB473, NCP03WB473,
-  NCP15WL333, NCP03WF104
+  NCP15WL333, NCP03WF104, NCP15XH103
   Prefixes: 'ncp15wb473', 'ncp18wb473', 'ncp21wb473', 'ncp03wb473',
-  'ncp15wl333', 'ncp03wf104'
+  'ncp15wl333', 'ncp03wf104', 'ncp15xh103'
   Datasheet: Publicly available at Murata
 
 Supported thermistors from EPCOS:
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 60fb80b..f3f13c5 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1127,7 +1127,7 @@ config SENSORS_NTC_THERMISTOR
 
 	  Currently, this driver supports
 	  NCP15WB473, NCP18WB473, NCP21WB473, NCP03WB473, NCP15WL333,
-	  and NCP03WF104 from Murata and B57330V2103 from EPCOS.
+	  NCP03WF104 and NCP15XH103 from Murata and B57330V2103 from EPCOS.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called ntc-thermistor.
diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index feed306..faa6e8d 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -54,6 +54,7 @@ static const struct platform_device_id ntc_thermistor_id[] = {
 	{ "ncp15wl333", TYPE_NCPXXWL333 },
 	{ "b57330v2103", TYPE_B57330V2103},
 	{ "ncp03wf104", TYPE_NCPXXWF104 },
+	{ "ncp15xh103", TYPE_NCPXXXH103 },
 	{ },
 };
 
@@ -173,6 +174,43 @@ static const struct ntc_compensation ncpXXwf104[] = {
 	{ .temp_c	= 125, .ohm	= 2522 },
 };
 
+static const struct ntc_compensation ncpXXxh103[] = {
+	{ .temp_c	= -40, .ohm	= 247565 },
+	{ .temp_c	= -35, .ohm	= 181742 },
+	{ .temp_c	= -30, .ohm	= 135128 },
+	{ .temp_c	= -25, .ohm	= 101678 },
+	{ .temp_c	= -20, .ohm	= 77373 },
+	{ .temp_c	= -15, .ohm	= 59504 },
+	{ .temp_c	= -10, .ohm	= 46222 },
+	{ .temp_c	= -5, .ohm	= 36244 },
+	{ .temp_c	= 0, .ohm	= 28674 },
+	{ .temp_c	= 5, .ohm	= 22878 },
+	{ .temp_c	= 10, .ohm	= 18399 },
+	{ .temp_c	= 15, .ohm	= 14910 },
+	{ .temp_c	= 20, .ohm	= 12169 },
+	{ .temp_c	= 25, .ohm	= 10000 },
+	{ .temp_c	= 30, .ohm	= 8271 },
+	{ .temp_c	= 35, .ohm	= 6883 },
+	{ .temp_c	= 40, .ohm	= 5762 },
+	{ .temp_c	= 45, .ohm	= 4851 },
+	{ .temp_c	= 50, .ohm	= 4105 },
+	{ .temp_c	= 55, .ohm	= 3492 },
+	{ .temp_c	= 60, .ohm	= 2985 },
+	{ .temp_c	= 65, .ohm	= 2563 },
+	{ .temp_c	= 70, .ohm	= 2211 },
+	{ .temp_c	= 75, .ohm	= 1915 },
+	{ .temp_c	= 80, .ohm	= 1666 },
+	{ .temp_c	= 85, .ohm	= 1454 },
+	{ .temp_c	= 90, .ohm	= 1275 },
+	{ .temp_c	= 95, .ohm	= 1121 },
+	{ .temp_c	= 100, .ohm	= 990 },
+	{ .temp_c	= 105, .ohm	= 876 },
+	{ .temp_c	= 110, .ohm	= 779 },
+	{ .temp_c	= 115, .ohm	= 694 },
+	{ .temp_c	= 120, .ohm	= 620 },
+	{ .temp_c	= 125, .ohm	= 556 },
+};
+
 /*
  * The following compensation table is from the specification of EPCOS NTC
  * Thermistors Datasheet
@@ -260,6 +298,8 @@ static const struct of_device_id ntc_match[] = {
 		.data = &ntc_thermistor_id[5]},
 	{ .compatible = "murata,ncp03wf104",
 		.data = &ntc_thermistor_id[6] },
+	{ .compatible = "murata,ncp15xh103",
+		.data = &ntc_thermistor_id[7] },
 
 	/* Usage of vendor name "ntc" is deprecated */
 	{ .compatible = "ntc,ncp15wb473",
@@ -609,6 +649,10 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 		data->comp = ncpXXwf104;
 		data->n_comp = ARRAY_SIZE(ncpXXwf104);
 		break;
+	case TYPE_NCPXXXH103:
+		data->comp = ncpXXxh103;
+		data->n_comp = ARRAY_SIZE(ncpXXxh103);
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown device type: %lu(%s)\n",
 				pdev_id->driver_data, pdev_id->name);
diff --git a/include/linux/platform_data/ntc_thermistor.h b/include/linux/platform_data/ntc_thermistor.h
index aed1705..698d0d5 100644
--- a/include/linux/platform_data/ntc_thermistor.h
+++ b/include/linux/platform_data/ntc_thermistor.h
@@ -28,6 +28,7 @@ enum ntc_thermistor_type {
 	TYPE_NCPXXWL333,
 	TYPE_B57330V2103,
 	TYPE_NCPXXWF104,
+	TYPE_NCPXXXH103,
 };
 
 struct ntc_thermistor_platform_data {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
