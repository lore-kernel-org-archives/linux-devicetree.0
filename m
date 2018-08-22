From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2] ARM: multi_v7_defconfig: enable STM32 SPI
Date: Wed, 22 Aug 2018 12:49:49 +0200
Message-ID: <1534934989-22292-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the STM32 SPI driver, implemented on STM32MP1 SoC.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b749d1e..4cdb622 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -417,6 +417,7 @@ CONFIG_SPI_S3C64XX=m
 CONFIG_SPI_SH_MSIOF=m
 CONFIG_SPI_SH_HSPI=y
 CONFIG_SPI_SIRF=y
+CONFIG_SPI_STM32=m
 CONFIG_SPI_SUN4I=y
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA114=y
-- 
2.7.4
