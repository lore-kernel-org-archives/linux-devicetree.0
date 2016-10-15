From: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] x86: bzImage: Allow the appending of a device tree binary
Date: Sat, 15 Oct 2016 08:29:20 +0200
Message-ID: <1476512960-22406-1-git-send-email-franck.jullien@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch provides the ability to boot using a device tree that is appended
to the raw binary bzImage (e.g. cat bzImage <filename>.dtb > bzImage_w_dtb).

Based on Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> work on x86
builtin dtb support.

Signed-off-by: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/x86/Kconfig                   | 19 ++++++++++++
 arch/x86/boot/compressed/head_32.S | 61 ++++++++++++++++++++++++++++++++++++++
 arch/x86/boot/compressed/head_64.S | 53 +++++++++++++++++++++++++++++++++
 arch/x86/boot/compressed/misc.c    | 40 +++++++++++++++++++++++++
 4 files changed, 173 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bada636..722d846 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2222,6 +2222,25 @@ config MODIFY_LDT_SYSCALL
 
 	  Saying 'N' here may make sense for embedded or server kernels.
 
+config X86_APPENDED_DTB
+	bool "Use appended device tree blob to bzImage"
+	depends on OF
+	select OF_EARLY_FLATTREE
+	help
+	  With this option, the boot code will look for a device tree binary
+	  (DTB) appended to bzImage
+	  (e.g. cat bzImage <filename>.dtb > bzImage_w_dtb).
+
+	  This is meant as a backward compatibility convenience for those
+	  systems with a bootloader that can't be upgraded to accommodate
+	  the documented boot protocol using a device tree.
+
+	  Beware that there is very little in terms of protection against
+	  this option being confused by leftover garbage in memory that might
+	  look like a DTB header after a reboot if no actual DTB is appended
+	  to bzImage.  Do not leave this option active in a production kernel
+	  if you don't intend to always append a DTB.
+
 source "kernel/livepatch/Kconfig"
 
 endmenu
diff --git a/arch/x86/boot/compressed/head_32.S b/arch/x86/boot/compressed/head_32.S
index fd0b6a2..e28a586 100644
--- a/arch/x86/boot/compressed/head_32.S
+++ b/arch/x86/boot/compressed/head_32.S
@@ -201,6 +201,40 @@ preferred_addr:
 	cld
 	popl	%esi
 
+#if CONFIG_X86_APPENDED_DTB
+/*
+ * Check if an appended device tree blob is present.
+ */
+
+	movl	$0, dtb_sz(%ebp)
+
+	movl	$(_edata - startup_32), %ecx
+	leal	startup_32(%ebp), %edx
+
+	/* Calculate the appended DTB address. We need to add 4 bytes for
+	 * CRC and padding to the next 16-byte paragraph (see ../tools/build.c)
+	 */
+	addl	$19, %ecx
+	andl	$0xfffffff0, %ecx
+	addl	%edx, %ecx
+
+	movl	(%ecx), %eax
+
+	/* DTB sig is 0xd00dfeed big endian */
+	movl	$0xedfe0dd0, %edx
+
+	cmpl	%eax, %edx
+	jne	2f
+
+	/* Get DTB size */
+	movl	4(%ecx), %edx
+	bswap	%edx
+
+	movl	%edx, dtb_sz(%ebp)
+	movl	%ecx, dtb_address(%ebp)
+2:
+#endif
+
 /*
  * Jump to the relocated address.
  */
@@ -234,6 +268,7 @@ relocated:
 	jmp	1b
 2:
 
+	pushl	%ebp
 /*
  * Do the extraction, and jump to the new kernel..
  */
@@ -255,12 +290,38 @@ relocated:
 	call	extract_kernel	/* returns kernel location in %eax */
 	addl	$24, %esp
 
+
+	popl	%ebp
+
+#if CONFIG_X86_APPENDED_DTB
+	pushl	%eax
+
+	movl	dtb_sz(%ebp), %edi		/* dtb size */
+	cmpl	$0, %edi
+	je	1f
+	movl	dtb_address(%ebp), %eax		/* dtb start */
+
+	pushl	%edi				/* dtb_size */
+	pushl	%eax				/* dtb_start */
+	pushl	%esi				/* real mode pointer */
+	call	relocate_dtb
+	addl	$12,%esp
+1:
+	popl	%eax
+#endif
+
 /*
  * Jump to the extracted kernel.
  */
 	xorl	%ebx, %ebx
 	jmp	*%eax
 
