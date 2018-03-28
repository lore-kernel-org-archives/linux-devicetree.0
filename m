From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 12/13] staging: typec: tcpci: Only touch target bit when
 enable vconn
Date: Thu, 29 Mar 2018 00:06:17 +0800
Message-ID: <1522253178-32414-13-git-send-email-jun.li@nxp.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

We need regmap_update_bits to avoid touch any other bits when
enable or disable vconn.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index b58bd59..0d0c971 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -218,12 +218,9 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 			return ret;
 	}
 
-	ret = regmap_write(tcpci->regmap, TCPC_POWER_CTRL,
-			   enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL,
+				TCPC_POWER_CTRL_VCONN_ENABLE,
+				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
 static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
-- 
2.7.4
