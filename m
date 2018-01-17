From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 6/6] arm64: zynqmp: Add 8-bit bus width property for ep108
Date: Wed, 17 Jan 2018 16:29:50 +0100
Message-ID: <bbbcb046ab6c2f7b00c5a13f64af43c578e72e5d.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.or, devicetree@vger.kernel.org
Cc: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, Alistair Francis <alistair.francis@xilinx.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>

This patch add 8-bit bus width property to eMMC node.

Signed-off-by: P L Sai Krishna <lakshmis@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 22ea2973800c..b089f715c1fb 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -97,6 +97,7 @@
 
 &sdhci0 {
 	status = "okay";
+	bus-width = <8>;
 };
 
 &sdhci1 {
-- 
1.9.1
