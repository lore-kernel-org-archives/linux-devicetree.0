From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V6 09/10] dmaengine: qcom_hidma: break completion processing on error
Date: Wed, 19 Oct 2016 13:51:51 -0400
Message-ID: <1476899512-20431-10-git-send-email-okaya@codeaurora.org>
References: <1476899512-20431-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476899512-20431-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We try to consume as much successful transfers as possible. Now that we
support MSI interrupts, an error interrupt might be observed by another
processor while we are finishing the successful ones.

Try to abort successful processing if this is the case.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 drivers/dma/qcom/hidma_ll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index 62cdd42..999abda 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -291,6 +291,13 @@ static int hidma_handle_tre_completion(struct hidma_lldev *lldev)
 		evre_write_off =
 		    readl_relaxed(lldev->evca + HIDMA_EVCA_WRITE_PTR_REG);
 		num_completed++;
+
+		/*
+		 * An error interrupt might have arrived while we are processing
+		 * the completed interrupt.
+		 */
+		if (!hidma_ll_isenabled(lldev))
+			break;
 	}
 
 	if (num_completed) {
-- 
1.9.1
