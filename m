From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 1/2] dt-bindings: zx296718-clk: add compatible for audio clock controller
Date: Thu,  8 Dec 2016 17:25:56 +0800
Message-ID: <1481189157-8995-1-git-send-email-shawnguo@kernel.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baoyou Xie <xie.baoyou@zte.com.cn>, Jun Nie <jun.nie@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

It adds the compatible string for zx296718 audio clock controller.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/clock/zx296718-clk.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zx296718-clk.txt b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
index 8c18b7b237bf..4ad703808407 100644
--- a/Documentation/devicetree/bindings/clock/zx296718-clk.txt
+++ b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
@@ -13,6 +13,9 @@ Required properties:
 	"zte,zx296718-lsp1crm":
 		zx296718 device level clock selection and gating
 
+	"zte,zx296718-audiocrm":
+		zx296718 audio clock selection, divider and gating
+
 - reg: Address and length of the register set
 
 The clock consumer should specify the desired clock by having the clock
-- 
1.9.1

