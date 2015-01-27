From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH 1/3] arm64: mediatek: Add config option for mt8173.
Date: Tue, 27 Jan 2015 15:13:54 +0800
Message-ID: <1422342836-27689-2-git-send-email-hongzhou.yang@mediatek.com>
References: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, eddie.huang@mediatek.com, linux-kernel@vger.kernel.org, alan.cheng@mediatek.com, maoguang.meng@mediatek.com, Ashwin Chaugule <ashwin.chaugule@linaro.org>, toby.liu@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, dandan.he@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Hongzhou Yang <hongzhou.yang@mediatek.com>

The upcoming MTK pinctrl driver have a big pin table for each SoC,
and we don't want to bloat the kernel binary if we don't need it.
Add config options so we can build for one SoC only.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 arch/arm64/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e627ead..6213dac 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -151,9 +151,15 @@ menu "Platform selection"
 config ARCH_MEDIATEK
 	bool "Mediatek MT65xx & MT81xx ARMv8 SoC"
 	select ARM_GIC
+	select PINCTRL
 	help
 	  Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
 
+config MACH_MT8173
+	bool "Mediatek 8173 Soc Supprt"
+	depends on ARCH_MEDIATEK
+	default y
+
 config ARCH_SEATTLE
 	bool "AMD Seattle SoC Family"
 	help
-- 
1.8.1.1.dirty
