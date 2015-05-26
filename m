From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 7/7] mips: pistachio: Allow to enable the external timer based clocksource
Date: Tue, 26 May 2015 15:41:56 -0300
Message-ID: <1432665716-16202-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432665548-16024-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432665548-16024-1-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit introduces a new config, so the user can choose to enable
the General Purpose Timer based clocksource. This option is required
to have CPUFreq support.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
