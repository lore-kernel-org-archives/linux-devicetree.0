From: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC V4 PATCH 6/6] arm64: configs: enable configs for msm899(2/4) basic support
Date: Fri, 21 Oct 2016 04:11:13 -0700
Message-ID: <1477048273-32451-7-git-send-email-jeremymc@redhat.com>
References: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477048273-32451-1-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Given the mimimal hardware support for msm899(2/4) currently.
A few config options are needed to allow for continued
development and booting.

The following are needed for continued development and
booting:
  -8x74 pinctrl for serial support
  -Enable Global Glock Controller (gcc)

Signed-off-by: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dab2cb0..611ebb3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -252,6 +252,7 @@ CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8996=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_MSM8X74=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_PL061=y
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
