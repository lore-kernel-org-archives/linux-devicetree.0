From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3 21/25] irqdomain/powerpc: Replace custom xlate
 functions with library functions
Date: Sun, 5 Feb 2012 23:00:04 -0700
Message-ID: <20120206060004.GB21449@ponder.secretlab.ca>
References: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
 <1327700179-17454-22-git-send-email-grant.likely@secretlab.ca>
 <24476.1328505761@neuling.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <24476.1328505761-/owAOxkjmzZAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michael Neuling <mikey-/owAOxkjmzZAfugRpC6u6w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2012 at 04:22:41PM +1100, Michael Neuling wrote:
> >  static const struct irq_domain_ops pmac_pic_host_ops = {
> >  	.match = pmac_pic_host_match,
> >  	.map = pmac_pic_host_map,
> > -	.xlate = pmac_pic_host_xlate,
> > +	.xlate = irq_domain_xlate_onecell;
> >  };
> >  
> 
> This causes a compile fail (in next-20120206):
>   arch/powerpc/platforms/powermac/pic.c:294: error: expected '}' before ';' token
> Trivial fix below:

fixed, thanks.

g.

> 
> 
> 
> irqdomain/powerpc: Fix compile error in powermac/pic.c
> 
> Error introduced in:
>   commit 72d6b477675374eafd206720d6c9146520df18ce
>   Author: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>   irqdomain/powerpc: Replace custom xlate functions with library functions
> 
> Signed-off-by: Michael Neuling <mikey-/owAOxkjmzZAfugRpC6u6w@public.gmane.org>
> 
> diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
> index 3af29d1..92afc38 100644
> --- a/arch/powerpc/platforms/powermac/pic.c
> +++ b/arch/powerpc/platforms/powermac/pic.c
> @@ -291,7 +291,7 @@ static int pmac_pic_host_map(struct irq_domain *h, unsigned int virq,
>  static const struct irq_domain_ops pmac_pic_host_ops = {
>  	.match = pmac_pic_host_match,
>  	.map = pmac_pic_host_map,
> -	.xlate = irq_domain_xlate_onecell;
> +	.xlate = irq_domain_xlate_onecell,
>  };
>  
>  static void __init pmac_pic_probe_oldstyle(void)
