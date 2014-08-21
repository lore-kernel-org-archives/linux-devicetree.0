From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/7] MIPS: Add support for building device-tree binaries
Date: Thu, 21 Aug 2014 13:04:21 -0700
Message-ID: <1408651466-8334-3-git-send-email-abrestic@chromium.org>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408651466-8334-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a 'dtbs' Makefile target that just builds the device-tree binaries
enabled by the configuration.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/mips/Makefile          | 5 +++++
 arch/mips/boot/.gitignore   | 1 +
 arch/mips/boot/dts/Makefile | 7 ++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 72cdd6a..26672e1 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -330,6 +330,10 @@ core-$(CONFIG_BUILTIN_DTB) += arch/mips/boot/dts/
 %.dtb %.dtb.S %.dtb.o: | scripts
 	$(Q)$(MAKE) $(build)=arch/mips/boot/dts arch/mips/boot/dts/$@
 
+PHONY += dtbs
+dtbs: scripts
+	$(Q)$(MAKE) $(build)=arch/mips/boot/dts dtbs
+
 archprepare:
 ifdef CONFIG_MIPS32_N32
 	@echo '  Checking missing-syscalls for N32'
@@ -364,6 +368,7 @@ define archhelp
 	echo '  vmlinuz.srec         - SREC zboot image'
 	echo '  uImage               - U-Boot image'
 	echo '  uImage.gz            - U-Boot image (gzip)'
+	echo '  dtbs                 - Device-tree blobs for enabled boards'
 	echo
 	echo '  These will be default as appropriate for a configured platform.'
 endef
diff --git a/arch/mips/boot/.gitignore b/arch/mips/boot/.gitignore
index a73d6e2..d3962cd 100644
--- a/arch/mips/boot/.gitignore
+++ b/arch/mips/boot/.gitignore
@@ -5,3 +5,4 @@ zImage
 zImage.tmp
 calc_vmlinuz_load_addr
 uImage
+*.dtb
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 6bb41df..9b3da1f 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,3 +1,8 @@
 obj-y		+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
-clean-files	+= *.dtb.S
+targets		+= dtbs
+targets		+= $(dtb-y)
+
+dtbs: $(addprefix $(obj)/, $(dtb-y))
+
+clean-files	+= *.dtb *.dtb.S
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
