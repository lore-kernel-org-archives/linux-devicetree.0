From: Parthiban Nallathambi <pn@denx.de>
Subject: [PATCH v3 3/4] arm64: dts: actions: Add sirq node for Actions Semi S700
Date: Mon, 26 Nov 2018 11:03:55 +0100
Message-ID: <20181126100356.2840578-4-pn@denx.de>
References: <20181126100356.2840578-1-pn@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126100356.2840578-1-pn@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, manivannan.sadhasivam@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thomas.liau@actions-semi.com, mp-cs@actions-semi.com, linux@cubietech.com, edgar.righi@lsitec.org.br, laisa.costa@lsitec.org.br, guilherme.simoes@lsitec.org.br, mkzuffo@lsi.usp.br, Parthiban Nallathambi <pn@denx.de>, Saravanan Sekar <sravanhome@gmail.com>
List-Id: devicetree@vger.kernel.org

Add sirq node for Actions Semi S700 SoC with 3 SIRQ pins support,
in which external interrupt controllers can be connected.

Example:
atc260x: atc2603c@65 {
        interrupt-parent = <&sirq>;
        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
};

Signed-off-by: Parthiban Nallathambi <pn@denx.de>
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 192c7b39c8c1..d87602ebd689 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -174,6 +174,16 @@
 			#clock-cells = <1>;
 		};
 
+		sirq: interrupt-controller@e01b0200 {
+			compatible = "actions,owl-sirq";
+			reg = <0x0 0xe01b0000 0x0 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			actions,sirq-shared-reg;
+			actions,sirq-reg-offset = <0x200 0x200 0x200>;
+			actions,ext-irq-range = <13 15>;
+		};
+
 		sps: power-controller@e01b0100 {
 			compatible = "actions,s700-sps";
 			reg = <0x0 0xe01b0100 0x0 0x100>;
-- 
2.17.2
