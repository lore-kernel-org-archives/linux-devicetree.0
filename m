From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] clk: st: Provide a clock domain
Date: Mon, 26 Jan 2015 11:13:59 +0000
Message-ID: <1422270840-3039-4-git-send-email-lee.jones@linaro.org>
References: <1422270840-3039-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422270840-3039-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ST's h/w contains clocks which if turned off would prove fatal.  The
only way to recover is to restart the board(s).  This driver takes
references to clocks which are required to be always-on in order to
prevent the common clk framework from trying to turn them off during
the clk_disabled_unused() procedure.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/st/Makefile     |  2 +-
 drivers/clk/st/clk-domain.c | 63 +++++++++++++++++++++++++++++++++++++=
++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/st/clk-domain.c

diff --git a/drivers/clk/st/Makefile b/drivers/clk/st/Makefile
index ede7b2f..ac09be6 100644
--- a/drivers/clk/st/Makefile
+++ b/drivers/clk/st/Makefile
@@ -1 +1 @@
-obj-y +=3D clkgen-mux.o clkgen-pll.o clkgen-fsyn.o clk-flexgen.o
+obj-y +=3D clkgen-mux.o clkgen-pll.o clkgen-fsyn.o clk-flexgen.o clk-d=
omain.o
diff --git a/drivers/clk/st/clk-domain.c b/drivers/clk/st/clk-domain.c
new file mode 100644
index 0000000..e34049b
--- /dev/null
+++ b/drivers/clk/st/clk-domain.c
@@ -0,0 +1,63 @@
+/*
+ * ST Clock Domain
+ *
+ * Copyright (C) 2015 STMicroelectronics =E2=80=93 All Rights Reserved
+ *
+ * Author: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License as published b=
y
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/clk-private.h>
+#include <linux/clk-provider.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static void st_clk_domain_hog_clock(struct platform_device *pdev, int =
index)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	struct clk *clk;
+	int ret;
+
+	clk =3D of_clk_get(np, index);
+	if (IS_ERR(clk)) {
+		dev_warn(&pdev->dev, "Failed get clock %s[%d]: %li\n",
+			 np->full_name, index, PTR_ERR(clk));
+		return;
+	}
+
+	ret =3D clk_prepare_enable(clk);
+	if (ret)
+		dev_warn(&pdev->dev, "Failed to enable clock: %s\n", clk->name);
+}
+
+static int st_clk_domain_probe(struct platform_device *pdev)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	int nclks, i;
+
+	nclks =3D of_count_phandle_with_args(np, "clocks", "#clock-cells");
+
+	for (i =3D 0; i < nclks; i++)
+		st_clk_domain_hog_clock(pdev, i);
+
+	return 0;
+}
+
+static const struct of_device_id st_clk_domain_match[] =3D {
+	{ .compatible =3D "st,clk-domain" },
+	{ },
+};
+
+static struct platform_driver st_clk_domain_driver =3D {
+	.probe =3D st_clk_domain_probe,
+	.driver =3D {
+		.name =3D "st-clk-domain",
+		.of_match_table =3D st_clk_domain_match,
+	},
+};
+module_platform_driver(st_clk_domain_driver);
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
