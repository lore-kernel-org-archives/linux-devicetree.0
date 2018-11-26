From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/4] ARM: dts: rockchip: Fix the PMU interrupt number for rv1108
Date: Mon, 26 Nov 2018 15:35:03 -0200
Message-ID: <20181126173506.24068-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

According to the Rockchip vendor tree the PMU interrupt number is
76, so fix it accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Fabio Berton <fabio.berton@ossystems.com.br>
---

Changes in v2:
- fixup commit signed-off-by
- fixup commit log

 arch/arm/boot/dts/rv1108.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 11ab86d6c4a5..611f2fe8e56c 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -67,7 +67,7 @@
 
 	arm-pmu {
 		compatible = "arm,cortex-a7-pmu";
-		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	timer {
-- 
2.19.2
