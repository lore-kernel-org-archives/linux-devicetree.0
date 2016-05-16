From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] of: unittest: hashed phandles unitest
Date: Mon, 16 May 2016 14:38:27 -0500
Message-ID: <CAL_Jsq+=w1zo=QUWV3iMv=mpMTb+JtRFSPStrpd=3x67fte3rA@mail.gmail.com>
References: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com> <1463417556-23087-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463417556-23087-4-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 11:52 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Add a benchmarking hashed phandles unittest which report what kind
> of speed up we get switching to hashed phandle lookups.
>
>  ### dt-test ### the hash method is 8.2 times faster than the original
>
> On the beaglebone we perform about 1877 phandle lookups until that
> point in the unittest. Each non-hashed lookup takes about 23us when
> the cash is hot, while the hash lookup takes about 3us.
>
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
> +       ktime_t start, end;
> +       s64 dur[2];
> +       int dec, frac;
> +
> +       /* test only available when hashing is available */
> +       if (!of_phandle_ht_available()) {
> +               pr_warn("phandle hash test requires hash to be initialized\n");
> +               return;

As the point of the unittest is to test the core DT code, this should
be a test fail.

> +       }
> +
> +       /* find the maximum phandle of the tree */
> +       raw_spin_lock_irqsave(&devtree_lock, flags);
> +       max_phandle = 0;
> +       total = 0;
> +       for_each_of_allnodes(node) {
> +               if (node->phandle != (phandle)-1U &&
> +                               node->phandle > max_phandle)
> +                       max_phandle = node->phandle;
> +               total++;
> +       }
> +       raw_spin_unlock_irqrestore(&devtree_lock, flags);
> +       max_phandle++;
> +
> +       pr_debug("phandle: max-phandle #%u, #%d total nodes\n",
> +                       (u32)max_phandle, total);
> +
> +       /* perform random lookups using the hash */
> +       for (j = 0; j < 2; j++) {
> +
> +               /* disabled for pass #0, enabled for pass #1 */
> +               of_phandle_ht_is_disabled = j == 0;

I'm not wild about having this variable leaked from the core code just
for the unit test. Yet another step away from the unittest being a
module.

I think you should just measure current performance and users can
revert the hash table if they want to measure the slow path.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
