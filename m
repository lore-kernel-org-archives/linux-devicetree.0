From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2 0/8] arm64: zynqmp: Add support for existing Xilinx ZynqMP
 based boards
Date: Fri, 23 Feb 2018 15:40:22 +0100
Message-ID: <cover.1519396753.git.michal.simek@xilinx.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, monstr@monstr.eu, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This patchset is adding all current existing Xilinx ZynqMP boards.
zcu* boards are customer boards. zc1* are mainly Xilinx internal boards
but some of them have been shared with customers. zc1751 is unique in
this set because it is based board with FMC card for silicon/hard IP
validation.
All boards are using the same default clock configuration till clock
driver is merged to mainline. Some boards also contain other components
which are not described because mainline driver haven't been merged yet.
For example nand, qspi, pinctrl and phy.
Please let me know if you see any issue with these boards.

Thanks,
Michal

Changes in v2:
- New patch in this series
- Use i2c-mux instead of i2cswitch
- Remove i2c mw u-boot commands
- Use 96boards labels for i2cs and spis
- Fix pmic and wifi node
- Record compatible string to xilinx.txt
- Remove Nathalie's email (she left Xilinx already)
- Remove i2c mw u-boot commands
- Use i2c-mux instead of i2cswitch
- Use clock generator without numbers.
- Use dash in node name zcu102 rev1.0
- Record compatible string to xilinx.txt
- Remove i2c mw u-boot commands
- Record compatible string to xilinx.txt
- Remove i2c mw u-boot commands
- Use i2c-mux instead of i2cswitch
- Use clock generator without numbers
- Record compatible string to xilinx.txt
- Remove i2c mw u-boot commands
- Use i2c-mux instead of i2cswitch
- Use clock generator without numbers.
- Record compatible string to xilinx.txt
- Record compatible string to xilinx.txt
- Record compatible string to xilinx.txt

Michal Simek (8):
  dt-bindings: xilinx: Add description for ZynqMP
  arm64: zynqmp: Add support for Xilinx zcu100-revC
  arm64: zynqmp: Add support for Xilinx zcu102
  arm64: zynqmp: Add support for Xilinx zcu104-revA
  arm64: zynqmp: Add support for Xilinx zcu106-revA
  arm64: zynqmp: Add support for Xilinx zcu111-revA
  arm64: zynqmp: Add support for Xilinx zc12XX boards
  arm64: zynqmp: Add support for Xilinx zc1751

 Documentation/devicetree/bindings/arm/xilinx.txt   |  42 ++
 arch/arm64/boot/dts/xilinx/Makefile                |  15 +
 arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi         | 213 ++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts  |  54 ++
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts  |  42 ++
 arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts  |  42 ++
 .../boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    | 133 +++++
 .../boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts    | 170 +++++++
 .../boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts    | 153 ++++++
 .../boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    | 181 +++++++
 .../boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts    | 126 +++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  | 292 +++++++++++
 .../arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts |  36 ++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  | 550 +++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts  |  42 ++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  | 197 ++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  | 524 ++++++++++++++++++++
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  | 446 +++++++++++++++++
 18 files changed, 3258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts

-- 
1.9.1
