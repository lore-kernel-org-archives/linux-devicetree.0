From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH RFC 03/13] OF: define of_*_cmp() macros also if CONFIG_OF
 isn't set
Date: Tue, 11 Dec 2012 08:45:09 +0000
Message-ID: <20121211084509.2DEE83E076D@localhost>
References: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
 <1355168499-5847-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355168499-5847-4-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Dec 2012 20:41:29 +0100, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
> 
> of_*_cmp() macros do not depend on any OF functions and can be defined also
> if CONFIG_OF isn't set. Also include linux/string.h, required by those
> macros.

Patch looks fine, but I'd like to know the situation where you found
this problem. Again, anything calling these of_ helpers is probably
CONFIG_OF specific code.

I've resisted doing a blanket add of these helpers outside of CONFIG_OF
exactly because it helps identify CONFIG_OF code that should be compiled
out when CONFIG_OF=n

g.

> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
> ---
>  include/linux/of.h |   15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9ba8cf1..38d4b1a 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -85,6 +85,14 @@ static inline struct device_node *of_node_get(struct device_node *node)
>  static inline void of_node_put(struct device_node *node) { }
>  #endif /* !CONFIG_OF_DYNAMIC */
>  
> +/* Default string compare functions, Allow arch asm/prom.h to override */
> +#if !defined(of_compat_cmp)
> +#include <linux/string.h>
> +#define of_compat_cmp(s1, s2, l)	strcasecmp((s1), (s2))
> +#define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
> +#define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
> +#endif
> +
>  #ifdef CONFIG_OF
>  
>  /* Pointer for first entry in chain of all nodes. */
> @@ -143,13 +151,6 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
>  #define OF_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>  #endif
>  
> -/* Default string compare functions, Allow arch asm/prom.h to override */
> -#if !defined(of_compat_cmp)
> -#define of_compat_cmp(s1, s2, l)	strcasecmp((s1), (s2))
> -#define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
> -#define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
> -#endif
> -
>  /* flag descriptions */
>  #define OF_DYNAMIC	1 /* node and properties were allocated via kmalloc */
>  #define OF_DETACHED	2 /* node has been detached from the device tree */
> -- 
> 1.7.9.5
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
