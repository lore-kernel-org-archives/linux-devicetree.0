From: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [3.8.y.z extended stable] Patch "MIPS: DTS: Fix missing device_type="memory" property in memory nodes" has been added to staging queue
Date: Mon, 21 Jul 2014 14:21:32 -0700
Message-ID: <1405977692-720-1-git-send-email-kamal@canonical.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, gaurav.minocha-cmaem7PIVQRC8prJL3GQQw@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, kernel-team-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a note to let you know that I have just added a patch titled

    MIPS: DTS: Fix missing device_type="memory" property in memory nodes

to the linux-3.8.y-queue branch of the 3.8.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.8.y-queue

This patch is scheduled to be released in version 3.8.13.27.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.8.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

------

>From 5dd6419bc23ec280abf9865f4bc99db44e353404 Mon Sep 17 00:00:00 2001
From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, 26 May 2014 14:42:49 +0100
Subject: MIPS: DTS: Fix missing device_type="memory" property in memory nodes

commit 1d530fa42a317deca1c4a4780d18e2dbf316e0cb upstream.

A few platforms lack a 'device_type = "memory"' for their memory
nodes, relying on an old ppc quirk in order to discover its memory.
Add the missing data so that all parsing code can find memory nodes
correctly.

Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: gaurav.minocha-cmaem7PIVQRC8prJL3GQQw@public.gmane.org
Patchwork: https://patchwork.linux-mips.org/patch/6989/
Signed-off-by: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
[ kamal: backport to 3.8-stable: only lantiq/dts/easy50712.dts ]
Signed-off-by: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 arch/mips/lantiq/dts/easy50712.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/lantiq/dts/easy50712.dts b/arch/mips/lantiq/dts/easy50712.dts
index 68c1731..de53a1b 100644
--- a/arch/mips/lantiq/dts/easy50712.dts
+++ b/arch/mips/lantiq/dts/easy50712.dts
@@ -8,6 +8,7 @@
 	};

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
