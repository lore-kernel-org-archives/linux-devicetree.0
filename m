From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] ARM: dts: rockchip: Add missing dma-names SPI support for rv1108
Date: Thu,  3 Jan 2019 23:40:20 -0200
Message-ID: <20190104014023.17973-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jason Zhu <jason.zhu@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Pass the 'dma-names' property to the SPI ports so that DMA can
be supported.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index d31370ff28f4..cb26d9d98c34 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -207,6 +207,7 @@
 		clocks = <&cru SCLK_SPI>, <&cru PCLK_SPI>;
 		clock-names = "spiclk", "apb_pclk";
 		dmas = <&pdma 8>, <&pdma 9>;
+		dma-names = "tx", "rx";
 		#dma-cells = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.20.1
