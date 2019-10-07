From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 1/3] dt-bindings: arm: stm32: Add missing STM32 boards
Date: Mon, 7 Oct 2019 15:44:08 +0200
Message-ID: <20191007134410.10337-2-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This commit documents missing STM32 boards:

-STM32MCU: F429 disco/eval, F469-disco, F746 disco/eval, F769 disco,
H743 disco/eval.

-STM32MPU: MP157 dk1/dk2/ed1/ev1.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4d194f1eb03a..1fcf306bd2d1 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -13,19 +13,38 @@ properties:
   compatible:
     oneOf:
       - items:
+          - enum:
+              - st,stm32f429i-disco
+              - st,stm32429i-eval
           - const: st,stm32f429
-
       - items:
+          - enum:
+              - st,stm32f469i-disco
           - const: st,stm32f469
-
       - items:
+          - enum:
+              - st,stm32f746-disco
+              - st,stm32746g-eval
           - const: st,stm32f746
-
       - items:
+          - enum:
+              - st,stm32f769-disco
+          - const: st,stm32f769
+      - items:
+          - enum:
+              - st,stm32h743i-disco
+              - st,stm32h743i-eval
           - const: st,stm32h743
-
       - items:
           - enum:
               - arrow,stm32mp157a-avenger96 # Avenger96
+              - st,stm32mp157c-ed1
+              - st,stm32mp157a-dk1
+              - st,stm32mp157c-dk2
+
+          - const: st,stm32mp157
+      - items:
+          - const: st,stm32mp157c-ev1
+          - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
 ...
-- 
2.17.1
