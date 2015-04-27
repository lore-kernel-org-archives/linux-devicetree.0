From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/10] ARM: shmobile: r8a7779 dtsi: Use generic names for device nodes
Date: Mon, 27 Apr 2015 14:55:27 +0200
Message-ID: <1430139334-15272-4-git-send-email-geert+renesas@glider.be>
References: <1430139334-15272-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430139334-15272-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

irqpin -> interrupt-controller

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 5c2219b9f3eb5003..5c8071e87ae9c719 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -148,7 +148,7 @@
 		interrupt-controller;
 	};
 
-	irqpin0: irqpin@fe780010 {
+	irqpin0: interrupt-controller@fe780010 {
 		compatible = "renesas,intc-irqpin-r8a7779", "renesas,intc-irqpin";
 		#interrupt-cells = <2>;
 		status = "disabled";
-- 
1.9.1

