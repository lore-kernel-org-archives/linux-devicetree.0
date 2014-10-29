From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH 04/11] irqchip: Remove ARM dependency for bcm7120-l2 and brcmstb-l2
Date: Tue, 28 Oct 2014 20:58:51 -0700
Message-ID: <1414555138-6500-4-git-send-email-cernekee@gmail.com>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1414555138-6500-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

This can compile for MIPS (or anything else) now.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/irqchip/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 6f0e80b..6a03c65 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -53,7 +53,6 @@ config ATMEL_AIC5_IRQ
 
 config BRCMSTB_L2_IRQ
 	bool
-	depends on ARM
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
-- 
2.1.1
