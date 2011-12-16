From: Richard Zhao <richard.zhao@linaro.org>
Subject: [PATCH V2 3/4] arm/imx6q: register arm_clk as cpu to clkdev
Date: Fri, 16 Dec 2011 18:31:01 +0800
Message-ID: <1324031462-24961-4-git-send-email-richard.zhao@linaro.org>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux@arm.linux.org.uk, davej@redhat.com, kernel@pengutronix.de, shawn.guo@linaro.org, eric.miao@linaro.org, mark.langsdorf@calxeda.com, linaro-dev@lists.linaro.org, patches@linaro.org, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

cpufreq needs cpu clock to change frequency.

Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
---
 arch/arm/mach-imx/clock-imx6q.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/clock-imx6q.c b/arch/arm/mach-imx/clock-imx6q.c
index 039a7ab..72acbc2 100644
--- a/arch/arm/mach-imx/clock-imx6q.c
+++ b/arch/arm/mach-imx/clock-imx6q.c
@@ -1911,6 +1911,7 @@ static struct clk_lookup lookups[] = {
 	_REGISTER_CLOCK(NULL, "gpmi_io_clk", gpmi_io_clk),
 	_REGISTER_CLOCK(NULL, "usboh3_clk", usboh3_clk),
 	_REGISTER_CLOCK(NULL, "sata_clk", sata_clk),
+	_REGISTER_CLOCK(NULL, "cpu", arm_clk),
 };
 
 int imx6q_set_lpm(enum mxc_cpu_pwr_mode mode)
-- 
1.7.5.4


