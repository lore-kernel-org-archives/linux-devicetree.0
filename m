From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v6 2/2] mtd: nand: sunxi: add reset line support
Date: Mon, 20 Jun 2016 12:48:38 +0800
Message-ID: <20160620044838.56904-2-icenowy@aosc.xyz>
References: <20160620044838.56904-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBSHLTW5QKGQE34RBVAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160620044838.56904-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NAND controller on some sun8i chips needs its reset line to be
deasserted before they can enter working state.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
 =C2=A0Changes in v2:
 =C2=A0=C2=A0=C2=A0- Corrected the error checking code of reset line.

 =C2=A0Changes in v3:
 =C2=A0=C2=A0=C2=A0- Corrected a more serious error brought in the "fix" of=
 v2.

 =C2=A0Changes in v4:
 =C2=A0=C2=A0=C2=A0- Removed unneeded code block after "else".

 =C2=A0Changes in v5:
 =C2=A0=C2=A0=C2=A0- Added reassertion code in case of initialization error=
 and device
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0remove.

  Changes in v6:
    - Fixed a resource leak by not using goto to exit in case of error.

 drivers/mtd/nand/sunxi_nand.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index a83a690..08d5e88 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -39,6 +39,7 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/reset.h>
=20
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
@@ -269,6 +270,7 @@ struct sunxi_nfc {
 	void __iomem *regs;
 	struct clk *ahb_clk;
 	struct clk *mod_clk;
+	struct reset_control *reset;
 	unsigned long assigned_cs;
 	unsigned long clk_rate;
 	struct list_head chips;
@@ -1871,26 +1873,42 @@ static int sunxi_nfc_probe(struct platform_device *=
pdev)
 	if (ret)
 		goto out_ahb_clk_unprepare;
=20
+	nfc->reset =3D devm_reset_control_get_optional(dev, "ahb");
+
+	if (!IS_ERR(nfc->reset)) {
+		ret =3D reset_control_deassert(nfc->reset);
+		if (ret) {
+			dev_err(dev, "reset err %d\n", ret);
+			goto out_mod_clk_unprepare;
+		}
+	} else if (PTR_ERR(nfc->reset) !=3D -ENOENT) {
+		ret =3D PTR_ERR(nfc->reset);
+		goto out_mod_clk_unprepare;
+	}
+
 	ret =3D sunxi_nfc_rst(nfc);
 	if (ret)
-		goto out_mod_clk_unprepare;
+		goto out_ahb_reset_reassert;
=20
 	writel(0, nfc->regs + NFC_REG_INT);
 	ret =3D devm_request_irq(dev, irq, sunxi_nfc_interrupt,
 			       0, "sunxi-nand", nfc);
 	if (ret)
-		goto out_mod_clk_unprepare;
+		goto out_ahb_reset_reassert;
=20
 	platform_set_drvdata(pdev, nfc);
=20
 	ret =3D sunxi_nand_chips_init(dev, nfc);
 	if (ret) {
 		dev_err(dev, "failed to init nand chips\n");
-		goto out_mod_clk_unprepare;
+		goto out_ahb_reset_reassert;
 	}
=20
 	return 0;
=20
+out_ahb_reset_reassert:
+	if (!IS_ERR(nfc->reset))
+		reset_control_assert(nfc->reset);
 out_mod_clk_unprepare:
 	clk_disable_unprepare(nfc->mod_clk);
 out_ahb_clk_unprepare:
@@ -1904,6 +1922,10 @@ static int sunxi_nfc_remove(struct platform_device *=
pdev)
 	struct sunxi_nfc *nfc =3D platform_get_drvdata(pdev);
=20
 	sunxi_nand_chips_cleanup(nfc);
+
+	if (!IS_ERR(nfc->reset))
+		reset_control_assert(nfc->reset);
+
 	clk_disable_unprepare(nfc->mod_clk);
 	clk_disable_unprepare(nfc->ahb_clk);
=20
--=20
2.9.0

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
