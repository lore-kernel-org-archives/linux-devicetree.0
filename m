From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/3] dt-bindings: regulator: Add STM32 Voltage Reference Buffer
Date: Tue, 11 Jul 2017 14:30:31 +0200
Message-ID: <1499776233-29116-2-git-send-email-fabrice.gasnier@st.com>
References: <1499776233-29116-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499776233-29116-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document STM32 VREFBUF (voltage reference buffer) which can be used as
voltage reference for ADCs, DACs and external components.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../bindings/regulator/st,stm32-vrefbuf.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
new file mode 100644
index 0000000..3944ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
@@ -0,0 +1,20 @@
+STM32 VREFBUF - Voltage reference buffer
+
+Some STM32 devices embed a voltage reference buffer which can be used as
+voltage reference for ADCs, DACs and also as voltage reference for external
+components through the dedicated VREF+ pin.
+
+Required properties:
+- compatible:		Must be "st,stm32-vrefbuf".
+- reg:			Offset and length of VREFBUF register set.
+- clocks:		Must contain an entry for peripheral clock.
+
+Example:
+	vrefbuf: regulator@58003C00 {
+		compatible = "st,stm32-vrefbuf";
+		reg = <0x58003C00 0x8>;
+		clocks = <&rcc VREF_CK>;
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <2500000>;
+		vdda-supply = <&vdda>;
+	};
-- 
1.9.1
