From: Frank Rowand <frowand.list@gmail.com>
Subject: [patch 4/7] dt: dtb version: kernel Makefile
Date: Wed, 18 Mar 2015 20:36:03 -0700
Message-ID: <550A4423.8040707@gmail.com>
References: <550A42AC.8060104@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <550A42AC.8060104@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.cz>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Leif Lindholm <leif.lindholm@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

Capture the initial value of .version_dtb so that when multiple .dtb files are
created in a single make the make scripts will be able to increment
.version_dtb only once instead of for each .dtb.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 Makefile                                     |    4 +

Index: b/Makefile
===================================================================
--- a/Makefile
+++ b/Makefile
@@ -416,6 +416,9 @@ KBUILD_LDFLAGS_MODULE := -T $(srctree)/s
 KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 
+VERSION_DTB_BASE := $(shell cat .version_dtb 2> /dev/null)
+
+export VERSION_DTB_BASE
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP
@@ -1181,6 +1184,7 @@ CLEAN_DIRS  += $(MODVERDIR)
 MRPROPER_DIRS  += include/config usr/include include/generated          \
 		  arch/*/include/generated .tmp_objdiff
 MRPROPER_FILES += .config .config.old .version .old_version \
+		  .version_dtb .version_dtb_flock \
 		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
 		  signing_key.priv signing_key.x509 x509.genkey		\
 		  extra_certificates signing_key.x509.keyid		\
