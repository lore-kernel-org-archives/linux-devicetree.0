From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 1/3] of: Add vendor prefix for Linear Technology Corporation
Date: Mon, 26 May 2014 10:38:14 +0200
Message-ID: <1401093496-28474-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add Linear Technology Corporation to the list of device tree vendor prefixes.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1:
 - Changed vendor prefix to lltc
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0f01c9b..98e739f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -65,6 +65,7 @@ lantiq	Lantiq Semiconductor
 lg	LG Corporation
 linux	Linux-specific binding
 lsi	LSI Corp. (LSI Logic)
+lltc	Linear Technology Corporation
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
 microchip	Microchip Technology Inc.
-- 
2.0.0.rc2
