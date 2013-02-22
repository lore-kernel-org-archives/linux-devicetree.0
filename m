From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] thermal: rcar: fix missing unlock on error in rcar_thermal_update_temp()
Date: Fri, 22 Feb 2013 12:50:42 +0800
Message-ID: <CAPgLHd_a8ujLyz_v+zRq00HAfKYibFd=Dq7dZfP9nCcGP=PC2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: rui.zhang@intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, kuninori.morimoto.gx@renesas.com
Cc: yongjun_wei@trendmicro.com.cn, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add the missing unlock before return from function rcar_thermal_update_temp()
in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/thermal/rcar_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 909bb4b..fe694be 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -174,6 +174,7 @@ static int rcar_thermal_update_temp(struct rcar_thermal_priv *priv)
 
 	if (!ctemp) {
 		dev_err(dev, "thermal sensor was broken\n");
+		mutex_unlock(&priv->lock);
 		return -EINVAL;
 	}
 


