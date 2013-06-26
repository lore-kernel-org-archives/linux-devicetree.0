From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH/RFC v3 3/7] ARM: shmobile: kzm9g-reference: add DMA channels to the MMCIF DT
Date: Wed, 26 Jun 2013 16:40:52 +0200
Message-ID: <1372257656-9944-4-git-send-email-g.liakhovetski@gmx.de>
References: <1372257656-9944-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1372257656-9944-1-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

The MMCIF driver can use DMA for data transfer, add suitable
Device Tree bindings.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
---
 arch/arm/boot/dts/sh73a0-kzm9g-reference.dts |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
index b6f759e..348e973 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
@@ -149,6 +149,9 @@
 	bus-width = <8>;
 	vmmc-supply = <&reg_1p8v>;
 	status = "okay";
+	dmas = <&dma0 0xd1
+		&dma0 0xd2>;
+	dma-names = "tx", "rx";
 };
 
 &sdhi0 {
-- 
1.7.2.5

