From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] of/pdt: fix section mismatch warning
Date: Tue, 27 Dec 2011 18:03:39 -0500 (EST)
Message-ID: <20111227.180339.1600858845043629941.davem@davemloft.net>
References: <20111227222658.GA19202@merkur.ravnborg.org>
 <20111227.172921.750063350996279524.davem@davemloft.net>
 <4EFA4C8F.5080901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EFA4C8F.5080901-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Tue, 27 Dec 2011 16:54:07 -0600

> On 12/27/2011 04:29 PM, David Miller wrote:
>> From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
>> Date: Tue, 27 Dec 2011 23:26:58 +0100
>> 
>>> We have two implementations of kernel_tree_alloc() - one in fdt.c and
>>> another in pdt.c.
>>>
>>> $ grep kernel_tree_alloc *
>>> fdt.c:static void *kernel_tree_alloc(u64 size, u64 align)
>>> fdt.c:  __unflatten_device_tree(device_tree, mynodes, &kernel_tree_alloc);
>>> pdt.c:static void * __init kernel_tree_alloc(u64 size, u64 align)
>>> pdt.c:  of_alias_scan(kernel_tree_alloc);
>>>
>>> The version in fdt.c is using kzalloc() whereas the version in pdt.c
>>> uses prom_early_alloc().
>>>
>>> And of_fdt_unflatten_tree() uses the version in fdt.c - so the patch is OK.
>>>
>>> It is confusing that they have the same name - but I did nto fix that.
>>> And I forgot about this detail when I wrote the changelog.
>> 
>> Ok, I hadn't realized this, thanks for explaining.
>> 
>> I think Grant should apply your patch then:
>> 
>> Acked-by: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
>> _______________________________________________
> 
> I've applied it for 3.3 unless you think it needs to go into 3.2.

It's not so critical for 3.2, thus targetting 3.3 is fine.
