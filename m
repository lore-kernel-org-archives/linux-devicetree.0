From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/3] dt-bindings: ufs: Add sm8150 compatible string
Date: Wed,  4 Sep 2019 15:38:33 +0530
Message-ID: <20190904100835.6099-2-vkoul@kernel.org>
References: <20190904100835.6099-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904100835.6099-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Evan Green <evgreen@chromium.org>, Can Guo <cang@codeaurora.org>, Stanley Chu <stanley.chu@mediatek.com>, Subhash Jadavani <subhashj@codeaurora.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Document "qcom,sm8150-ufshc" compatible string for UFS HC found on
SM8150.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index a74720486ee2..7529e2c26127 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -13,6 +13,7 @@ Required properties:
 			    "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
+			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 - interrupts        : <interrupt mapping for UFS host controller IRQ>
 - reg               : <registers mapping>
 
-- 
2.20.1
