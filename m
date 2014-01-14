From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
Subject: [PATCH v1 6/6] ARM: STi: Add reset controller support to mach-sti Kconfig
Date: Tue, 14 Jan 2014 10:51:56 +0000
Message-ID: <1389696716-19944-1-git-send-email-srinivas.kandagatla@st.com>
References: <1389696613-19683-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389696613-19683-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Stuart Menefy <stuart.menefy@st.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, stephen.gallimore@st.com, kernel@stlinux.com, lee.jones@linaro.com, Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: devicetree@vger.kernel.org

From: Stephen Gallimore <stephen.gallimore@st.com>

This patch selects reset controller support for ARCH_STI and
selects the reset controllers for STiH415 and STiH416 SoCs.

Signed-off-by: Stephen Gallimore <stephen.gallimore@st.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
---
 arch/arm/mach-sti/Kconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index d71654b..2550620 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -7,6 +7,7 @@ menuconfig ARCH_STI
 	select PINCTRL
 	select PINCTRL_ST
 	select MFD_SYSCON
+	select ARCH_HAS_RESET_CONTROLLER
 	select MIGHT_HAVE_CACHE_L2X0
 	select HAVE_SMP
 	select HAVE_ARM_SCU if SMP
@@ -28,6 +29,7 @@ if ARCH_STI
 config SOC_STIH415
 	bool "STiH415 STMicroelectronics Consumer Electronics family"
 	default y
+	select STIH415_RESET
 	help
 	  This enables support for STMicroelectronics Digital Consumer
 	  Electronics family StiH415 parts, primarily targeted at set-top-box
@@ -37,6 +39,7 @@ config SOC_STIH415
 config SOC_STIH416
 	bool "STiH416 STMicroelectronics Consumer Electronics family"
 	default y
+	select STIH416_RESET
 	help
 	  This enables support for STMicroelectronics Digital Consumer
 	  Electronics family StiH416 parts, primarily targeted at set-top-box
-- 
1.7.6.5
