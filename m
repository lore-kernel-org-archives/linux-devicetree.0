From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [RESEND PATCH v2 04/13] drivers: clk: st: Add clock propagation for
 audio clocks
Date: Thu, 16 Jun 2016 11:20:24 +0200
Message-ID: <1466068833-5055-5-git-send-email-gabriel.fernandez@linaro.org>
References: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466068833-5055-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, vincent.abriou@st.com, arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org, gabriel.fernandez@st.com, Peter Griffin <peter.griffin@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

This patch allows fine tuning of the quads FS for audio clocks
accuracy.

Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 .../devicetree/bindings/clock/st/st,flexgen.txt    |  2 ++
 drivers/clk/st/clk-flexgen.c                       | 24 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
index b7ee5c7..d68f6a5f 100644
--- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
@@ -60,6 +60,8 @@ This binding uses the common clock binding[2].
 Required properties:
 - compatible : shall be:
   "st,flexgen"
+  "st,flexgen-audio", "st,flexgen" (enable clock propagation on parent for
+  audio use case)
 
 - #clock-cells : from common clock binding; shall be set to 1 (multiple clock
   outputs).
diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 627267c..33d6ced 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -15,6 +15,10 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
+struct clkgen_data {
+	unsigned long flags;
+};
+
 struct flexgen {
 	struct clk_hw hw;
 
@@ -259,6 +263,18 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
 	return parents;
 }
 
+static const struct clkgen_data clkgen_audio = {
+	.flags = CLK_SET_RATE_PARENT,
+};
+
+static const struct of_device_id flexgen_of_match[] = {
+	{
+		.compatible = "st,flexgen-audio",
+		.data = &clkgen_audio,
+	},
+	{}
+};
+
 static void __init st_of_flexgen_setup(struct device_node *np)
 {
 	struct device_node *pnode;
@@ -267,6 +283,8 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	const char **parents;
 	int num_parents, i;
 	spinlock_t *rlock = NULL;
+	const struct of_device_id *match;
+	struct clkgen_data *data = NULL;
 	unsigned long flex_flags = 0;
 	int ret;
 
@@ -282,6 +300,12 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	if (!parents)
 		return;
 
+	match = of_match_node(flexgen_of_match, np);
+	if (match) {
+		data = (struct clkgen_data *)match->data;
+		flex_flags = data->flags;
+	}
+
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
 		goto err;
-- 
1.9.1
