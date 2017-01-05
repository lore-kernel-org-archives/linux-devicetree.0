From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCHv3 2/8] dt-bindings: document the STM32 RTC bindings
Date: Thu, 5 Jan 2017 14:43:23 +0100
Message-ID: <1483623809-29937-3-git-send-email-amelie.delaunay@st.com>
References: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the STM32 RTC.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/rtc/st,stm32-rtc.txt       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
new file mode 100644
index 0000000..e2837b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
@@ -0,0 +1,27 @@
+STM32 Real Time Clock
+
+Required properties:
+- compatible: "st,stm32-rtc".
+- reg: address range of rtc register set.
+- clocks: reference to the clock entry ck_rtc.
+- interrupt-parent: phandle for the interrupt controller.
+- interrupts: rtc alarm interrupt.
+- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
+  (RTC registers) write protection.
+
+Optional properties (to override default ck_rtc parent clock):
+- assigned-clocks: reference to the ck_rtc clock entry.
+- assigned-clock-parents: phandle of the new parent clock of ck_rtc.
+
+Example:
+
+	rtc: rtc@40002800 {
+		compatible = "st,stm32-rtc";
+		reg = <0x40002800 0x400>;
+		clocks = <&rcc 1 CLK_RTC>;
+		assigned-clocks = <&rcc 1 CLK_RTC>;
+		assigned-clock-parents = <&rcc 1 CLK_LSE>;
+		interrupt-parent = <&exti>;
+		interrupts = <17 1>;
+		st,syscfg = <&pwrcfg>;
+	};
-- 
1.9.1
