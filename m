From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: bootloader support for DTB on x86
Date: Tue, 22 May 2012 21:51:07 +0200
Message-ID: <20120522195107.GA17501@linutronix.de>
References: <20120522125622.GA21187@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522125622.GA21187-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Thierry Reding | 2012-05-22 14:56:22 [+0200]:

>Hi,
Hi,

>I was looking at booting an x86-based platform using DT. However I wasn't
>able to find a bootloader that supports this. There also doesn't seem to b=
e a
>method to append the DTB to the zImage (which I wouldn't want to use anywa=
y).
>Does anybody know of a bootloader that supports this?

None that I am aware of.

>I'm currently using syslinux (specifically extlinux) and was looking at
>perhaps adding the support myself based on the information given in
>Documentation/x86/boot.txt. However I'm not overly familiar with syslinux
>code and this could prove more difficult than I anticipate.

It should not be that difficult. =

- Look how the initrd is loaded. Use the same technique to load the dtb =

  blob. =


- Allocate another memory block for setup_data. You need one entry of =

  type SETUP_DTB pointing to the dtb. If I remember correctly, the =

  setup_data is thrown away by kernel and the dtb blob itself is  =

  relocated to some place safe.

- You may need to set hardware_subarch to some similar to =

  X86_SUBARCH_CE4100. I mean you *may* need your own subarch value but =

  you can most likely reuse most of the functions that ce4100 is using. =

  The PCI bus and UART is broken is a special way, everything else is
  generic. Since we don't have ACPI/SFI,=E2=80=A6 we need something to find
  HPET, IO-APIC, irq routing,=E2=80=A6

>The only x86 platforms that use DT seem to be OLPC and CE4100 and according
>to the web the OLPC has a complete OF implementation. Does anyone know whi=
ch
>bootloader the CE4100 uses?

It jumps in the end to redboot which then loads the kernel. In the early
days I had this patch make to sure the setup_data thingy works. So with
this it should be easy to add the support to redboot/grub/isolinux/=E2=80=
=A6

From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: [PATCH ] x86/dtb: add bzImage support

this adds two new targets:
- arch/x86/boot/$dt.dtb
  a convience target which just calls dtc on the $dtb which lives in
  arch/x86/boot/dts/$dt.dts

- bzImage.$dt
  embeds the device tree in the bzImage loader. The dtb will be
  passed to the kernel via setup_data if there is no dtb included.
  The memory location of the dtb will be before the initrd if one is
  available. If not it will placed at "memory size" or 128MiB depends
  which one is less. The upper limit is used a guess to ensure that it
  remains in lowmem. On a system with 1GiB the lowmem is around ~880MiB.
  The exact value depends on a few CONFIG_ swithes and is determined at
  run time. It can be additionaly increased or decreased via kernel
  parameters like memmap or vmalloc. So instead of parsing every piece
  of information we assume that nobody runs a kernel with only the first
  100MiB mapped.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 arch/x86/Makefile                      |    6 +++
 arch/x86/boot/Makefile                 |   29 ++++++++++++++--
 arch/x86/boot/compressed/Makefile      |   25 ++++++++++++--
 arch/x86/boot/compressed/misc.c        |   60 ++++++++++++++++++++++++++++=
+++-
 arch/x86/boot/compressed/vmlinux.lds.S |    7 ++++
 5 files changed, 120 insertions(+), 7 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index e8c8881..50dffd8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -161,6 +161,9 @@ endif
 	$(Q)mkdir -p $(objtree)/arch/$(UTS_MACHINE)/boot
 	$(Q)ln -fsn ../../x86/boot/bzImage $(objtree)/arch/$(UTS_MACHINE)/boot/$@
 =

+bzImage.%: vmlinux
+	$(Q)$(MAKE) $(build)=3D$(boot) $(boot)/$@
+
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=3D$(boot) $@
 =

@@ -177,6 +180,9 @@ archclean:
 	$(Q)rm -rf $(objtree)/arch/x86_64
 	$(Q)$(MAKE) $(clean)=3D$(boot)
 =

+%.dtb:
+	$(Q)$(MAKE) $(build)=3D$(boot) $@
+
 define archhelp
   echo  '* bzImage      - Compressed kernel image (arch/x86/boot/bzImage)'
   echo  '  install      - Install kernel using'
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index f7cb086..a7651f2 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -72,20 +72,30 @@ KBUILD_CFLAGS	+=3D $(call cc-option, -m32)
 KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
 GCOV_PROFILE :=3D n
 =

