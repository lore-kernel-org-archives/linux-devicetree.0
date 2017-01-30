From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 3/5] Documentation: dt: iio: document stm32 exti trigger
Date: Mon, 30 Jan 2017 14:57:41 +0100
Message-ID: <1485784663-19505-4-git-send-email-fabrice.gasnier@st.com>
References: <1485784663-19505-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1485784663-19505-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Add dt documentation for st,stm32-exti-trigger.
EXTi gpio signal can be routed internally as trigger source for various
IPs (e.g. for ADC or DAC conversions).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../bindings/iio/trigger/st,stm32-exti-trigger.txt      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt

diff --git a/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt b/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
new file mode 100644
index 0000000..ebf2645
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
@@ -0,0 +1,17 @@
+STMicroelectronics STM32 EXTI trigger bindings
+
+EXTi gpio signal can be routed internally as trigger source for various
+IPs (e.g. for ADC or DAC conversions).
+
+Contents of a stm32 exti trigger root node:
+-------------------------------------------
+Required properties:
+- compatible: Should be "st,stm32-exti-trigger"
+- extiN-gpio: optional gpio line that may be used as external trigger source
+  (e.g. N may be 0..15. For example, exti11-gpio can trig ADC on stm32f4).
+
+Example:
+	triggers {
+		compatible = "st,stm32-exti-trigger";
+		exti11-gpio=<&gpioa 11 0>;
+	};
-- 
1.9.1
