From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] ARM: mediatek: Low-level-debug for mt6592
Date: Wed, 14 Jan 2015 12:35:55 +0100
Message-ID: <1421235356-6631-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, howard.chen@linaro.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch changes the description of the low-level-debug port. SoC mt8127 and
mt6592 have the same uart port and the same mapping. We just change the
description to add low-level-debug to mt6592.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 5ddd490..385f2d1 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -973,7 +973,7 @@ choice
 		  for Mediatek mt6589 based platforms on UART0.
 
 	config DEBUG_MT8127_UART0
-		bool "Mediatek mt8127 UART0"
+		bool "Mediatek mt8127/mt6592 UART0"
 		depends on ARCH_MEDIATEK
 		select DEBUG_UART_8250
 		help
-- 
1.9.1
