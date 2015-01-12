From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v4 0/4] Add basic support for Mediatek MT8173 SoC
Date: Mon, 12 Jan 2015 17:14:29 +0800
Message-ID: <1421054073-43468-1-git-send-email-eddie.huang@mediatek.com>
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
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, marc.zyngier@arm.com, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, peter.maydell@linaro.org, linux-arm-kernel@lists.infradead.org, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

MT8173 is a SoC based on 64bit ARMv8 architecture. It contains 2 CA53 + 2 CA57 cores.
MT8173 share many HW IP with MT8135 and other MT65xx series. This patchset was tested
on MT8173 engineer sample, and boot to shell ok.

This series contains document bindings, device tree, defconfig, and one sysirq
modification for MT8173.

Changes in v4:
1. Add sysirq, uart binding documents.
2. Disable UART in mt8173.dtsi, enable needed UART in mt8173-evb.dtsi

This patch base on 3.19-rc1, Joe's sysirq patch [1] and test boot to shell with
Catalin Marinas's arch_timer virtual counter patch [2]

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/310335.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/309856.html

Eddie Huang (3):
  Document: DT: Add bindings for mediatek MT8173 SoC Platform
  arm64: dts: Add mediatek MT8173 SoC and evaluation board dts and
    Makefile
  arm64: mediatek: Add MT8173 SoC Kconfig and defconfig

Yingjoe Chen (1):
  irqchip: mtk-sysirq: Get irq number from register resource size

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 .../bindings/arm/mediatek/mediatek,sysirq.txt      |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   4 +-
 arch/arm64/Kconfig                                 |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   5 +
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |  38 +++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 168 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/irqchip/irq-mtk-sysirq.c                   |  18 ++-
 10 files changed, 239 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/Makefile
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173.dtsi

--
1.8.1.1.dirty
