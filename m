From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v2 2/2] ARM: at91/dt: sama5d2: Use new compatible for ohci node
Date: Wed, 1 Jun 2016 12:30:00 +0800
Message-ID: <1464755400-6825-3-git-send-email-wenyou.yang@atmel.com>
References: <1464755400-6825-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464755400-6825-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Use compatible "atmel,sama5d2-ohci" to be capable of suspending
ports while sleep to save the power consumption.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

Changes in v2:
 - Use the new compatible for ohci-node.

 arch/arm/boot/dts/sama5d2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 78996bd..03d6724 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -232,7 +232,7 @@
 		};
 
 		usb1: ohci@00400000 {
-			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
+			compatible = "atmel,sama5d2-ohci", "usb-ohci";
 			reg = <0x00400000 0x100000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
 			clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
-- 
2.7.4
