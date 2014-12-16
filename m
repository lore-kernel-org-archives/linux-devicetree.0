From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH v4 1/5] ARM: mediatek: Add config options for mediatek SoCs.
Date: Wed, 17 Dec 2014 07:34:29 +0800
Message-ID: <1418772873-19747-2-git-send-email-hongzhou.yang@mediatek.com>
References: <1418772873-19747-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418772873-19747-1-git-send-email-hongzhou.yang@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, alan.cheng@mediatek.com, maoguang.meng@mediatek.com, Ashwin Chaugule <ashwin.chaugule@linaro.org>, toby.liu@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, dandan.he@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Yingjoe Chen <yingjoe.chen@mediatek.com>

The upcoming MTK pinctrl driver have a big pin table for each SoC
and we don't want to bloat the kernel binary if we don't need it.
Add config options so we can build for one SoC only.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 arch/arm/mach-mediatek/Kconfig | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index f73f588..f7e463c 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -1,6 +1,26 @@
-config ARCH_MEDIATEK
+menuconfig ARCH_MEDIATEK
 	bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
 	select ARM_GIC
 	select MTK_TIMER
 	help
 	  Support for Mediatek MT65xx & MT81xx SoCs
+
+if ARCH_MEDIATEK
+
+config MACH_MT6589
+	bool "MediaTek MT6589 SoCs support"
+	default ARCH_MEDIATEK
+
+config MACH_MT6592
+	bool "MediaTek MT6592 SoCs support"
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
