From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 09/11] dt/bindings: Correct clk binding example for PIC32 DMT.
Date: Tue, 17 May 2016 10:35:58 +0530
Message-ID: <1463461560-9629-9-git-send-email-purna.mandal@microchip.com>
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
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Update binding example based on new clock binding scheme.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
index 852f694..49485f8 100644
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
@@ -8,12 +8,12 @@ Required properties:
 - compatible: must be "microchip,pic32mzda-dmt".
 - reg: physical base address of the controller and length of memory mapped
   region.
-- clocks: phandle of parent clock (should be &PBCLK7).
+- clocks: phandle of source clk. Should be <&rootclk PB7CLK>.
 
 Example:
 
 	watchdog@1f800a00 {
 		compatible = "microchip,pic32mzda-dmt";
 		reg = <0x1f800a00 0x80>;
-		clocks = <&PBCLK7>;
+		clocks = <&rootclk PB7CLK>;
 	};
-- 
1.8.3.1
