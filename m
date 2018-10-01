From: Rob Herring <robh@kernel.org>
Subject: [PATCH v4 5/9] c6x: use common built-in dtb support
Date: Mon,  1 Oct 2018 10:25:27 -0500
Message-ID: <20181001152531.3385-6-robh@kernel.org>
References: <20181001152531.3385-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001152531.3385-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>
Cc: Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-c6x-dev@linux-c6x.org
List-Id: devicetree@vger.kernel.org

Using the common build support for built-in dtb files just requires
adding a .dtb.o target to obj-y.

The dtb now needs to be copied when unflattened because an init section
is used now.

Cc: Mark Salter <msalter@redhat.com>
Cc: Aurelien Jacquiot <jacquiot.aurelien@gmail.com>
Cc: linux-c6x-dev@linux-c6x.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/c6x/boot/dts/Makefile      | 11 +----------
 arch/c6x/boot/dts/linked_dtb.S  |  2 --
 arch/c6x/include/asm/sections.h |  1 -
 arch/c6x/kernel/setup.c         |  4 ++--
 arch/c6x/kernel/vmlinux.lds.S   | 10 ----------
 5 files changed, 3 insertions(+), 25 deletions(-)
 delete mode 100644 arch/c6x/boot/dts/linked_dtb.S

diff --git a/arch/c6x/boot/dts/Makefile b/arch/c6x/boot/dts/Makefile
index b212d278ebc4..fd937f781d16 100644
--- a/arch/c6x/boot/dts/Makefile
+++ b/arch/c6x/boot/dts/Makefile
@@ -6,14 +6,5 @@
 DTC_FLAGS ?= -p 1024
 
 ifneq ($(DTB),)
-obj-y += linked_dtb.o
+obj-y += $(DTB).dtb.o
 endif
-
-quiet_cmd_cp = CP      $< $@$2
-	cmd_cp = cat $< >$@$2 || (rm -f $@ && echo false)
-
-# Generate builtin.dtb from $(DTB).dtb
-$(obj)/builtin.dtb: $(obj)/$(DTB).dtb
-	$(call if_changed,cp)
-
-$(obj)/linked_dtb.o: $(obj)/builtin.dtb
diff --git a/arch/c6x/boot/dts/linked_dtb.S b/arch/c6x/boot/dts/linked_dtb.S
deleted file mode 100644
index cf347f1d16ce..000000000000
--- a/arch/c6x/boot/dts/linked_dtb.S
+++ /dev/null
@@ -1,2 +0,0 @@
-.section __fdt_blob,"a"
-.incbin "arch/c6x/boot/dts/builtin.dtb"
diff --git a/arch/c6x/include/asm/sections.h b/arch/c6x/include/asm/sections.h
index d6c591ab5b7e..dc2f15eb3bde 100644
--- a/arch/c6x/include/asm/sections.h
+++ b/arch/c6x/include/asm/sections.h
@@ -8,6 +8,5 @@ extern char _vectors_start[];
 extern char _vectors_end[];
 
 extern char _data_lma[];
-extern char _fdt_start[], _fdt_end[];
 
 #endif /* _ASM_C6X_SECTIONS_H */
diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c
index 786e36e2f61d..509c5f086496 100644
--- a/arch/c6x/kernel/setup.c
+++ b/arch/c6x/kernel/setup.c
@@ -270,7 +270,7 @@ int __init c6x_add_memory(phys_addr_t start, unsigned long size)
 notrace void __init machine_init(unsigned long dt_ptr)
 {
 	void *dtb = __va(dt_ptr);
-	void *fdt = _fdt_start;
+	void *fdt = __dtb_start;
 
 	/* interrupts must be masked */
 	set_creg(IER, 2);
@@ -363,7 +363,7 @@ void __init setup_arch(char **cmdline_p)
 					 memory_end >> PAGE_SHIFT);
 	memblock_reserve(memory_start, bootmap_size);
 
-	unflatten_device_tree();
+	unflatten_and_copy_device_tree();
 
 	c6x_cache_init();
 
diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index 1fba5b421eee..584bab2bace6 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -90,16 +90,6 @@ SECTIONS
 		*(.switch)
 	}
 
-	. = ALIGN (8) ;
-	__fdt_blob : AT(ADDR(__fdt_blob) - LOAD_OFFSET)
-	{
-		_fdt_start = . ;	/* place for fdt blob */
-		*(__fdt_blob) ;		/* Any link-placed DTB */
-		BYTE(0);		/* section always has contents */
-	        . = _fdt_start + 0x4000;	/* Pad up to 16kbyte */
-		_fdt_end = . ;
-	}
-
 	_etext = .;
 
 	/*
-- 
2.17.1
