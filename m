From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH 2/3] dt-bindings: stm32: Add bindings for Extended TrustZone Protection
Date: Tue, 27 Feb 2018 15:09:25 +0100
Message-ID: <20180227140926.22996-3-benjamin.gaignard@st.com>
References: <20180227140926.22996-1-benjamin.gaignard@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227140926.22996-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Extended TrustZone Protection driver is very basic and only needs
to know where are the registers (no clock, no interrupt)

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/arm/stm32/st,stm32mp1-etzpc.txt     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/st,stm32mp1-etzpc.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32mp1-etzpc.txt b/Documentation/devicetree/bindings/arm/stm32/st,stm32mp1-etzpc.txt
new file mode 100644
index 000000000000..6db093847a13
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32mp1-etzpc.txt
@@ -0,0 +1,13 @@
+STMicroelectronics STM32 Extended TrustZone Protection driver
+
+Required properties:
+ - compatible : value should be "st,stm32mp1-etzpc"
+ - reg : physical base address of the IP registers and length of memory
+	 mapped region.
+
+Example for stm32mp1:
+
+etzpc: etzpc@5c007000 {
+	compatible = "st,stm32mp1-etzpc";
+	reg = <0x5c007000 0x400>;
+};
-- 
2.15.0
