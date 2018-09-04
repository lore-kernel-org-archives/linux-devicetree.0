From: Andre Kalb <Andre.Kalb@sma.de>
Subject: [PATCH] of: __of_update_property_sysfs only call
 __of_sysfs_remove_bin_file if of_node_is_attached.
Date: Tue, 4 Sep 2018 11:19:35 +0000
Message-ID: <AM6PR04MB5239B08D03B4B4678818D41BFC030@AM6PR04MB5239.eurprd04.prod.outlook.com>
References: <20180904111739.399781C210C@fedora-nb5693.sma.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904111739.399781C210C@fedora-nb5693.sma.de>
Content-Language: de-DE
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

To prevent warning "kernfs: can not remove '(null)', no directory", if an overlay isn't applied to the active devicetree.

Using of_remove_property and than of_add_property don't show the warning.
---
 drivers/of/kobj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c index 7a0a18980b98..2b71e5979580 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -104,7 +104,7 @@ void __of_update_property_sysfs(struct device_node *np, struct property *newprop
                struct property *oldprop)
 {
        /* At early boot, bail out and defer setup to of_init() */
-       if (!of_kset)
+       if (!of_kset || !of_node_is_attached(np)))
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
