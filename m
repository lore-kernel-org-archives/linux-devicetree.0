From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH v2 02/12] of: Allow scripts/dtc/libfdt to be used
	from kernel code
Date: Sat, 5 Mar 2011 19:24:09 +1100
Message-ID: <20110305082409.GB3312@yookeroo>
References: <1299267744-17278-1-git-send-email-ddaney@caviumnetworks.com>
	<1299267744-17278-3-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1299267744-17278-3-git-send-email-ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2011 at 11:42:14AM -0800, David Daney wrote:
> Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
[snip]
> --- /dev/null
> +++ b/lib/libfdt/libfdt_env.h
> @@ -0,0 +1,21 @@
> +#ifndef _LIBFDT_ENV_H
> +#define _LIBFDT_ENV_H
> +
> +#include <linux/string.h>
> +
> +#define _B(n)	((unsigned long long)((uint8_t *)&x)[n])
> +static inline uint32_t fdt32_to_cpu(uint32_t x)
> +{
> +	return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
> +}
> +#define cpu_to_fdt32(x) fdt32_to_cpu(x)
> +
> +static inline uint64_t fdt64_to_cpu(uint64_t x)
> +{
> +	return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) << 32)
> +		| (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8) | _B(7);
> +}
> +#define cpu_to_fdt64(x) fdt64_to_cpu(x)
> +#undef _B

Ah, yuck.  I only used those nasty macros in the userspace version of
libfdt_env.h because bytesex.h is such a portability nightmare.  The
kernel already has cpu_to_be{32,64}(), and the fdt byteswapping
functions should just be aliased to them.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
