From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] ARM64: dts: Add support for Meson GXM
Date: Mon, 21 Nov 2016 17:29:03 +0100
Message-ID: <20161121162905.14285-1-narmstrong@baylibre.com>
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
To: khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

The new Amlogic GXM SoC (S912) is part of the Meson GX family and is nearly
identical to GXM but with a second Quad-A53 core cluster.

The GXM dtsi includes the GXL dtsi and the p20x dtsi is refactored in a
common p20x/q20x to support the GXM Q200 and Q201 board that uses the exact
same board layout since the S905D and S912 are pinout compatible.

The last patch adds support for the Nexbox A1 Set-Top-Box based on the S912.

Changes since RFC :
 - Refactor the p20x/q20x dtsi into a single common file
 - Add support for Nexbox A1

Neil Armstrong (2):
  ARM64: dts: Add support for Meson GXM
  Add support for the Nexbox A1 board based on the Amlogic S912 SoC.

 Documentation/devicetree/bindings/arm/amlogic.txt  |   7 +
 arch/arm64/boot/dts/amlogic/Makefile               |   3 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 190 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |  19 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |   7 +
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts      |   3 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p231.dts      |   3 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi     | 188 --------------------
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 169 ++++++++++++++++++
 .../arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts |  77 +++++++++
 .../arm64/boot/dts/amlogic/meson-gxm-s912-q201.dts |  58 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         | 114 +++++++++++++
 12 files changed, 648 insertions(+), 190 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
 delete mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p23x.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-s912-q200.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-s912-q201.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi

-- 
2.7.0
