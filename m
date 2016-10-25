From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [PATCH 6/6] arm64: configs: enable configs for msm899(2/4) basic support
Date: Tue, 25 Oct 2016 04:17:01 -0700
Message-ID: <1477394221-30963-7-git-send-email-jeremymc@redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol@redhat.com>

Given the mimimal hardware support for msm899(2/4) currently.
A few config options are needed to allow for continued
development and booting.

The following are needed for continued development and
booting:
  -8994 pinctrl for serial support
  -Enable Global Glock Controller (gcc)

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dab2cb0..a71bb7a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -249,6 +249,7 @@ CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_MSM8916=y
+CONFIG_PINCTRL_MSM8994=y
 CONFIG_PINCTRL_MSM8996=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
@@ -390,6 +391,7 @@ CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_CLK_QORIQ=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_MSM_GCC_8916=y
+CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_MAILBOX=y
-- 
2.6.1
