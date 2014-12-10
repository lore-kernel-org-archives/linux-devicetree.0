From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH 0/4] Add basic support for Mediatek MT8173 SoC
Date: Wed, 10 Dec 2014 18:49:58 +0800
Message-ID: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

MT8173 is a SoC based on 64bit ARMv8 architecture. It contains 
2 CA53 + 2 CA57 cores. MT8173 share many HW IP with MT8135 and other 
MT65xx series. This patchset was tested on MT8173 engineer sample, and 
boot to shell ok.

This series contains document bindings, device tree, defconfig, 
and one sysirq modification for MT8173.

This series is based on 3.18, and Joe's MT8135 basic support patch [1] 
and sysirq patch [2]

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/296093.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/305808.html

Eddie Huang (3):
  Document: DT: Add bindings for mediatek MT8173 Soc Platform
  arm64: dts: Add mediatek MT8173 SoC and evaluation board dts and
    Makefile
  arm64: mediatek: Add MT8173 SoC Kconfig and defconfig

Yingjoe Chen (1):
  irqchip: mediatek: Add support for mt8173

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 arch/arm64/Kconfig                                 |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/mt8173-evb.dts                 |  31 ++++
 arch/arm64/boot/dts/mt8173.dtsi                    | 164 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/irqchip/irq-mtk-sysirq.c                   |  22 ++-
 7 files changed, 226 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mt8173-evb.dts
 create mode 100644 arch/arm64/boot/dts/mt8173.dtsi

-- 
1.8.1.1.dirty 
