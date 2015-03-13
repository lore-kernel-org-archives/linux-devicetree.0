From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 2/5] MIPS: Allow platforms to specify the decompressor load address
Date: Fri, 13 Mar 2015 15:54:06 -0700
Message-ID: <1426287249-27185-3-git-send-email-abrestic@chromium.org>
References: <1426287249-27185-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1426287249-27185-1-git-send-email-abrestic@chromium.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

Platforms which use raw zboot images may need to link the image at
a fixed address if there is no other way to communicate the load
address to the bootloader.  Allow the per-platform Kbuild files
to specify an optional zboot image load address (zload-y) and fall
back to calc_vmlinuz_load_addr if unset.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
No changes from v1.
---
 arch/mips/boot/compressed/Makefile | 6 ++++--
 arch/mips/jz4740/Platform          | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 61af6b6..82d0b13 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -12,6 +12,8 @@
 # Author: Wu Zhangjin <wuzhangjin@gmail.com>
 #
 
+include $(srctree)/arch/mips/Kbuild.platforms
+
 # set the default size of the mallocing area for decompressing
 BOOT_HEAP_SIZE := 0x400000
 
@@ -66,8 +68,8 @@ $(obj)/piggy.o: $(obj)/dummy.o $(obj)/vmlinux.bin.z FORCE
 # Calculate the load address of the compressed kernel image
 hostprogs-y := calc_vmlinuz_load_addr
 
-ifeq ($(CONFIG_MACH_JZ4740),y)
-VMLINUZ_LOAD_ADDRESS := 0x80600000
+ifneq ($(zload-y),)
+VMLINUZ_LOAD_ADDRESS := $(zload-y)
 else
 VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
 		$(obj)/vmlinux.bin $(VMLINUX_LOAD_ADDRESS))
diff --git a/arch/mips/jz4740/Platform b/arch/mips/jz4740/Platform
index ba91be9..c41d300 100644
--- a/arch/mips/jz4740/Platform
+++ b/arch/mips/jz4740/Platform
@@ -1,3 +1,4 @@
 platform-$(CONFIG_MACH_JZ4740)	+= jz4740/
 cflags-$(CONFIG_MACH_JZ4740)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
 load-$(CONFIG_MACH_JZ4740)	+= 0xffffffff80010000
+zload-$(CONFIG_MACH_JZ4740)	+= 0xffffffff80600000
-- 
2.2.0.rc0.207.ga3a616c
