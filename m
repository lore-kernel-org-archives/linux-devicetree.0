From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: tq imx7 evaluation board
Date: Wed,  3 Apr 2019 08:44:22 +0200
Message-ID: <20190403064427.30041-1-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
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
Cc: devicetree@vger.kernel.org, laa@kamstrup.com, festevam@gmail.com, s.hauer@pengutronix.de, clemens.ml@gmx.net, bruno.thomsen@gmail.com, bth@kamstrup.com, ksc@kamstrup.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

Thanks for all the review comments Shawn Guo, Rob Herring and
Clemens Koller. All issues that have been pointed out are fixed in v2.
Patch 2 and 3 has been merged as they both modify the new fsl.yaml.

This patch series is an effort to get mainline kernel support for TQ
boards with i.MX7 SoCs and is based on the vendor BSP. Products based
on these TQMa7 modules such as smart grid infrastructure will be sold
for many years with an expected field lifetime of up to two decades.
During this long lifetime they need to receive security patches and
new in-kernel security features. The typical device of this type does
not use audio and video, so it has not been a focus area. This however
could be worked on in the future if someone desire that functionality.

The following device trees has been tested on a 4.19 mainline kernel
together with U-Boot 2019.01.

Working/tested:
USB
Ethernet
SD
Console
Buttons

Not working/tested:
Sound
Video

No changes to MAINTAINERS are needed IMHO.

Bruno Thomsen (5):
  dt-bindings: add vendor prefix for TQ Systems GmbH
  dt-bindings: arm: add TQ boards
  ARM: dts: tq imx7 common board support
  ARM: dts: tq imx7s board support
  ARM: dts: tq imx7d board support

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imx7-mba7.dtsi              | 563 ++++++++++++++++++
 arch/arm/boot/dts/imx7-tqma7.dtsi             | 233 ++++++++
 arch/arm/boot/dts/imx7d-mba7.dts              | 119 ++++
 arch/arm/boot/dts/imx7d-tqma7.dtsi            |  11 +
 arch/arm/boot/dts/imx7s-mba7.dts              |  18 +
 arch/arm/boot/dts/imx7s-tqma7.dtsi            |  11 +
 9 files changed, 965 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7-mba7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7-tqma7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-mba7.dts
 create mode 100644 arch/arm/boot/dts/imx7d-tqma7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7s-mba7.dts
 create mode 100644 arch/arm/boot/dts/imx7s-tqma7.dtsi

-- 
2.20.1
