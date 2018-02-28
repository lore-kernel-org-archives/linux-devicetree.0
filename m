From: Rob Herring <robh@kernel.org>
Subject: [PATCH 6/6] scripts: turn off some new dtc warnings by default
Date: Wed, 28 Feb 2018 17:32:49 -0600
Message-ID: <20180228233249.26281-7-robh@kernel.org>
References: <20180228233249.26281-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The latest dtc update adds some new noisy warnings, so turn them off by
default. Disable 'avoid_unnecessary_addr_size' and 'alias_paths'. They
can be re-enabled by building with 'W=1'.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 10906c1d7715..dcc934319f92 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -277,6 +277,8 @@ DTC ?= $(objtree)/scripts/dtc/dtc
 ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-unit_address_format \
+	-Wno-avoid_unnecessary_addr_size \
+	-Wno-alias_paths \
 	-Wno-pci_device_reg
 endif
 
-- 
2.14.1
