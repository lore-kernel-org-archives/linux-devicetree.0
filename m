From: Rob Herring <robh@kernel.org>
Subject: [PATCH v4 4/9] nios2: fix building all dtbs
Date: Mon,  1 Oct 2018 10:25:26 -0500
Message-ID: <20181001152531.3385-5-robh@kernel.org>
References: <20181001152531.3385-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001152531.3385-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

nios2 has a 'dtbs' target, but nothing is added to 'dtb-*' targets and
no dtbs were getting built. This enables building all the dts files in
arch/nios2/boot/dts/ when COMPILE_TEST and OF_ALL_DTBS are enabled.

Cc: Ley Foon Tan <lftan@altera.com>
Cc: nios2-dev@lists.rocketboards.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/nios2/boot/dts/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
index f6358e395b25..a91a0b09be63 100644
--- a/arch/nios2/boot/dts/Makefile
+++ b/arch/nios2/boot/dts/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y := $(patsubst "%.dts",%.dtb.o,$(CONFIG_NIOS2_DTB_SOURCE))
+
+dtstree		:= $(srctree)/$(src)
+dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
-- 
2.17.1
