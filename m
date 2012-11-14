From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 3/4 v2] dtc/libfdt: introduce fdt types for annotation by
 endian checkers
Date: Wed, 14 Nov 2012 08:42:55 -0600
Message-ID: <E1TYeB5-0003oB-IS@jdl.com>
References: <1350433728-24120-1-git-send-email-kim.phillips@freescale.com>
 <507F4B0B.1020401@gmail.com> <20121018121112.GI23523@truffula.fritz.box>
 <20121018173022.32f1745249d162d1aa453694@freescale.com>
 <20121019004324.GN23523@truffula.fritz.box>
 <20121030165754.65b34c78cd0d3a0d6ab7d34e@freescale.com>
 <20121106074819.GG23553@truffula.fritz.box>
 <20121113183417.7706e5c6044eb273309ef46e@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20121113183417.7706e5c6044eb273309ef46e-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi Kim,

> 
> I hope this addresses all your comments, David.

Which is why David didn't see this patch earlier. :-)


> index 213d7fb..302d5cb 100644
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -5,25 +5,63 @@
>  #include <stdint.h>
>  #include <string.h>
>  
> +#ifdef __CHECKER__
> +#define __force __attribute__((force))
> +#define __bitwise __attribute__((bitwise))
> +typedef uint16_t __bitwise fdt16_t;
> +typedef uint32_t __bitwise fdt32_t;
> +typedef uint64_t __bitwise fdt64_t;
> +#else
> +#define __force
> +#define __bitwise
> +typedef uint16_t fdt16_t;
> +typedef uint32_t fdt32_t;
> +typedef uint64_t fdt64_t;
> +#endif

Would this be simpler/better?

    #ifdef __CHECKER__
    #define __force __attribute__((force))
    #define __bitwise __attribute__((bitwise))
    #else
    #define __force
    #define __bitwise
    #endif

    typedef uint16_t __bitwise fdt16_t;
    typedef uint32_t __bitwise fdt32_t;
    typedef uint64_t __bitwise fdt64_t;



>  #define EXTRACT_BYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
> -static inline uint16_t fdt16_to_cpu(uint16_t x)
> -{
> -	return (EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1);
> -}
> -#define cpu_to_fdt16(x) fdt16_to_cpu(x)
> +#define __SWAB16X ((EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1))
> +#define __SWAB32X ((EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) <<
>  8) | EXTRACT_BYTE(3))
> +#define __SWAB64X ((EXTRACT_BYTE(0) << 56) | (EXTRACT_BYTE(1) << 48) | (EXTRACT_BYTE(2) <<
>  40) | (EXTRACT_BYTE(3) << 32) \
> +		  | (EXTRACT_BYTE(4) << 24) | (EXTRACT_BYTE(5) << 16) | (EXTRACT_BYTE(6) << 8
> ) | EXTRACT_BYTE(7))

I dislike function-like macros that grab global names.
Instead, can we re-work 'x' in as a parameter:

    >  #define EXTRACT_BYTE(x, n)	((unsigned long long)((uint8_t *)&x)[n])


> +#define DEF_FDT_TO_CPU(bits) \
> +static inline uint##bits##_t fdt##bits##_to_cpu(fdt##bits##_t x) \
> +{ \
> +	if (*__first_byte == 0x11) \
> +		return (__force uint##bits##_t)x; \
> +	else \
> +		return (__force uint##bits##_t)__SWAB##bits##X; \
>  }

Case check that last X...

> -static inline uint64_t fdt64_to_cpu(uint64_t x)
> -{
> -	return (EXTRACT_BYTE(0) << 56) | (EXTRACT_BYTE(1) << 48) | (EXTRACT_BYTE(2) << 40) | 
> (EXTRACT_BYTE(3) << 32)
> -		| (EXTRACT_BYTE(4) << 24) | (EXTRACT_BYTE(5) << 16) | (EXTRACT_BYTE(6) << 8) 
> | EXTRACT_BYTE(7);
> +#define DEF_CPU_TO_FDT(bits) \
> +static inline fdt##bits##_t cpu_to_fdt##bits(uint##bits##_t x) \
> +{ \
> +	if (*__first_byte == 0x11) \
> +		return (__force fdt##bits##_t)x; \
> +	else \
> +		return (__force fdt##bits##_t)__SWAB##bits##X; \
>  }

...and that one.

Thanks,
jdl
