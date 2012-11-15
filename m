From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 3/4] dtc/libfdt: introduce fdt types for annotation by
 endian checkers
Date: Thu, 15 Nov 2012 15:43:40 +1100
Message-ID: <20121115044340.GI32290@truffula.fritz.box>
References: <E1TYeB5-0003oB-IS@jdl.com>
 <1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
 <1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1352941199-19393-3-git-send-email-kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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

On Wed, Nov 14, 2012 at 06:59:58PM -0600, Kim Phillips wrote:
> Projects such as linux and u-boot run sparse on libfdt.  libfdt
> contains the notion of endianness via usage of endian conversion
> functions such as fdt32_to_cpu.  As such, in order to pass endian
> checks, libfdt has to annotate its fdt variables such that sparse
> can warn when mixing bitwise and regular integers.  This patch adds
> these new fdtXX_t types and, ifdef __CHECKER__ (a symbol sparse
> defines), includes the bitwise annotation.
> 
> Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v2:
> adds bitwise awareness: determine host endianness manually, and
> annotate swabs with __force in fdtXX_to_cpu and cpu_to_fdtXX
> conversion functions (the inline endian condition checks are
> optimized out at compile time).  This allows us to be able to check
> libfdt bitwise conversions with sparse by building dtc with make
> CC=cgcc. v2 also moves fdt32 definitions from fdt.h to libfdt_env.h
> and changes fdt32 definitions to use __bitwise instead of __be32. No
> separate _FDT_SPARSE was introduced because there's no need: using
> __CHECKER__ directly is valid because it only occurs once, and in
> libfdt_env.h.
> In addition, the libfdt sparse fixes have been moved to a subsequent
> patch.
> 
> v3:  address comments from jdl:
> o single set of fdt typedefs, since __bitwise is not defined if !CHECKER
> o re-work EXTRACT_BYTE to take 'x' as a parameter, not a global
> o SWAB function macros converted to take lowercase 'x' as a parameter,
>   not a global
> 
>  libfdt/fdt.h        | 42 ++++++++++++++++----------------
>  libfdt/libfdt_env.h | 69 +++++++++++++++++++++++++++++++++++++++++------------
>  2 files changed, 75 insertions(+), 36 deletions(-)
> 
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 48ccfd9..45dd134 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
[snip]
> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> index 213d7fb..f0d97b9 100644
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -5,25 +5,64 @@
>  #include <stdint.h>
>  #include <string.h>
>  
> -#define EXTRACT_BYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
> -static inline uint16_t fdt16_to_cpu(uint16_t x)
> -{
> -	return (EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1);
> -}
> -#define cpu_to_fdt16(x) fdt16_to_cpu(x)
> +#ifdef __CHECKER__
> +#define __force __attribute__((force))
> +#define __bitwise __attribute__((bitwise))
> +#else
> +#define __force
> +#define __bitwise
> +#endif
> +
> +typedef uint16_t __bitwise fdt16_t;
> +typedef uint32_t __bitwise fdt32_t;
> +typedef uint64_t __bitwise fdt64_t;

I agree with Jon that the approach above is better than the earlier one.

> +#define EXTRACT_BYTE(x, n) ((unsigned long long)((uint8_t *)&x)[n])
> +#define __SWAB16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
> +#define __SWAB32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
> +		     (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
> +#define __SWAB64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
> +		     (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
> +		     (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
> +		     (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))

This is not right, or at least very misleading.  "swab" usually refers
to an unconditional byteswap.  But the macros above are nops on a
big-endian machine.

> -static inline uint32_t fdt32_to_cpu(uint32_t x)
> -{
> -	return (EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3);
> +/*
> + * determine host endianness:
> + * *__first_byte is 0x11 on big endian systems
> + * *__first_byte is 0x44 on little endian systems
> + */
> +static const uint32_t __native = 0x11223344u;
> +static const uint8_t *__first_byte = (const uint8_t *)&__native;
> +
> +#define DEF_FDT_TO_CPU(bits) \
> +static inline uint##bits##_t fdt##bits##_to_cpu(fdt##bits##_t x) \
> +{ \
> +	if (*__first_byte == 0x11) \
> +		return (__force uint##bits##_t)x; \
> +	else \
> +		return (__force uint##bits##_t)__SWAB##bits(x); \
>  }
> -#define cpu_to_fdt32(x) fdt32_to_cpu(x)
> +DEF_FDT_TO_CPU(16)
> +DEF_FDT_TO_CPU(32)
> +DEF_FDT_TO_CPU(64)

In fact, I really don't see why you're rewriting the byteswapper
functions as part of this patch.  The existing versions aren't very
nice, but if you want to rewrite those, please do it in a separate
patch.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
