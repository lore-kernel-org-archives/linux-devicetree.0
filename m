From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 3/3] nvmem: imx-ocotp: broaden Kconfig dependency
Date: Thu, 28 Feb 2019 08:01:37 +0100
Message-ID: <20190228070137.30867-3-l.stach@pengutronix.de>
References: <20190228070137.30867-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190228070137.30867-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>, Carlo Caione <ccaione@baylibre.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The i.MX OCOTP controller is used in numerous Freescale/NXP
SoCs from the MXC family, so the strict dependency on the
i.MX6 SoC is too narrow. Broaden it to cover all the MXC
familiy members.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
---
v2:
- rebased on linux-next
- collected reviewed-by
---
 drivers/nvmem/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 530d570724c9..9e1d83643e9c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -25,8 +25,8 @@ config NVMEM_IMX_IIM
 	  will be called nvmem-imx-iim.
 
 config NVMEM_IMX_OCOTP
-	tristate "i.MX6 On-Chip OTP Controller support"
-	depends on SOC_IMX6 || SOC_IMX7D || COMPILE_TEST
+	tristate "i.MX 6/7/8 On-Chip OTP Controller support"
+	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This is a driver for the On-Chip OTP Controller (OCOTP) available on
-- 
2.20.1
