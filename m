From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] of/pdt: fix section mismatch warning
Date: Tue, 27 Dec 2011 17:29:21 -0500 (EST)
Message-ID: <20111227.172921.750063350996279524.davem@davemloft.net>
References: <20111227220408.GA18932@merkur.ravnborg.org>
 <20111227.171307.1727824866350984198.davem@davemloft.net>
 <20111227222658.GA19202@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111227222658.GA19202-OoSGOWW0KRunlFQ6Q1D1Y0B+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Date: Tue, 27 Dec 2011 23:26:58 +0100

> We have two implementations of kernel_tree_alloc() - one in fdt.c and
> another in pdt.c.
> 
> $ grep kernel_tree_alloc *
> fdt.c:static void *kernel_tree_alloc(u64 size, u64 align)
> fdt.c:  __unflatten_device_tree(device_tree, mynodes, &kernel_tree_alloc);
> pdt.c:static void * __init kernel_tree_alloc(u64 size, u64 align)
> pdt.c:  of_alias_scan(kernel_tree_alloc);
> 
> The version in fdt.c is using kzalloc() whereas the version in pdt.c
> uses prom_early_alloc().
> 
> And of_fdt_unflatten_tree() uses the version in fdt.c - so the patch is OK.
> 
> It is confusing that they have the same name - but I did nto fix that.
> And I forgot about this detail when I wrote the changelog.

Ok, I hadn't realized this, thanks for explaining.

I think Grant should apply your patch then:

Acked-by: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
