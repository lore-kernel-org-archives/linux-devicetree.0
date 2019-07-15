From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 0/2] arm64: dts: imx8mq: Add DT node for the Mixel MIPI D-PHY
Date: Mon, 15 Jul 2019 12:43:04 +0200
Message-ID: <cover.1563187253.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that the driver is in linux-next as of 20190624 let's have a DT node
for the i.MX8MQ and enable it on the Librem 5 devkit.

Changes from v1:
- Add Acked-by: form Angus, thanks!

Guido Günther (2):
  arm64: dts: imx8mq: Add MIPI D-PHY
  arm64: dts: imx8mq-librem5: Enable MIPI D-PHY

 .../boot/dts/freescale/imx8mq-librem5-devkit.dts    |  4 ++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi           | 13 +++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.20.1
