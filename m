From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v3 01/10] dmaengine: sun6i: Correct setting of
 clock autogating register for A83T/H3
Date: Mon, 25 Sep 2017 02:02:35 +0200
Message-ID: <8b0e3c36-850c-4211-b647-b03143be67f7@rwthex-w2-a.rwth-ad.de>
References: <20170925000244.11679-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBNEPUHHAKGQEJJ4NCBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170925000244.11679-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The H83T uses a compatible string different from the A23, but requires
the same clock autogating register setting.

The H3 also requires setting the clock autogating register, but has
the register at a different offset.

Add three suitable callbacks for the existing controller generations
and set it in the controller config structure.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

---

Changes in v3:
- Check for callback instead of using a no-op callback

Changes in v2:
- Use callback for autogating instead of variable for different SoC generat=
ions

 drivers/dma/sun6i-dma.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index bcd496edc70f..b4a29d1a100d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -48,6 +48,9 @@
 #define SUN8I_DMA_GATE		0x20
 #define SUN8I_DMA_GATE_ENABLE	0x4
=20
+#define SUNXI_H3_SECURE_REG		0x20
+#define SUNXI_H3_DMA_GATE		0x28
+#define SUNXI_H3_DMA_GATE_ENABLE	0x4
 /*
  * Channels specific registers
  */
@@ -111,7 +114,7 @@ struct sun6i_dma_config {
 	 * however these SoCs really have and need this bit, as seen in the
 	 * BSP kernel source code.
 	 */
-	bool gate_needed;
+	void (*clock_autogate_enable)();
 };
=20
 /*
@@ -267,6 +270,16 @@ static inline s8 convert_buswidth(enum dma_slave_buswi=
dth addr_width)
 	return addr_width >> 1;
 }
=20
+static void sun6i_enable_clock_autogate_a23(struct sun6i_dma_dev *sdev)
+{
+	writel(SUN8I_DMA_GATE_ENABLE, sdev->base + SUN8I_DMA_GATE);
+}
+
+static void sun6i_enable_clock_autogate_h3(struct sun6i_dma_dev *sdev)
+{
+	writel(SUNXI_H3_DMA_GATE_ENABLE, sdev->base + SUNXI_H3_DMA_GATE);
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd =3D pchan->desc;
@@ -1020,24 +1033,28 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg =
=3D {
 	.nr_max_channels =3D 8,
 	.nr_max_requests =3D 24,
 	.nr_max_vchans   =3D 37,
-	.gate_needed	 =3D true,
+	.clock_autogate_enable =3D sun6i_enable_clock_autogate_a23;
 };
=20
 static struct sun6i_dma_config sun8i_a83t_dma_cfg =3D {
 	.nr_max_channels =3D 8,
 	.nr_max_requests =3D 28,
 	.nr_max_vchans   =3D 39,
+	.clock_autogate_enable =3D sun6i_enable_clock_autogate_a23;
 };
=20
 /*
  * The H3 has 12 physical channels, a maximum DRQ port id of 27,
  * and a total of 34 usable source and destination endpoints.
+ * It also supports additional burst lengths and bus widths,
+ * and the burst length fields have different offsets.
  */
=20
 static struct sun6i_dma_config sun8i_h3_dma_cfg =3D {
 	.nr_max_channels =3D 12,
 	.nr_max_requests =3D 27,
 	.nr_max_vchans   =3D 34,
+	.clock_autogate_enable =3D sun6i_enable_clock_autogate_h3;
 };
=20
 /*
@@ -1049,7 +1066,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg =3D =
{
 	.nr_max_channels =3D 8,
 	.nr_max_requests =3D 23,
 	.nr_max_vchans   =3D 24,
-	.gate_needed	 =3D true,
+	.clock_autogate_enable =3D sun6i_enable_clock_autogate_a23;
 };
=20
 static const struct of_device_id sun6i_dma_match[] =3D {
@@ -1199,8 +1216,8 @@ static int sun6i_dma_probe(struct platform_device *pd=
ev)
 		goto err_dma_unregister;
 	}
=20
-	if (sdc->cfg->gate_needed)
-		writel(SUN8I_DMA_GATE_ENABLE, sdc->base + SUN8I_DMA_GATE);
+	if (sdc->cfg->clock_autogate_enable)
+		sdc->cfg->clock_autogate_enable();
=20
 	return 0;
=20
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
