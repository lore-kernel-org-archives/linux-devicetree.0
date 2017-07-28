From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH v1 1/5] [media] stm32-dcmi: catch dma submission error
Date: Fri, 28 Jul 2017 12:04:58 +0200
Message-ID: <1501236302-18097-2-git-send-email-hugues.fruchet@st.com>
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

Test cookie return by dmaengine_submit() and return error if any.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 24ef888..716b3db 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -295,6 +295,10 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 
 	/* Push current DMA transaction in the pending queue */
 	dcmi->dma_cookie = dmaengine_submit(desc);
+	if (dma_submit_error(dcmi->dma_cookie)) {
+		dev_err(dcmi->dev, "%s: DMA submission failed\n", __func__);
+		return -ENXIO;
+	}
 
 	dma_async_issue_pending(dcmi->dma_chan);
 
-- 
1.9.1
