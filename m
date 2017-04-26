From: <sean.wang@mediatek.com>
Subject: [PATCH v2 00/30] arm: dts: extend mt7623 support
Date: Wed, 26 Apr 2017 17:25:44 +0800
Message-ID: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
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
To: robh+dt@kernel.org, matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Changes since v1:
Continue the upstream journey based on the previous John Crispin's good work.
- add fixes for the v1 suggestion
- fix typo in the commit log
- add missing pinctrl bindings for mt7623
- reuse pinctrl driver for mt7623
- enhance existing nodes since the way for binding is changed e.g USB
- add more nodes which already gets support from the latest tree e.g MT7530 DSA
- add the dts file for Bananapi R2 (BPI-R2) board

This series extends the dts files used for booting mt7623 base boards.
Since support for mt7623 was added around v4.6, many new drivers have
been accepted upstream. The contained patches add several of these to
the devicetree.

Additionally the series does a bit of refactoring. Mediatek pointed out
that the evaluation board is infact a reference design and asked the the
evb files be renamed to rfb.

As with all of the current ARM bases MTK silicon, these boards also have
a PMIC. Instead of adding the nodes to all of the dts files, we add an
intermediate dtsi file that contains the required nodes. This allows us
to reduce the size of the top most dts files.

The RFB comes in various versions and asiarf has even done a crowdfunder
to sell them. We should try to reduce the duplication. This series adds
a common dtsi file for these boards. This results in the topmost dts files
only needing to specify the compatible string, MTD nodes and ethernet setup.

John Crispin (14):
  arm: dts: mt7623: add clock controller device nodes
  arm: dts: mt7623: add subsystem clock controller device nodes
  arm: dts: mt7623: add power domain controller device node
  arm: dts: mt7623: add clock-frequency to the a7 timer node to
    mt7623.dtsi
  arm: dts: mt7623: add pinctrl nodes to the mt7623 dtsi file
  arm: dts: mt7623: add pmic wrapper nodes to the mt7623 dtsi file
  arm: dts: mt7623: add i2c nodes to the mt7623.dtsi file
  arm: dts: mt7623: add nand nodes to the mt7623.dtsi file
  arm: dts: mt7623: add mmc nodes to the mt7623.dtsi file
  arm: dts: mt7623: add usb nodes to the mt7623.dtsi file
  arm: dts: mt7623: add mt7623-mt6323.dtsi file
  arm: dts: mt7623: cleanup the mt7623n rfb uart nodes
  arm: dts: mt7623: enable the usb device on the mt7623n rfb
  arm: dts: mt7623: enable the nand device on the mt7623n nand rfb

Sean Wang (16):
  pinctrl: mediatek: Add missing pinctrl bindings for mt7623
  pinctrl: mediatek: reuse pinctrl driver for mt7623
  arm: dts: mt7623: add spi nodes to the mt7623.dtsi file
  arm: dts: mt7623: add pwm nodes to the mt7623.dtsi file
  arm: dts: mt7623: add ethernet nodes to the mt7623.dtsi file
  arm: dts: mt7623: add crypto engine nodes to the mt7623.dtsi file
  arm: dts: mt7623: add ir nodes to the mt7623.dtsi file
  arm: dts: mt7623: add afe nodes to the mt7623.dtsi file
  arm: dts: mt7623: add rng nodes to the mt7623.dtsi file
  arm: dts: mt7623: add auxadc nodes to the mt7623.dtsi file
  arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file
  arm: dts: mt7623: add thermal nodes to the mt7623.dtsi file
  arm: dts: mt7623: add Sean as one of authors for mt7623.dtsi files
  arm: dts: mt7623: rename mt7623-evb.dts to
    arch/arm/boot/dts/mt7623n-rfb.dtsi
  dt-bindings: add vendor prefix for bananapi
  arm: dts: mt7623: add dts file for Bananapi R2 (BPI-R2) board

 Documentation/devicetree/bindings/arm/mediatek.txt |    8 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 -
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/mt7623-evb.dts                   |   33 -
 arch/arm/boot/dts/mt7623-mt6323.dtsi               |  269 +++
 arch/arm/boot/dts/mt7623.dtsi                      |  556 +++++-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      |  478 +++++
 arch/arm/boot/dts/mt7623n-rfb-nand.dts             |  109 ++
 arch/arm/boot/dts/mt7623n-rfb.dtsi                 |   61 +
 arch/arm/mach-mediatek/mediatek.c                  |    4 +-
 arch/arm/mach-mediatek/platsmp.c                   |    2 +-
 drivers/pinctrl/mediatek/Kconfig                   |    9 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 -
 drivers/pinctrl/mediatek/pinctrl-mt7623.c          |  379 ----
 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h      | 1936 --------------------
 include/dt-bindings/pinctrl/mt7623-pinfunc.h       |   30 +-
 17 files changed, 1497 insertions(+), 2383 deletions(-)
 delete mode 100644 arch/arm/boot/dts/mt7623-evb.dts
 create mode 100644 arch/arm/boot/dts/mt7623-mt6323.dtsi
 create mode 100644 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
 create mode 100644 arch/arm/boot/dts/mt7623n-rfb-nand.dts
 create mode 100644 arch/arm/boot/dts/mt7623n-rfb.dtsi
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7623.c
 delete mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h

-- 
1.9.1
