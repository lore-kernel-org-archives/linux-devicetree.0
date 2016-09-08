From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 1/8] clk: sunxi-ng: div: Add mux table macros
Date: Thu,  8 Sep 2016 11:48:36 +0200
Message-ID: <20160908094843.14710-2-maxime.ripard@free-electrons.com>
References: <20160908094843.14710-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160908094843.14710-1-maxime.ripard@free-electrons.com>
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

Add some macros to ease the declaration of clocks that are using them.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_div.h | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index 5d98549e23a6..a5c9eaf90e84 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -77,13 +77,16 @@ struct ccu_div {
 				      _shift, _width, _table, 0,	\
 				      _flags)
 
-#define SUNXI_CCU_M_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				  _mshift, _mwidth, _muxshift, _muxwidth, \
-				  _gate, _flags)			\
+#define SUNXI_CCU_M_WITH_MUX_TABLE_GATE(_struct, _name,			\
+					_parents, _table,		\
+					_reg,				\
+					_mshift, _mwidth,		\
+					_muxshift, _muxwidth,		\
+					_gate, _flags)			\
 	struct ccu_div _struct = {					\
 		.enable	= _gate,					\
 		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
-		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.mux	= _SUNXI_CCU_MUX_TABLE(_muxshift, _muxwidth, _table), \
 		.common	= {						\
 			.reg		= _reg,				\
 			.hw.init	= CLK_HW_INIT_PARENTS(_name,	\
@@ -93,12 +96,23 @@ struct ccu_div {
 		},							\
 	}
 
+#define SUNXI_CCU_M_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				  _mshift, _mwidth, _muxshift, _muxwidth, \
+				  _gate, _flags)			\
+	SUNXI_CCU_M_WITH_MUX_TABLE_GATE(_struct, _name,			\
+					_parents, NULL,			\
+					_reg, _mshift, _mwidth,		\
+					_muxshift, _muxwidth,		\
+					_gate, _flags)
+
 #define SUNXI_CCU_M_WITH_MUX(_struct, _name, _parents, _reg,		\
 			     _mshift, _mwidth, _muxshift, _muxwidth,	\
 			     _flags)					\
-	SUNXI_CCU_M_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				  _mshift, _mwidth, _muxshift, _muxwidth, \
-				  0, _flags)
+	SUNXI_CCU_M_WITH_MUX_TABLE_GATE(_struct, _name,			\
+					_parents, NULL,			\
+					_reg, _mshift, _mwidth,		\
+					_muxshift, _muxwidth,		\
+					0, _flags)
 
 
 #define SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
-- 
2.9.3
