From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v4 03/11] mtd: brcmnand: add support for STB chips
Date: Tue, 12 May 2015 17:53:36 -0700
Message-ID: <1431478424-29230-4-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

BCM7xxx chips are supported entirely by the library code, since they us=
e
generic irqchip interfaces and don't need any extra SoC-specific
configuration.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v4: pulled stub platform driver into its own file as part of the
    library-ization. This is also important, to keep the STB driver fro=
m
    overriding the iproc_nand driver, when seeing a compatible property=
 like:

      compatible =3D "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brc=
mnand";

 drivers/mtd/nand/brcmnand/Makefile       |  1 +
 drivers/mtd/nand/brcmnand/brcmstb_nand.c | 44 ++++++++++++++++++++++++=
++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/mtd/nand/brcmnand/brcmstb_nand.c

diff --git a/drivers/mtd/nand/brcmnand/Makefile b/drivers/mtd/nand/brcm=
nand/Makefile
index a1b3e3ebe440..b7b24f8277cc 100644
--- a/drivers/mtd/nand/brcmnand/Makefile
+++ b/drivers/mtd/nand/brcmnand/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_MTD_NAND_BRCMSTB)		+=3D brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMSTB)		+=3D brcmnand.o
diff --git a/drivers/mtd/nand/brcmnand/brcmstb_nand.c b/drivers/mtd/nan=
d/brcmnand/brcmstb_nand.c
new file mode 100644
index 000000000000..5c271077ac87
--- /dev/null
+++ b/drivers/mtd/nand/brcmnand/brcmstb_nand.c
@@ -0,0 +1,44 @@
+/*
+ * Copyright =C2=A9 2015 Broadcom Corporation
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "brcmnand.h"
+
+static const struct of_device_id brcmstb_nand_of_match[] =3D {
+	{ .compatible =3D "brcm,brcmnand" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, brcmstb_nand_of_match);
+
+static int brcmstb_nand_probe(struct platform_device *pdev)
+{
+	return brcmnand_probe(pdev, NULL);
+}
+
+static struct platform_driver brcmstb_nand_driver =3D {
+	.probe			=3D brcmstb_nand_probe,
+	.remove			=3D brcmnand_remove,
+	.driver =3D {
+		.name		=3D "brcmstb_nand",
+		.pm		=3D &brcmnand_pm_ops,
+		.of_match_table =3D brcmstb_nand_of_match,
+	}
+};
+module_platform_driver(brcmstb_nand_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Brian Norris");
+MODULE_DESCRIPTION("NAND driver for Broadcom STB chips");
--=20
1.9.1
