From: Stefan Wahren <info@lategoodbye.de>
Subject: [PATCH RFC 1/3] DT: add binding for MXS regulator
Date: Sun,  7 Sep 2014 13:37:47 +0200
Message-ID: <1410089869-6611-2-git-send-email-info@lategoodbye.de>
References: <1410089869-6611-1-git-send-email-info@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410089869-6611-1-git-send-email-info@lategoodbye.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lgirdwood@gmail.com, broonie@kernel.org, shawn.guo@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, Stefan Wahren <info@lategoodbye.de>, linux-kernel@vger.kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the Device tree bindings for the Freescale MXS on-chip
regulators.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../bindings/regulator/mxs-regulator.txt           | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mxs-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mxs-regulator.txt b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
new file mode 100644
index 0000000..c3226cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
@@ -0,0 +1,38 @@
+MXS regulators
+
+Required node properties:
+- compatible: Should be "fsl,<soc>-power", where soc is "imx23" or "imx28"
+- reg: Offset and length of the register set for the device
+
+Required regulator properties:
+- compatible: Must be "fsl,mxs-regulator"
+- reg: Offset of the register set for the regulator
+- mxs-max-reg-val: Maximum value of this register
+
+Optional regulator properties:
+- mxs-default-microvolt: initial voltage of the regulator
+
+Any regulator property defined as part of the core regulator
+binding, defined in regulator.txt, can also be used.
+
+Example:
+
+	power: power@80044000 {
+		compatible = "fsl,imx28-power";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x80044000 0x2000>;
+
+		reg_vddio: regulator-vddio@80044060 {
+			reg = <0x80044060>;
+			compatible = "fsl,mxs-regulator";
+			regulator-name = "vddio";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-microvolt-offset = <80000>;
+			regulator-always-on;
+			mxs-max-reg-val = <0x10>;
+			mxs-default-microvolt = <3300000>;
+		};
+	};
+
-- 
1.8.1.4
