From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v29 9/9] Documentation: dt: chosen properties for arm64
 kdump
Date: Thu, 12 Jan 2017 15:39:45 +0000
Message-ID: <20170112153944.GB12249@leverpostej>
References: <20161228043347.27358-1-takahiro.akashi@linaro.org>
 <20161228043734.27535-1-takahiro.akashi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161228043734.27535-1-takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 28, 2016 at 01:37:34PM +0900, AKASHI Takahiro wrote:
> From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> 
> Add documentation for
> 	linux,crashkernel-base and crashkernel-size,
> 	linux,usable-memory-range
> 	linux,elfcorehdr
> used by arm64 kdump to decribe the kdump reserved area, and
> the elfcorehdr's location within it.
> 
> Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> [takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org: added "linux,crashkernel-base" and "-size" ]
> Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/chosen.txt | 50 ++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 6ae9d82d4c37..7b115165e9ec 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -52,3 +52,53 @@ This property is set (currently only on PowerPC, and only needed on
>  book3e) by some versions of kexec-tools to tell the new kernel that it
>  is being booted by kexec, as the booting environment may differ (e.g.
>  a different secondary CPU release mechanism)
> +
> +linux,crashkernel-base
> +linux,crashkernel-size
> +----------------------
> +
> +These properties (currently used on PowerPC and arm64) indicates
> +the base address and the size, respectively, of the reserved memory
> +range for crash dump kernel.

>From this description, it's not clear to me what the (expected)
consumers of this property are, nor what is expected to provide it.

In previous rounds of review, I had assumed that this was used to
describe a preference to the first kernel as to what region of memory
should be used for a subsequent kdump kernel. Looking around, I'm not
sure if I was correct in that assessment.

I see that arch/powerpc seems to consume this property to configure
crashk_res, but it also rewrites it based on crashk_res, presumably for
the benefit of userspace. It's not clear to me how on powerpc the kdump
kernel knows its memory range -- is more DT modification done in the
kernel and/or userspace?

I disagree with modifying this property to expose it to userspace. For
arm64 we should either ensure that /proc/iomem is consistently usable
(and have userspace consistently use it), or we should expose a new file
specifically to expose this information.

Further, I do not think we need this property. It makes more sense to me
for the preference of a a region to be described to the *first* kernel
using the command line consistently.

So I think we should drop this property, and not use it on arm64. Please
document this as powerpc only.

> +e.g.
> +
> +/ {
> +	chosen {
> +		linux,crashkernel-base = <0x9 0xf0000000>;
> +		linux,crashkernel-size = <0x0 0x10000000>;
> +	};
> +};

> +
> +linux,usable-memory-range
> +-------------------------
> +
> +This property (currently used only on arm64) holds the memory range,
> +the base address and the size, which can be used as system ram on
> +the *current* kernel. Note that, if this property is present, any memory
> +regions under "memory" nodes in DT blob or ones marked as "conventional
> +memory" in EFI memory map should be ignored.

Could you please replace this with:

  This property (arm64 only) holds a base address and size, describing a
  limited region in which memory may be considered available for use by
  the kernel. Memory outside of this range is not available for use.
  
  This property describes a limitation: memory within this range is only
  valid when also described through another mechanism that the kernel
  would otherwise use to determine available memory (e.g. memory nodes
  or the EFI memory map). Valid memory may be sparse within the range.

To clarify why we need this, given by above comments w.r.r. the
linux,crashkernel-* properties:

* It preserves all the original memory map information (e.g. memory
  nodes and/or EFI memory map)

* It works consistently, regardless of how the kdump kernel would
  otherwise determine which memory to use (memory nodes, EFI, etc).

* It will be simply and reliable for an in-kernel purgatory to insert,
  if we need a kexec_file_load()-based kdump (e.g. without requiring
  memory map rewrites, and avoiding clashes with command line
  parameters). For a first kernel, this is not as big a concern.

> +linux,elfcorehdr
> +----------------
> +
> +This property (currently used only on arm64) holds the memory range,
> +the address and the size, of the elf core header which mainly describes
> +the panicked kernel's memory layout as PT_LOAD segments of elf format.
> +e.g.
> +
> +/ {
> +	chosen {
> +		linux,elfcorehdr = <0x9 0xfffff000 0x0 0x800>;
> +	};
> +};

This property looks fine to me.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
