From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 6/7] MAINTAINERS: Add FDMA driver files to STi section.
Date: Wed,  8 Jul 2015 17:11:27 +0100
Message-ID: <1436371888-27863-7-git-send-email-peter.griffin@linaro.org>
References: <1436371888-27863-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436371888-27863-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, dan.j.williams@intel.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, ludovic.barre@st.com
List-Id: devicetree@vger.kernel.org

This patch adds the FDMA driver files to the STi
section of the maintainers file.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8133cef..8cb1ad9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1503,6 +1503,8 @@ S:	Maintained
 F:	arch/arm/mach-sti/
 F:	arch/arm/boot/dts/sti*
 F:	drivers/clocksource/arm_global_timer.c
+F:	drivers/dma/st_fdma.*
+F:	drivers/dma/st_fdma_xbar.c
 F:	drivers/i2c/busses/i2c-st.c
 F:	drivers/media/rc/st_rc.c
 F:	drivers/mmc/host/sdhci-st.c
-- 
1.9.1
