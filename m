From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 02/17] MIPS: BMIPS: Align secondary boot sequence with latest firmware releases
Date: Mon, 20 Oct 2014 21:27:52 -0700
Message-ID: <1413865687-15255-3-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On some older BMIPS5200 (dual core / quad thread) platforms, the
PROM code set up CPU2/CPU3 so they would be started through an NMI
instead of through the ACTION register.  But this was incompatible with
some power management features that were later added, so the scheme was
changed so that Linux is fully responsible for booting CPU2/CPU3.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
