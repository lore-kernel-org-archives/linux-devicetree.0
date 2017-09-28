From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH v4 05/11] dmaengine: sun6i: Move number of
 pchans/vchans/request to device struct
Date: Thu, 28 Sep 2017 03:49:22 +0200
Message-ID: <86c0dfa0-9284-4501-b845-a67a766b51cc@rwthex-w2-a.rwth-ad.de>
References: <20170928014928.2272-1-stefan.bruens@rwth-aachen.de>
Reply-To: stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDIYL7P2SAMRBPFKWHHAKGQE6TQ3OWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170928014928.2272-1-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Preparatory patch: If the same compatible is used for different SoCs which
have a common register layout, but different number of channels, the
channel count can no longer be stored in the config. Store it in the
device structure instead.

Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/dma/sun6i-dma.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index eb45ab39eddd..7fce976a13d8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -188,6 +188,9 @@ struct sun6i_dma_dev {
 	struct sun6i_pchan	*pchans;
 	struct sun6i_vchan	*vchans;
 	const struct sun6i_dma_config *cfg;
+	u32			num_pchans;
+	u32			num_vchans;
+	u32			max_request;
 };
=20
 static struct device *chan2dev(struct dma_chan *chan)
@@ -434,7 +437,6 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vch=
an)
 static void sun6i_dma_tasklet(unsigned long data)
 {
 	struct sun6i_dma_dev *sdev =3D (struct sun6i_dma_dev *)data;
-	const struct sun6i_dma_config *cfg =3D sdev->cfg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	unsigned int pchan_alloc =3D 0;
@@ -462,7 +464,7 @@ static void sun6i_dma_tasklet(unsigned long data)
 	}
=20
 	spin_lock_irq(&sdev->lock);
-	for (pchan_idx =3D 0; pchan_idx < cfg->nr_max_channels; pchan_idx++) {
+	for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan =3D &sdev->pchans[pchan_idx];
=20
 		if (pchan->vchan || list_empty(&sdev->pending))
@@ -483,7 +485,7 @@ static void sun6i_dma_tasklet(unsigned long data)
 	}
 	spin_unlock_irq(&sdev->lock);
=20
-	for (pchan_idx =3D 0; pchan_idx < cfg->nr_max_channels; pchan_idx++) {
+	for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		if (!(pchan_alloc & BIT(pchan_idx)))
 			continue;
=20
@@ -505,7 +507,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *d=
ev_id)
 	int i, j, ret =3D IRQ_NONE;
 	u32 status;
=20
-	for (i =3D 0; i < sdev->cfg->nr_max_channels / DMA_IRQ_CHAN_NR; i++) {
+	for (i =3D 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
 		status =3D readl(sdev->base + DMA_IRQ_STAT(i));
 		if (!status)
 			continue;
@@ -985,7 +987,7 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_ph=
andle_args *dma_spec,
 	struct dma_chan *chan;
 	u8 port =3D dma_spec->args[0];
=20
-	if (port > sdev->cfg->nr_max_requests)
+	if (port > sdev->max_request)
 		return NULL;
=20
 	chan =3D dma_get_any_slave_channel(&sdev->slave);
@@ -1018,7 +1020,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_de=
v *sdev)
 {
 	int i;
=20
-	for (i =3D 0; i < sdev->cfg->nr_max_vchans; i++) {
+	for (i =3D 0; i < sdev->num_vchans; i++) {
 		struct sun6i_vchan *vchan =3D &sdev->vchans[i];
=20
 		list_del(&vchan->vc.chan.device_node);
@@ -1224,26 +1226,30 @@ static int sun6i_dma_probe(struct platform_device *=
pdev)
 	sdc->slave.residue_granularity		=3D DMA_RESIDUE_GRANULARITY_BURST;
 	sdc->slave.dev =3D &pdev->dev;
=20
-	sdc->pchans =3D devm_kcalloc(&pdev->dev, sdc->cfg->nr_max_channels,
+	sdc->num_pchans =3D sdc->cfg->nr_max_channels;
+	sdc->num_vchans =3D sdc->cfg->nr_max_vchans;
+	sdc->max_request =3D sdc->cfg->nr_max_requests;
+
+	sdc->pchans =3D devm_kcalloc(&pdev->dev, sdc->num_pchans,
 				   sizeof(struct sun6i_pchan), GFP_KERNEL);
 	if (!sdc->pchans)
 		return -ENOMEM;
=20
-	sdc->vchans =3D devm_kcalloc(&pdev->dev, sdc->cfg->nr_max_vchans,
+	sdc->vchans =3D devm_kcalloc(&pdev->dev, sdc->num_vchans,
 				   sizeof(struct sun6i_vchan), GFP_KERNEL);
 	if (!sdc->vchans)
 		return -ENOMEM;
=20
 	tasklet_init(&sdc->task, sun6i_dma_tasklet, (unsigned long)sdc);
=20
-	for (i =3D 0; i < sdc->cfg->nr_max_channels; i++) {
+	for (i =3D 0; i < sdc->num_pchans; i++) {
 		struct sun6i_pchan *pchan =3D &sdc->pchans[i];
=20
 		pchan->idx =3D i;
 		pchan->base =3D sdc->base + 0x100 + i * 0x40;
 	}
=20
-	for (i =3D 0; i < sdc->cfg->nr_max_vchans; i++) {
+	for (i =3D 0; i < sdc->num_vchans; i++) {
 		struct sun6i_vchan *vchan =3D &sdc->vchans[i];
=20
 		INIT_LIST_HEAD(&vchan->node);
--=20
2.14.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
