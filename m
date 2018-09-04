From: Andre Kalb <Andre.Kalb@sma.de>
Subject: [PATCH v2] of: __of_update_property_sysfs only call
 __of_sysfs_remove_bin_file if of_node_is_attached
Date: Tue, 4 Sep 2018 15:51:15 +0000
Message-ID: <AM6PR04MB52394FDB1266388BCE1374E3FC030@AM6PR04MB5239.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

To prevent warning "kernfs: can not remove '(null)', no directory" if an overlay isn't applied to the active devicetree.

Using of_remove_property and then of_add_property doesn't show the warning.

Signed-off-by: Andre Kalb <Andre.Kalb@sma.de>
---
Changes in v2:
  - Fix typo

 drivers/of/kobj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c index 7a0a18980b98..962b660e8ad1 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -104,7 +104,7 @@ void __of_update_property_sysfs(struct device_node *np, struct property *newprop
                struct property *oldprop)
 {
        /* At early boot, bail out and defer setup to of_init() */
-       if (!of_kset)
+       if (!of_kset || !of_node_is_attached(np))
                return;

        if (oldprop)
--
2.17.1


___________________________________________________

SMA Solar Technology AG
Aufsichtsrat: Dr. Erik Ehrentraut (Vorsitzender)
Vorstand: Ulrich Hadding, Dr.-Ing. Juergen Reinert, Pierre-Pascal Urbon
Handelsregister: Amtsgericht Kassel HRB 3972
Sitz der Gesellschaft: 34266 Niestetal
USt-ID-Nr. DE 113 08 59 54
WEEE-Reg.-Nr. DE 95881150
___________________________________________________
