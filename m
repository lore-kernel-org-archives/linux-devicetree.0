From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] [PATCH V2] Adding DTB to architecture independent vmlinux
Date: Wed, 27 Oct 2010 17:57:54 -0700
Message-ID: <20101028005754.GA27386@dvomlehn-lnx2.corp.sa.net>
References: <4CC6E491.7060304@gmail.com>
	<20101027110937.GD7822@angua.secretlab.ca>
	<4CC860EF.6060503@linux.intel.com> <4CC8C423.9050600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CC8C423.9050600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 27, 2010 at 05:30:27PM -0700, Dirk Brandewie wrote:
> Here is V2 of the patch.
...
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 3068e1e..0f5eb1d 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -120,6 +120,21 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
>  obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
>  obj-$(CONFIG_X86_OF)			+= prom.o
>
> +ifeq ($(CONFIG_KERNEL_DTB),y)
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
> +	@echo '.section .dtb,"a"' > $@
> +	@echo '.incbin "$<" ' >> $@
> +

I've been playing a bit with the patch, and would suggest something
like the following for the second target:

	$(obj)/%.dtb.S: $(obj)/%.dtb
		@echo '#include <asm/page.h>' >$@
		@echo '.balign PAGE_SIZE' >> $@
		@echo '.section .kernel:dtb,"a"' >> $@
		@echo '.global __$(*F)_dtb' >> $@
		@echo '__$(*F)_dtb:' >> $@
		@echo '.incbin "$<" ' >> $@
		@echo '.balign PAGE_SIZE' >> $@

Advantages:
1.	Each blob gets a name that can be used to refer to it. This
	allows multiple blobs to be built into a kernel, each with
	its own name.  The name of each blob is taken from the file
	name, so a source
	file abc.dts would produce a blob referred to as __abc_dtb.
2.	Blobs are aligned on a page boundary and extend to the nearest
	page boundary. Any blobs you don't care about can then easily
	be completely freed.

You might then use:

	obj-y += $(addprefix .dtb.o,$(PLATFORM_DTB))

to add blob names, but I'm not completely confident this is the way to go.
-- 
David VL
