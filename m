From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 2/6] ARM: DTS: da850: Add node for edma0
Date: Thu, 31 Jul 2014 13:18:50 +0300
Message-ID: <1406801934-23334-3-git-send-email-peter.ujfalusi@ti.com>
References: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406801934-23334-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, robh+dt@kernel.org
Cc: khilman@deeprootsystems.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com, pawel.moll@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT node for edma0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index b695548dbb4e..41ce4e8bf227 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -150,6 +150,12 @@
 			};
 
 		};
+		edma0: edma@01c00000 {
+			compatible = "ti,edma3";
+			reg =	<0x0 0x10000>;
+			interrupts = <11 13 12>;
+			#dma-cells = <1>;
+		};
 		serial0: serial@1c42000 {
 			compatible = "ns16550a";
 			reg = <0x42000 0x100>;
-- 
2.0.2
