From: thor.thayer@linux.intel.com
Subject: [PATCHv3 4/6] arm64: defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
Date: Mon, 28 Jan 2019 16:14:13 -0600
Message-ID: <1548713655-25940-5-git-send-email-thor.thayer@linux.intel.com>
References: <1548713655-25940-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548713655-25940-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, olof@lixom.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Enable the Stratix10 System Manager by default.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2-3  No change
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c8432e24207e..48a312126cf7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -417,6 +417,7 @@ CONFIG_MESON_WATCHDOG=m
 CONFIG_RENESAS_WDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_BCM2835_WDT=y
+CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
-- 
2.7.4
