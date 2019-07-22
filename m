From: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
Date: Mon, 22 Jul 2019 12:24:48 -0700
Message-ID: <20190722192451.1947348-2-vijaykhemka@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722192451.1947348-1-vijaykhemka@fb.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, sdasari@fb.com, vijaykhemka@fb.com
List-Id: devicetree@vger.kernel.org

Added new DT binding document for Infineon PXE1610 devices.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 .../devicetree/bindings/hwmon/pxe1610.txt         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pxe1610.txt

diff --git a/Documentation/devicetree/bindings/hwmon/pxe1610.txt b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
new file mode 100644
index 000000000000..635daf4955db
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pxe1610.txt
@@ -0,0 +1,15 @@
+pxe1610 properties
+
+Required properties:
+- compatible: Must be one of the following:
+	- "infineon,pxe1610" for pxe1610
+	- "infineon,pxe1110" for pxe1610
+	- "infineon,pxm1310" for pxm1310
+- reg: I2C address
+
+Example:
+
+vr@48 {
+	compatible = "infineon,pxe1610";
+	reg = <0x48>;
+};
-- 
2.17.1
