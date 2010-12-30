From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/7] arch/x86: Add support for device tree code.
Date: Wed, 29 Dec 2010 17:17:23 -0700
Message-ID: <20101230001723.GB32711@angua.secretlab.ca>
References: <1290021345-4303-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1290124502-13125-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1290124502-13125-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<98608b2e-d138-4dc0-808d-3662ab2c9938@VA3EHSMHS025.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <98608b2e-d138-4dc0-808d-3662ab2c9938-+Ck8Kgl/v0/6UOWq+LNw4LjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 18, 2010 at 03:54:57PM -0800, Stephen Neuendorffer wrote:
> A few support device-tree related support functions that x86 didn't
> have before.
> 
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Skipping this patch.  I expect to pick up Dirk's version instead.

g.

> 
> ----
> 
> Looks like just some irq related junk left!
> ---
>  arch/x86/include/asm/irq.h |    2 ++
>  arch/x86/kernel/irq.c      |   11 +++++++++++
>  2 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
> index 5458380..af4e630 100644
> --- a/arch/x86/include/asm/irq.h
> +++ b/arch/x86/include/asm/irq.h
> @@ -10,6 +10,8 @@
>  #include <asm/apicdef.h>
>  #include <asm/irq_vectors.h>
>  
> +#define irq_dispose_mapping(...)
> +
>  static inline int irq_canonicalize(int irq)
>  {
>  	return ((irq == 2) ? 9 : irq);
> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
> index 91fd0c7..a3aaed4 100644
> --- a/arch/x86/kernel/irq.c
> +++ b/arch/x86/kernel/irq.c
> @@ -364,3 +364,14 @@ void fixup_irqs(void)
>  	}
>  }
>  #endif
> +
> +#ifdef CONFIG_OF
> +#include <linux/of_irq.h>
> +unsigned int irq_create_of_mapping(struct device_node *controller,
> +				   const u32 *intspec, unsigned int intsize)
> +{
> +	return intspec[0] + 1;
> +}
> +EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> +
> +#endif
> -- 
> 1.5.6.6
> 
> 
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 
> 
