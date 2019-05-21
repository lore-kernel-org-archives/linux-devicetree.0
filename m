From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/9 RESEND 2] mtd: partitions: Add AFS partitions DT bindings
Date: Tue, 21 May 2019 03:42:21 +0200
Message-ID: <20190521014230.18463-5-linus.walleij@linaro.org>
References: <20190521014230.18463-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190521014230.18463-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for ARM Firmware Suite
flash partitioning used in NOR flashes on ARM reference
designs.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../mtd/partitions/arm,arm-firmware-suite.txt   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
new file mode 100644
index 000000000000..d5c5616f6db5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
@@ -0,0 +1,17 @@
+ARM AFS - ARM Firmware Suite Partitions
+=======================================
+
+The ARM Firmware Suite is a flash partitioning system found on the
+ARM reference designs: Integrator AP, Integrator CP, Versatile AB,
+Versatile PB, the RealView family, Versatile Express and Juno.
+
+Required properties:
+- compatible : (required) must be "arm,arm-firmware-suite"
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "arm,arm-firmware-suite";
+	};
+};
-- 
2.20.1
