From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: sunxi: gmac-tx-clk mux is not a
 CLK_MUX_INDEX_BIT mux
Date: Sun, 16 Nov 2014 13:56:57 +0100
Message-ID: <1416142617-4094-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBLN6UKRQKGQE6PQEDDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A CLK_MUX_INDEX_BIT mux has one bit per parent, but the sun7i-a20-gmac-clk
has 2 bits selecting between 3 possible parents using values of 0, 1, 2,
which makes it a regular mux which should not have CLK_MUX_INDEX_BIT set in
its flag.

However we do not support parent 1 (an external clock), so use a table to
select parent 0 or 2, which are the 2 parents we support.

Note this has not been causing any issues sofar, because we start with a
parent setting of parent 0, and only ever re-parent to parent 2 (for which
we use an index of 1 as we skip parent 1) and with CLK_MUX_INDEX_BIT set
we write a value of 2 for index 1.

Tested on both a cubietruck (which uses rgmii mode) as well as a cs908
(an a31s board which uses mii mode).

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/sunxi/clk-a20-gmac.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-a20-gmac.c b/drivers/clk/sunxi/clk-a20-gmac.c
index 5296fd6..0dcf4f2 100644
--- a/drivers/clk/sunxi/clk-a20-gmac.c
+++ b/drivers/clk/sunxi/clk-a20-gmac.c
@@ -53,6 +53,11 @@ static DEFINE_SPINLOCK(gmac_lock);
 #define SUN7I_A20_GMAC_MASK	0x3
 #define SUN7I_A20_GMAC_PARENTS	2
 
+static u32 sun7i_a20_gmac_mux_table[SUN7I_A20_GMAC_PARENTS] = {
+	0x00, /* Select mii_phy_tx_clk */
+	0x02, /* Select gmac_int_tx_clk */
+};
+
 static void __init sun7i_a20_gmac_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
@@ -90,7 +95,7 @@ static void __init sun7i_a20_gmac_clk_setup(struct device_node *node)
 	gate->lock = &gmac_lock;
 	mux->reg = reg;
 	mux->mask = SUN7I_A20_GMAC_MASK;
-	mux->flags = CLK_MUX_INDEX_BIT;
+	mux->table = sun7i_a20_gmac_mux_table;
 	mux->lock = &gmac_lock;
 
 	clk = clk_register_composite(NULL, clk_name,
-- 
2.1.0
