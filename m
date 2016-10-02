From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: [RFC V2 PATCH 09/12] arm64: dts: move Huawei Angler (Nexus 6P) to qcom directory
Date: Sat,  1 Oct 2016 19:38:36 -0700
Message-ID: <1475375919-618-10-git-send-email-jmcnicol@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de
Cc: jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Given that this is a MSM SoC and not a specific vendor created
SoC moving associated device tree files to qcom directory.

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/boot/dts/huawei/Makefile                             | 5 -----
 arch/arm64/boot/dts/qcom/Makefile                               | 4 ++--
 arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/huawei/Makefile
 rename arch/arm64/boot/dts/{huawei => qcom}/msm8994-angler-rev-101.dts (96%)

diff --git a/arch/arm64/boot/dts/huawei/Makefile b/arch/arm64/boot/dts/huawei/Makefile
deleted file mode 100644
index 4b31ff4..0000000
--- a/arch/arm64/boot/dts/huawei/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-dtb-$(CONFIG_MACH_HUAWEI) += msm8994-angler-rev-101.dtb
-
-always          := $(dtb-y)
-subdir-y        := $(dts-dirs)
-clean-files     := *.dtb
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cee6bcc..84f102d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,5 +1,5 @@
-dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb msm8992-bullhead-rev-101.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb msm8996-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb msm8994-angler-rev-101.dtb
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/huawei/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
similarity index 96%
rename from arch/arm64/boot/dts/huawei/msm8994-angler-rev-101.dts
rename to arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index 07a71d6..5cff29f 100644
--- a/arch/arm64/boot/dts/huawei/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -13,7 +13,7 @@
 
 /dts-v1/;
 
-#include "../qcom/msm8994-v2.0.dtsi"
+#include "msm8994-v2.0.dtsi"
 
 / {
 	model = "HUAWEI MSM8994 ANGLER rev-1.01";
-- 
2.6.1
