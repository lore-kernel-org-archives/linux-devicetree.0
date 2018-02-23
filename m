From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2 0/5] arm: zynq: Adding new Xilinx boards
Date: Fri, 23 Feb 2018 16:00:18 +0100
Message-ID: <cover.1519398009.git.michal.simek@xilinx.com>
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
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Josh Cartwright <josh.cartwright@ni.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, monstr@monstr.eu, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Herring <robherring2@gmail.com>, Russell King <linux@armlinux.org.uk>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

this patchset is adding 5 new dts files which target cc108 and zc770
boards.
Please let me know if you see any issue with them.

Series depends on this one patch
https://lkml.org/lkml/2018/2/23/412

Thanks,
Michal

Changes in v2:
- Record compatible string to xilinx.txt
- Record compatible string to xilinx.txt
- Record compatible string to xilinx.txt
- Record compatible string to xilinx.txt
- use eeprom as node name instead of at25
- Record compatible string to xilinx.txt

Michal Simek (5):
  arm: zynq: Add Xilinx cc108 board
  arm: zynq: Add support for Xilinx zc770 xm010 dc1 board
  arm: zynq: Add support for Xilinx zc770 xm011 dc2 board
  arm: zynq: Add support for Xilinx zc770 xm012 dc3 board
  arm: zynq: Add support for Xilinx zc770 xm013 dc4 board

 Documentation/devicetree/bindings/arm/xilinx.txt | 11 +++
 arch/arm/boot/dts/Makefile                       |  5 ++
 arch/arm/boot/dts/zynq-cc108.dts                 | 75 +++++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm010.dts           | 92 ++++++++++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm011.dts           | 64 +++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm012.dts           | 64 +++++++++++++++++
 arch/arm/boot/dts/zynq-zc770-xm013.dts           | 78 ++++++++++++++++++++
 7 files changed, 389 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-cc108.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm010.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm011.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm012.dts
 create mode 100644 arch/arm/boot/dts/zynq-zc770-xm013.dts

-- 
1.9.1
