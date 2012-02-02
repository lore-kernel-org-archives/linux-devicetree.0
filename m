From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] irq_domain/microblaze: Convert microblaze to use
 irq_domains
Date: Thu, 2 Feb 2012 13:01:13 -0700
Message-ID: <20120202200113.GX15343@ponder.secretlab.ca>
References: <1328183974-3767-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1328183974-3767-1-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2012 at 12:59:34PM +0100, Michal Simek wrote:
> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> Move get_irq to asm/irq.h from hardirq.h.
> 
> Grant: Why does your patch setup NR_IRQS to 64? It seems to me
> pretty big value because intc support up to 32 interrupts.
> The main problem was with get_irq function because there must
> check status of IVR.
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
> Cc: John Linn <john.linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> ---
> diff --git a/arch/microblaze/kernel/irq.c b/arch/microblaze/kernel/irq.c
> index 3f613df..ace700a 100644
> --- a/arch/microblaze/kernel/irq.c
> +++ b/arch/microblaze/kernel/irq.c
> @@ -31,14 +31,13 @@ void __irq_entry do_IRQ(struct pt_regs *regs)
>  	trace_hardirqs_off();
>  
>  	irq_enter();
> -	irq = get_irq(regs);
> +	irq = get_irq();
>  next_irq:
>  	BUG_ON(!irq);
> -	/* Substract 1 because of get_irq */
> -	generic_handle_irq(irq + IRQ_OFFSET - NO_IRQ_OFFSET);
> +	generic_handle_irq(irq);
>  
> -	irq = get_irq(regs);
> -	if (irq) {
> +	irq = get_irq();
> +	if (irq != -1U) {

irq should never be -1 now with my current tree.  I've just pushed it out,
can you take a look and try it with the original "if (!irq)" test?

g.
