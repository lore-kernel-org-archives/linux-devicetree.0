From: Kim Phillips <kim.phillips@freescale.com>
Subject: Re: [PATCH v3 3/4] dtc/libfdt: introduce fdt types for
 annotation by endian checkers
Date: Wed, 14 Nov 2012 23:12:04 -0600
Message-ID: <20121114231204.8f19082c7acc1cea2a2d794f@freescale.com>
References: <E1TYeB5-0003oB-IS@jdl.com>
	<1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
	<1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
	<20121115044340.GI32290@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20121115044340.GI32290@truffula.fritz.box>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: David Gibson <david@gibson.dropbear.id.au>
Cc: u-boot@lists.denx.de, jdl@jdl.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, 15 Nov 2012 15:43:40 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Nov 14, 2012 at 06:59:58PM -0600, Kim Phillips wrote:
> > +#define EXTRACT_BYTE(x, n) ((unsigned long long)((uint8_t *)&x)[n])
> > +#define __SWAB16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
> > +#define __SWAB32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
> > +		     (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
> > +#define __SWAB64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
> > +		     (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
> > +		     (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
> > +		     (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
> 
> This is not right, or at least very misleading.  "swab" usually refers
> to an unconditional byteswap.  But the macros above are nops on a
> big-endian machine.

but they don't get called on a big endian system.  This is the name
linux uses.  If you want them renamed, please suggest names - I
can't read your mind.

> > -static inline uint32_t fdt32_to_cpu(uint32_t x)
> > -{
> > -	return (EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3);
> > +/*
> > + * determine host endianness:
> > + * *__first_byte is 0x11 on big endian systems
> > + * *__first_byte is 0x44 on little endian systems
> > + */
> > +static const uint32_t __native = 0x11223344u;
> > +static const uint8_t *__first_byte = (const uint8_t *)&__native;
> > +
> > +#define DEF_FDT_TO_CPU(bits) \
> > +static inline uint##bits##_t fdt##bits##_to_cpu(fdt##bits##_t x) \
> > +{ \
> > +	if (*__first_byte == 0x11) \
> > +		return (__force uint##bits##_t)x; \
> > +	else \
> > +		return (__force uint##bits##_t)__SWAB##bits(x); \
> >  }
> > -#define cpu_to_fdt32(x) fdt32_to_cpu(x)
> > +DEF_FDT_TO_CPU(16)
> > +DEF_FDT_TO_CPU(32)
> > +DEF_FDT_TO_CPU(64)
> 
> In fact, I really don't see why you're rewriting the byteswapper
> functions as part of this patch.  The existing versions aren't very
> nice, but if you want to rewrite those, please do it in a separate
> patch.

This patchseries is about silencing sparse warnings in linux,
u-boot, and libfdt.  Sparse is intelligent in that if you mismatch a
native type of value 0 to a bitwise restricted type, it won't call a
warning.  The existing short-circuiting of the byteswapper
functions, i.e., defining cpu_to_fdt32(x) to fdt32_to_cpu(x) and
vice versa doesn't allow for correct attribution propagation.
Therefore I chose to allow sparse to see the actual conversion.  If
you have any other ideas on how to silence sparse in libfdt, let me
know.

Kim
