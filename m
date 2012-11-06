From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: introduce fdt type annotation for use by endian
 checkers
Date: Tue, 6 Nov 2012 18:48:19 +1100
Message-ID: <20121106074819.GG23553@truffula.fritz.box>
References: <1350433728-24120-1-git-send-email-kim.phillips@freescale.com>
 <507F4B0B.1020401@gmail.com>
 <20121018121112.GI23523@truffula.fritz.box>
 <20121018173022.32f1745249d162d1aa453694@freescale.com>
 <20121019004324.GN23523@truffula.fritz.box>
 <20121030165754.65b34c78cd0d3a0d6ab7d34e@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121030165754.65b34c78cd0d3a0d6ab7d34e-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2012 at 04:57:54PM -0500, Kim Phillips wrote:
> Projects such as linux and u-boot run sparse on libfdt.  libfdt
> contains the notion of endianness via usage of endian conversion
> functions such as fdt32_to_cpu.  As such, in order to pass endian
> checks, libfdt has to annotate its fdt variables as big endian.
> This patch does that ifdef __CHECKER__ (a symbol sparse defines),
> for two new fdt types: fdt32_t and fdt64_t, and subsequently
> silences warnings emitted by sparse when parsing libfdt.
> 
> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> note: wasn't sure whether to introduce the new fdt32 types, or
> just have libfdt use __be32 directly.

I prefer having the fdt32 types, to match the cpu_to_fdt32() and so
forth functions we already use.

So I like this in principle, but a couple of nits.

First, I'd really like to see an accompanying patch that adds targets
to the dtc makefiles to run sparse over the sources.  I couldn't
really test this, because I couldn't figure out quite what options I
needed to invoke sparse with to get it to work properly.

And I'd also like to see the default libfdt_env.h updated to supply
the necessary sparse stuff - including the necessary __force casts in
its byteswap functions.

[snip]
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 48ccfd9..0d9c856 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -3,46 +3,54 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#ifdef __CHECKER__

So, I'd prefer not to use __CHECKER__ directly here.  I'd rather we
defined a new specific symbol, that libfdt_env.h can set based on
__CHECKER__ if it wants.  Let's say _FDT_SPARSE The reason is
because..

> +typedef __be32 fdt32_t;
> +typedef __be64 fdt64_t;

..just running sparse does *not* immediately give you __be32 and
__be64 types - those have to be defined in terms of
__attribute__((bitwise)) and whatnot.  Your uboot env probably does
that already, but the default libfdt_env.h certainly doesn't.
Effectively _FDT_SPARSE is sayint two things, first that we're
compiling under sparse, but also that we have suitably defined endian
types in the environment.

Actually, given that libfdt_env.h is already required to provide the
cpu_to_fdt32() and so forth macros, I think it's slightly neater to
just require it to directly supply the fdt32_t etc. types when it
defines _FDT_SPARSE as well, rather than defining them in terms of
__beXX here then in terms of the attributes in the environment.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
