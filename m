From: Richard Zhao <richard.zhao@linaro.org>
Subject: [PATCH V6 7/7] arm/imx6q: select ARCH_HAS_CPUFREQ
Date: Fri, 30 Dec 2011 10:56:09 +0800
Message-ID: <1325213769-11752-8-git-send-email-richard.zhao@linaro.org>
References: <1325213769-11752-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1325213769-11752-1-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux@arm.linux.org.uk, davej@redhat.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, kernel@pengutronix.de, shawn.guo@linaro.org, catalin.marinas@arm.com, eric.miao@linaro.org, mark.langsdorf@calxeda.com, davidb@codeaurora.org, arnd@arndb.de, bryanh@codeaurora.org, jamie@jamieiles.com, marc.zyngier@arm.com, linaro-dev@lists.linaro.org, patches@linaro.org, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
---
 arch/arm/mach-imx/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index c44aa97..39cf00a 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -595,6 +595,7 @@ comment "i.MX6 family:"
 
 config SOC_IMX6Q
 	bool "i.MX6 Quad support"
+	select ARCH_HAS_CPUFREQ
 	select ARM_GIC
 	select CACHE_L2X0
 	select CPU_V7
-- 
1.7.5.4


