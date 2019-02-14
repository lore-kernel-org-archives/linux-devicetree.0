From: thor.thayer@linux.intel.com
Subject: [PATCHv4 4/6] arm64: defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
Date: Thu, 14 Feb 2019 14:44:16 -0600
Message-ID: <1550177058-1860-5-git-send-email-thor.thayer@linux.intel.com>
References: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
Sender: netdev-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, olof@lixom.net
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Enable the Stratix10 System Manager by default.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
v2-4  No change
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
