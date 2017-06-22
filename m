From: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v1 1/5] [media] stm32-dcmi: catch dma submission error
Date: Thu, 22 Jun 2017 17:12:47 +0200
Message-ID: <1498144371-13310-2-git-send-email-hugues.fruchet@st.com>
References: <1498144371-13310-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498144371-13310-1-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Test cookie return by dmaengine_submit() and return error if any.

Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 83d32a5..0dd5d1c 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
