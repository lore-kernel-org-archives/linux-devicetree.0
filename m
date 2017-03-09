From: Carlo Caione <carlo@caione.org>
Subject: [PATCH v3 1/2] Documentation: bindings: Introduce scpi,sensors-scale
Date: Thu,  9 Mar 2017 11:17:58 +0100
Message-ID: <20170309101759.18081-2-carlo@caione.org>
References: <20170309101759.18081-1-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170309101759.18081-1-carlo@caione.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux@endlessm.com, punit.agrawal@arm.com, sudeep.holla@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: Carlo Caione <carlo@endlessm.com>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

Document the new property `scpi,sensors-scale` used by the hwmon-scpi
driver to convert the sensor readings to the correct / expected scale.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 Documentation/devicetree/bindings/arm/arm,scpi.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
index 4018319..35c621c 100644
--- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
@@ -84,6 +84,24 @@ Required properties:
 			 as used by the firmware. Refer to  platform details
 			 for your implementation for the IDs to use.
 
+Optional properties:
+- scpi,sensors-scale: array of 5 elements defining the unit scale used by the
+                      SCP for the 5 different sensor classes (temperature,
+                      voltage, current, power, energy) such that 1 == unit,
+                      1000 == milli, 1000000 == micro, ...
+
+                      Example:
+                         scpi,sensors-scale = <1 1000 1000 1000000 1000000>
+                      In this case the values reported by SCP are:
+                      -> temperature in degree Celsius
+                      -> voltage in millivolts
+                      -> current in milliamperes
+                      -> power in microwatts
+                      -> energy in microjoules
+
+                      The default value is:
+                         scpi,sensors-scale = <1000 1000 1000 1000000 1000000>
+
 Power domain bindings for the power domains based on SCPI Message Protocol
 ------------------------------------------------------------
 
-- 
2.9.3
