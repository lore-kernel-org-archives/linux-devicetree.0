From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] net: mdio: of: of_find_mii_timestamper() can be static
Date: Sat, 1 Jun 2019 01:24:01 +0800
Message-ID: <20190531172401.GA73874@lkp-kbuild06>
References: <a375c2b73288184fe86155707ba150daaf946943.1559281985.git.richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a375c2b73288184fe86155707ba150daaf946943.1559281985.git.richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: kbuild-all@01.org, netdev@vger.kernel.org, David Miller <davem@davemloft.net>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org


Fixes: 500a41a402da ("net: mdio: of: Register discovered MII time stampers.")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 of_mdio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 255f47d..1251d73 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -43,7 +43,7 @@ static int of_get_phy_id(struct device_node *device, u32 *phy_id)
 	return -EINVAL;
 }
 
-struct mii_timestamper *of_find_mii_timestamper(struct device_node *node)
+static struct mii_timestamper *of_find_mii_timestamper(struct device_node *node)
 {
 	struct of_phandle_args arg;
 	int err;
