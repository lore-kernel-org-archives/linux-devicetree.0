From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v3 0/3] arm: dts: imx8mq: Add cpufreq support
Date: Thu, 28 Feb 2019 21:42:43 +0000
Message-ID: <1551390149-15443-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Changes since v2:
 * renamed the regulator
 * removed the useless enable-active-high from the regulator=20
 * renamed a53_0_opp_table to a53_opp_table

Abel Vesa (3):
  arm64: dts: imx8mq: Add the clocks and the latencies for the A53 cores
  arm64: dts: imx8mq: Add the buck vdd_arm regulator
  arm64: dts: imx8mq: Add the opp table and cores opp properties

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 35 ++++++++++++++++++++++++=
++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 31 ++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

--=20
2.7.4
