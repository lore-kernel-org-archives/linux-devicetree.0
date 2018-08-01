From: Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v2, 1/3] arm64: dts: fsl: add clocks property for fman ptp timer node
Date: Wed,  1 Aug 2018 18:05:52 +0800
Message-ID: <20180801100554.36634-1-yangbo.lu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, madalin.bucur@nxp.com, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangbo Lu <yangbo.lu@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch is to add clocks property for fman ptp timer node.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None.
---
 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi b/arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi
index a56a408..4664c33 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi
@@ -80,4 +80,5 @@ ptp_timer0: ptp-timer@1afe000 {
 	compatible = "fsl,fman-ptp-timer";
 	reg = <0x0 0x1afe000 0x0 0x1000>;
 	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clockgen 3 0>;
 };
-- 
1.7.1
