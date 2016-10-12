From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [RFC V3 PATCH 7/7] arm64: configs: enable configs for msm899(2/4) basic support
Date: Wed, 12 Oct 2016 02:37:34 -0700
Message-ID: <1476265054-22511-8-git-send-email-jeremymc@redhat.com>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org

From: Jeremy McNicoll <jmcnicol@redhat.com>

Given the mimimal hardware support for msm899(2/4) currently.
A few config options are needed to allow for continued
development and booting.

The following are needed for continued development and
booting:
  -InitRD support
  -8x74 pinctrl for serial support
  -Enable Global Glock Controller (gcc)

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fd2d74d..8601388 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -21,6 +21,7 @@ CONFIG_CGROUP_HUGETLB=y
 # CONFIG_NET_NS is not set
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_BLK_DEV_RAM=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
@@ -187,6 +188,7 @@ CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_MSM8X74=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_PL061=y
@@ -285,6 +287,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_CLK_QORIQ=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_MSM_GCC_8916=y
+CONFIG_MSM_GCC_8994=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_MAILBOX=y
 CONFIG_ARM_MHU=y
-- 
2.6.1
