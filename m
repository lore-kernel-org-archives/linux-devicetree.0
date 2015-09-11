From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 9/9] ARM: multi_v7_defconfig: Enable STi FDMA driver
Date: Fri, 11 Sep 2015 15:14:31 +0100
Message-ID: <1441980871-24475-10-git-send-email-peter.griffin@linaro.org>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This DMA controller is found on all STi chipsets.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5fd8df6..ce3c8c1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -587,6 +587,7 @@ CONFIG_IMX_DMA=y
 CONFIG_MXS_DMA=y
 CONFIG_DMA_OMAP=y
 CONFIG_XILINX_VDMA=y
+CONFIG_ST_FDMA=y
 CONFIG_STAGING=y
 CONFIG_SENSORS_ISL29018=y
 CONFIG_SENSORS_ISL29028=y
-- 
1.9.1
