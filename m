From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH RFC v3 2/4] MIPS: add support for vmlinuz.bin appended dtb
Date: Sun, 12 Apr 2015 12:24:59 +0200
Message-ID: <1428834301-12721-3-git-send-email-jogo@openwrt.org>
References: <1428834301-12721-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428834301-12721-1-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for detecting a vmlinuz.bin appended dtb and overriding
the boot arguments to match the UHI interface.

To ensure _edata / __apendend_dtb points to the actual end of the
binary, align the data section to 16 bytes instead of the address
cursor.

Due to ld.script not going through the preprocessor, we can't check
for MIPS_ZBOOT_APPENDED_DTB being enabled, so always reserve space
for it. It should have no consequences for booting without it enabled
except 1 MiB more ram usage during the uncompressing stage.

Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 arch/mips/Kconfig                   |   18 ++++++++++++++++++
 arch/mips/boot/compressed/head.S    |   16 ++++++++++++++++
 arch/mips/boot/compressed/ld.script |    6 +++++-
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0986619..8aef377 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2697,6 +2697,24 @@ choice
 		  look like a DTB header after a reboot if no actual DTB is appended
 		  to vmlinux.bin.  Do not leave this option active in a production kernel
 		  if you don't intend to always append a DTB.
+
+	config MIPS_ZBOOT_APPENDED_DTB
+		bool "vmlinuz.bin"
+		depends on SYS_SUPPORTS_ZBOOT
+		help
+		  With this option, the boot code will look for a device tree binary
+		  DTB) appended to raw vmlinuz.bin (with decompressor).
+		  (e.g. cat vmlinuz.bin <filename>.dtb > vmlinuz_w_dtb).
+
+		  This is meant as a backward compatibility convenience for those
+		  systems with a bootloader that can't be upgraded to accommodate
+		  the documented boot protocol using a device tree.
+
+		  Beware that there is very little in terms of protection against
+		  this option being confused by leftover garbage in memory that might
+		  look like a DTB header after a reboot if no actual DTB is appended
+		  to vmlinuz.bin.  Do not leave this option active in a production kernel
+		  if you don't intend to always append a DTB.
 endchoice
 
 endmenu
diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb48..c580e85 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -25,6 +25,22 @@ start:
 	move	s2, a2
 	move	s3, a3
 
+#ifdef CONFIG_MIPS_ZBOOT_APPENDED_DTB
+	PTR_LA	t0, __appended_dtb
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	li	t1, 0xd00dfeed
+#else
+	li	t1, 0xedfe0dd0
+#endif
+	lw	t2, (t0)
+	bne	t1, t2, not_found
+	 nop
+
+	move	s1, t0
+	PTR_LI	s0, -2
+not_found:
+#endif
+
 	/* Clear BSS */
 	PTR_LA	a0, _edata
 	PTR_LA	a2, _end
diff --git a/arch/mips/boot/compressed/ld.script b/arch/mips/boot/compressed/ld.script
index 5a33409..2ed08fb 100644
--- a/arch/mips/boot/compressed/ld.script
+++ b/arch/mips/boot/compressed/ld.script
@@ -29,8 +29,12 @@ SECTIONS
 		*(.image)
 		__image_end = .;
 		CONSTRUCTORS
+		. = ALIGN(16);
 	}
-	. = ALIGN(16);
+	__appended_dtb = .;
+	/* leave space for appended DTB */
+	. += 0x100000;
+
 	_edata = .;
 	/* End of data section */
 
-- 
1.7.10.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
