From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 06/18] ARM: imx: clk-gate2: allow custom gate configuration
Date: Wed,  9 Mar 2016 18:16:47 -0800
Message-ID: <1457576219-7971-7-git-send-email-stefan@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457576219-7971-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, sergeimir@emcraft.com, kernel@pengutronix.de, galak@codeaurora.org, tglx@linutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The 2-bit gates found i.MX and Vybrid SoC support different clock
configuration:

0b00: clk disabled
0b01: clk enabled in RUN mode but disabled in WAIT and STOP mode
0b10: clk enabled in RUN, WAIT and STOP mode (only Vybrid)
0b11: clk enabled in RUN and WAIT mode

For some clocks, we might want to configure different behaviour,
e.g. a memory clock should be on even in STOP mode. Add a new
function imx_clk_gate2_cgr which allow to configure specific
gate values through the cgr_val parameter.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/clk/imx/clk-gate2.c |  7 +++++--
 drivers/clk/imx/clk.h       | 13 ++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index 8935bff..db44a19 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -31,6 +31,7 @@ struct clk_gate2 {
 	struct clk_hw hw;
 	void __iomem	*reg;
 	u8		bit_idx;
+	u8		cgr_val;
 	u8		flags;
 	spinlock_t	*lock;
 	unsigned int	*share_count;
@@ -50,7 +51,8 @@ static int clk_gate2_enable(struct clk_hw *hw)
 		goto out;
 
 	reg = readl(gate->reg);
-	reg |= 3 << gate->bit_idx;
+	reg &= ~(3 << gate->bit_idx);
+	reg |= gate->cgr_val << gate->bit_idx;
 	writel(reg, gate->reg);
 
 out:
@@ -125,7 +127,7 @@ static struct clk_ops clk_gate2_ops = {
 
 struct clk *clk_register_gate2(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
-		void __iomem *reg, u8 bit_idx,
+		void __iomem *reg, u8 bit_idx, u8 cgr_val,
 		u8 clk_gate2_flags, spinlock_t *lock,
 		unsigned int *share_count)
 {
@@ -140,6 +142,7 @@ struct clk *clk_register_gate2(struct device *dev, const char *name,
 	/* struct clk_gate2 assignments */
 	gate->reg = reg;
 	gate->bit_idx = bit_idx;
+	gate->cgr_val = cgr_val;
 	gate->flags = clk_gate2_flags;
 	gate->lock = lock;
 	gate->share_count = share_count;
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index c94ac5c..9311755 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -41,7 +41,7 @@ struct clk *imx_clk_pllv3(enum imx_pllv3_type type, const char *name,
 
 struct clk *clk_register_gate2(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
-		void __iomem *reg, u8 bit_idx,
+		void __iomem *reg, u8 bit_idx, u8 cgr_val,
 		u8 clk_gate_flags, spinlock_t *lock,
 		unsigned int *share_count);
 
@@ -55,7 +55,7 @@ static inline struct clk *imx_clk_gate2(const char *name, const char *parent,
 		void __iomem *reg, u8 shift)
 {
 	return clk_register_gate2(NULL, name, parent, CLK_SET_RATE_PARENT, reg,
-			shift, 0, &imx_ccm_lock, NULL);
+			shift, 0x3, 0, &imx_ccm_lock, NULL);
 }
 
 static inline struct clk *imx_clk_gate2_shared(const char *name,
@@ -63,7 +63,14 @@ static inline struct clk *imx_clk_gate2_shared(const char *name,
 		unsigned int *share_count)
 {
 	return clk_register_gate2(NULL, name, parent, CLK_SET_RATE_PARENT, reg,
-			shift, 0, &imx_ccm_lock, share_count);
+			shift, 0x3, 0, &imx_ccm_lock, share_count);
+}
+
+static inline struct clk *imx_clk_gate2_cgr(const char *name, const char *parent,
+		void __iomem *reg, u8 shift, u8 cgr_val)
+{
+	return clk_register_gate2(NULL, name, parent, CLK_SET_RATE_PARENT, reg,
+			shift, cgr_val, 0, &imx_ccm_lock, NULL);
 }
 
 struct clk *imx_clk_pfd(const char *name, const char *parent_name,
-- 
2.7.2
