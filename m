From: Anton Vorontsov <anton@enomsg.org>
Subject: [PATCH] of/irq: Provide struct device_node forward-declaration for
 !OF case
Date: Wed, 28 Aug 2013 18:28:28 -0700
Message-ID: <20130829012828.GA15558@lizard.sbx00571.losalca.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch fixes the following warnings:

  CC      drivers/power/bq24190_charger.o
  In file included from drivers/power/bq24190_charger.c:14:0:
  include/linux/of_irq.h:82:7: warning: =E2=80=98struct device_node=E2=80=
=99 declared
  inside parameter list [enabled by default]
  include/linux/of_irq.h:82:7: warning: its scope is only this definiti=
on
  or declaration, which is probably not what you want [enabled by defau=
lt]
  include/linux/of_irq.h:87:118: warning: =E2=80=98struct device_node=E2=
=80=99 declared
  inside parameter list [enabled by default]

Signed-off-by: Anton Vorontsov <anton@enomsg.org>
---
 include/linux/of_irq.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 535cecf..988d5c9 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -78,6 +78,9 @@ extern void of_irq_init(const struct of_device_id *ma=
tches);
 #endif /* CONFIG_OF_IRQ */
=20
 #else /* !CONFIG_OF */
+
+struct device_node;
+
 static inline unsigned int irq_of_parse_and_map(struct device_node *de=
v,
 						int index)
 {
--=20
1.8.1.4
