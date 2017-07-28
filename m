From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v1 2/5] [media] stm32-dcmi: revisit control register handling
Date: Fri, 28 Jul 2017 12:04:59 +0200
Message-ID: <1501236302-18097-3-git-send-email-hugues.fruchet@st.com>
References: <1501236302-18097-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501236302-18097-1-git-send-email-hugues.fruchet@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Hugues Fruchet <hugues.fruchet@st.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Simplify bits handling of DCMI_CR register.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 716b3db..526e354 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -490,7 +490,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
 	struct dcmi_buf *buf, *node;
-	u32 val;
+	u32 val = 0;
 	int ret;
 
 	ret = clk_enable(dcmi->mclk);
@@ -510,22 +510,16 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	spin_lock_irq(&dcmi->irqlock);
 
-	val = reg_read(dcmi->regs, DCMI_CR);
-
-	val &= ~(CR_PCKPOL | CR_HSPOL | CR_VSPOL |
-		 CR_EDM_0 | CR_EDM_1 | CR_FCRC_0 |
-		 CR_FCRC_1 | CR_JPEG | CR_ESS);
-
 	/* Set bus width */
 	switch (dcmi->bus.bus_width) {
 	case 14:
-		val &= CR_EDM_0 + CR_EDM_1;
+		val |= CR_EDM_0 | CR_EDM_1;
 		break;
 	case 12:
-		val &= CR_EDM_1;
+		val |= CR_EDM_1;
 		break;
 	case 10:
-		val &= CR_EDM_0;
+		val |= CR_EDM_0;
 		break;
 	default:
 		/* Set bus width to 8 bits by default */
-- 
1.9.1
