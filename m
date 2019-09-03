From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: [PATCH 0/4] arm64: Add basic support for Amlogic A1 SoC Family
Date: Tue, 3 Sep 2019 02:51:11 -0400
Message-ID: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
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
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>, Tao Zeng <tao.zeng@amlogic.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

A1 is an application processor designed for smart audio and IoT applications,
with Dual core ARM Cortex-A35 CPU. Unlike the previous GXL and G12 series,
there is no Cortex-M3 AO CPU in it.

This serial add basic support for the Amlogic A1 based Amlogic AD401 board:
which describe components as follows: Reserve Memory, CPU, GIC, IRQ,
Timer, UART. It's capable of booting up into the serial console.

The pclk for uart_AO_B need to be fixed once A1 clock driver is merged.
In this version, it rely on bootloader to enable the pclk gate

Jianxin Pan (4):
  soc: amlogic: meson-gx-socinfo: Add A1 and A113L IDs
  dt-bindings: arm: amlogic: add A1 bindings
  dt-bindings: arm: amlogic: add Amlogic AD401 bindings
  arm64: dts: add support for A1 based Amlogic AD401

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts     |  30 +++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 121 +++++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c             |   2 +
 5 files changed, 160 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1.dtsi

-- 
2.7.4
