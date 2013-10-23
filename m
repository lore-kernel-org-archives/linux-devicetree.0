From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv3][ 2/5] dma: ipu: Add devicetree support.
Date: Wed, 23 Oct 2013 14:43:46 +0200
Message-ID: <1382532229-32755-2-git-send-email-denis@eukrea.com>
References: <1382532229-32755-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382532229-32755-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
ChangeLog v2->v3:
- The DMA channels are not exposed anymore in order to look more like t=
he IPUv3
  bindings.
---
 .../devicetree/bindings/dma/fsl-imx-ipu.txt        |   33 ++++++++++++=
++++++++
 drivers/dma/ipu/ipu_idmac.c                        |    8 +++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl-imx-ipu.t=
xt

diff --git a/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt b/Do=
cumentation/devicetree/bindings/dma/fsl-imx-ipu.txt
new file mode 100644
index 0000000..ee66e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/fsl-imx-ipu.txt
@@ -0,0 +1,33 @@
+* Freescale Image Processing Unit DMA support for i.MX3x.
+
+This dma driver supports the imx31 and imx35 devices.
+
+Required properties:
+- compatible : Should be "fsl,imx31-ipu".
+- reg : Should contain DMA registers location and length
+- interrupts : First item should be DMA interrupt, second one is optio=
nal and
+    should contain DMA Error interrupt.
+
+Example:
+
+	ipu: ipu@53fc0000 {
+		compatible =3D "fsl,imx31-ipu";
+		reg =3D <	0x53fc0000 0x5f
+			0x53fc0088 0x2b >;
+		interrupts =3D <42 41>;
+		clocks =3D <&clks 55>;
+		clock-names =3D "";
+		status =3D "disabled";
+	};
+
+* DMA client
+
+Clients have to specify the DMA requests with phandles in a list.
+
+Required properties:
+Example:
+
+	lcdc: mx3fb@53fc00b4 {
+		...
+		...
+	};
diff --git a/drivers/dma/ipu/ipu_idmac.c b/drivers/dma/ipu/ipu_idmac.c
index cb9c0bc..d853ee1 100644
--- a/drivers/dma/ipu/ipu_idmac.c
+++ b/drivers/dma/ipu/ipu_idmac.c
@@ -22,6 +22,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/dma/ipu-dma.h>
=20
 #include "../dmaengine.h"
@@ -1768,6 +1769,12 @@ static int ipu_remove(struct platform_device *pd=
ev)
 	return 0;
 }
=20
+static const struct of_device_id ipu_dma_of_dev_id[] =3D {
+	{ .compatible =3D "fsl,imx31-ipu", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ipu_dma_of_dev_id);
+
 /*
  * We need two MEM resources - with IPU-common and Image Converter reg=
isters,
  * including PF_CONF and IDMAC_* registers, and two IRQs - function an=
d error
@@ -1775,6 +1782,7 @@ static int ipu_remove(struct platform_device *pde=
v)
 static struct platform_driver ipu_platform_driver =3D {
 	.driver =3D {
 		.name	=3D "ipu-core",
+		.of_match_table =3D of_match_ptr(ipu_dma_of_dev_id),
 		.owner	=3D THIS_MODULE,
 	},
 	.remove		=3D ipu_remove,
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
