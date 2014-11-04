From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 8/8] ARM: mediatek: Fix description for mediatek SoCs
Date: Tue, 4 Nov 2014 15:30:55 +0800
Message-ID: <1415086255-5555-9-git-send-email-yingjoe.chen@mediatek.com>
References: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415086255-5555-1-git-send-email-yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, nathan.chung@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, yingjoe.chen@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

We support more MediaTek SoCs now, update the description.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/mach-mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 2c043a2..f73f588 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -1,6 +1,6 @@
 config ARCH_MEDIATEK
-	bool "Mediatek MT6589 SoC" if ARCH_MULTI_V7
+	bool "Mediatek MT65xx & MT81xx SoC" if ARCH_MULTI_V7
 	select ARM_GIC
 	select MTK_TIMER
 	help
-	  Support for Mediatek Cortex-A7 Quad-Core-SoC MT6589.
+	  Support for Mediatek MT65xx & MT81xx SoCs
-- 
1.8.1.1.dirty
