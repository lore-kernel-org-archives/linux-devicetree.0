From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 01/15] firmware: qcom: scm: Add ipq4019 soc compatible
Date: Mon, 29 Jan 2018 10:41:15 +0530
Message-ID: <1517202689-14212-2-git-send-email-sricharan@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add the compatible for ipq4019.
This does not need clocks to do scm calls.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 3 ++-
 drivers/firmware/qcom_scm.c                             | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 7b40054..fcf6979 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -11,9 +11,10 @@ Required properties:
  * "qcom,scm-msm8660" for MSM8660 platforms
  * "qcom,scm-msm8690" for MSM8690 platforms
  * "qcom,scm-msm8996" for MSM8996 platforms
+ * "qcom,scm-ipq4019" for IPQ4019 platforms
  * "qcom,scm" for later processors (MSM8916, APQ8084, MSM8974, etc)
 - clocks: One to three clocks may be required based on compatible.
- * No clock required for "qcom,scm-msm8996"
+ * No clock required for "qcom,scm-msm8996", "qcom,scm-ipq4019"
  * Only core clock required for "qcom,scm-apq8064", "qcom,scm-msm8660", and "qcom,scm-msm8960"
  * Core, iface, and bus clocks required for "qcom,scm"
 - clock-names: Must contain "core" for the core clock, "iface" for the interface
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index af4c752..ddc9ea8 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -603,6 +603,9 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
 	{ .compatible = "qcom,scm-msm8996",
 	  .data = NULL, /* no clocks */
 	},
+	{ .compatible = "qcom,scm-ipq4019",
+	  .data = NULL, /* no clocks */
+	},
 	{ .compatible = "qcom,scm",
 	  .data = (void *)(SCM_HAS_CORE_CLK
 			   | SCM_HAS_IFACE_CLK
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
