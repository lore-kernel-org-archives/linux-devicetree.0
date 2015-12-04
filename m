From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 4/6] ARM: DTS: da850: Enable DMA use for MMC0
Date: Fri, 4 Dec 2015 15:53:28 +0200
Message-ID: <1449237210-16381-5-git-send-email-peter.ujfalusi@ti.com>
References: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@deeprootsystems.com
List-Id: devicetree@vger.kernel.org

Add the needed bindings for MMC0 in order to be able to utilize the DMA
instead of PIO mode.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index e311d73a5265..ccaaf2746aca 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -236,6 +236,8 @@
 			compatible = "ti,da830-mmc";
 			reg = <0x40000 0x1000>;
 			interrupts = <16>;
+			dmas = <&edma0 16 0>, <&edma0 17 0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 		ehrpwm0: ehrpwm@01f00000 {
-- 
2.6.3
