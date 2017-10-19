From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/5] ARM64: meson: enable MESON_IRQ_GPIO in Kconfig
Date: Thu, 19 Oct 2017 14:01:40 +0200
Message-ID: <20171019120143.20581-3-jbrunet@baylibre.com>
References: <20171019120143.20581-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171019120143.20581-1-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

select MESON_IRQ_GPIO in Kconfig for Amlogic's meson SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6b54ee8c1262..5d5e79e8d556 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -104,6 +104,7 @@ config ARCH_MESON
 	select PINCTRL_MESON
 	select COMMON_CLK_AMLOGIC
 	select COMMON_CLK_GXBB
+	select MESON_IRQ_GPIO
 	help
 	  This enables support for the Amlogic S905 SoCs.
 
-- 
2.13.6
