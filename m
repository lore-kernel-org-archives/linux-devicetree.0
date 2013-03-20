From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] net: ethernet: davinci_emac: make local function
 emac_poll_controller() static
Date: Wed, 20 Mar 2013 23:01:45 +0800
Message-ID: <CAPgLHd8=u1jepO+Z0HExYyyybaYtVcdqk0yhtmnLUieUhEGLTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, davem@davemloft.net, mugunthanvnm@ti.com, jiri@resnulli.us, agust@denx.de, bhutchings@solarflare.com
Cc: yongjun_wei@trendmicro.com.cn, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

emac_poll_controller() was not declared. It should be static.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/net/ethernet/ti/davinci_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index ae1b77a..e38e3d8 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -1438,7 +1438,7 @@ static int emac_poll(struct napi_struct *napi, int budget)
  * Polled functionality used by netconsole and others in non interrupt mode
  *
  */
-void emac_poll_controller(struct net_device *ndev)
+static void emac_poll_controller(struct net_device *ndev)
 {
 	struct emac_priv *priv = netdev_priv(ndev);
 
