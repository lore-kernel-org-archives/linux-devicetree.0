From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH] arm64: dts: k3-am65-wakeup: Fix wakeup_uart reg address
Date: Thu, 27 Sep 2018 10:31:46 +0530
Message-ID: <20180927050146.17847-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

cbass_wakeup interconnect which is the parent of wakeup_uart node
defines address-cells=1 and size-cells=1, therefore fix up reg property
of wakeup_uart node accordingly. Otherwise, this UART instance fails to
probe if enabled.

Fixes: 4201af2544b3 ("arm64: dts: ti: am654: Add uart nodes")
Signed-off-by: Vignesh R <vigneshr@ti.com>
---

Based on next-20180926

 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index ee56959f4af8..c617393ea767 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -44,7 +44,7 @@
 
 	wkup_uart0: serial@42300000 {
 		compatible = "ti,am654-uart";
-		reg = <0x00 0x42300000 0x00 0x100>;
+		reg = <0x42300000 0x100>;
 		reg-shift = <2>;
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.19.0
