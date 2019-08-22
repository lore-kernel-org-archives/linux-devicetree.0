From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 0/1] arch: arm64: imx8mq: Add mux-controller to iomuxc_gpr
Date: Thu, 22 Aug 2019 13:07:18 +0200
Message-ID: <cover.1566471985.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds a mux-controller to the iomuxc_gpr syscon. It will e.g. be used by
the NWL DSI host controller driver.

Guido Günther (1):
  arm64: dts: imx8mq: Add mux controller to iomuxc_gpr

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.20.1
