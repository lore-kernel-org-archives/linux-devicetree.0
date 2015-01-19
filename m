From: Romain Perier <romain.perier@gmail.com>
Subject: [PATCH v1 1/4] net: stmmac: dwmac-rk: Don't set the regulator voltage for phy from the driver
Date: Mon, 19 Jan 2015 18:08:06 +0000
Message-ID: <1421690889-11901-2-git-send-email-romain.perier@gmail.com>
References: <1421690889-11901-1-git-send-email-romain.perier@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1421690889-11901-1-git-send-email-romain.perier@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: peppe.cavallaro@st.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, roger.chen@rock-chips.com
List-Id: devicetree@vger.kernel.org

As these settings can be directly expressed from devicetree for both fixed
regulators and pmic-integrated regulators, it is more standard to set them
from dts and let the regulator framework use the right voltage informations
when it is used in the driver.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 35f9b86..06e1637 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -303,7 +303,6 @@ static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 	} else {
 		if (enable) {
 			if (!regulator_is_enabled(ldo)) {
-				regulator_set_voltage(ldo, 3300000, 3300000);
 				ret = regulator_enable(ldo);
 				if (ret != 0)
 					dev_err(dev, "%s: fail to enable %s\n",
-- 
1.9.1
