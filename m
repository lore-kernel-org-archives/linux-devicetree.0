From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v5 4/7] arm64: berlin: add the pinctrl dependency for Marvell
 Berlin SoCs
Date: Fri, 9 Oct 2015 19:56:47 +0800
Message-ID: <1444391810-5045-5-git-send-email-jszhang@marvell.com>
References: <1444391810-5045-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444391810-5045-1-git-send-email-jszhang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>, linux-gpio@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is to add the pinctrl dependency for Marvell Berlin SoCs.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index c6e2c75..3d17ee2 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -9,6 +9,7 @@ config ARCH_BERLIN
 	bool "Marvell Berlin SoC Family"
 	select ARCH_REQUIRE_GPIOLIB
 	select DW_APB_ICTL
+	select PINCTRL
 	help
 	  This enables support for Marvell Berlin SoC Family
 
-- 
2.6.1
