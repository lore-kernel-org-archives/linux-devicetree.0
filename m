From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 7/7] mips: pistachio: Allow to enable the external timer based clocksource
Date: Thu, 21 May 2015 18:43:38 -0300
Message-ID: <1432244618-15548-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Damien.Horsley@imgtec.com, Govindraj.Raja@imgtec.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: devicetree@vger.kernel.org

This commit introduces a new config, so the user can choose to enable
the General Purpose Timer based clocksource. This option is required
to have CPUFreq support.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 arch/mips/Kconfig           |  1 +
 arch/mips/pistachio/Kconfig | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/mips/pistachio/Kconfig

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f501665..91f6ca0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -934,6 +934,7 @@ source "arch/mips/jazz/Kconfig"
 source "arch/mips/jz4740/Kconfig"
 source "arch/mips/lantiq/Kconfig"
 source "arch/mips/lasat/Kconfig"
+source "arch/mips/pistachio/Kconfig"
 source "arch/mips/pmcs-msp71xx/Kconfig"
 source "arch/mips/ralink/Kconfig"
 source "arch/mips/sgi-ip27/Kconfig"
diff --git a/arch/mips/pistachio/Kconfig b/arch/mips/pistachio/Kconfig
new file mode 100644
index 0000000..97731ea
--- /dev/null
+++ b/arch/mips/pistachio/Kconfig
@@ -0,0 +1,13 @@
+config PISTACHIO_GPTIMER_CLKSRC
+	bool "Enable General Purpose Timer based clocksource"
+	depends on MACH_PISTACHIO
+	select CLKSRC_PISTACHIO
+	select MIPS_EXTERNAL_TIMER
+	help
+	  This option enables a clocksource driver based on a Pistachio
+	  SoC General Purpose external timer.
+
+	  If you want to enable the CPUFreq, you need to enable
+	  this option.
+
+	  If you don't want to enable CPUFreq, you can leave this disabled.
-- 
2.3.3
