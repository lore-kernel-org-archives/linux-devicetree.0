From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: [PATCH 3/4] ARM: zImage: make sure appended DTB doesn't get
	overwritten by kernel .bss
Date: Tue, 21 Jun 2011 01:09:14 -0400
Message-ID: <1308632955-11070-4-git-send-email-nico@fluxnic.net>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1308632955-11070-1-git-send-email-nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The appended DTB gets relocated with the decompressor code to get out
of the way of the decompressed kernel.  However the kernel's .bss section
may be larger than the relocated code and data, and then the DTB gets
overwritten.  Let's make sure the relocation takes care of moving zImage
far enough so no such conflict with .bss occurs.

Thanks to Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> for figuring out this issue.

While at it, let's clean up the code a bit so that the wont_overwrite
symbol is used while determining if a conflict exists, making the above
change more precise as well as eliminating some ARM/THUMB alternates.

Signed-off-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/compressed/Makefile |    3 +++
 arch/arm/boot/compressed/head.S   |   19 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 23aad07..48bead9 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -98,6 +98,9 @@ endif
 ccflags-y := -fpic -fno-builtin
 asflags-y := -Wa,-march=all
 
+# Supply kernel BSS size to the decompressor via a linker symbol.
+KBSS_SZ = $(shell size $(obj)/../../../../vmlinux | awk 'END{print $$3}')
+LDFLAGS_vmlinux = --defsym _kernel_bss_size=$(KBSS_SZ)
 # Supply ZRELADDR to the decompressor via a linker symbol.
 ifneq ($(CONFIG_AUTO_ZRELADDR),y)
 LDFLAGS_vmlinux += --defsym zreladdr=$(ZRELADDR)
diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index b791b5e..d4f8db2 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -248,6 +248,18 @@ restart:	adr	r0, LC0
 
 		mov	r8, r6			@ use the appended device tree
 
+		/*
+		 * Make sure that the DTB doesn't end up in the final
+		 * kernel's .bss area. To do so, we adjust the decompressed
+		 * kernel size to compensate if that .bss size is larger
+		 * than the relocated code.
+		 */
+		ldr	r5, =_kernel_bss_size
+		adr	r1, wont_overwrite
+		sub	r1, r6, r1
+		subs	r1, r5, r1
+		addhi	r9, r9, r1
+
 		/* Get the dtb's size */
 		ldr	r5, [r6, #4]
 #ifndef __ARMEB__
@@ -276,15 +288,14 @@ dtb_check_done:
  *   r10 = end of this image, including  bss/stack/malloc space if non XIP
  * We basically want:
  *   r4 - 16k page directory >= r10 -> OK
- *   r4 + image length <= current position (pc) -> OK
+ *   r4 + image length <= address of wont_overwrite -> OK
  */
 		add	r10, r10, #16384
 		cmp	r4, r10
 		bhs	wont_overwrite
 		add	r10, r4, r9
-   ARM(		cmp	r10, pc		)
- THUMB(		mov	lr, pc		)
- THUMB(		cmp	r10, lr		)
+		adr	r9, wont_overwrite
+		cmp	r10, r9
 		bls	wont_overwrite
 
 /*
-- 
1.7.4
