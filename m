From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 2/5] devicetree: bindings: add new SMP enable method Mediatek SoC
Date: Fri, 2 Oct 2015 23:19:38 +0800
Message-ID: <1443799181-50409-3-git-send-email-yingjoe.chen@mediatek.com>
References: <1443799181-50409-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443799181-50409-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

This commit add new cpu enable method "mediatek,mt65xx-smp" and
"mediatek,mt81xx-tz-smp".

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 91e6e5c..3a07a87 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -195,6 +195,8 @@ nodes to be present and contain the properties described below.
 			    "marvell,armada-380-smp"
 			    "marvell,armada-390-smp"
 			    "marvell,armada-xp-smp"
+			    "mediatek,mt6589-smp"
+			    "mediatek,mt81xx-tz-smp"
 			    "qcom,gcc-msm8660"
 			    "qcom,kpss-acc-v1"
 			    "qcom,kpss-acc-v2"
-- 
1.9.1
