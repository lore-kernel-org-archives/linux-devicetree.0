From: Priit Laes <plaes@plaes.org>
Subject: [PATCH 1/4] arm: defconfig: imx6: Added CONFIG_FHANDLE
Date: Sun, 19 Feb 2017 22:27:58 +0200
Message-ID: <20170219202801.2082-2-plaes@plaes.org>
References: <20170219202801.2082-1-plaes@plaes.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170219202801.2082-1-plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Priit Laes <plaes@plaes.org>
List-Id: devicetree@vger.kernel.org

CONFIG_FHANDLE is a must-have for newer distributions with systemd
support (including Debian stable).

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index cbe7faf..701db9a 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -1,5 +1,6 @@
 CONFIG_KERNEL_LZO=y
 CONFIG_SYSVIPC=y
+CONFIG_FHANDLE=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_IKCONFIG=y
-- 
2.9.3
