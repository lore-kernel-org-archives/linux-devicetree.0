From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 03/27] ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC node
Date: Fri, 14 Jun 2019 16:29:52 -0400
Message-ID: <20190614203018.27686-3-sashal@kernel.org>
References: <20190614203018.27686-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190614203018.27686-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Jose Abreu <joabreu@synopsys.com>, Joao Pinto <jpinto@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <vgupta@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jose Abreu <joabreu@synopsys.com>

[ Upstream commit 4c70850aeb2e40016722cd1abd43c679666d3ca0 ]

Add the binding for RX/TX fifo size of GMAC node.

Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Tested-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/boot/dts/hsdk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index c033ae45fe42..57d81c6aa379 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -170,6 +170,9 @@
 			resets = <&cgu_rst HSDK_ETH_RESET>;
 			reset-names = "stmmaceth";
 
+			tx-fifo-depth = <4096>;
+			rx-fifo-depth = <4096>;
+
 			mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.20.1
