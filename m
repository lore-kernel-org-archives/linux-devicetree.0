From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH v2 5/8] [PATCH [5/8] Documentation: dt-bindings: Add a
 document for PECI hwmon client driver
Date: Wed, 21 Feb 2018 08:16:03 -0800
Message-ID: <20180221161606.32247-6-jae.hyun.yoo@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org, andrew@lunn.ch
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This commit adds a dt-bindings document for a generic PECI hwmon client
driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 .../devicetree/bindings/hwmon/peci-hwmon.txt       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
new file mode 100644
index 000000000000..831813158884
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-hwmon.txt
@@ -0,0 +1,27 @@
+Bindings for Intel PECI (Platform Environment Control Interface) hwmon driver.
+
+Required properties:
+- compatible
+	Should be "intel,peci-hwmon".
+
+- reg
+	Should contain address of a client CPU. Address range of CPU clients is
+	starting from 0x30 based on PECI specification.
+	<0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
+
+Example:
+	peci-bus@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		< more properties >
+
+		peci-hwmon@cpu0 {
+			compatible = "intel,peci-hwmon";
+			reg = <0x30>;
+		};
+
+		peci-hwmon@cpu1 {
+			compatible = "intel,peci-hwmon";
+			reg = <0x31>;
+		};
+	};
-- 
2.16.1
