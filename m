From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [GIT PULL] Improve cp110 clk support on Marvell Armada 7K/8K
Date: Mon, 19 Jun 2017 17:18:53 -0700
Message-ID: <20170620001853.GT20170@codeaurora.org>
References: <pull.28a1be390fb082d60e88c3234dd7d76fb61438b6.1497886602.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <pull.28a1be390fb082d60e88c3234dd7d76fb61438b6.1497886602.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/19, Gregory CLEMENT wrote:
> 
> Hi Mike, Stephen,
> 
> This time I turned the series in a pull request so I removed the
> device tree binding part which will be in an other series for Rob
> Herring and I also removed the dt part that I will take care of once
> you will have pulled this one.
> 
> I hope this will be easier for you to apply this way.
> 

Ok. It wasn't clear what was going on and I forgot to ask in the
lastest patch series. Pulled into clk-next, but I had to apply
this patch on top:

---8<----
From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH] clk: mvebu: cp110: Minor cleanups

Mark an array of strings static const and remove the dereference
of a function pointer when assigning to the platform driver probe
struct member.

drivers/clk/mvebu/cp110-system-controller.c:89:12:
warning: symbol 'gate_base_names' was not declared. Should it be static?
drivers/clk/mvebu/cp110-system-controller.c:447:18:
error: cannot dereference this type

Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/mvebu/cp110-system-controller.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index b034b79345ec..ca9a0a536174 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -86,7 +86,7 @@ enum {
 #define CP110_GATE_EIP150		25
 #define CP110_GATE_EIP197		26
 
-const char *gate_base_names[] = {
+static const char * const gate_base_names[] = {
 	[CP110_GATE_AUDIO]	= "audio",
 	[CP110_GATE_COMM_UNIT]	= "communit",
 	[CP110_GATE_NAND]	= "nand",
@@ -437,14 +437,13 @@ static int cp110_clk_probe(struct platform_device *pdev)
 	return cp110_syscon_common_probe(pdev, pdev->dev.of_node->parent);
 }
 
-
 static const struct of_device_id cp110_syscon_legacy_of_match[] = {
 	{ .compatible = "marvell,cp110-system-controller0", },
 	{ }
 };
 
 static struct platform_driver cp110_syscon_legacy_driver = {
-	.probe = *cp110_syscon_legacy_clk_probe,
+	.probe = cp110_syscon_legacy_clk_probe,
 	.driver		= {
 		.name	= "marvell-cp110-system-controller0",
 		.of_match_table = cp110_syscon_legacy_of_match,
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
