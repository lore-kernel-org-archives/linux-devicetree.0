From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/3] mfd: syscon: Add optional clock support
Date: Tue, 27 Nov 2018 17:48:16 +0100
Message-ID: <1543337297-21873-3-git-send-email-fabrice.gasnier@st.com>
References: <1543337297-21873-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543337297-21873-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, fabrice.gasnier@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some system control registers need to be clocked, so the registers can
be accessed. Add an optional clock and attach it to regmap.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/mfd/syscon.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index b6d05cd..a0ba4ff 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -12,6 +12,7 @@
  * (at your option) any later version.
  */
 
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
 #include <linux/io.h>
@@ -45,6 +46,7 @@ struct syscon {
 
 static struct syscon *of_syscon_register(struct device_node *np)
 {
+	struct clk *clk;
 	struct syscon *syscon;
 	struct regmap *regmap;
 	void __iomem *base;
@@ -119,6 +121,18 @@ static struct syscon *of_syscon_register(struct device_node *np)
 		goto err_regmap;
 	}
 
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		/* clock is optional */
+		if (ret != -ENOENT)
+			goto err_clk;
+	} else {
+		ret = regmap_mmio_attach_clk(regmap, clk);
+		if (ret)
+			goto err_attach;
+	}
+
 	syscon->regmap = regmap;
 	syscon->np = np;
 
@@ -128,6 +142,11 @@ static struct syscon *of_syscon_register(struct device_node *np)
 
 	return syscon;
 
+err_attach:
+	if (!IS_ERR(clk))
+		clk_put(clk);
+err_clk:
+	regmap_exit(regmap);
 err_regmap:
 	iounmap(base);
 err_map:
-- 
1.9.1
