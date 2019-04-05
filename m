From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v4 2/5] phy: core: Invoke pm_runtime_get_*/pm_runtime_put_* before invoking reset callback
Date: Fri, 5 Apr 2019 16:38:31 +0530
Message-ID: <20190405110834.13083-3-kishon@ti.com>
References: <20190405110834.13083-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405110834.13083-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, rogerq@ti.com
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PHY drivers may try to access PHY registers in the ->reset() callback.
Invoke phy_pm_runtime_get_sync() before invoking the ->reset() callback
so that the PHY drivers don't have to enable clocks by themselves before
accessing PHY registers.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/phy/phy-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index b9a4ebf35dd3..c147ba843f0b 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -384,10 +384,16 @@ int phy_reset(struct phy *phy)
 	if (!phy || !phy->ops->reset)
 		return 0;
 
+	ret = phy_pm_runtime_get_sync(phy);
+	if (ret < 0 && ret != -ENOTSUPP)
+		return ret;
+
 	mutex_lock(&phy->mutex);
 	ret = phy->ops->reset(phy);
 	mutex_unlock(&phy->mutex);
 
+	phy_pm_runtime_put(phy);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(phy_reset);
-- 
2.17.1
