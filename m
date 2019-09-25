From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH net] of: mdio: Fix a signedness bug in
 of_phy_get_and_connect()
Date: Wed, 25 Sep 2019 14:01:00 +0300
Message-ID: <20190925110100.GL3264@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Dongpo Li <lidongpo@hisilicon.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The "iface" variable is an enum and in this context GCC treats it as
an unsigned int so the error handling is never triggered.

Fixes: b78624125304 ("of_mdio: Abstract a general interface for phy connect")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/of/of_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 000b95787df1..bd6129db6417 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -362,7 +362,7 @@ struct phy_device *of_phy_get_and_connect(struct net_device *dev,
 	int ret;
 
 	iface = of_get_phy_mode(np);
-	if (iface < 0)
+	if ((int)iface < 0)
 		return NULL;
 	if (of_phy_is_fixed_link(np)) {
 		ret = of_phy_register_fixed_link(np);
-- 
2.20.1
