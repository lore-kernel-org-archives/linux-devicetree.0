From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 2/4] dt-bindings: qcom: Add SDM845 bindings
Date: Thu, 22 Feb 2018 11:42:06 +0530
Message-ID: <20180222061208.2031-3-rnayak@codeaurora.org>
References: <20180222061208.2031-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180222061208.2031-1-rnayak@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a SoC string 'sdm845' for the qualcomm SDM845 SoC

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index 0ed4d39d7fe1..ee532e705d6c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -26,6 +26,7 @@ The 'SoC' element must be one of the following strings:
 	msm8996
 	mdm9615
 	ipq8074
+	sdm845
 
 The 'board' element must be one of the following strings:
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
