From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 11/21] ARM: shmobile: sh7372: Add pin control device to device tree
Date: Tue, 21 May 2013 14:14:32 +0200
Message-ID: <1369138482-5871-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1369138482-5871-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1369138482-5871-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

Add a pfc node to the sh7372 device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm/boot/dts/sh7372.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sh7372.dtsi b/arch/arm/boot/dts/sh7372.dtsi
index 677fc60..ce19398 100644
--- a/arch/arm/boot/dts/sh7372.dtsi
+++ b/arch/arm/boot/dts/sh7372.dtsi
@@ -18,4 +18,12 @@
 			compatible = "arm,cortex-a8";
 		};
 	};
+
+	pfc: pfc@e6050000 {
+		compatible = "renesas,pfc-sh7372";
+		reg = <0xe6050000 0x8000>,
+		      <0xe605801c 0x1c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
-- 
1.8.1.5

