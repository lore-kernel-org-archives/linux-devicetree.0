From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH 1/1] dt-bindings: arm: document supported STM32 SoC family
Date: Fri, 8 Dec 2017 14:56:34 +0100
Message-ID: <1512741394-27341-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gwenael Treuveur <gwenael.treuveur@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This adds a list of supported STM32 SoC bindings.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@st.com>
Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 Documentation/devicetree/bindings/arm/stm32.txt | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
new file mode 100644
index 0000000..05762b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32.txt
@@ -0,0 +1,9 @@
+STMicroelectronics STM32 Platforms Device Tree Bindings
+
+Each device tree must specify which STM32 SoC it uses,
+using one of the following compatible strings:
+
+  st,stm32f429
+  st,stm32f469
+  st,stm32f746
+  st,stm32h743
-- 
2.7.4
