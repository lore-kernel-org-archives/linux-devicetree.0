From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v1 3/3] ARM64: dts: rk3368: Add mailbox device nodes
Date: Tue, 27 Oct 2015 15:31:46 +0800
Message-ID: <1445931106-683-4-git-send-email-wxt@rock-chips.com>
References: <1445931106-683-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445931106-683-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: frank.wang@rock-chips.com, linux-rockchip@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds mailbox device nodes in dts.

Mailbox is used by the Rockchip CPU cores to communicate
requests to MCU processor.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v1:
- PATCH[3/3] dts:
- fix "processormZ"--> "processor",the miss-fingerboard.
- Remove the shared memory in mailbox controller dtsi.

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index cc093a4..cefdad3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -484,6 +484,18 @@
 		status = "disabled";
 	};
 
+	mbox: mbox@ff6b0000 {
+		compatible = "rockchip,rk3368-mailbox";
+		reg = <0x0 0xff6b0000 0x0 0x1000>,
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_MAILBOX>;
+		clock-names = "pclk_mailbox";
+		#mbox-cells = <1>;
+	};
+
 	pmugrf: syscon@ff738000 {
 		compatible = "rockchip,rk3368-pmugrf", "syscon";
 		reg = <0x0 0xff738000 0x0 0x1000>;
-- 
1.9.1
