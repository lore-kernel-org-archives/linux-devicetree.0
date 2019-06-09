From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC next v1 1/5] net: stmmac: drop redundant check in stmmac_mdio_reset
Date: Sun,  9 Jun 2019 20:06:17 +0200
Message-ID: <20190609180621.7607-2-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: devicetree@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

A simplified version of the existing code looks like this:
  if (priv->device->of_node) {
      struct device_node *np = priv->device->of_node;
      if (!np)
          return 0;

The second "if" never evaluates to true because the first "if" checks
for exactly the opposite.
Drop the redundant check and early return to make the code easier to
understand.

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 093a223fe408..cb9aad090cc9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -254,9 +254,6 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (data->reset_gpio < 0) {
 			struct device_node *np = priv->device->of_node;
 
-			if (!np)
-				return 0;
-
 			data->reset_gpio = of_get_named_gpio(np,
 						"snps,reset-gpio", 0);
 			if (data->reset_gpio < 0)
-- 
2.21.0
