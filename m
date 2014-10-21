From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 04/17] MIPS: BMIPS: Allow BMIPS3300 to utilize SMP ebase relocation code
Date: Mon, 20 Oct 2014 21:27:54 -0700
Message-ID: <1413865687-15255-5-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

BMIPS3300 processors do not have the hardware to support SMP, but with a
small tweak, the SMP ebase relocation code allows BMIPS3300-based
platforms to reuse the S2/S3 power management code from BMIPS4380-based
chips.  Normally this is as simple as adding one line to prom_init():

    board_ebase_setup = &bmips_ebase_setup;

Signed-off-by: Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/kernel/smp-bmips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 8383fa4..887c3ea 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -541,6 +541,7 @@ void bmips_ebase_setup(void)
 			&bmips_smp_int_vec, 0x80);
 		__sync();
 		return;
+	case CPU_BMIPS3300:
 	case CPU_BMIPS4380:
 		/*
 		 * 0x8000_0000: reset/NMI (initially in kseg1)
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
