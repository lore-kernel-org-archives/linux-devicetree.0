From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 19/22] phy: core: Probe phy providers on demand
Date: Tue, 28 Jul 2015 15:19:50 +0200
Message-ID: <1438089593-7696-20-git-send-email-tomeu.vizoso@collabora.com>
References: <1438089593-7696-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1438089593-7696-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-arm-kernel@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-acpi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

When looking up a phy provider through its firmware node, probe it if it
hasn't already.

The goal is to reduce deferred probes to a minimum, as it makes it very
cumbersome to find out why a device failed to probe, and can introduce
very big delays in when a critical device is probed.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

Changes in v2: None

 drivers/phy/phy-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index fc48fac003a6..c27e7d3d86ee 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -363,6 +363,8 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	if (ret)
 		return ERR_PTR(-ENODEV);
 
+	fwnode_ensure_device(&args.np->fwnode);
+
 	mutex_lock(&phy_provider_mutex);
 	phy_provider = of_phy_provider_lookup(args.np);
 	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
-- 
2.4.3

