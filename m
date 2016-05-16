From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 3/5] of: unittest: hashed phandles unitest
Date: Mon, 16 May 2016 21:04:55 +0200
Message-ID: <CAMuHMdWg=Cp8doe3ZC1qiSdY4AzPOknxkNpw_tow_mGhXgzaOA@mail.gmail.com>
References: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1463417556-23087-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463417556-23087-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 6:52 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a benchmarking hashed phandles unittest which report what kind
> of speed up we get switching to hashed phandle lookups.
>
>  ### dt-test ### the hash method is 8.2 times faster than the original
>
> On the beaglebone we perform about 1877 phandle lookups until that
> point in the unittest. Each non-hashed lookup takes about 23us when
> the cash is hot, while the hash lookup takes about 3us.

cache

> For those 1877 lookup we get a speedup in the boot sequence of
> 1877 * (23 - 3) = 37.5ms, which is not spectacular but there's no
> point in wasting cycles and energy.
>
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/unittest.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 7ea3689..59cad84 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -25,6 +25,9 @@
>
>  #include <linux/bitops.h>
>
> +#include <linux/timekeeping.h>
> +#include <linux/random.h>
> +
>  #include "of_private.h"
>
>  static struct unittest_results {
> @@ -2266,6 +2269,70 @@ out:
>  static inline void __init of_unittest_overlay(void) { }
>  #endif
>
> +#define PHANDLE_LOOKUPS        1000
> +
> +static void __init of_unittest_phandle_hash(void)
> +{
> +       struct device_node *node;
> +       phandle max_phandle;
> +       u32 ph;
> +       unsigned long flags;
> +       int i, j, total;

unsigned int

> +       ktime_t start, end;
> +       s64 dur[2];

No idea why ktime_to_us() returns s64 i.s.o. u64...

> +       int dec, frac;

unsigned int?

> +       /* test only available when hashing is available */
> +       if (!of_phandle_ht_available()) {
> +               pr_warn("phandle hash test requires hash to be initialized\n");
> +               return;
> +       }
> +
> +       /* find the maximum phandle of the tree */
> +       raw_spin_lock_irqsave(&devtree_lock, flags);
> +       max_phandle = 0;
> +       total = 0;
> +       for_each_of_allnodes(node) {
> +               if (node->phandle != (phandle)-1U &&

Drop the "U" suffix?

> +                               node->phandle > max_phandle)
> +                       max_phandle = node->phandle;
> +               total++;
> +       }
> +       raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       max_phandle++;
> +
> +       pr_debug("phandle: max-phandle #%u, #%d total nodes\n",
> +                       (u32)max_phandle, total);

phandle is already u32, so no need for the cast.

> +
> +       /* perform random lookups using the hash */
> +       for (j = 0; j < 2; j++) {
> +
> +               /* disabled for pass #0, enabled for pass #1 */
> +               of_phandle_ht_is_disabled = j == 0;
> +
> +               start = ktime_get_raw();
> +               for (i = 0; i < PHANDLE_LOOKUPS; i++) {
> +                       ph = prandom_u32() % max_phandle;
> +                       node = of_find_node_by_phandle(ph);
> +                       of_node_put(node);
> +               }
> +               end = ktime_get_raw();
> +
> +               dur[j] = ktime_to_us(end) - ktime_to_us(start);
> +               pr_debug("#%d lookups in %lld us (%s)\n",

$u

> +                               PHANDLE_LOOKUPS, dur[j],
> +                               j == 0 ? "original" : "hashed");
> +       }
> +
> +       unittest(dur[0] > dur[1], "Non hashing phandles are faster!?");
> +
> +       dec = (int)div64_s64(dur[0] * 10 + 5, dur[1]);

I'd expect div64_u64(), if not for ktime_to_us() returning s64...

> +       frac = dec % 10;
> +       dec /= 10;
> +       pr_info("the hash method is %d.%d times faster than the original\n",

%u.%u once dec and frac are unsigned.

> +                       dec, frac);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
