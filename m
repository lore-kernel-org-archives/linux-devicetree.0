From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 08/11] dt/bindings: Correct clk binding example for PIC32 serial.
Date: Tue, 17 May 2016 10:35:57 +0530
Message-ID: <1463461560-9629-8-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Andrei Pistirica <andrei.pistirica@microchip.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Update binding example based on new clock binding scheme.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt b/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
index 65b38bf..7a34345 100644
--- a/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
+++ b/Documentation/devicetree/bindings/serial/microchip,pic32-uart.txt
@@ -20,7 +20,7 @@ Example:
 		interrupts = <112 IRQ_TYPE_LEVEL_HIGH>,
 			<113 IRQ_TYPE_LEVEL_HIGH>,
 			<114 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&PBCLK2>;
+		clocks = <&rootclk PB2CLK>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_uart1
 				&pinctrl_uart1_cts
-- 
1.8.3.1
