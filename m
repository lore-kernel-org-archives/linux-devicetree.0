From: Christophe Roullier <christophe.roullier@st.com>
Subject: [PATCH V2 6/8] dt-bindings: net: stmmac: add syscfg clock property
Date: Fri, 22 Feb 2019 09:28:07 +0100
Message-ID: <1550824089-19961-7-git-send-email-christophe.roullier@st.com>
References: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550824089-19961-1-git-send-email-christophe.roullier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, christophe.roullier@st.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Need syscfg clock for MCU family in case bootloader does not
activate it.

Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 Documentation/devicetree/bindings/net/stm32-dwmac.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.txt b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
index f42dc68..524f8a0 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
@@ -14,8 +14,8 @@ Required properties:
 - clock-names: Should be "stmmaceth" for the host clock.
 	       Should be "mac-clk-tx" for the MAC TX clock.
 	       Should be "mac-clk-rx" for the MAC RX clock.
-	       For MPU family need to add also "ethstp" for power mode clock and,
-	                                       "syscfg-clk" for SYSCFG clock.
+	       Should be "syscfg-clk" for the SYSCFG clock.
+	       For MPU family need to add also "ethstp" for power mode clock
 - interrupt-names: Should contain a list of interrupt names corresponding to
            the interrupts in the interrupts property, if available.
 		   Should be "macirq" for the main MAC IRQ
-- 
2.7.4
