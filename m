From: <srv_hongzhou.yang@mediatek.com>
Subject: [PATCH 1/4] arm: mediatek: Add config option for mediatek SoCs.
Date: Fri, 19 Sep 2014 19:48:23 +0800
Message-ID: <1411127306-13677-2-git-send-email-srv_hongzhou.yang@mediatek.com>
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

From: "Joe.C" <yingjoe.chen@mediatek.com>

Add config options for ARCH_MT6589, ARCH_MT8127, ARCH_MT8135. This
allow drivers to isolate support base on these options.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/mach-mediatek/Kconfig | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 2c043a2..25fe6cf 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -1,6 +1,22 @@
-config ARCH_MEDIATEK
-	bool "Mediatek MT6589 SoC" if ARCH_MULTI_V7
+menuconfig ARCH_MEDIATEK
+	bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
 	select ARM_GIC
 	select MTK_TIMER
 	help
-	  Support for Mediatek Cortex-A7 Quad-Core-SoC MT6589.
+	  Support for Mediatek MT65xx & MT81xx SoCs
+
+if ARCH_MEDIATEK
+
+config MACH_MT6589
+	bool "MediaTek MT6589 SoCs support"
+	default ARCH_MEDIATEK
+
+config MACH_MT8127
+	bool "MediaTek MT8127 SoCs support"
+	default ARCH_MEDIATEK
+
+config MACH_MT8135
+	bool "MediaTek MT8135 SoCs support"
+	default ARCH_MEDIATEK
+
+endif
-- 
1.8.1.1.dirty
