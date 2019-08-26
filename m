From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH 04/12] ARM: dts: imx7d: cl-som-imx7: add emmicro,em3027 RTC
Date: Mon, 26 Aug 2019 16:37:52 +0100
Message-ID: <20190826153800.35400-4-git@andred.net>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826153800.35400-1-git@andred.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Ilya Ledvich <ilya@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add/enable RTC support using the on-board EM3027 real time
clock on i2c2.

Signed-off-by: André Draszik <git@andred.net>
Cc: Ilya Ledvich <ilya@compulab.co.il>
Cc: Igor Grinberg <grinberg@compulab.co.il>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index ec82f4738c4f..481bd3971c55 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -181,6 +181,11 @@
 		reg = <0x50>;
 		pagesize = <16>;
 	};
+
+	rtc@56 {
+		compatible = "emmicro,em3027";
+		reg = <0x56>;
+	};
 };
 
 &uart1 {
-- 
2.23.0.rc1
