From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Adding DTB to architecture independent vmlinux
Date: Wed, 27 Oct 2010 12:09:37 +0100
Message-ID: <20101027110937.GD7822@angua.secretlab.ca>
References: <4CC6E491.7060304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CC6E491.7060304-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 26, 2010 at 07:24:17AM -0700, Dirk Brandewie wrote:
> Hi All,
> 
> I am working on working on adding support device tree support to an
> x86 based platform, hpa pointed out that the device tree blob is
> architecture independent and should be part of the generic kernel.
> 
> The patch below is a first cut at adding dtb support to the architecture
> independent kernel and adding a generic dts->dtb build rule.
> 
> This has only been tested on x86.
> 
> Comments/suggestions gratefully accepted.
> 
> --Dirk
> 
> of: add support for linking platform dtb into vmlinux
> 
> From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch adds support for linking a device tree blob into
> vmlinux. The platform DTB to be built and linked into the kernel is
> specified by passing PLATFORM_DTB=<platform name> to make.

I don't think it is worth trying to do this in a cross-architecture
way.  The powerpc zImage wrappers are already very platform-specific
code, and there are no assumptions made about how a dtb image is
linked into the wrapper.  A wrapper could even link in multiple dtb
images.


For the x86 code, linking the dtb into the vmlinux itself is not
something that is desired without the option of selecting it between
multiple linked-in dtb files if firmware doesn't pass one in for you.
This will require some discussion about how best to manage dtbs before
merging a patch like this.

> 
> The command:
> make PLATFORM_DTB=ce4100
> 
> will link the device tree blob into vmlinux
> 
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/powerpc/boot/zImage.coff.lds.S |    5 ++---
>  arch/powerpc/boot/zImage.lds.S      |    5 ++---
>  arch/powerpc/boot/zImage.ps3.lds.S  |    5 ++---
>  arch/x86/kernel/Makefile            |   15 +++++++++++++++
>  include/asm-generic/vmlinux.lds.h   |   12 ++++++++++++
>  scripts/Makefile.lib                |    7 +++++++
>  7 files changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/boot/zImage.coff.lds.S
> b/arch/powerpc/boot/zImage.coff.lds.S
> index 856dc78..c23145f 100644
> --- a/arch/powerpc/boot/zImage.coff.lds.S
> +++ b/arch/powerpc/boot/zImage.coff.lds.S
> @@ -1,3 +1,4 @@
> +#include <asm-generic/vmlinux.lds.h>
>  OUTPUT_ARCH(powerpc:common)
>  ENTRY(_zimage_start_opd)
>  EXTERN(_zimage_start_opd)
> @@ -21,9 +22,7 @@ SECTIONS
>      *(.got2)
>      __got2_end = .;
> 
> -    _dtb_start = .;
> -    *(.kernel:dtb)
> -    _dtb_end = .;
> +    KERNEL_DTB()

Has this been compile tested?  I don't believe the powerpc boot
wrapper code (arch/powerpc/boot/*) will include stuff from
linux/asm-generic because it is intended to be a completely
independent C environment.

> 
>      _vmlinux_start =  .;
>      *(.kernel:vmlinux.strip)
> diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
> index 0962d62..f5b9c56 100644
> --- a/arch/powerpc/boot/zImage.lds.S
> +++ b/arch/powerpc/boot/zImage.lds.S
> @@ -1,3 +1,4 @@
> +#include <asm-generic/vmlinux.lds.h>
>  OUTPUT_ARCH(powerpc:common)
>  ENTRY(_zimage_start)
>  EXTERN(_zimage_start)
> @@ -22,9 +23,7 @@ SECTIONS
>    }
> 
>    . = ALIGN(8);
> -  _dtb_start = .;
> -  .kernel:dtb : { *(.kernel:dtb) }
> -  _dtb_end = .;
> +  KERNEL_DTB()
> 
>    . = ALIGN(4096);
>    _vmlinux_start =  .;
> diff --git a/arch/powerpc/boot/zImage.ps3.lds.S b/arch/powerpc/boot/zImage.ps3.lds.S
> index aaa469c..246d227 100644
> --- a/arch/powerpc/boot/zImage.ps3.lds.S
> +++ b/arch/powerpc/boot/zImage.ps3.lds.S
> @@ -1,3 +1,4 @@
> +#include <asm-generic/vmlinux.lds.h>
>  OUTPUT_ARCH(powerpc:common)
>  ENTRY(_zimage_start)
>  EXTERN(_zimage_start)
> @@ -8,9 +9,7 @@ SECTIONS
>    _vmlinux_end =  .;
> 
>    . = ALIGN(4096);
> -  _dtb_start = .;
> -  .kernel:dtb : { *(.kernel:dtb) }
> -  _dtb_end = .;
> +  KERNEL_DTB()
> 
>    . = ALIGN(4096);
>    _initrd_start =  .;
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 3068e1e..992b3dd 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -120,6 +120,21 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
>  obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
>  obj-$(CONFIG_X86_OF)			+= prom.o
> 
> +ifeq ($(CONFIG_X86_OF),y)
> +ifneq ($(PLATFORM_DTB),)
> +obj-y += $(PLATFORM_DTB).dtb.o
> +endif
> +endif
> +
> +dtstree	:= $(srctree)/arch/x86/boot/dts
> +
> +$(obj)/%.dtb: $(dtstree)/%.dts
> +	$(call if_changed,dtc)
> +
> +$(obj)/%.dtb.S: $(obj)/%.dtb
> +	@echo '.section .kernel:dtb,"a"' > $@
> +	@echo '.incbin "$<" ' >> $@
> +

Hmmm, I wonder if this hunk can be common for all architectures.

>  ###
>  # 64 bit specific files
>  ifeq ($(CONFIG_X86_64),y)
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 8a92a17..5729a24 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -146,6 +146,14 @@
>  #define TRACE_SYSCALLS()
>  #endif
> 
> +#ifdef CONFIG_OF
> +#define KERNEL_DTB() _dtb_start = .;	    				\
> +		   *(.kernel:dtb)					\
> +		   _dtb_end = .;					
> +#else
> + KERNEL_DTB()
> +#endif
> +
>  /* .data section */
>  #define DATA_DATA							\
>  	*(.data)							\
> @@ -245,6 +253,10 @@
>  		VMLINUX_SYMBOL(__end_pci_fixups_suspend) = .;		\
>  	}								\
>  									\
> +	.dtb : AT(ADDR(.dtb) - LOAD_OFFSET) {				\
> +	     KERNEL_DTB()      		    				\
> +	}		   						\
> +								\
>  	/* Built-in firmware blobs */					\
>  	.builtin_fw        : AT(ADDR(.builtin_fw) - LOAD_OFFSET) {	\
>  		VMLINUX_SYMBOL(__start_builtin_fw) = .;			\
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 54fd1b7..ce32644 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -207,6 +207,13 @@ quiet_cmd_gzip = GZIP    $@
>  cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -f -9 > $@) || \
>  	(rm -f $@ ; false)
> 
> +# DTC
> +#  ---------------------------------------------------------------------------
> +
> +DTC = $(objtree)/scripts/dtc/dtc
> +
> +quiet_cmd_dtc = DTC	$@
> +      cmd_dtc = $(DTC) -O dtb -o $(obj)/$*.dtb -b 0 -p 1024 $(dtstree)/$*.dts
> 
>  # Bzip2
>  # ---------------------------------------------------------------------------
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
