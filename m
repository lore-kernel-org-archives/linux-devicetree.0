From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH 00/22] This patchset holds some common changes that were never
 upstreamed.
Date: Tue, 30 Jul 2019 16:46:27 +0200
Message-ID: <20190730144649.19022-1-dev@pschenker.ch>
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
To: marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, stefan@agner.ch, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Philippe Schenker <philippe.schenker@toradex.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Philippe Schenker <philippe.schenker@toradex.com>

With latest downstream kernel upgrade, I took the aproach to select
mainline devicetrees and atomically add missing stuff for downstream.

These patches I send here are separated out with changes that also
have a benfit for mainline.

Philippe


Marcel Ziswiler (1):
  ARM: dts: imx7-colibri: make sure module supplies are always on

Max Krummenacher (2):
  ARM: dts: imx6ull-colibri: reduce v_batt current in power off
  ARM: dts: imx6ull: improve can templates

Oleksandr Suvorov (1):
  ARM: dts: add recovery for I2C for iMX7

Philippe Schenker (15):
  ARM: dts: imx7-colibri: prepare module device tree for FlexCAN
  ARM: dts: imx7-colibri: Add sleep mode to ethernet
  ARM: dts: imx7-colibri: Add touch controllers
  ARM: dts: imx6qdl-colibri: add phy to fec
  ARM: dts: imx6qdl-colibri: Add missing pin declaration in iomuxc
  ARM: dts: imx6: Add sleep state to can interfaces
  ARM: dts: imx6: Add touchscreens used on Toradex eval boards
  ARM: dts: colibri-imx6: Add missing pinmuxing to Toradex eval board
  ARM: dts: apalis-imx6: Add some example I2C devices
  ARM: dts: apalis-imx6: Add some optional I2C devices
  ARM: dts: imx6ull-colibri: Add sleep mode to fec
  ARM: dts: imx6ull-colibri: Add watchdog
  ARM: dts: imx6ull-colibri: Add general wakeup key used on Colibri
  ARM: dts: imx6/7-colibri: switch dr_mode to otg
  ARM: dts: imx6ull-colibri: Add touchscreens used with Eval Board

Stefan Agner (3):
  ARM: dts: imx7-colibri: disable HS400
  ARM: dts: imx7-colibri: add GPIO wakeup key
  ARM: dts: imx7-colibri: fix 1.8V/UHS support

 arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts  |  52 ++++++++
 arch/arm/boot/dts/imx6q-apalis-eval.dts       | 122 ++++++++++++++++++
 arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts |  19 +++
 arch/arm/boot/dts/imx6q-apalis-ixora.dts      |  19 +++
 arch/arm/boot/dts/imx6qdl-apalis.dtsi         |  27 +++-
 arch/arm/boot/dts/imx6qdl-colibri.dtsi        |  27 +++-
 .../arm/boot/dts/imx6ull-colibri-eval-v3.dtsi |  63 +++++++++
 .../arm/boot/dts/imx6ull-colibri-nonwifi.dtsi |   2 +-
 arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi   |   2 +-
 arch/arm/boot/dts/imx6ull-colibri.dtsi        |  52 +++++++-
 arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi   |  51 ++++++++
 arch/arm/boot/dts/imx7-colibri.dtsi           | 114 ++++++++++++++--
 12 files changed, 524 insertions(+), 26 deletions(-)

-- 
2.22.0
