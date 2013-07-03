From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Fix address decoding on Bimini and js2x machines
Date: Wed, 03 Jul 2013 09:10:15 -0500
Message-ID: <51D430C7.8030100@gmail.com>
References: <1372831270.4122.36.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372831270.4122.36.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/03/2013 01:01 AM, Benjamin Herrenschmidt wrote:
>  Commit:
>     
>   e38c0a1fbc5803cbacdaac0557c70ac8ca5152e7
>   of/address: Handle #address-cells > 2 specially
>     
> broke real time clock access on Bimini, js2x, and similar powerpc
> machines using the "maple" platform. That code was indirectly relying
> on the old (broken) behaviour of the translation for the hypertransport
> to ISA bridge.
>     
> This fixes it by treating hypertransport as a PCI bus
>     
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> [v3.6+]
> ---
> 
> Rob, if you have no objection I will put that in powerpc -next

NP.

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Rob

> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 04da786..7c8221d 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -106,8 +106,12 @@ static unsigned int of_bus_default_get_flags(const __be32 *
>  
>  static int of_bus_pci_match(struct device_node *np)
>  {
> -       /* "vci" is for the /chaos bridge on 1st-gen PCI powermacs */
> -       return !strcmp(np->type, "pci") || !strcmp(np->type, "vci");
> +       /*
> +        * "vci" is for the /chaos bridge on 1st-gen PCI powermacs
> +        * "ht" is hypertransport
> +        */
> +       return !strcmp(np->type, "pci") || !strcmp(np->type, "vci") ||
> +               !strcmp(np->type, "ht");
>  }
>  
>  static void of_bus_pci_count_cells(struct device_node *np,
> 
> 
