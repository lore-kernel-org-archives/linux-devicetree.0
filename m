From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 10/22] ARM: shmobile: r8a7790: Add pin control device to device tree
Date: Wed, 12 Jun 2013 00:22:39 +0200
Message-ID: <1370989371-30846-11-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1370989371-30846-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1370989371-30846-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

Add a pfc node to the r8a7790 device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 339d9b1..13caf12 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -54,4 +54,9 @@
 		interrupt-parent = <&gic>;
 		interrupts = <0 0 4>, <0 1 4>, <0 2 4>,	<0 3 4>;
 	};
+
+	pfc: pfc@e6060000 {
+		compatible = "renesas,pfc-r8a7790";
+		reg = <0 0xe6060000 0 0x250>;
+	};
 };
-- 
1.8.1.5

