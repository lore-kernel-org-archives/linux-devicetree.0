From: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patches] [PATCH] RISC-V: Support built-in dtb
Date: Thu, 21 Dec 2017 12:32:59 -0800 (PST)
Message-ID: <mhng-149d8a09-420d-4edc-ab13-cb6239193fc0@palmer-si-x1c4>
References: <1513761271-2386-1-git-send-email-zongbox@gmail.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513761271-2386-1-git-send-email-zongbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: albert-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Wesley Terpstra <wesley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zong-MUIXKm3Oiri1Z/+hSey0Gg@public.gmane.org, zongbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Dec 2017 01:14:31 PST (-0800), zongbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> Build the dtb into the kernel image.
> If the DTB is given via bootloader, the external DTB is adopted first.
>
> Signed-off-by: Zong Li <zongbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/riscv/Kconfig           |  4 ++++
>  arch/riscv/Makefile          |  9 +++++++++
>  arch/riscv/boot/Makefile     | 17 +++++++++++++++++
>  arch/riscv/boot/dts/Makefile | 11 +++++++++++
>  arch/riscv/kernel/setup.c    |  2 +-
>  5 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/Makefile
>  create mode 100644 arch/riscv/boot/dts/Makefile
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 2e15e85..831cbb9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -189,6 +189,10 @@ config RISCV_ISA_C
>  config RISCV_ISA_A
>  	def_bool y
>
> +config RISCV_BUILTIN_DTB
> +        string "Builtin DTB"
> +        default ""
> +
>  endmenu

It looks like most other architectures handle this via something like

    config RISCV_BUILTIN_DTB
            bool "Embed DTB in kernel image"
            select BUILTIN_DTB
            help
              Embeds a device tree binary in the kernel image.  The 
              bootloader's device tree will override the kernel's if the 
              bootloader provides a device tree.
    
    config RISCV_BUILTIN_DTB_NAME
            string "Built in DTB"
            depends on RISCV_BUILTIN_DTB
            help
              Set the name of the DTB to embed (leave blank to pick one
              automatically based on kernel configuration).

which matches what Linux does for other things (CMDLINE_BOOL/CMDLINE and 
BLK_DEV_INITRD/INITRAMFS_SOURCE are the two I can think of).  I don't see any 
reason to be different here.

Additionally: I'm not sure I like the idea of having a bultin DTB.  We're using 
device tree to ensure the kernel is portable between different RISC-V systems, 
and building one into the kernel seems to defeat that purpose.  Since even BBL 
can provide a device tree to Linux I don't think there's any reason to build 
one in -- hopefully real systems will use a proper bootloader, and that will 
have support for device trees as well.

I've added Arnd and Olof, in case they have a bit more perspective here.  If 
I'm reading this correctly, there isn't an arm or arm64 option to do this.  
There is an option to built in many DTBs, which makes a lot more sense to me as 
it doesn't tie the kernel to any one particular implementation.  We'd need a 
mechanism for picking the DTB that Linux should use.  We've kicked around the 
idea of:

* Having the bootloader always provide a DTB.
* Taking a hash of that DTB when booting Linux.
* Using that hash to look up DTBs that are built in to Linux.

This would allow us to support replacing broken DTBs if they escape into the 
wild, but would still allow us to have a portable kernel.

What is this Kconfig entry meant to be used for?

>
>  menu "Kernel type"
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6719dd3..4c5c9f8 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -57,6 +57,12 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
>  	KBUILD_CFLAGS += -mcmodel=medany
>  endif
>
> +ifneq '$(CONFIG_RISCV_BUILTIN_DTB)' '""'
> +BUILTIN_DTB := y
> +else
> +BUILTIN_DTB := n
> +endif

Maybe I've lost my mind, but I can't find anything that actually uses 
CONFIG_BUILTIN_DTB outside of arch-specific code.

>  # GCC versions that support the "-mstrict-align" option default to allowing
>  # unaligned accesses.  While unaligned accesses are explicitly allowed in the
>  # RISC-V ISA, they're emulated by machine mode traps on all extant
> @@ -69,4 +75,7 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
>
>  libs-y += arch/riscv/lib/
>
> +boot := arch/riscv/boot
> +core-$(BUILTIN_DTB) += $(boot)/dts/
> +
>  all: vmlinux
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> new file mode 100644
> index 0000000..003d697
> --- /dev/null
> +++ b/arch/riscv/boot/Makefile
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +targets := Image Image.gz
> +
> +$(obj)/Image: vmlinux FORCE
> +	$(call if_changed,objcopy)
> +
> +$(obj)/Image.gz: $(obj)/Image FORCE
> +	$(call if_changed,gzip)
> +
> +install: $(obj)/Image
> +	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> +	$(obj)/Image System.map "$(INSTALL_PATH)"
> +
> +zinstall: $(obj)/Image.gz
> +	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> +	$(obj)/Image.gz System.map "$(INSTALL_PATH)"
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> new file mode 100644
> index 0000000..b65d070
> --- /dev/null
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ifneq '$(CONFIG_RISCV_BUILTIN_DTB)' '""'
> +BUILTIN_DTB := $(patsubst "%",%,$(CONFIG_RISCV_BUILTIN_DTB)).dtb.o
> +else
> +BUILTIN_DTB :=
> +endif
> +
> +obj-$(CONFIG_OF) += $(BUILTIN_DTB)
> +
> +clean-files := *.dtb *.dtb.S
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index e59a28c..3c89f3d 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -149,7 +149,7 @@ asmlinkage void __init setup_vm(void)
>
>  void __init sbi_save(unsigned int hartid, void *dtb)
>  {
> -	early_init_dt_scan(__va(dtb));
> +	early_init_dt_scan(dtb ? __va(dtb) : __dtb_start);
>  }
>
>  /*
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
