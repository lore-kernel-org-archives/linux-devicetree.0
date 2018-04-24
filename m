From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH  8/8] dt-bindings: stm32: add compatible for syscon
Date: Tue, 24 Apr 2018 17:02:00 +0200
Message-ID: <1524582120-4451-9-git-send-email-christophe.roullier@st.com>
References: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524582120-4451-1-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com
List-Id: devicetree@vger.kernel.org

This patch describes syscon DT bindings.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 Documentation/devicetree/bindings/arm/stm32.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32.txt b/Documentation/devicetree/bindings/arm/stm32.txt
index 6808ed9..a871a78 100644
--- a/Documentation/devicetree/bindings/arm/stm32.txt
+++ b/Documentation/devicetree/bindings/arm/stm32.txt
@@ -8,3 +8,10 @@ using one of the following compatible strings:
   st,stm32f746
   st,stm32h743
   st,stm32mp157
+
+Required nodes:
+
+- syscon: some subnode of the STM32 SoC node must be a
+  system controller node pointing to the control registers,
+  with the compatible string set to one of these tuples:
+  "st,stm32-syscfg", "syscon"
-- 
1.9.1
