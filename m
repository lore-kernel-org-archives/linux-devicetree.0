From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 08/22] MIPS: BMIPS: Align secondary boot sequence with latest firmware releases
Date: Sat, 15 Nov 2014 16:17:32 -0800
Message-ID: <1416097066-20452-9-git-send-email-cernekee@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On some older BMIPS5200 (dual core / quad thread) platforms, the
PROM code set up CPU2/CPU3 so they would be started through an NMI
instead of through the ACTION register.  But this was incompatible with
some power management features that were later added, so the scheme was
changed so that Linux is fully responsible for booting CPU2/CPU3.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/kernel/smp-bmips.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 06bb5ed..4e56911 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -213,17 +213,7 @@ static void bmips_boot_secondary(int cpu, struct task_struct *idle)
 				set_c0_brcm_cmt_ctrl(0x01);
 			break;
 		case CPU_BMIPS5000:
-			if (cpu & 0x01)
-				write_c0_brcm_action(ACTION_BOOT_THREAD(cpu));
-			else {
-				/*
-				 * core N thread 0 was already booted; just
-				 * pulse the NMI line
-				 */
-				bmips_write_zscm_reg(0x210, 0xc0000000);
-				udelay(10);
-				bmips_write_zscm_reg(0x210, 0x00);
-			}
+			write_c0_brcm_action(ACTION_BOOT_THREAD(cpu));
 			break;
 		}
 		cpumask_set_cpu(cpu, &bmips_booted_mask);
-- 
2.1.1
