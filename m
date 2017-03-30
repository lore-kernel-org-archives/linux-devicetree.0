From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v4 1/5] dt-bindings: watchdog: Document STM32 IWDG bindings
Date: Thu, 30 Mar 2017 17:15:22 +0200
Message-ID: <1490886926-20585-2-git-send-email-yannick.fertre@st.com>
References: <1490886926-20585-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1490886926-20585-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, linux-kernel@vger.kernel.org, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the STM32 IWDG
(Independent WatchDoG).

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>

Author:    Yannick Fertre <yannick.fertre@st.com>
---
 .../devicetree/bindings/watchdog/st,stm32-iwdg.txt        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
new file mode 100644
index 0000000..15fef87
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
@@ -0,0 +1,15 @@
+STM32 Independent WatchDoG (IWDG)
+---------------------------------
+
+Required properties:
+- compatible: "st,stm32-iwdg"
+- reg: physical base address and length of the registers set for the device
+- clocks: must contain a single entry describing the clock input
+
+Example:
+
+iwdg: watchdog@40003000 {
+	compatible = "st,stm32-iwdg";
+	reg = <0x40003000 0x400>;
+	clocks = <&clk_lsi>;
+};
-- 
1.9.1
