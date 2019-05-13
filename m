From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] of_net: Fix missing of_find_device_by_node ref count drop
Date: Mon, 13 May 2019 11:41:39 +0200
Message-ID: <1557740500-2479-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

of_find_device_by_node takes a reference to the embedded struct device
which needs to be dropped after use.

Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/of/of_net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index a4b392a5406b..6f1be80e8c4e 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -60,10 +60,13 @@ static const void *of_get_mac_addr_nvmem(struct device_node *np)
 		return ERR_PTR(-ENODEV);
 
 	ret = nvmem_get_mac_address(&pdev->dev, &nvmem_mac);
-	if (ret)
+	if (ret) {
+		put_device(&pdev->dev);
 		return ERR_PTR(ret);
+	}
 
 	mac = devm_kmemdup(&pdev->dev, nvmem_mac, ETH_ALEN, GFP_KERNEL);
+	put_device(&pdev->dev);
 	if (!mac)
 		return ERR_PTR(-ENOMEM);
 
-- 
1.9.1
