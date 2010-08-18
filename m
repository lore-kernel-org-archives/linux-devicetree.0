From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 02/14] ARM: vexpress: fix clocks definition to comply with
	new framework
Date: Wed, 18 Aug 2010 19:59:48 +0100
Message-ID: <1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-2-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The new clock infrastructure introduced within the DT series of patches
slightly changed how clocks are declared and initialized. Some clock
definitions become platform specific.

This patch fixes some typos on ARM Versatile Express clock definition
and initialization that caused compile time errors.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-vexpress/include/mach/clkdev.h |    2 +-
 arch/arm/mach-vexpress/v2m.c                 |   13 ++++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-vexpress/include/mach/clkdev.h b/arch/arm/mach-vexpress/include/mach/clkdev.h
index ad3f6e7..9e23cac 100644
--- a/arch/arm/mach-vexpress/include/mach/clkdev.h
+++ b/arch/arm/mach-vexpress/include/mach/clkdev.h
@@ -9,7 +9,7 @@ struct clk_v2m {
 	u32		config;
 };
 
-const struct clk_ops clk_v2m_ops;
+extern const struct clk_ops clk_v2m_ops;
 
 #define INIT_CLK_V2M(r,c) { .clk = INIT_CLK(clk_v2m_ops), \
 	.rate = r, .config = c }
diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index f22e272..06d6914 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -285,12 +285,21 @@ static int clk_v2m_set_rate(struct clk *_clk, unsigned long rate)
 	struct clk_v2m *clk = to_clk_v2m(_clk);
 	int ret;
 
-	ret = v2m_cfg_write(clk->cofig, rate);
+	ret = v2m_cfg_write(clk->config, rate);
 	if (!ret)
 		clk->rate = rate;
 	return ret;
 }
 
+static void clk_v2m_put(struct clk *_clk)
+{
+}
+
+static int clk_v2m_get(struct clk *_clk)
+{
+	return 1;
+}
+
 static unsigned long clk_v2m_get_rate(struct clk *clk)
 {
 	return to_clk_v2m(clk)->rate;
@@ -300,6 +309,8 @@ const struct clk_ops clk_v2m_ops = {
 	.round_rate = clk_v2m_round_rate,
 	.get_rate = clk_v2m_get_rate,
 	.set_rate = clk_v2m_set_rate,
+	.get = clk_v2m_get,
+	.put = clk_v2m_put,
 };
 
 static struct clk_v2m osc1_clk =
-- 
1.6.3.3
