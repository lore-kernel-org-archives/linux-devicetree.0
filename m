From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V4 10/16] MIPS: Fall back to the generic restart notifier
Date: Thu, 27 Nov 2014 20:32:16 -0800
Message-ID: <1417149142-3756-11-git-send-email-cernekee@gmail.com>
References: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417149142-3756-1-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org
Cc: f.fainelli@gmail.com, jfraser@broadcom.com, dtor@chromium.org, tglx@linutronix.de, jason@lakedaemon.net, jogo@openwrt.org, arnd@arndb.de, computersforpeace@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If the machine doesn't set its own _machine_restart callback, call the
common do_kernel_restart() instead.  This allows arch-independent reset
drivers from drivers/power/reset/ to be used to reboot the machine.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/kernel/reset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 07fc5244aed4..cf23ab520701 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -29,6 +29,8 @@ void machine_restart(char *command)
 {
 	if (_machine_restart)
 		_machine_restart(command);
+	else
+		do_kernel_restart(command);
 }
 
 void machine_halt(void)
-- 
2.1.0