-$(obj)/bzImage: asflags-y  :=3D $(SVGA_MODE)
+$(obj)/bzImage $(obj)/bzImage.%: asflags-y  :=3D $(SVGA_MODE)
 =

 quiet_cmd_image =3D BUILD   $@
-cmd_image =3D $(obj)/tools/build $(obj)/setup.bin $(obj)/vmlinux.bin \
+cmd_image =3D $(obj)/tools/build $(obj)/setup.bin $2 \
 	$(ROOT_DEV) > $@
 =

 $(obj)/bzImage: $(obj)/setup.bin $(obj)/vmlinux.bin $(obj)/tools/build FOR=
CE
-	$(call if_changed,image)
+	$(call if_changed,image, $(obj)/vmlinux.bin)
+	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
+
+$(obj)/bzImage.%: $(obj)/setup.bin $(obj)/vmlinux.bin.% $(obj)/tools/build=
 FORCE
+	$(call if_changed,image,$(obj)/vmlinux.bin.$*)
 	@echo 'Kernel: $@ is ready' ' (#'`cat .version`')'
 =

 OBJCOPYFLAGS_vmlinux.bin :=3D -O binary -R .note -R .comment -S
 $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
 	$(call if_changed,objcopy)
 =

+quiet_cmd_objcopybin =3D OBJCOPY $@
+      cmd_objcopybin =3D $(OBJCOPY) $(OBJCOPYFLAGS) -O binary -R .note -R =
.comment -S $< $@
+
+$(obj)/vmlinux.bin.%: $(obj)/compressed/vmlinux.dtb.% FORCE
+	$(call if_changed,objcopybin)
+
 SETUP_OBJS =3D $(addprefix $(obj)/,$(setup-y))
 =

 sed-voffset :=3D -e 's/^\([0-9a-fA-F]*\) . \(_text\|_end\)$$/\#define VO_\=
