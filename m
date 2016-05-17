From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 07/11] dt/bindings: Correct clk binding example for PIC32 pinctrl
Date: Tue, 17 May 2016 10:35:56 +0530
Message-ID: <1463461560-9629-7-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Update binding example based on new clock binding scheme.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
index 4b5efa5..29b72e3 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
@@ -34,7 +34,7 @@ pic32_pinctrl: pinctrl@1f801400{
 	#size-cells = <1>;
 	compatible = "microchip,pic32mzda-pinctrl";
 	reg = <0x1f801400 0x400>;
-	clocks = <&PBCLK1>;
+	clocks = <&rootclk PB1CLK>;
 
 	pinctrl_uart2: pinctrl_uart2 {
 		uart2-tx {
-- 
1.8.3.1
