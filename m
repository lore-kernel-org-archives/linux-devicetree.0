From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/6] microblaze: remove the explicit removal of system.dtb
Date: Fri,  7 Dec 2018 20:33:57 +0900
Message-ID: <1544182437-26660-7-git-send-email-yamada.masahiro@socionext.com>
References: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I guess

    || (rm -f $@ && echo false)

... should be

    || (rm -f $@ && false)

In fact, no Makefile needs to delete a target explicitly on error.

It is automatically done since commit 9c2af1c7377a ("kbuild: add
.DELETE_ON_ERROR special target").

I also reused equivalent cmd_shipped from scripts/Makefile.lib.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 arch/microblaze/boot/dts/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/dts/Makefile
index c7324e7..ef00dd3 100644
--- a/arch/microblaze/boot/dts/Makefile
+++ b/arch/microblaze/boot/dts/Makefile
@@ -12,12 +12,9 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
 # Generate system.dtb from $(DTB).dtb
 ifneq ($(DTB),system)
 $(obj)/system.dtb: $(obj)/$(DTB).dtb
-	$(call if_changed,cp)
+	$(call if_changed,shipped)
 endif
 endif
 
-quiet_cmd_cp = CP      $< $@$2
-	cmd_cp = cat $< >$@$2 || (rm -f $@ && echo false)
-
 # Rule to build device tree blobs
 DTC_FLAGS := -p 1024
-- 
2.7.4
