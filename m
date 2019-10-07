From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/3] dt-bindings: pinctrl: stm32: Fix 'st,syscfg' description field
Date: Mon, 7 Oct 2019 15:44:09 +0200
Message-ID: <20191007134410.10337-3-alexandre.torgue@st.com>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007134410.10337-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As there is only one item "st,syscfg" this commit moves phandle description
fields under "description" tag. It'll fix a validation issue seen  during
stm32 DT check.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 400df2da018a..754ea7ab040a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -40,10 +40,9 @@ properties:
     allOf:
       - $ref: "/schemas/types.yaml#/definitions/phandle-array"
     description: Should be phandle/offset/mask
-    items:
-      - description: Phandle to the syscon node which includes IRQ mux selection.
-      - description: The offset of the IRQ mux selection register.
-      - description: The field mask of IRQ mux, needed if different of 0xf.
+      - Phandle to the syscon node which includes IRQ mux selection.
+      - The offset of the IRQ mux selection register.
+      - The field mask of IRQ mux, needed if different of 0xf.
 
   st,package:
     allOf:
-- 
2.17.1
