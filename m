From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 0/7] ARM: dts: fixes and additions for pxa platform
Date: Fri, 30 Nov 2018 18:55:36 +0100
Message-ID: <20181130175543.32628-1-daniel@zonque.org>
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
To: robert.jarzmik@free.fr, haojian.zhuang@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series carries a number of smaller fixes for the PXA SoC dts
include files. The last patch is a revised version of the Raumfeld
audio devices DTS.

Daniel Mack (7):
  ARM: dts: pxa2xx: drop #address-cells and #size-cells from /cpus
  ARM: dts: pxa3xx: drop #address-cells and #size-cells from pinctrl
    node
  ARM: dts: pxa2xx: fix hwuart memory range
  ARM: dts: pxa: merge &pxa3xx_ohci with &usb0
  ARM: dts: pxa3xx: order timer and gcu nodes under /pxabus
  ARM: dts: pxa3xx: clean up pxa3xx clock controller node name
  ARM: dts: pxa3xx: Add Raumfeld DTS files

 arch/arm/boot/dts/Makefile                    |   7 +
 arch/arm/boot/dts/pxa2xx.dtsi                 |   7 +-
 arch/arm/boot/dts/pxa300-raumfeld-common.dtsi | 405 ++++++++++++++++++
 .../boot/dts/pxa300-raumfeld-connector.dts    |  73 ++++
 .../boot/dts/pxa300-raumfeld-controller.dts   | 266 ++++++++++++
 .../boot/dts/pxa300-raumfeld-speaker-l.dts    |  11 +
 .../boot/dts/pxa300-raumfeld-speaker-m.dts    |  11 +
 .../boot/dts/pxa300-raumfeld-speaker-one.dts  | 137 ++++++
 .../boot/dts/pxa300-raumfeld-speaker-s.dts    |  11 +
 .../dts/pxa300-raumfeld-tuneable-clock.dtsi   |  85 ++++
 arch/arm/boot/dts/pxa3xx.dtsi                 |  44 +-
 11 files changed, 1026 insertions(+), 31 deletions(-)
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-common.dtsi
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-connector.dts
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-controller.dts
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-speaker-l.dts
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-speaker-m.dts
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-speaker-one.dts
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-speaker-s.dts
 create mode 100644 arch/arm/boot/dts/pxa300-raumfeld-tuneable-clock.dtsi

-- 
2.19.2
