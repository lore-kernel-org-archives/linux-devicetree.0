From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH v3 7/7] ARM: shmobile: armadillo800eva-reference: add DMA support for MMCIF and SDHI
Date: Wed, 26 Jun 2013 16:40:56 +0200
Message-ID: <1372257656-9944-8-git-send-email-g.liakhovetski@gmx.de>
References: <1372257656-9944-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1372257656-9944-1-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Add DMA bindings to SDHI and MMCIF DT nodes on armadillo800eva-reference.
Since SDHI and MMCIF devices can use any of the 3 DMAC instances on
r8a7740, we point to the DMA multiplexer node instead of a specific DMAC
DT node.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
---
 .../boot/dts/r8a7740-armadillo800eva-reference.dts |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
index 3752637..1983d49 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
@@ -47,6 +47,9 @@
 	vmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
 	non-removable;
+	dmas = <&dmac 0xd1
+		&dmac 0xd2>;
+	dma-names = "tx", "rx";
 	status = "okay";
 };
 
@@ -54,11 +57,17 @@
 	vmmc-supply = <&reg_3p3v>;
 	bus-width = <4>;
 	broken-cd;
+	dmas = <&dmac 0xc1
+		&dmac 0xc2>;
+	dma-names = "tx", "rx";
 	status = "okay";
 };
 
 &sdhi1 {
 	vmmc-supply = <&reg_3p3v>;
 	bus-width = <4>;
+	dmas = <&dmac 0xc9
+		&dmac 0xca>;
+	dma-names = "tx", "rx";
 	status = "okay";
 };
-- 
1.7.2.5

