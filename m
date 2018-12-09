From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 4/6] MAINTAINERS: add i.MX8 DT path to i.MX architecture
Date: Sun, 9 Dec 2018 14:26:09 +0000
Message-ID: <1544365552-30270-5-git-send-email-abel.vesa@nxp.com>
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

Shawn agreed to take patches for the i.MX8 parts through his tree.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3625a8d..b41ebff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1530,6 +1530,7 @@ F:	arch/arm/mach-imx/
 F:	arch/arm/mach-mxs/
 F:	arch/arm/boot/dts/imx*
 F:	arch/arm/configs/imx*_defconfig
+F:	arch/arm64/boot/dts/freescale/imx*
 F:	drivers/clk/imx/
 F:	drivers/firmware/imx/
 F:	drivers/soc/imx/
--=20
2.7.4
