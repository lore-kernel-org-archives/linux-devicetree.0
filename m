From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/4] x86/of: Support building device tree blob(s) into
	image.
Date: Sat, 13 Nov 2010 22:13:47 -0700
Message-ID: <20101114051347.GB2355@angua.secretlab.ca>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
	<1b004c685c67c07a5a0b2b16b3a00dd016e2b759.1289520079.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1b004c685c67c07a5a0b2b16b3a00dd016e2b759.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 11, 2010 at 04:03:47PM -0800, dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch adds support for linking device tree blobs into vmlinux.
> The blobs linked into the image is controlled via kernel config
> variables
> 
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/x86/Kconfig          |    6 +++++-
>  arch/x86/boot/dts/Kconfig |    8 ++++++++
>  arch/x86/kernel/Makefile  |   11 +++++++++++
>  3 files changed, 24 insertions(+), 1 deletions(-)
>  create mode 100644 arch/x86/boot/dts/Kconfig
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 5904f38..62c195d 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -299,13 +299,17 @@ config X86_BIGSMP
>  	---help---
>  	  This option is needed for the systems that have more than 8 CPUs
>  
> -config X86_OF
> +menuconfig X86_OF
>  	bool "Support for device tree"
>  	select OF
>  	select OF_FLATTREE
>  	---help---
>  	  Device tree support on X86.
>  
> +if X86_OF
> +source "arch/x86/boot/dts/Kconfig
> +endif
> +
>  if X86_32
>  config X86_EXTENDED_PLATFORM
>  	bool "Support for extended (non-PC) x86 platforms"
> diff --git a/arch/x86/boot/dts/Kconfig b/arch/x86/boot/dts/Kconfig
> new file mode 100644
> index 0000000..5380b6b
> --- /dev/null
> +++ b/arch/x86/boot/dts/Kconfig
> @@ -0,0 +1,8 @@
> +config CE4100_DTB
> +       bool "Intel CE4100"
> +       depends on X86_OF && KERNEL_DTB
> +
> +config TEST_DTB
> +       bool "Test DTS"
> +       depends on  X86_OF && KERNEL_DTB
> +

Rather than explicitly adding a Kconfig entry for each and every .dts
file that you'll ever want to embed; I suggest a single Kconfig that
allows the users to input a list of .dtb filenames.  PowerPC already
does this (sort of) for specifying a list of additional dtbimage.%
targets.

See config EXTRA_TARGETS in arch/powerpc/Kconfig and in
arch/powerp/boot/Makefile.

You can still /also/ link in specific .dtb files when other config
symbols are chosen (ie, if some specific board support is chosen that
is known to require it), but it doesn't seem to make a lot of sense to
me to have entirely separate Kconfig symbols for each and every .dtb
file.

> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 586df14..cf15e8c 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -113,6 +113,17 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
>  obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
>  obj-$(CONFIG_X86_OF)			+= prom.o
>  
> +ifeq ($(CONFIG_KERNEL_DTB),y)
> +obj-$(CONFIG_CE4100_DTB) += ce4100.dtb.o
> +obj-$(CONFIG_TEST_DTB) += test.dtb.o
> +endif

The rule that actually generates the .dtb.o files seems to be in patch
#2, which makes this series non-bisectable (it will break if patch 1
is applied without patch 2).  The changes need to be ordered so that
the kernel still builds at any point in the series.

... hmmm, maybe I should dig deeper....

Okay, I see now that it requires CONFIG_KERNEL_DTB to be set which is
also defined in patch #2, so the series does appear to be bisectable,
but it isn't entirely logical.  I would expect to see all the required
rules and linker script additions to be applied before adding the dts
files to the kernel and adding the Kconfig/Makefile changes that use
them.

heh, and I've also just realized that it still isn't bisectable
because none of these patches add ce4100.dts or test.dts to the
kernel.  :-)

I imagine this series should be something like:

1) add %.dtb:%.dts rule  (ideally to scripts/Makefile.lib; see below)
2) add %.dtb.S:%.dtb rule  (ideally to scripts/Makefile.lib; see below)
3+) add x86 Kconfig and Makefile changes to enable dtb linking and to
    add the .dts files.

> +
> +dtstree	:= $(srctree)/arch/x86/boot/dts
> +
> +$(obj)/%.dtb: $(dtstree)/%.dts
> +	$(call if_changed,dtc)

I know this is what we've done in powerpc, but I suspect it would make
a lot more sense to make this rule generic and arch independent so
that .dts files can live in any subdirectory.

Perhaps this works (completely untested):

$(obj)/%.dtb: $(src)/%.dts
	$(call if_changed,dtc)

And I think that would belong in scripts/Makefile.lib.  I don't see
any reason why PowerPC and Microblaze couldn't use a common definition
for this rule.

g.
