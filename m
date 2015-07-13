From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH 3/5] arm64: mediatek: enable MTK_TIMER
Date: Mon, 13 Jul 2015 17:32:47 +0800
Message-ID: <1436779969-18610-4-git-send-email-yingjoe.chen@mediatek.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Yingjoe Chen <yingjoe.chen@mediatek.com>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable MTK_TIMER for MediaTek plaform, which will be used as
schedule clock.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0f6edb1..5934f51 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -193,6 +193,7 @@ config ARCH_MEDIATEK
 	bool "Mediatek MT65xx & MT81xx ARMv8 SoC"
 	select ARM_GIC
 	select PINCTRL
+	select MTK_TIMER
 	help
 	  Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
 
-- 
1.8.1.1.dirty
