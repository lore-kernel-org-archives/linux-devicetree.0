From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 4/4] arm64: defconfig: enable some drivers for
 hi3798cv200-poplar board.
Date: Wed, 26 Jul 2017 14:06:03 +0800
Message-ID: <1501049163-18892-5-git-send-email-xuejiancheng@hisilicon.com>
References: <1501049163-18892-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501049163-18892-1-git-send-email-xuejiancheng@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, kishon@ti.com, xuwei5@hisilicon.com, catalin.marinas@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, project-aspen-dev@linaro.org, Jiancheng Xue <xuejiancheng@hisilicon.com>, hermit.wangheming@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable GMAC,I2C,USB2-PHY for hi3798cv200-poplar board.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6c7d147..93c709d7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -184,6 +184,7 @@ CONFIG_VIRTIO_NET=y
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
 CONFIG_MACB=y
+CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
 CONFIG_E1000E=y
@@ -267,6 +268,7 @@ CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I2C_HIX5HD2=y
 CONFIG_SPI=y
 CONFIG_SPI_MESON_SPICC=m
 CONFIG_SPI_MESON_SPIFC=m
@@ -504,7 +506,9 @@ CONFIG_PWM_MESON=m
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
 CONFIG_PWM_TEGRA=m
+CONFIG_TI_SYSCON_RESET=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
1.9.1
