From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 5/6] arm64: zynqmp: Added OOB timing settings in zynqmp-ep108.dts
Date: Wed, 17 Jan 2018 16:29:49 +0100
Message-ID: <22377adc20a2000627fa3b243b5e526dc585f24d.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.or, devicetree@vger.kernel.org
Cc: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, Javier Martinez Canillas <javier@dowhile0.org>, P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>, Kedareswara rao Appana <appanad@xilinx.com>, linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@xilinx.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>

This patch adds the sata port phy OOB timing values in the sata
device-tree node.

Signed-off-by: Anurag Kumar Vulisha <anuragku@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index 67eababceb93..22ea2973800c 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -84,6 +84,15 @@
 &sata {
 	status = "okay";
 	ceva,broken-gen2;
+	/* SATA Phy OOB timing settings */
+	ceva,p0-cominit-params = /bits/ 8 <0x0F 0x25 0x18 0x29>;
+	ceva,p0-comwake-params = /bits/ 8 <0x04 0x0B 0x08 0x0F>;
+	ceva,p0-burst-params = /bits/ 8 <0x0A 0x08 0x4A 0x06>;
+	ceva,p0-retry-params = /bits/ 16 <0x0216 0x7F06>;
+	ceva,p1-cominit-params = /bits/ 8 <0x0F 0x25 0x18 0x29>;
+	ceva,p1-comwake-params = /bits/ 8 <0x04 0x0B 0x08 0x0F>;
+	ceva,p1-burst-params = /bits/ 8 <0x0A 0x08 0x4A 0x06>;
+	ceva,p1-retry-params = /bits/ 16 <0x0216 0x7F06>;
 };
 
 &sdhci0 {
-- 
1.9.1
