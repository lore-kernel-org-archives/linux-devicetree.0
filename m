From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH v4 12/23] drivers/fsi: Add documentation for GPIO bindings
Date: Wed, 29 Mar 2017 12:43:29 -0500
Message-ID: <20170329174340.89109-13-cbostic@linux.vnet.ibm.com>
References: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170329174340.89109-1-cbostic@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, rostedt@goodmis.org, mingo@redhat.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: andrew@aj.id.au, alistair@popple.id.au, linux-kernel@vger.kernel.org, Chris Bostic <cbostic@linux.vnet.ibm.com>, benh@kernel.crashing.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic@linux.vnet.ibm.com>

Add fsi master gpio device tree binding documentation

Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
new file mode 100644
index 0000000..a767259
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
@@ -0,0 +1,24 @@
+Device-tree bindings for gpio-based FSI master driver
+-----------------------------------------------------
+
+Required properties:
+ - compatible = "fsi-master-gpio";
+ - clock-gpios = <gpio-descriptor>;	: GPIO for FSI clock
+ - data-gpios = <gpio-descriptor>;	: GPIO for FSI data signal
+
+Optional properties:
+ - enable-gpios = <gpio-descriptor>;	: GPIO for enable signal
+ - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
+ - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
+                                          functions (eg, external FSI masters)
+
+Examples:
+
+    fsi-master {
+        compatible = "fsi-master-gpio", "fsi-master";
+        clock-gpios = <&gpio 0>;
+        data-gpios = <&gpio 1>;
+        enable-gpios = <&gpio 2>;
+        trans-gpios = <&gpio 3>;
+        mux-gpios = <&gpio 4>;
+    }
-- 
1.8.2.2
