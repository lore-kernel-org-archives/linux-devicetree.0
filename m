From: Howard Chen <howard.chen@linaro.org>
Subject: [PATCH 2/2] dt-bindings: add mt6592 compatible string for mediatek sysirq
Date: Thu,  8 Jan 2015 14:23:11 +0800
Message-ID: <1420698191-10878-2-git-send-email-howard.chen@linaro.org>
References: <1420698191-10878-1-git-send-email-howard.chen@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420698191-10878-1-git-send-email-howard.chen@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Jason Cooper <jason@lakedaemon.net>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek
	SoC..." <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Howard Chen <howard.chen@linaro.org>
---
 Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
index d680b07..4cd6f7b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible: should be one of:
 	"mediatek,mt8135-sysirq"
 	"mediatek,mt8127-sysirq"
+	"mediatek,mt6592-sysirq"
 	"mediatek,mt6589-sysirq"
 	"mediatek,mt6582-sysirq"
 	"mediatek,mt6577-sysirq"
-- 
1.9.1
