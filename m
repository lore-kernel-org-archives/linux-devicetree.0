From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 24/81] MIPS: DTS: jz4740: Correct interrupt number of DMA core
Date: Thu, 28 Feb 2019 10:07:16 -0500
Message-ID: <20190228150813.10256-24-sashal@kernel.org>
References: <20190228150813.10256-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190228150813.10256-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>, Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, Sasha Levin <sashal@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit 70999ec1c9d3f783a7232973cfc26971e5732758 ]

The interrupt number set in the devicetree node of the DMA driver was
wrong.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 6fb16fd240353..2beb78a62b7dc 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -161,7 +161,7 @@
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
-		interrupts = <29>;
+		interrupts = <20>;
 
 		clocks = <&cgu JZ4740_CLK_DMA>;
 
-- 
2.19.1
