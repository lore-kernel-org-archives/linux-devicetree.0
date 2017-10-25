From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH v2 3/9] dt-bindings: interrupt-controllers: add compatible
 string for stm32h7
Date: Wed, 25 Oct 2017 19:10:59 +0200
Message-ID: <1508951465-17152-4-git-send-email-ludovic.Barre@st.com>
References: <1508951465-17152-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1508951465-17152-1-git-send-email-ludovic.Barre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch updates stm32-exti documentation with stm32h7-exti
compatible string.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 .../devicetree/bindings/interrupt-controller/st,stm32-exti.txt        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
index 6e7703d..edf03f0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
@@ -2,7 +2,9 @@ STM32 External Interrupt Controller
 
 Required properties:
 
-- compatible: Should be "st,stm32-exti"
+- compatible: Should be:
+    "st,stm32-exti"
+    "st,stm32h7-exti"
 - reg: Specifies base physical address and size of the registers
 - interrupt-controller: Indentifies the node as an interrupt controller
 - #interrupt-cells: Specifies the number of cells to encode an interrupt
-- 
2.7.4
