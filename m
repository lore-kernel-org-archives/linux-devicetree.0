From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v02 6/6] ARM: DTS: da850: Enable DMA for SPI1
Date: Thu, 17 Dec 2015 15:27:52 +0200
Message-ID: <1450358872-2951-7-git-send-email-peter.ujfalusi@ti.com>
References: <1450358872-2951-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450358872-2951-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@deeprootsystems.com
List-Id: devicetree@vger.kernel.org

Add the needed bindings so the SPI driver can use DMA with SPI1.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: Sushaanth Srirangapathi <sushaanth.s@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 31ca5768fccf..226cda76e77c 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -285,6 +285,8 @@
 			num-cs = <4>;
 			ti,davinci-spi-intr-line = <1>;
 			interrupts = <56>;
+			dmas = <&edma0 18 0>, <&edma0 19 0>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 		mdio: mdio@1e24000 {
-- 
2.6.4
