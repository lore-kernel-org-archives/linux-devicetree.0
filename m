From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] powerpc: build dtb even without COMPILE_TEST
Date: Fri,  4 Jan 2019 09:58:17 +0000
Message-ID: <1546595897-33291-1-git-send-email-clabbe@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org, mark.rutland@arm.com, mpe@ellerman.id.au, paulus@samba.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

I wanted to test the virtex440-ml507 qemu machine and found that the dtb
for it was not builded.
All powerpc DTB are only built when CONFIG_OF_ALL_DTBS is set which depend on
COMPILE_TEST.
But building DTB is not related to a "compile build test".

So this patch made building of DTB independent of COMPILE_TEST (by
depending only on the PPC arch)
A better selection of which DTB to build could be done in the future
like that do the ARM arch.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/powerpc/boot/dts/Makefile     | 2 +-
 arch/powerpc/boot/dts/fsl/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index fb335d05aae8..3a73cf41585b 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -3,4 +3,4 @@
 subdir-y += fsl
 
 dtstree		:= $(srctree)/$(src)
-dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+dtb-$(CONFIG_PPC) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index 3bae982641e9..27c5ca3a35be 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 dtstree		:= $(srctree)/$(src)
-dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
+dtb-$(CONFIG_PPC) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
-- 
2.19.2
