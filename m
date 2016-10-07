From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V5 02/10] Documentation: DT: qcom_hidma: correct spelling
 mistakes
Date: Fri,  7 Oct 2016 01:25:07 -0400
Message-ID: <1475817915-11976-3-git-send-email-okaya@codeaurora.org>
References: <1475817915-11976-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1475817915-11976-1-git-send-email-okaya@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: Mark Rutland <mark.rutland@arm.com>, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, agross@codeaurora.org, linux-arm-kernel@lists.infradead.org
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
