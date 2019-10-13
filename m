From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/5] ARM: qcom_defconfig: add ocmem support
Date: Sun, 13 Oct 2019 04:08:00 -0400
Message-ID: <20191013080804.10231-2-masneyb@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191013080804.10231-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add ocmem driver that's needed to support the GPU on a3xx and a4xx based
systems.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 02f1e7b7c8f6..b6faf6f2ddb4 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -226,6 +226,7 @@ CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_GSBI=y
+CONFIG_QCOM_OCMEM=m
 CONFIG_QCOM_PM=y
 CONFIG_QCOM_SMEM=y
 CONFIG_QCOM_SMD_RPM=y
-- 
2.21.0
