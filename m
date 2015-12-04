From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 6/6] ARM: DTS: da850: Enable DMA for SPI1
Date: Fri, 4 Dec 2015 15:53:30 +0200
Message-ID: <1449237210-16381-7-git-send-email-peter.ujfalusi@ti.com>
References: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@deeprootsystems.com
List-Id: devicetree@vger.kernel.org

Add the needed bindings so the SPI driver can use DMA with SPI1.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index edaf69ec03a9..fc7866657a4e 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -286,6 +286,8 @@
 			num-cs = <4>;
 			ti,davinci-spi-intr-line = <1>;
 			interrupts = <56>;
+			dmas = <&edma0 18 0>, <&edma0 19 0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 		mdio: mdio@1e24000 {
-- 
2.6.3
