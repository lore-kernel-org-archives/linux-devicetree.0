From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [RESEND PATCH v2 1/3] dt-bindings: stm32: syscon: add clock support
Date: Mon, 7 Jan 2019 11:07:43 +0100
Message-ID: <1546855665-26218-2-git-send-email-fabrice.gasnier@st.com>
References: <1546855665-26218-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546855665-26218-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, fabrice.gasnier@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

STM32 system configuration controller registers needs to be clocked.
Document clock support on stm32-syscon.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- move clocks to specific bindings using syscon as per Rob's comment
---
 Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt b/Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
index 99980ae..c92d411 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
@@ -5,10 +5,12 @@ Properties:
                  - " st,stm32mp157-syscfg " - for stm32mp157 based SoCs,
                  second value must be always "syscon".
    - reg : offset and length of the register set.
+   - clocks: phandle to the syscfg clock
 
  Example:
          syscfg: syscon@50020000 {
                  compatible = "st,stm32mp157-syscfg", "syscon";
                  reg = <0x50020000 0x400>;
+                 clocks = <&rcc SYSCFG>;
          };
 
-- 
1.9.1
