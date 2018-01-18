From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix W= option checks for extra DTC warnings
Date: Thu, 18 Jan 2018 12:31:46 +0900
Message-ID: <1516246306-12851-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kbuild@vger.kernel.org
Cc: devicetree@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Kbuild supports 3 levels of extra warnings, and multiple levels can
be combined, like W=12, W=123.  It was added by commit a6de553da01c
("kbuild: Allow to combine multiple W= levels").

>From the log of commit 8654cb8d0371 ("dtc: update warning settings
for new bus and node/property name checks"), I assume:

 - unit_address_vs_reg, simple_bus_reg, etc. belong to level 1
 - node_name_chars_strict, property_name_chars_strict belong to level 2

However, the level 1 warnings are displayed by any argument to W=.
On the other hand, the level 2 warnings are displayed by W=2, but
not by W=12, or W=123.

Use $(findstring ...) like scripts/Makefile.extrawarn.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Side Notes for possible additional works:

 [1] I implemented DTC extra warnings differently in U-Boot:

    https://github.com/u-boot/u-boot/blob/v2018.01/scripts/Makefile.extrawarn#L64

    Better to collect extra warning stuff into scripts/Makefile.extrawarn ?

 [2] KBUILD_ENABLE_EXTRA_GCC_CHECKS is getting a historical misnomer
     because we use it for Clang and DTC too.

     Better to rename?  (keeping backward-compatibility for a while)?


 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1ca4dcd..7dee1da 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -264,7 +264,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -n -f -9 > $@) || \
 DTC ?= $(objtree)/scripts/dtc/dtc
 
 # Disable noisy checks by default
-ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
+ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-simple_bus_reg \
 	-Wno-unit_address_format \
@@ -273,7 +273,7 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-pci_device_reg
 endif
 
-ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),2)
+ifneq ($(findstring 2,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
 DTC_FLAGS += -Wnode_name_chars_strict \
 	-Wproperty_name_chars_strict
 endif
-- 
2.7.4
