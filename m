From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 0/6] ARM: dts: tq imx7 evaluation board
Date: Mon,  4 Mar 2019 17:56:24 +0100
Message-ID: <20190304165630.18225-1-bruno.thomsen@gmail.com>
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
Cc: devicetree@vger.kernel.org, bruno.thomsen@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

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

Bruno Thomsen (6):
  dt-bindings: add vendor prefix for TQ Systems GmbH
  dt-bindings: fsl: add compatible for i.MX7S generic board
  dt-bindings: tq: add compatible for i.MX7 boards
  ARM: dts: tq imx7 common board support
  ARM: dts: tq imx7s board support
  ARM: dts: tq imx7d board support

 Documentation/devicetree/bindings/arm/fsl.txt |   4 +
 Documentation/devicetree/bindings/arm/tq.txt  |  35 ++
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/imx7-mba7.dtsi              | 586 ++++++++++++++++++
 arch/arm/boot/dts/imx7-tqma7.dtsi             | 232 +++++++
 arch/arm/boot/dts/imx7d-mba7.dts              | 122 ++++
 arch/arm/boot/dts/imx7d-tqma7.dtsi            |  11 +
 arch/arm/boot/dts/imx7s-mba7.dts              |  18 +
 arch/arm/boot/dts/imx7s-tqma7.dtsi            |  11 +
 10 files changed, 1022 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tq.txt
 create mode 100644 arch/arm/boot/dts/imx7-mba7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7-tqma7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7d-mba7.dts
 create mode 100644 arch/arm/boot/dts/imx7d-tqma7.dtsi
 create mode 100644 arch/arm/boot/dts/imx7s-mba7.dts
 create mode 100644 arch/arm/boot/dts/imx7s-tqma7.dtsi

-- 
2.20.1
