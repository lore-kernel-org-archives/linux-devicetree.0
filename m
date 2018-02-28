From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/6] scripts: re-enable some now fixed dtc warnings
Date: Wed, 28 Feb 2018 17:32:46 -0600
Message-ID: <20180228233249.26281-4-robh@kernel.org>
References: <20180228233249.26281-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We can re-enable some dtc warnings that have been completely or mostly
fixed. There are a few remaining ones in arm64 dts files which crept in
recently.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 6aeb91524c76..10906c1d7715 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -276,10 +276,7 @@ DTC ?= $(objtree)/scripts/dtc/dtc
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
-	-Wno-simple_bus_reg \
 	-Wno-unit_address_format \
-	-Wno-pci_bridge \
-	-Wno-pci_device_bus_num \
 	-Wno-pci_device_reg
 endif
 
-- 
2.14.1
