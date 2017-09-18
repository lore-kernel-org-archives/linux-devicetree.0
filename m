From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 2/2] dts: Enable building of LWN's Display5 board
Date: Mon, 18 Sep 2017 16:59:25 +0200
Message-ID: <1505746765-965-2-git-send-email-lukma@denx.de>
References: <1505746765-965-1-git-send-email-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505746765-965-1-git-send-email-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, fabio.estevam@nxp.com, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

This commit enables building of display5 related dtbs.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 arch/arm/boot/dts/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4b17f35..c293bbb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -400,6 +400,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-cm-fx6.dtb \
 	imx6q-cubox-i.dtb \
 	imx6q-dfi-fs700-m60.dtb \
+	imx6q-display5-tianma-tm070-1280x768.dtb \
+	imx6q-display5-mitsubishi-aa070-800x480.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-evi.dtb \
 	imx6q-gk802.dtb \
-- 
2.1.4
