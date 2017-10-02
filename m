From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/4] dt-bindings: nvmem: Describe the Amlogic
 Meson6/Meson8/Meson8b efuse
Date: Tue,  3 Oct 2017 01:28:01 +0200
Message-ID: <20171002232804.20042-2-martin.blumenstingl@googlemail.com>
References: <20171002232804.20042-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171002232804.20042-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Amlogic Meson6, Meson8 and Meson8b SoCs have an efuse which contains
calibration data from the factory (for the internal temperature sensor
and some CVBS connector settings). Some manufacturers also store the MAC
address or serial number in the efuse.

This documents the devicetree bindings for the efuse on these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/nvmem/amlogic-meson-mx-efuse.txt      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt
new file mode 100644
index 000000000000..a3c63954a1a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/amlogic-meson-mx-efuse.txt
@@ -0,0 +1,22 @@
+Amlogic Meson6/Meson8/Meson8b efuse
+
+Required Properties:
+- compatible: depending on the SoC this should be one of:
+	- "amlogic,meson6-efuse"
+	- "amlogic,meson8-efuse"
+	- "amlogic,meson8b-efuse"
+- reg: base address and size of the efuse registers
+- clocks: a reference to the efuse core gate clock
+- clock-names: must be "core"
+
+All properties and sub-nodes as well as the consumer bindings
+defined in nvmem.txt in this directory are also supported.
+
+
+Example:
+	efuse: nvmem@0 {
+		compatible = "amlogic,meson8-efuse";
+		reg = <0x0 0x2000>;
+		clocks = <&clkc CLKID_EFUSE>;
+		clock-names = "core";
+	};
-- 
2.14.2
