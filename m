From: Rob Herring <robh@kernel.org>
Subject: [PATCH v4 7/9] powerpc: enable building all dtbs
Date: Mon,  1 Oct 2018 10:25:29 -0500
Message-ID: <20181001152531.3385-8-robh@kernel.org>
References: <20181001152531.3385-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001152531.3385-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Enable the 'dtbs' target for powerpc. This allows building all the dts
files in arch/powerpc/boot/dts/ when COMPILE_TEST and OF_ALL_DTBS are
enabled.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/boot/dts/Makefile     | 5 +++++
 arch/powerpc/boot/dts/fsl/Makefile | 4 ++++
 2 files changed, 9 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/Makefile

diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index f66554cd5c45..fb335d05aae8 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -1 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+
+subdir-y += fsl
+
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
new file mode 100644
index 000000000000..3bae982641e9
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
-- 
2.17.1
