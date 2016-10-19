From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 6/9] ARM64: meson: enable MESON_IRQ_GPIO in Kconfig
Date: Wed, 19 Oct 2016 12:08:26 +0200
Message-ID: <1476871709-8359-7-git-send-email-jbrunet@baylibre.com>
References: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1476871709-8359-1-git-send-email-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add select MESON_IRQ_GPIO in Kconfig for Amlogic's meson SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index cfbdf02ef566..846479d4492d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -95,6 +95,7 @@ config ARCH_MESON
 	select PINCTRL_MESON
 	select COMMON_CLK_AMLOGIC
 	select COMMON_CLK_GXBB
+	select MESON_GPIO_IRQ
 	help
 	  This enables support for the Amlogic S905 SoCs.
 
-- 
2.7.4
