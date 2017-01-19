From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: ARM: i.MX7: Fix LPSR specific iomux pins
Date: Thu, 19 Jan 2017 10:09:20 +0100
Message-ID: <20170119090924.19636-1-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

The i.MX7 has two iomux controllers. the iomuxc and the iomuxc_lpsr.
Some pinmux settings in the board dts files are non functional because
they are attached to the wrong iomux controller. The following patches
fix this.
It's way too easy to fall into this trap again. Only a look into the
reference manual can reveal which pin belongs to which controller.
To make this clearer the last patch adds "LPSR" to the pin names
which belong to the LPSR controller.

Sascha

----------------------------------------------------------------
Sascha Hauer (4):
      ARM: dts: imx7s-warp: Fix watchdog pinmux
      ARM: dts: imx7d-sdp: Fix watchdog and pwm pinmux
      ARM: dts: imx7d-cl-som: Fix OTG power pinctrl
      ARM: dts: imx7: Add "LPSR" to LPSR iomux pin names

 arch/arm/boot/dts/imx7-colibri.dtsi     |  16 ++---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts |  14 ++--
 arch/arm/boot/dts/imx7d-nitrogen7.dts   |  14 ++--
 arch/arm/boot/dts/imx7d-pinfunc.h       | 110 ++++++++++++++++----------------
 arch/arm/boot/dts/imx7d-sdb.dts         |  26 ++++----
 arch/arm/boot/dts/imx7s-warp.dts        |   4 +-
 6 files changed, 95 insertions(+), 89 deletions(-)
