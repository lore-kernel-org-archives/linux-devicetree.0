From: <srv_hongzhou.yang@mediatek.com>
Subject: [PATCH 3/4] ARM: dts: mt8135: Add pinctrl node for mt8135.
Date: Fri, 19 Sep 2014 19:48:25 +0800
Message-ID: <1411127306-13677-4-git-send-email-srv_hongzhou.yang@mediatek.com>
References: <1411127306-13677-1-git-send-email-srv_hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411127306-13677-1-git-send-email-srv_hongzhou.yang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, =Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Hongzhou Yang <hongzhou.yang@mediatek.com>

Add pinctrl node to mt8135.dtsi.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 arch/arm/boot/dts/mt8135.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 90a56ad..1bfd3d0 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -15,6 +15,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include "skeleton64.dtsi"
+#include "mt8135-pinfunc.h"
+#include <dt-bindings/pinctrl/mt65xx.h>
 
 / {
 	compatible = "mediatek,mt8135";
@@ -111,5 +113,14 @@
 			      <0 0x10214000 0 0x2000>,
 			      <0 0x10216000 0 0x2000>;
 		};
+
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt8135-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x1020C000 0 0x1000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 	};
 };
-- 
1.8.1.1.dirty
