From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5 14/16] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND documentation
Date: Thu, 17 Aug 2017 17:37:52 +0530
Message-ID: <1502971674-13810-15-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>, Sricharan R <sricharan@codeaurora.org>, Abhishek Sahu <absahu@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
which uses BAM DMA Engine.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4: None

 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index d93b952..73d336be 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -6,6 +6,8 @@ Required properties:
 			    SoC and it uses ADM DMA
     * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
                             IPQ4019 SoC and it uses BAM DMA
+    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
+                            IPQ8074 SoC and it uses BAM DMA
 
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
