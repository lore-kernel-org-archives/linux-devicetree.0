From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: Provide dummy of_clk_get_from_provider() for compile-testing
Date: Fri, 28 Apr 2017 15:08:53 +0200
Message-ID: <1493384933-31297-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

When CONFIG_ON=n, dummies are provided for of_clk_get() and
of_clk_get_by_name(), but not for of_clk_get_from_provider().

Provide a dummy for the latter, to improve the ability to do
compile-testing.  This requires removing the existing dummy in the
Lantiq clock code.

Fixes: 766e6a4ec602d0c1 ("clk: add DT clock binding support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Remove conflicting dummy in Lantiq clock code (reported by 0day).
---
 arch/mips/lantiq/clk.c | 5 -----
 include/linux/clk.h    | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/lantiq/clk.c b/arch/mips/lantiq/clk.c
index 149f0513c4f5d0d4..a263d1b751ffe48d 100644
--- a/arch/mips/lantiq/clk.c
+++ b/arch/mips/lantiq/clk.c
@@ -160,11 +160,6 @@ void clk_deactivate(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_deactivate);
 
-struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
-{
-	return NULL;
-}
-
 static inline u32 get_counter_resolution(void)
 {
 	u32 res;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index e9d36b3e49de5b1b..3ed97abb5cbb7f94 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -539,6 +539,10 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
 {
 	return ERR_PTR(-ENOENT);
 }
+static inline struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
+{
+	return ERR_PTR(-ENOENT);
+}
 #endif
 
 #endif
-- 
2.7.4
