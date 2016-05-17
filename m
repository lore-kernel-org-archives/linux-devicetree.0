From: Purna Chandra Mandal <purna.mandal@microchip.com>
Subject: [PATCH 06/11] dt/bindings: Correct clk binding example for PIC32 SDHCI
Date: Tue, 17 May 2016 10:35:55 +0530
Message-ID: <1463461560-9629-6-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Purna Chandra Mandal <purna.mandal@microchip.com>, devicetree@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Joshua Henderson <joshua.henderson@microchip.com>, Andrei Pistirica <andrei.pistirica@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: devicetree@vger.kernel.org

Update binding example based on new clock binding documentation.
[1] Documentation/devicetree/bindings/clock/microchip,pic32.txt

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---

 Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
index 71ad57e..3149297 100644
--- a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
+++ b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
@@ -20,7 +20,7 @@ Example:
 		compatible = "microchip,pic32mzda-sdhci";
 		reg = <0x1f8ec000 0x100>;
 		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&REFCLKO4>, <&PBCLK5>;
+		clocks = <&rootclk REF4CLK>, <&rootclk PB5CLK>;
 		clock-names = "base_clk", "sys_clk";
 		bus-width = <4>;
 		cap-sd-highspeed;
-- 
1.8.3.1
