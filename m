From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH 2/2] ARC: [plat-hsdk]: Add missing FIFO size entry in GMAC node
Date: Mon, 20 May 2019 15:43:13 +0200
Message-ID: <cdd9b9c36ff1ac3a3b56dff4a90e9bfd89b48866.1558359611.git.joabreu@synopsys.com>
References: <cover.1558359611.git.joabreu@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1558359611.git.joabreu@synopsys.com>
In-Reply-To: <cover.1558359611.git.joabreu@synopsys.com>
References: <cover.1558359611.git.joabreu@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add the binding for RX/TX fifo size of GMAC node.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index b0f059377ab0..3bcd1edc4dcc 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -196,6 +196,9 @@
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 			dma-coherent;
 
+			tx-fifo-depth = <4096>;
+			rx-fifo-depth = <4096>;
+
 			mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.4
