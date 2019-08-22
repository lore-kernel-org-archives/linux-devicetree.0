From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 7/7] ARM: qcom_defconfig: add ocmem support
Date: Thu, 22 Aug 2019 07:37:03 -0700
Message-ID: <20190822143703.13030-8-masneyb@onstation.org>
References: <20190822143703.13030-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822143703.13030-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, jcrouse@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add ocmem driver that's needed for some a3xx and a4xx based systems.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v5:
- None

This patch was introduced in v5.

 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 34433bf5885d..595e1910ba78 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -225,6 +225,7 @@ CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=y
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.21.0
