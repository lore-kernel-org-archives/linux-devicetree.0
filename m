From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V4 02/10] Documentation: DT: qcom_hidma: correct spelling mistakes
Date: Wed, 28 Sep 2016 22:12:39 -0400
Message-ID: <1475115167-5898-3-git-send-email-okaya@codeaurora.org>
References: <1475115167-5898-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1475115167-5898-1-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix the spelling mistakes and extra and statements in the sentences.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
index 2c5e4b8..55492c2 100644
--- a/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
@@ -5,13 +5,13 @@ memcpy and memset capabilities. It has been designed for virtualized
 environments.
 
 Each HIDMA HW instance consists of multiple DMA channels. These channels
-share the same bandwidth. The bandwidth utilization can be parititioned
+share the same bandwidth. The bandwidth utilization can be partitioned
 among channels based on the priority and weight assignments.
 
 There are only two priority levels and 15 weigh assignments possible.
 
 Other parameters here determine how much of the system bus this HIDMA
-instance can use like maximum read/write request and and number of bytes to
+instance can use like maximum read/write request and number of bytes to
 read/write in a single burst.
 
 Main node required properties:
-- 
1.9.1
