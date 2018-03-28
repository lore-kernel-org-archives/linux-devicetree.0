From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 11/13] staging: typec: tcpci: keep the not connecting cc
 line open
Date: Thu, 29 Mar 2018 00:06:16 +0800
Message-ID: <1522253178-32414-12-git-send-email-jun.li@nxp.com>
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

While set polarity, we should keep the not connecting cc line to be
open.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/staging/typec/tcpci.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index d5b4e4e..b58bd59 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -185,15 +185,25 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			      enum typec_cc_polarity polarity)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	unsigned int reg;
 	int ret;
 
-	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
-			   (polarity == TYPEC_POLARITY_CC2) ?
-			   TCPC_TCPC_CTRL_ORIENTATION : 0);
+	/* Keep the disconnect cc line open */
+	ret = regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	if (polarity == TYPEC_POLARITY_CC2)
+		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT;
+	else
+		reg |= TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT;
+	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
+			   (polarity == TYPEC_POLARITY_CC2) ?
+			   TCPC_TCPC_CTRL_ORIENTATION : 0);
 }
 
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
-- 
2.7.4
