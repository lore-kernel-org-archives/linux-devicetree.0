From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 1/5] ARM: mediatek: Add MT2701 config options for mediatek
 SoCs.
Date: Thu, 26 Nov 2015 16:44:28 +0800
Message-ID: <1448527472-20651-2-git-send-email-biao.huang@mediatek.com>
References: <1448527472-20651-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1448527472-20651-1-git-send-email-biao.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Erin Lo <erin.lo@mediatek.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Erin Lo <erin.lo@mediatek.com>

The upcoming MTK pinctrl driver have a big pin table for each SoC
and we don't want to bloat the kernel binary if we don't need it.
Add config options so we can build for one SoC only. Add MT2701.

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
---
 arch/arm/mach-mediatek/Kconfig |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index aeece17..37dd438 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -9,6 +9,10 @@ menuconfig ARCH_MEDIATEK
 
 if ARCH_MEDIATEK
 
+config MACH_MT2701
+	bool "MediaTek MT2701 SoCs support"
+	default ARCH_MEDIATEK
+
 config MACH_MT6589
 	bool "MediaTek MT6589 SoCs support"
 	default ARCH_MEDIATEK
-- 
1.7.9.5
