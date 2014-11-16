From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V2 10/22] MIPS: BMIPS: Allow BMIPS3300 to utilize SMP ebase relocation code
Date: Sat, 15 Nov 2014 16:17:34 -0800
Message-ID: <1416097066-20452-11-git-send-email-cernekee@gmail.com>
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

From: Jon Fraser <jfraser@broadcom.com>

BMIPS3300 processors do not have the hardware to support SMP, but with a
small tweak, the SMP ebase relocation code allows BMIPS3300-based
platforms to reuse the S2/S3 power management code from BMIPS4380-based
chips.  Normally this is as simple as adding one line to prom_init():

    board_ebase_setup = &bmips_ebase_setup;

Signed-off-by: Jon Fraser <jfraser@broadcom.com>
Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
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
