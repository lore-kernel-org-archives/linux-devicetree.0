From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 2/8] clk: sunxi-ng: div: Add kerneldoc for the _ccu_div
 structure
Date: Thu,  8 Sep 2016 11:48:37 +0200
Message-ID: <20160908094843.14710-3-maxime.ripard@free-electrons.com>
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

The internal _ccu_div structure is meant to be embedded into other
structures to combine the various dividers and to form the clock classes
support.

Start to document those structures by using kerneldoc.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi-ng/ccu_div.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index a5c9eaf90e84..e1b1326e68a1 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -19,6 +19,20 @@
 #include "ccu_common.h"
 #include "ccu_mux.h"
 
+/**
+ * struct _ccu_div - Internal divider description
+ * @shift: Bit offset of the divider in its register
+ * @width: Width of the divider field in its register
+ * @flags: clk_divider flags to apply on this divider
+ * @table: Divider table pointer (if applicable)
+ *
+ * That structure represents a single divider, and is meant to be
+ * embedded in other structures representing the various clock
+ * classes.
+ *
+ * It is basically a wrapper around the clk_divider functions
+ * arguments.
+ */
 struct _ccu_div {
 	u8			shift;
 	u8			width;
-- 
2.9.3
