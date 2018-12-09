From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 1/6] arm64: add basic Kconfig symbols for i.MX8
Date: Sun, 9 Dec 2018 14:26:06 +0000
Message-ID: <1544365552-30270-2-git-send-email-abel.vesa@nxp.com>
References: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach@pengutronix.de>

Add basic Kconfig symbols to make the MXC architecture available
in the ARM64 world.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 28f0521..7e1545a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -142,6 +142,20 @@ config ARCH_MVEBU
 	   - Armada 7K SoC Family
 	   - Armada 8K SoC Family
=20
+config ARCH_MXC
+	bool "ARMv8 based NXP i.MX SoC family"
+	help
+	  This enables support for the ARMv8 based SoCs in the
+	  NXP i.MX family.
+
+config SOC_IMX8MQ
+	bool "i.MX8MQ support"
+	depends on ARCH_MXC
+	select ARM64_ERRATUM_843419
+	select ARM64_ERRATUM_845719
+	help
+	  This enables support for the i.MX8MQ SoC.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
--=20
2.7.4
