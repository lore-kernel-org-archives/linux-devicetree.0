From: Haojian Zhuang <haojian.zhuang@marvell.com>
Subject: [PATCH] ARM: mmp: remove SPARSE_IRQ for mmp
Date: Fri,  8 Jul 2011 18:20:17 +0800
Message-ID: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, haojian.zhuang@gmail.com, nico@fluxnic.net, samuel.ortiz@intel.com, broonie@opens
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
List-Id: devicetree@vger.kernel.org

Avoid to use SPARSE_IRQ for mmp. There will be irq domain translation between
DT irq specifier and the Linux irq number.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 arch/arm/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 17507b8..48748fb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -545,7 +545,6 @@ config ARCH_MMP
 	select HAVE_SCHED_CLOCK
 	select TICK_ONESHOT
 	select PLAT_PXA
-	select SPARSE_IRQ
 	help
 	  Support for Marvell's PXA168/PXA910(MMP) and MMP2 processor line.
 
-- 
1.5.6.5
