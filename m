From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/7] MIPS: Lantiq: Move device-trees to arch/mips/boot/dts/
Date: Thu, 21 Aug 2014 13:04:23 -0700
Message-ID: <1408651466-8334-5-git-send-email-abrestic@chromium.org>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408651466-8334-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move the Lantiq device-trees to arch/mips/boot/dts/ and update the
Makefiles accordingly.  There is currently only a single Lantiq
device-tree (EASY50712), and it's required to be built into the kernel,
so select BUILTIN_DTB for it.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/mips/boot/dts/Makefile                  | 1 +
 arch/mips/{lantiq => boot}/dts/danube.dtsi   | 0
 arch/mips/{lantiq => boot}/dts/easy50712.dts | 0
 arch/mips/lantiq/Kconfig                     | 1 +
 arch/mips/lantiq/Makefile                    | 2 --
 arch/mips/lantiq/dts/Makefile                | 1 -
 6 files changed, 2 insertions(+), 3 deletions(-)
 rename arch/mips/{lantiq => boot}/dts/danube.dtsi (100%)
 rename arch/mips/{lantiq => boot}/dts/easy50712.dts (100%)
 delete mode 100644 arch/mips/lantiq/dts/Makefile

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 51acad6..4f265ec 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_CAVIUM_OCTEON_SOC)		+= octeon_3xxx.dtb octeon_68xx.dtb
+dtb-$(CONFIG_DT_EASY50712)		+= easy50712.dtb
 
 obj-y		+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/lantiq/dts/danube.dtsi b/arch/mips/boot/dts/danube.dtsi
similarity index 100%
rename from arch/mips/lantiq/dts/danube.dtsi
rename to arch/mips/boot/dts/danube.dtsi
diff --git a/arch/mips/lantiq/dts/easy50712.dts b/arch/mips/boot/dts/easy50712.dts
similarity index 100%
rename from arch/mips/lantiq/dts/easy50712.dts
rename to arch/mips/boot/dts/easy50712.dts
diff --git a/arch/mips/lantiq/Kconfig b/arch/mips/lantiq/Kconfig
index c002191..e10d333 100644
--- a/arch/mips/lantiq/Kconfig
+++ b/arch/mips/lantiq/Kconfig
@@ -30,6 +30,7 @@ choice
 config DT_EASY50712
 	bool "Easy50712"
 	depends on SOC_XWAY
+	select BUILTIN_DTB
 endchoice
 
 config PCI_LANTIQ
diff --git a/arch/mips/lantiq/Makefile b/arch/mips/lantiq/Makefile
index d6bdc57..690257a 100644
--- a/arch/mips/lantiq/Makefile
+++ b/arch/mips/lantiq/Makefile
@@ -6,8 +6,6 @@
 
 obj-y := irq.o clk.o prom.o
 
-obj-y += dts/
-
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 
 obj-$(CONFIG_SOC_TYPE_XWAY) += xway/
diff --git a/arch/mips/lantiq/dts/Makefile b/arch/mips/lantiq/dts/Makefile
deleted file mode 100644
index 6fa72dd..0000000
--- a/arch/mips/lantiq/dts/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_DT_EASY50712) := easy50712.dtb.o
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
