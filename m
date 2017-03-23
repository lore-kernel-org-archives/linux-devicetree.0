From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 2/4] iio: Documentation: Add max9611 sysfs documentation
Date: Thu, 23 Mar 2017 13:41:11 +0100
Message-ID: <1490272873-2532-3-git-send-email-jacopo+renesas@jmondi.org>
References: <1490272873-2532-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1490272873-2532-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: geert@linux-m68k.org, wsa+renesas@sang-engineering.com, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for max9611 driver.
Document attributes describing value of shunt resistor installed between
RS+ and RS- voltage sense inputs.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-max9611

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611 b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
new file mode 100644
index 0000000..9c60824
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-iio-adc-max9611
@@ -0,0 +1,16 @@
+What:		/sys/bus/iio/devices/iio:deviceX/in_shunt_resistor_power
+Date:		March 2017
+KernelVersion:	4.12
+Contact:	linux-iio@vger.kernel.org
+Description: 	The value of the shunt resistor used to compute power drain on
+                common input voltage pin (RS+). In micro Ohms.
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_shunt_resistor_current
+Date:		March 2017
+KernelVersion:	4.12
+Contact:	linux-iio@vger.kernel.org
+Description: 	The value of the shunt resistor used to compute current flowing
+                between RS+ and RS- voltage sense inputs. In micro Ohms.
+		This attributes describe a single physical component, exposed
+		as two distinct attributes as it is used to calculate two
+		different values.
-- 
2.7.4
