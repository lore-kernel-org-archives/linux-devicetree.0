From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v7 2/9] arm64: Add Mellanox BlueField SoC config option
Date: Thu,  3 Jan 2019 14:17:15 -0500
Message-ID: <1546543042-156044-2-git-send-email-lsun@mellanox.com>
References: <1546543042-156044-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1546543042-156044-1-git-send-email-lsun@mellanox.com>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <arm@kernel.org>
Cc: devicetree@vger.kernel.org, Liming Sun <lsun@mellanox.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This commit introduces config option for Mellanox BlueField SoC,
which can be used to build the SoC specific drivers, and enables
it by default in configs/defconfig.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 arch/arm64/configs/defconfig | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 51bc479..a9b10a0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -119,6 +119,12 @@ config ARCH_MESON
 	help
 	  This enables support for the Amlogic S905 SoCs.
 
+config ARCH_MLNX_BLUEFIELD
+	bool "Mellanox BlueField SoC Family"
+	select SOC_MLNX
+	help
+	  This enables support for the Mellanox BlueField SoC.
+
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
 	select ARMADA_AP806_SYSCON
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9a57d1..85dbef0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -44,6 +44,7 @@ CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
+CONFIG_ARCH_MLNX_BLUEFIELD=y
 CONFIG_ARCH_MVEBU=y
 CONFIG_ARCH_QCOM=y
 CONFIG_ARCH_ROCKCHIP=y
-- 
1.8.3.1
