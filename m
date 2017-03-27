From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 2/4] iio: Documentation: Add max9611 sysfs documentation
Date: Mon, 27 Mar 2017 17:12:56 +0200
Message-ID: <1490627578-15938-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1490627578-15938-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490627578-15938-1-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for max9611 driver.
Document attributes describing value of shunt resistor installed between
RS+ and RS- voltage sense inputs.

Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
---
 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
new file mode 100644
index 0000000..5020d00
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
@@ -0,0 +1,17 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_power_shunt_resistor
+Date:		March 2017
+KernelVersion:	4.12
+Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+Description: 	The value of the shunt resistor used to compute power drain on
+                common input voltage pin (RS+). In micro Ohms.
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_current_shunt_resistor
+Date:		March 2017
+KernelVersion:	4.12
+Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+Description: 	The value of the shunt resistor used to compute current flowing
+                between RS+ and RS- voltage sense inputs. In micro Ohms.
+
+These attributes describe a single physical component, exposed as two distinct
+attributes as it is used to calculate two different values: power load and
+current flowing between RS+ and RS- inputs.
-- 
2.7.4