+	.data
+dtb_address:
+	.long 0
+dtb_sz:
+	.long 0
+
 #ifdef CONFIG_EFI_STUB
 	.data
 efi32_config:
diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index efdfba2..3ad2086 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -365,6 +365,45 @@ preferred_addr:
 	cld
 	popq	%rsi
 
+#ifdef CONFIG_X86_APPENDED_DTB
+/*
+ * Check if an appended device tree blob is present.
+ * r13 = appended dtb size (0 if not present)
+ * r12 = address of the appended dtb
+ */
+	pushq	%rax
+	pushq	%rdx
+
+	xorq	%r13, %r13
+
+	movq	$(_edata - startup_32), %rcx
+	leaq	startup_32(%rip), %rdx
+
+	/* Calculate the appended DTB address. We need to add 4 bytes for
+	 * CRC and padding to the next 16-byte paragraph (see ../tools/build.c)
+	 */
+	addq	$19, %rcx
+	andq	$0xfffffffffffffff0, %rcx
+	addq	%rdx, %rcx
+	movq	%rcx, %r12
+
+	movq	(%rcx), %rax
+
+	/* DTB sig is 0xd00dfeed big endian */
+	movl	$0xedfe0dd0, %edx
+
+	cmpl	%eax, %edx
+	jne	1f
+
+	/* Get DTB size */
+	movl	4(%rcx), %edx
+	bswap	%edx
+	movq	%rdx, %r13
+1:
+	popq	%rdx
+	popq	%rax
+#endif
+
 /*
  * Jump to the relocated address.
  */
@@ -424,6 +463,20 @@ relocated:
 	call	extract_kernel		/* returns kernel location in %rax */
 	popq	%rsi
 
+#ifdef CONFIG_X86_APPENDED_DTB
+	cmpq	$0,%r13
+	je	2f
+	pushq	%rsi
+	pushq	%rax			/* save address */
+	movq	%rsi, %rdi		/* real mode address */
+	movq	%r12, %rsi		/* dtb start */
+	movq	%r13, %rdx		/* dtb size */
+	call	relocate_dtb
+	popq	%rax
+	popq	%rsi
+2:
+#endif
+
 /*
  * Jump to the decompressed kernel.
  */
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index b3c5a5f0..1b66a74 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -409,3 +409,43 @@ asmlinkage __visible void *extract_kernel(void *rmode, memptr heap,
 	debug_putstr("done.\nBooting the kernel.\n");
 	return output;
 }
+
+#ifdef CONFIG_X86_APPENDED_DTB
+asmlinkage __visible void relocate_dtb(void *rmode,
+			unsigned char *dtb_data,
+			unsigned long dtb_size)
+{
+
+	struct boot_params *boot_params = rmode;
+	struct setup_data *data;
+	u32 pa_data, pa_next;
+	u32 data_len, data_type;
+
+	/* first iterate over the setup data to find a DTB if it exists */
+	pa_data = boot_params->hdr.setup_data;
+	while (pa_data) {
+		data = (void *)(unsigned long)pa_data;
+		data_len = data->len + sizeof(struct setup_data);
+		data_type = data->type;
+		pa_next = data->next;
+
+		if (data_type == SETUP_DTB) {
+			debug_putstr("Using bootloader DTB\n");
+			return;
+		}
+
+		pa_data = pa_next;
+	}
+
+	/* insert the DTB in the beginning */
+	data = malloc(sizeof(*data) + dtb_size);
+	data->type = SETUP_DTB;
+	data->next = boot_params->hdr.setup_data;
+	data->len = dtb_size;
+	memcpy(&data->data[0], dtb_data, dtb_size);
+	boot_params->hdr.setup_data = (uintptr_t)data;
+
+	debug_putstr("Using appended DTB\n");
+
+}
+#endif
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
