From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 4/7] devicetree: bindings: add new SMP enable method Mediatek SoC
Date: Fri, 1 May 2015 15:43:27 +0800
Message-ID: <1430466210-22963-5-git-send-email-yingjoe.chen@mediatek.com>
References: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430466210-22963-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Catalin Marinas <catalin.marinas@arm.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Marc Carino <marc.ceeeee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This commit add new cpu enable method "mediatek,mt65xx-smp" and
"mediatek,mt81xx-tz-smp".

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 6aa331d..ac2903d 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -194,6 +194,8 @@ nodes to be present and contain the properties described below.
 			    "marvell,armada-380-smp"
 			    "marvell,armada-390-smp"
 			    "marvell,armada-xp-smp"
+			    "mediatek,mt65xx-smp"
+			    "mediatek,mt81xx-tz-smp"
 			    "qcom,gcc-msm8660"
 			    "qcom,kpss-acc-v1"
 			    "qcom,kpss-acc-v2"
-- 
1.8.1.1.dirty
