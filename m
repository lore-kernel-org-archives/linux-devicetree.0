From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 3/7] clk: sunxi-ng: mux: Add mux table macro
Date: Tue,  6 Sep 2016 14:18:33 +0200
Message-ID: <20160906121837.7517-4-maxime.ripard@free-electrons.com>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a new macro to declare muxes based on a table and a gate.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mux.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index f5123a1a6603..47aba3a48245 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -43,9 +43,12 @@ struct ccu_mux {
 	struct ccu_common	common;
 };
 
-#define SUNXI_CCU_MUX(_struct, _name, _parents, _reg, _shift, _width, _flags) \
+#define SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, _table,	\
+				     _reg, _shift, _width, _gate,	\
+				     _flags)				\
 	struct ccu_mux _struct = {					\
-		.mux	= _SUNXI_CCU_MUX(_shift, _width),		\
+		.enable	= _gate,					\
+		.mux	= _SUNXI_CCU_MUX_TABLE(_shift, _width, _table),	\
 		.common	= {						\
 			.reg		= _reg,				\
 			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
@@ -57,17 +60,14 @@ struct ccu_mux {
 
 #define SUNXI_CCU_MUX_WITH_GATE(_struct, _name, _parents, _reg,		\
 				_shift, _width, _gate, _flags)		\
-	struct ccu_mux _struct = {					\
-		.enable	= _gate,					\
-		.mux	= _SUNXI_CCU_MUX(_shift, _width),		\
-		.common	= {						\
-			.reg		= _reg,				\
-			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
-							      _parents, \
-							      &ccu_mux_ops, \
-							      _flags),	\
-		}							\
-	}
+	SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, NULL,	\
+				      _reg, _shift, _width, _gate,	\
+				      _flags)
+
+#define SUNXI_CCU_MUX(_struct, _name, _parents, _reg, _shift, _width,	\
+		      _flags)						\
+	SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, NULL,	\
+				      _reg, _shift, _width, 0, _flags)
 
 static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
 {
-- 
2.9.3
