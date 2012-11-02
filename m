From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc/gianfar: fix ethernet cannot work after restoring
 from hibernation
Date: Fri, 2 Nov 2012 09:52:05 +0800
Message-ID: <1351821125-9821-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: kumar.gala-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

we should make sure a ethernet has been taken down when system into hibernation
status. when the system restoring form hibernation, the ethernet cannot be
taken up.
eg:
~# ifconfig eth0 down
~# echo disk > /sys/power/state

hibernation restore

~# ifconfig eth0 up
SIOCSIFFLAGS: No such device

Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/net/ethernet/freescale/gianfar.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index 4605f72..487b944 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -1345,8 +1345,11 @@ static int gfar_restore(struct device *dev)
 	struct gfar_private *priv = dev_get_drvdata(dev);
 	struct net_device *ndev = priv->ndev;
 
-	if (!netif_running(ndev))
+	if (!netif_running(ndev)) {
+		netif_device_attach(ndev);
+
 		return 0;
+	}
 
 	gfar_init_bds(ndev);
 	init_registers(ndev);
-- 
1.7.5.1
