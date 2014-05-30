From: Luis Henriques <luis.henriques-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [3.11.y.z extended stable] Patch "mips: dts: Fix missing device_type="memory" property in memory nodes" has been added to staging queue
Date: Fri, 30 May 2014 10:29:17 +0100
Message-ID: <1401442157-10237-1-git-send-email-luis.henriques@canonical.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Luis Henriques <luis.henriques-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, kernel-team-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a note to let you know that I have just added a patch titled

    mips: dts: Fix missing device_type="memory" property in memory nodes

to the linux-3.11.y-queue branch of the 3.11.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.11.y-queue

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.11.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Luis

------

>From 6aaecc0b281873a946fe1f4f3b0ebc8e01371a62 Mon Sep 17 00:00:00 2001
From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Thu, 17 Apr 2014 18:42:00 +0100
Subject: mips: dts: Fix missing device_type="memory" property in memory nodes

commit dfc44f8030653b345fc6fb337558c3a07536823f upstream.

A few platforms lack a 'device_type = "memory"' for their memory
nodes, relying on an old ppc quirk in order to discover its memory.
Add the missing data so that all parsing code can find memory nodes
correctly.

Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Luis Henriques <luis.henriques-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 arch/mips/lantiq/dts/easy50712.dts    | 1 +
 arch/mips/ralink/dts/mt7620a_eval.dts | 1 +
 arch/mips/ralink/dts/rt2880_eval.dts  | 1 +
 arch/mips/ralink/dts/rt3052_eval.dts  | 1 +
 arch/mips/ralink/dts/rt3883_eval.dts  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/mips/lantiq/dts/easy50712.dts b/arch/mips/lantiq/dts/easy50712.dts
index fac1f5b178eb..143b8a37b5e4 100644
--- a/arch/mips/lantiq/dts/easy50712.dts
+++ b/arch/mips/lantiq/dts/easy50712.dts
@@ -8,6 +8,7 @@
 	};

 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};

diff --git a/arch/mips/ralink/dts/mt7620a_eval.dts b/arch/mips/ralink/dts/mt7620a_eval.dts
index 35eb874ab7f1..709f58132f5c 100644
--- a/arch/mips/ralink/dts/mt7620a_eval.dts
+++ b/arch/mips/ralink/dts/mt7620a_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink MT7620A evaluation board";

 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};

diff --git a/arch/mips/ralink/dts/rt2880_eval.dts b/arch/mips/ralink/dts/rt2880_eval.dts
index 322d7002595b..0a685db093d4 100644
--- a/arch/mips/ralink/dts/rt2880_eval.dts
+++ b/arch/mips/ralink/dts/rt2880_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink RT2880 evaluation board";

 	memory@0 {
+		device_type = "memory";
 		reg = <0x8000000 0x2000000>;
 	};

diff --git a/arch/mips/ralink/dts/rt3052_eval.dts b/arch/mips/ralink/dts/rt3052_eval.dts
index 0ac73ea28198..ec9e9a035541 100644
--- a/arch/mips/ralink/dts/rt3052_eval.dts
+++ b/arch/mips/ralink/dts/rt3052_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink RT3052 evaluation board";

 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};

diff --git a/arch/mips/ralink/dts/rt3883_eval.dts b/arch/mips/ralink/dts/rt3883_eval.dts
index 2fa6b330bf4f..e8df21a5d10d 100644
--- a/arch/mips/ralink/dts/rt3883_eval.dts
+++ b/arch/mips/ralink/dts/rt3883_eval.dts
@@ -7,6 +7,7 @@
 	model = "Ralink RT3883 evaluation board";

 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
