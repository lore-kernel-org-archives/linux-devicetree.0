From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 3/5] ARM: qcom_defconfig: add anx78xx HDMI bridge support
Date: Sun, 13 Oct 2019 04:08:02 -0400
Message-ID: <20191013080804.10231-4-masneyb@onstation.org>
References: <20191013080804.10231-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191013080804.10231-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the Analogix anx78xx driver so that the external display over HDMI
can be used on Nexus 5 phones.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 32fc8a24e5c7..f95cc49a1ddb 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -149,6 +149,7 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_DRM_MSM=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_ANALOGIX_ANX78XX=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 # CONFIG_LCD_CLASS_DEVICE is not set
-- 
2.21.0
