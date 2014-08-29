From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 7/7] MIPS: ralink: Move device-trees to arch/mips/boot/dts/ralink/
Date: Thu, 28 Aug 2014 20:27:42 -0700
Message-ID: <1409282862-4435-1-git-send-email-abrestic@chromium.org>
References: <1409191812-23697-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409191812-23697-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move the Ralink device-trees to arch/mips/boot/dts/ralink/ and update
the Makefiles accordingly.  A built-in device-tree is optional, so
select BUILTIN_DTB when it is requested.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Looks like this one didn't make it through the first time.
---
 arch/mips/boot/dts/Makefile                                | 1 +
 arch/mips/boot/dts/ralink/Makefile                         | 4 ++++
 arch/mips/{ralink/dts => boot/dts/ralink}/mt7620a.dtsi     | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/mt7620a_eval.dts | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/rt2880.dtsi      | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/rt2880_eval.dts  | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/rt3050.dtsi      | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/rt3052_eval.dts  | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/rt3883.dtsi      | 0
 arch/mips/{ralink/dts => boot/dts/ralink}/rt3883_eval.dts  | 0
 arch/mips/ralink/Kconfig                                   | 4 ++++
 arch/mips/ralink/Makefile                                  | 2 --
 arch/mips/ralink/dts/Makefile                              | 4 ----
 13 files changed, 9 insertions(+), 6 deletions(-)
 create mode 100644 arch/mips/boot/dts/ralink/Makefile
 rename arch/mips/{ralink/dts => boot/dts/ralink}/mt7620a.dtsi (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/mt7620a_eval.dts (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/rt2880.dtsi (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/rt2880_eval.dts (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/rt3050.dtsi (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/rt3052_eval.dts (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/rt3883.dtsi (100%)
 rename arch/mips/{ralink/dts => boot/dts/ralink}/rt3883_eval.dts (100%)
 delete mode 100644 arch/mips/ralink/dts/Makefile

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index a861be5..47406f7 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -2,6 +2,7 @@ include arch/mips/boot/dts/cavium-octeon/Makefile
 include arch/mips/boot/dts/lantiq/Makefile
 include arch/mips/boot/dts/mti/Makefile
 include arch/mips/boot/dts/netlogic/Makefile
+include arch/mips/boot/dts/ralink/Makefile
 
 obj-y		+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
new file mode 100644
index 0000000..81a567e
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -0,0 +1,4 @@
+dtb-$(CONFIG_DTB_RT2880_EVAL)	+= ralink/rt2880_eval.dtb
+dtb-$(CONFIG_DTB_RT305X_EVAL)	+= ralink/rt3052_eval.dtb
+dtb-$(CONFIG_DTB_RT3883_EVAL)	+= ralink/rt3883_eval.dtb
+dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= ralink/mt7620a_eval.dtb
diff --git a/arch/mips/ralink/dts/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
similarity index 100%
rename from arch/mips/ralink/dts/mt7620a.dtsi
rename to arch/mips/boot/dts/ralink/mt7620a.dtsi
diff --git a/arch/mips/ralink/dts/mt7620a_eval.dts b/arch/mips/boot/dts/ralink/mt7620a_eval.dts
similarity index 100%
rename from arch/mips/ralink/dts/mt7620a_eval.dts
rename to arch/mips/boot/dts/ralink/mt7620a_eval.dts
diff --git a/arch/mips/ralink/dts/rt2880.dtsi b/arch/mips/boot/dts/ralink/rt2880.dtsi
similarity index 100%
rename from arch/mips/ralink/dts/rt2880.dtsi
rename to arch/mips/boot/dts/ralink/rt2880.dtsi
diff --git a/arch/mips/ralink/dts/rt2880_eval.dts b/arch/mips/boot/dts/ralink/rt2880_eval.dts
similarity index 100%
rename from arch/mips/ralink/dts/rt2880_eval.dts
rename to arch/mips/boot/dts/ralink/rt2880_eval.dts
diff --git a/arch/mips/ralink/dts/rt3050.dtsi b/arch/mips/boot/dts/ralink/rt3050.dtsi
similarity index 100%
rename from arch/mips/ralink/dts/rt3050.dtsi
rename to arch/mips/boot/dts/ralink/rt3050.dtsi
diff --git a/arch/mips/ralink/dts/rt3052_eval.dts b/arch/mips/boot/dts/ralink/rt3052_eval.dts
similarity index 100%
rename from arch/mips/ralink/dts/rt3052_eval.dts
rename to arch/mips/boot/dts/ralink/rt3052_eval.dts
diff --git a/arch/mips/ralink/dts/rt3883.dtsi b/arch/mips/boot/dts/ralink/rt3883.dtsi
similarity index 100%
rename from arch/mips/ralink/dts/rt3883.dtsi
rename to arch/mips/boot/dts/ralink/rt3883.dtsi
diff --git a/arch/mips/ralink/dts/rt3883_eval.dts b/arch/mips/boot/dts/ralink/rt3883_eval.dts
similarity index 100%
rename from arch/mips/ralink/dts/rt3883_eval.dts
rename to arch/mips/boot/dts/ralink/rt3883_eval.dts
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 4a29665..77e8a96 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -42,18 +42,22 @@ choice
 	config DTB_RT2880_EVAL
 		bool "RT2880 eval kit"
 		depends on SOC_RT288X
+		select BUILTIN_DTB
 
 	config DTB_RT305X_EVAL
 		bool "RT305x eval kit"
 		depends on SOC_RT305X
+		select BUILTIN_DTB
 
 	config DTB_RT3883_EVAL
 		bool "RT3883 eval kit"
 		depends on SOC_RT3883
+		select BUILTIN_DTB
 
 	config DTB_MT7620A_EVAL
 		bool "MT7620A eval kit"
 		depends on SOC_MT7620
+		select BUILTIN_DTB
 
 endchoice
 
diff --git a/arch/mips/ralink/Makefile b/arch/mips/ralink/Makefile
index 98ae349..2c09c8a 100644
--- a/arch/mips/ralink/Makefile
+++ b/arch/mips/ralink/Makefile
@@ -16,5 +16,3 @@ obj-$(CONFIG_SOC_RT3883) += rt3883.o
 obj-$(CONFIG_SOC_MT7620) += mt7620.o
 
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
-
-obj-y += dts/
diff --git a/arch/mips/ralink/dts/Makefile b/arch/mips/ralink/dts/Makefile
deleted file mode 100644
index 18194fa..0000000
--- a/arch/mips/ralink/dts/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-obj-$(CONFIG_DTB_RT2880_EVAL) := rt2880_eval.dtb.o
-obj-$(CONFIG_DTB_RT305X_EVAL) := rt3052_eval.dtb.o
-obj-$(CONFIG_DTB_RT3883_EVAL) := rt3883_eval.dtb.o
-obj-$(CONFIG_DTB_MT7620A_EVAL) := mt7620a_eval.dtb.o
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
