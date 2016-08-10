From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v9 01/10] clk: fix initial state of critical clock's
 parents
Date: Wed, 10 Aug 2016 14:09:22 -0700
Message-ID: <20160810210922.GD2996@codeaurora.org>
References: <1466581229-2342-1-git-send-email-erin.lo@mediatek.com>
 <1466581229-2342-2-git-send-email-erin.lo@mediatek.com>
 <20160702012140.GB17071@codeaurora.org>
 <1467604308.26485.4.camel@mtksdaap41>
 <146802073038.73491.6675612765998057903@resonance>
 <1468225452.31247.7.camel@mtksdaap41>
 <1470203182.17063.3.camel@mtksdaap41>
 <1470721183.8551.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470721183.8551.6.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

(Including lists)

On 08/09, James Liao wrote:
> On Wed, 2016-08-03 at 13:46 +0800, James Liao wrote:
>>
>> Hi Mike,
>>
>> Do you have new patches to fix new clock parents? If not, I think we can
>> use my patch first. Is it okay?
>>
>
> Hi Stephen,
>
> Do you have comments for the bug fixing? I prefer to use my patch (clk:
> fix initial state of critical clock's parents). How do you think?
>

How about we recalc accuracies and rates in addition to the patch
from Mike? That will fix everything?

---8<----
From: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] clk: migrate ref counts when orphans are reunited

It's always nice to see families reunited, and this is equally true when
talking about parent clocks and their children. However, if the orphan
clk had a positive prepare_count or enable_count, then we would not
migrate those counts up the parent chain correctly.

This has manifested with the recent critical clocks feature, which often
enables clocks very early, before their parents have been registered.

Fixed by replacing the call to clk_core_reparent with calls to
__clk_set_parent_{before,after}.

Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
[sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org: Recalc accuracies and rates too]
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 820a939fb6bb..dc3fff2bf839 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2449,8 +2449,16 @@ static int __clk_core_init(struct clk_core *core)
 	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
 		struct clk_core *parent = __clk_init_parent(orphan);
 
-		if (parent)
-			clk_core_reparent(orphan, parent);
+		/*
+		 * we could call __clk_set_parent, but that would result in a
+		 * reducant call to the .set_rate op, if it exists
+		 */
+		if (parent) {
+			__clk_set_parent_before(orphan, parent);
+			__clk_set_parent_after(orphan, parent, NULL);
+			__clk_recalc_accuracies(orphan);
+			__clk_recalc_rates(orphan, 0);
+		}
 	}
 
 	/*
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