2 0x\1/p'
@@ -121,6 +131,19 @@ $(obj)/setup.bin: $(obj)/setup.elf FORCE
 $(obj)/compressed/vmlinux: FORCE
 	$(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
 =

+$(obj)/compressed/vmlinux.dtb.%: FORCE
+	$(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
+
+dtstree		:=3D $(srctree)/$(src)/dts
+DTC =3D $(objtree)/scripts/dtc/dtc
+
+quiet_cmd_dtc =3D DTC	$@
+	cmd_dtc =3D $(DTC) -O dtb -o $(obj)/$*.dtb -b 0 -p 1024 $(dtstree)/$*.dts
+
+# Rule to build device tree blobs
+$(obj)/%.dtb: $(dtstree)/%.dts FORCE
+	$(call if_changed,dtc)
+
 # Set this if you want to pass append arguments to the
 # bzdisk/fdimage/isoimage kernel
 FDARGS =3D
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/M=
akefile
index 0c22955..4137939 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -18,15 +18,34 @@ KBUILD_CFLAGS +=3D $(call cc-option,-fno-stack-protecto=
r)
 KBUILD_AFLAGS  :=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
 GCOV_PROFILE :=3D n
 =

-LDFLAGS :=3D -m elf_$(UTS_MACHINE)
-LDFLAGS_vmlinux :=3D -T
+LDFLAGS :=3D -m elf_$(UTS_MACHINE) -T
 =

 hostprogs-y	:=3D mkpiggy
 =

-$(obj)/vmlinux: $(obj)/vmlinux.lds $(obj)/head_$(BITS).o $(obj)/misc.o $(o=
bj)/string.o $(obj)/cmdline.o $(obj)/early_serial_console.o $(obj)/piggy.o =
FORCE
+VMLINUX_DEP	:=3D $(obj)/vmlinux.lds $(obj)/head_$(BITS).o $(obj)/misc.o $(=
obj)/string.o $(obj)/cmdline.o $(obj)/early_serial_console.o $(obj)/piggy.o
+
+$(obj)/vmlinux: $(VMLINUX_DEP) FORCE
+	$(call if_changed,ld)
+	@:
+
+dtstree		:=3D $(srctree)/arch/x86/boot/dts
+DTC =3D $(objtree)/scripts/dtc/dtc
+
+quiet_cmd_dtc =3D DTC	$@
+      cmd_dtc =3D $(DTC) -O dtb -o $(obj)/$*.dtb -b 0 -p 1024 $(dtstree)/$=
*.dts
+
+$(obj)/%.dtb: $(dtstree)/%.dts
+	$(call if_changed,dtc)
+
+$(obj)/%.dtb.S: $(obj)/%.dtb
+	@echo '.section .data..dtb,"a"' > $@
+	@echo '.incbin "$<" ' >> $@
+
+$(obj)/vmlinux.dtb.%: $(VMLINUX_DEP) $(obj)/%.dtb.o FORCE
 	$(call if_changed,ld)
 	@:
 =

+targets +=3D vmlinux.dtb.%
 OBJCOPYFLAGS_vmlinux.bin :=3D  -R .comment -S
 $(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/mis=
c.c
index 8f7bef8..ebd6901 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -101,7 +101,8 @@
 #undef memcpy
 #define memzero(s, n)	memset((s), 0, (n))
 =

-
+extern char _dtb_end[];
+extern char _dtb_start[];
 static void error(char *m);
 =

 /*
@@ -302,6 +303,40 @@ static void parse_elf(void *output)
 	}
 }
 =

+static u64 attach_initdata(u64 old_sd, void *dest, void *data, unsigned in=
t len,
+		unsigned int type)
+{
+	struct setup_data *sd =3D dest;
+
+	sd->next =3D old_sd;
+	sd->type =3D type;
+	sd->len =3D len;
+	memcpy(&sd->data[0], data, len);
+	return (u64) (u32) sd;
+}
+
+static u64 attach_dtb(u64 old_sd, void *dest, void *data, unsigned int len)
+{
+	return attach_initdata(old_sd, dest, data, len, SETUP_DTB);
+}
+
+static int dtb_passed(u64 setup_data)
+{
+	int ret =3D 0;
+
+	while (setup_data) {
+		struct setup_data *sdata;
+
+		sdata =3D (void *)(u32)setup_data;
+		if (sdata->type =3D=3D SETUP_DTB) {
+			ret =3D 1;
+			break;
+		}
+		setup_data =3D sdata->next;
+	}
+	return ret;
+}
+
 asmlinkage void decompress_kernel(void *rmode, memptr heap,
 				  unsigned char *input_data,
 				  unsigned long input_len,
@@ -350,6 +385,29 @@ asmlinkage void decompress_kernel(void *rmode, memptr =
heap,
 		putstr("\nDecompressing Linux... ");
 	decompress(input_data, input_len, NULL, NULL, output, NULL, error);
 	parse_elf(output);
+	if (_dtb_end > _dtb_start && !dtb_passed(real_mode->hdr.setup_data)) {
+		u32 k_dtb;
+
+		if (real_mode->hdr.ramdisk_image)
+			k_dtb =3D real_mode->hdr.ramdisk_image;
+		else {
+			k_dtb =3D real_mode->alt_mem_k;
+			k_dtb++;
+			k_dtb *=3D 1024;
+		}
+		if (k_dtb > 128 * 1024 * 1024)
+			k_dtb =3D 128 * 1024 * 1024;
+		k_dtb -=3D (_dtb_end -  _dtb_start);
+		if (!IS_ALIGNED(k_dtb, 4096)) {
+			/* align down */
+			k_dtb =3D ALIGN(k_dtb, 4096);
+			k_dtb -=3D 4096;
+		}
+		real_mode->hdr.setup_data =3D
+			attach_dtb(real_mode->hdr.setup_data, (void *)k_dtb,
+					_dtb_start, _dtb_end - _dtb_start);
+	}
+
 	if (!quiet)
 		putstr("done.\nBooting the kernel.\n");
 	return;
diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compres=
sed/vmlinux.lds.S
index 34d047c..a4924f9 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -41,6 +41,13 @@ SECTIONS
 		*(.rodata.*)
 		_erodata =3D . ;
 	}
+
+	_dtb_start =3D .;
+	.data..dtb : {
+		*(.data..dtb)
+	}
+	_dtb_end =3D . ;
+
 	.got : {
 		_got =3D .;
 		KEEP(*(.got.plt))
-- =

1.7.2.3

>Thierry

Sebastian
