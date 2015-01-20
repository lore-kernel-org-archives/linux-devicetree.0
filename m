From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 1/3] pinctrl: qcom: increase variable size for register addresses
Date: Tue, 20 Jan 2015 11:17:54 +0200
Message-ID: <1421745476-6276-2-git-send-email-svarbanov@mm-sol.com>
References: <1421745476-6276-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421745476-6276-1-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Joonwoo Park <joonwoop@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

From: Joonwoo Park <joonwoop@codeaurora.org>

Newer MSM SoCs have TLMM hardware block upper than 16 bit.  Increase to
32 bit registers to hold addresses correctly.

Signed-off-by: Joonwoo Park <joonwoop@codeaurora.org>
Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index b952c4b..54fdd04 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -70,11 +70,11 @@ struct msm_pingroup {
 	unsigned *funcs;
 	unsigned nfuncs;
 
-	s16 ctl_reg;
-	s16 io_reg;
-	s16 intr_cfg_reg;
-	s16 intr_status_reg;
-	s16 intr_target_reg;
+	u32 ctl_reg;
+	u32 io_reg;
+	u32 intr_cfg_reg;
+	u32 intr_status_reg;
+	u32 intr_target_reg;
 
 	unsigned mux_bit:5;
 
-- 
1.7.0.4
