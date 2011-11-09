From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add support for appending the values to a
 existing property
Date: Wed, 9 Nov 2011 15:49:14 +1100
Message-ID: <20111109044914.GH8168@truffala.fritz.box>
References: <1317182330-9280-1-git-send-email-Minghuan.Lian@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1317182330-9280-1-git-send-email-Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2011 at 11:58:50AM +0800, Minghuan Lian wrote:
> Some properties may contain multiple values, these values may need
> to be added to the property respectively. this patch provides this
> functionality. The main purpose of fdt_append_prop() is to append
> the values to a existing property, or create a new property if it
> dose not exist.

Sorry, this somehow got stuck in the mailing list and I only saw it a
few days ago, despite being posted more than a month back.

Nice patch, and a feature we definitely want.  Couple of little tweaks
would improve it, though.

> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  libfdt/fdt_rw.c |   27 +++++++++++++++++++++++++++
>  libfdt/libfdt.h |   30 ++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 0 deletions(-)
> 
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index 994037b..0ee578e 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -289,6 +289,33 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
>  	return 0;
>  }
>  
> +int fdt_append_prop(void *fdt, int nodeoffset, const char *name,
> +		    const void *val, int len)

I'd call it fdt_appendprop() without the extra underscore to match
setprop and getprop.

> +{
> +	struct fdt_property *prop;
> +	int err, oldlen, newlen;
> +
> +	FDT_RW_CHECK_HEADER(fdt);
> +
> +	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
> +	if (prop) {
> +		newlen = len + oldlen;
> +		err = _fdt_splice_struct(fdt, prop->data,
> +					 FDT_TAGALIGN(oldlen),
> +					 FDT_TAGALIGN(newlen));
> +		if (err)
> +			return err;
> +		prop->len = cpu_to_fdt32(newlen);
> +		memcpy(prop->data + oldlen, val, len);
> +	} else {
> +		err = _fdt_add_property(fdt, nodeoffset, name, len, &prop);
> +		if (err)
> +			return err;
> +		memcpy(prop->data, val, len);
> +	}
> +	return 0;
> +}
> +

Could you add fdt_appendprop_cell() and fdt_appendprop_string()
wrappers too, please.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
