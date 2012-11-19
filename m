From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/4] dtc/libfdt: introduce fdt types for annotation by
 endian checkers
Date: Mon, 19 Nov 2012 13:30:39 +1100
Message-ID: <20121119023039.GK5735@truffula.fritz.box>
References: <E1TYeB5-0003oB-IS@jdl.com>
 <1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
 <1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
 <20121115044340.GI32290@truffula.fritz.box>
 <20121114231204.8f19082c7acc1cea2a2d794f@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121114231204.8f19082c7acc1cea2a2d794f-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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

On Wed, Nov 14, 2012 at 11:12:04PM -0600, Kim Phillips wrote:
> On Thu, 15 Nov 2012 15:43:40 +1100
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> 
> > On Wed, Nov 14, 2012 at 06:59:58PM -0600, Kim Phillips wrote:
> > > +#define EXTRACT_BYTE(x, n) ((unsigned long long)((uint8_t *)&x)[n])
> > > +#define __SWAB16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
> > > +#define __SWAB32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
> > > +		     (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
> > > +#define __SWAB64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
> > > +		     (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
> > > +		     (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
> > > +		     (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
> > 
> > This is not right, or at least very misleading.  "swab" usually refers
> > to an unconditional byteswap.  But the macros above are nops on a
> > big-endian machine.
> 
> but they don't get called on a big endian system.

Yes, which means the nop-on-bigendian is double-implemented which is
also ugly.

> This is the name
> linux uses.

I'm not sure exactly which *swab* functions in Linux you're referring
to, but I'm pretty sure most of those are unconditional swaps.

>  If you want them renamed, please suggest names - I
> can't read your mind.

Well, FDT_TO_CPU would do.

> > > -static inline uint32_t fdt32_to_cpu(uint32_t x)
> > > -{
> > > -	return (EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3);
> > > +/*
> > > + * determine host endianness:
> > > + * *__first_byte is 0x11 on big endian systems
> > > + * *__first_byte is 0x44 on little endian systems
> > > + */
> > > +static const uint32_t __native = 0x11223344u;
> > > +static const uint8_t *__first_byte = (const uint8_t *)&__native;
> > > +
> > > +#define DEF_FDT_TO_CPU(bits) \
> > > +static inline uint##bits##_t fdt##bits##_to_cpu(fdt##bits##_t x) \
> > > +{ \
> > > +	if (*__first_byte == 0x11) \
> > > +		return (__force uint##bits##_t)x; \
> > > +	else \
> > > +		return (__force uint##bits##_t)__SWAB##bits(x); \
> > >  }
> > > -#define cpu_to_fdt32(x) fdt32_to_cpu(x)
> > > +DEF_FDT_TO_CPU(16)
> > > +DEF_FDT_TO_CPU(32)
> > > +DEF_FDT_TO_CPU(64)
> > 
> > In fact, I really don't see why you're rewriting the byteswapper
> > functions as part of this patch.  The existing versions aren't very
> > nice, but if you want to rewrite those, please do it in a separate
> > patch.
> 
> This patchseries is about silencing sparse warnings in linux,
> u-boot, and libfdt.  Sparse is intelligent in that if you mismatch a
> native type of value 0 to a bitwise restricted type, it won't call a
> warning.  The existing short-circuiting of the byteswapper
> functions, i.e., defining cpu_to_fdt32(x) to fdt32_to_cpu(x) and
> vice versa doesn't allow for correct attribution propagation.

Ah, right, yes that will have to go.  You've also added the explicit
endianness test, though, which is a redundant change.

> Therefore I chose to allow sparse to see the actual conversion.  If
> you have any other ideas on how to silence sparse in libfdt, let me
> know.

Hrm.  So you could either rename the macros, or just duplicate the
code in the to versions of the functions.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
