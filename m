From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] nds32: remove unneeded clean-files for DTB
Date: Fri,  9 Aug 2019 02:30:28 +0900
Message-ID: <20190808173028.1930-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These patterns are cleaned-up by the top-level Makefile

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/nds32/boot/dts/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/nds32/boot/dts/Makefile b/arch/nds32/boot/dts/Makefile
index fff8ade7a84f..f84bd529b6fd 100644
--- a/arch/nds32/boot/dts/Makefile
+++ b/arch/nds32/boot/dts/Makefile
@@ -5,5 +5,3 @@ else
 BUILTIN_DTB :=
 endif
 obj-$(CONFIG_OF) += $(BUILTIN_DTB)
-
-clean-files := *.dtb *.dtb.S
-- 
2.17.1
