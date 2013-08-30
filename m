From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH v7 2/3] ARM: bcm281xx: Enable GPIO driver
Date: Fri, 30 Aug 2013 10:15:13 -0700
Message-ID: <1377882914-30152-3-git-send-email-markus.mayer@linaro.org>
References: <1377882914-30152-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377882914-30152-1-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Christian Daudt <csd@broadcom.com>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Turn on the bcm281xx GPIO driver in the kernel configuration.
---
 arch/arm/mach-bcm/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index f112895..5819126 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -9,7 +9,7 @@ config ARCH_BCM
 	select CLKSRC_OF
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_TIME
-	select GPIO_BCM
+	select GPIO_BCM_KONA
 	select SPARSE_IRQ
 	select TICK_ONESHOT
 	help
-- 
1.7.9.5
