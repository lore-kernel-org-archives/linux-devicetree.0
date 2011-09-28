From: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCHv2 04/10] ARM: netx: convert to MULTI_IRQ_HANDLER
Date: Wed, 28 Sep 2011 11:41:41 +0100
Message-ID: <1317206507-18867-5-git-send-email-jamie@jamieiles.com>
References: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1317206507-18867-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, linus.walleij@stericsson.com, marc.zyngier@arm.com, devicetree-discuss@lists.ozlabs.org, rmallon@gmail.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, hsweeten@visionengravers.com, rajeev-dlh.kumar@st.com, ben-linux@fluff.org, STEricsson_nomadik_linux@list.st.com, Jamie Iles <jamie@jamieiles.com>, rubini@unipv.it
List-Id: devicetree@vger.kernel.org

Now that there is a generic IRQ handler for multiple VIC devices use it
for netx to help building multi platform kernels.

Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/arm/Kconfig                              |    1 +
 arch/arm/mach-netx/include/mach/entry-macro.S |   13 -------------
 arch/arm/mach-netx/nxdb500.c                  |    2 ++
 arch/arm/mach-netx/nxdkn.c                    |    2 ++
 arch/arm/mach-netx/nxeb500hmi.c               |    2 ++
 5 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7facb7c..b7cab06 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -416,6 +416,7 @@ config ARCH_NETX
 	select CPU_ARM926T
 	select ARM_VIC
 	select GENERIC_CLOCKEVENTS
+	select MULTI_IRQ_HANDLER
 	help
 	  This enables support for systems based on the Hilscher NetX Soc
 
diff --git a/arch/arm/mach-netx/include/mach/entry-macro.S b/arch/arm/mach-netx/include/mach/entry-macro.S
index 844f1f9..6e9f1cb 100644
--- a/arch/arm/mach-netx/include/mach/entry-macro.S
+++ b/arch/arm/mach-netx/include/mach/entry-macro.S
@@ -18,22 +18,9 @@
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
-#include <mach/hardware.h>
 
 		.macro  disable_fiq
 		.endm
 
-		.macro  get_irqnr_preamble, base, tmp
-		ldr	\base, =io_p2v(0x001ff000)
-		.endm
-
 		.macro  arch_ret_to_user, tmp1, tmp2
 		.endm
-
-		.macro  get_irqnr_and_base, irqnr, irqstat, base, tmp
-		ldr	\irqstat, [\base, #0]
-		clz	\irqnr, \irqstat
-		rsb     \irqnr, \irqnr, #31
-		cmp	\irqstat, #0
-		.endm
-
diff --git a/arch/arm/mach-netx/nxdb500.c b/arch/arm/mach-netx/nxdb500.c
index ca8b203..e86aea8 100644
--- a/arch/arm/mach-netx/nxdb500.c
+++ b/arch/arm/mach-netx/nxdb500.c
@@ -28,6 +28,7 @@
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
+#include <asm/hardware/vic.h>
 #include <mach/netx-regs.h>
 #include <mach/eth.h>
 
@@ -203,6 +204,7 @@ MACHINE_START(NXDB500, "Hilscher nxdb500")
 	.boot_params	= 0x80000100,
 	.map_io		= netx_map_io,
 	.init_irq	= netx_init_irq,
+	.handle_irq	= vic_handle_irq,
 	.timer		= &netx_timer,
 	.init_machine	= nxdb500_init,
 MACHINE_END
diff --git a/arch/arm/mach-netx/nxdkn.c b/arch/arm/mach-netx/nxdkn.c
index d775cbe..b3170da 100644
--- a/arch/arm/mach-netx/nxdkn.c
+++ b/arch/arm/mach-netx/nxdkn.c
@@ -28,6 +28,7 @@
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
+#include <asm/hardware/vic.h>
 #include <mach/netx-regs.h>
 #include <mach/eth.h>
 
@@ -96,6 +97,7 @@ MACHINE_START(NXDKN, "Hilscher nxdkn")
 	.boot_params	= 0x80000100,
 	.map_io		= netx_map_io,
 	.init_irq	= netx_init_irq,
+	.handle_irq	= vic_handle_irq,
 	.timer		= &netx_timer,
 	.init_machine	= nxdkn_init,
 MACHINE_END
diff --git a/arch/arm/mach-netx/nxeb500hmi.c b/arch/arm/mach-netx/nxeb500hmi.c
index de369cd..dc6fa77 100644
--- a/arch/arm/mach-netx/nxeb500hmi.c
+++ b/arch/arm/mach-netx/nxeb500hmi.c
@@ -28,6 +28,7 @@
 #include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
+#include <asm/hardware/vic.h>
 #include <mach/netx-regs.h>
 #include <mach/eth.h>
 
@@ -180,6 +181,7 @@ MACHINE_START(NXEB500HMI, "Hilscher nxeb500hmi")
 	.boot_params	= 0x80000100,
 	.map_io		= netx_map_io,
 	.init_irq	= netx_init_irq,
+	.handle_irq	= vic_handle_irq,
 	.timer		= &netx_timer,
 	.init_machine	= nxeb500hmi_init,
 MACHINE_END
-- 
1.7.4.1
