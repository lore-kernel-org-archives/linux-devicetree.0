From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arch/powerpc/platforms/52xx/efika.c: Add of_node_put
	to avoid memory leak
Date: Wed, 8 Sep 2010 11:45:47 -0600
Message-ID: <20100908174547.GN3686@angua.secretlab.ca>
References: <1283584397-7697-1-git-send-email-julia@diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1283584397-7697-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 04, 2010 at 09:13:17AM +0200, Julia Lawall wrote:
> This function is implemented as though the function of_get_next_child does
> not increment the reference count of its result, but actually it does.
> Thus the patch adds of_node_put in error handling code and drops a call to
> of_node_get.

applied, thanks.

g.

> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> expression E1;
> position p1,p2;
> @@
> 
> x@p1 = of_get_next_child(...);
> ... when != x = E1
> of_node_get@p2(x)
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> cocci.print_main("call",p1)
> cocci.print_secs("get",p2)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
> 
> ---
>  arch/powerpc/platforms/52xx/efika.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
> index 45c0cb9..18c1048 100644
> --- a/arch/powerpc/platforms/52xx/efika.c
> +++ b/arch/powerpc/platforms/52xx/efika.c
> @@ -99,7 +99,7 @@ static void __init efika_pcisetup(void)
>  	if (bus_range == NULL || len < 2 * sizeof(int)) {
>  		printk(KERN_WARNING EFIKA_PLATFORM_NAME
>  		       ": Can't get bus-range for %s\n", pcictrl->full_name);
> -		return;
> +		goto out_put;
>  	}
>  
>  	if (bus_range[1] == bus_range[0])
> @@ -111,12 +111,12 @@ static void __init efika_pcisetup(void)
>  	printk(" controlled by %s\n", pcictrl->full_name);
>  	printk("\n");
>  
> -	hose = pcibios_alloc_controller(of_node_get(pcictrl));
> +	hose = pcibios_alloc_controller(pcictrl);
>  	if (!hose) {
>  		printk(KERN_WARNING EFIKA_PLATFORM_NAME
>  		       ": Can't allocate PCI controller structure for %s\n",
>  		       pcictrl->full_name);
> -		return;
> +		goto out_put;
>  	}
>  
>  	hose->first_busno = bus_range[0];
> @@ -124,6 +124,9 @@ static void __init efika_pcisetup(void)
>  	hose->ops = &rtas_pci_ops;
>  
>  	pci_process_bridge_OF_ranges(hose, pcictrl, 0);
> +	return;
> +out_put:
> +	of_node_put(pcictrl);
>  }
>  
>  #else
> 
