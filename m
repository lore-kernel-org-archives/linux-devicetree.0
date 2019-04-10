From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/5] dt-bindings: pinctrl: stm32: add new entry for package
 information
Date: Wed, 10 Apr 2019 13:30:20 +0200
Message-ID: <1554895824-25709-2-git-send-email-alexandre.torgue@st.com>
References: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554895824-25709-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, arnd@arndb.de
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add "st,package" entry. Possibles values are:
-STM32MP_PKG_AA for LFBGA448 (18*18) package
-STM32MP_PKG_AB for LFBGA354 (16*16) package
-STM32MP_PKG_AC for TFBGA361 (12*12) package
-STM32MP_PKG_AD for TFBGA257 (10*10) package

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
index 48df30a..0016925 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@ -57,6 +57,8 @@ Optional properties:
  - st,bank-ioport: should correspond to the EXTI IOport selection (EXTI line
    used to select GPIOs as interrupts).
  - hwlocks: reference to a phandle of a hardware spinlock provider node.
+ - st,package: Indicates the SOC package used.
+   More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
 
 Example 1:
 #include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index b5a2174..e6fb8ad 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -32,5 +32,11 @@
 
 #define STM32_PINMUX(port, line, mode) (((PIN_NO(port, line)) << 8) | (mode))
 
+/*  package information */
+#define STM32MP_PKG_AA	0x1
+#define STM32MP_PKG_AB	0x2
+#define STM32MP_PKG_AC	0x4
+#define STM32MP_PKG_AD	0x8
+
 #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
 
-- 
2.7.4
