From: Aleix Roca Nonell <kernelrocks@gmail.com>
Subject: [PATCH 4/6] arm64: dts: realtek: Add realtek intc to RTD129x
Date: Sun, 7 Jul 2019 15:23:25 +0200
Message-ID: <20190707132325.GE13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add realtek's interrupt controller node and interrupt lines
to UART0

Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
---
 arch/arm64/boot/dts/realtek/rtd129x.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/rtd129x.dtsi b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
index 9009db909fab..6f61b9858aa0 100644
--- a/arch/arm64/boot/dts/realtek/rtd129x.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd129x.dtsi
@@ -29,8 +29,18 @@
 		/* Exclude up to 2 GiB of RAM */
 		ranges = <0x80000000 0x80000000 0x80000000>;
 
+		mux1_intc: intc@98007000 {
+			compatible = "realtek,rtd129x-intc-iso";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x98007000 0x4 0x98007040 0x4 0x98007004 0x4>;
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		uart0: serial@98007800 {
 			compatible = "snps,dw-apb-uart";
+			interrupt-parent = <&mux1_intc>;
+			interrupts = <2>;
 			reg = <0x98007800 0x400>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-- 
2.21.0
