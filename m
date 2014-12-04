From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v2 0/4] clk: mediatek: Add common clock support for Mediatek
 MT8135.
Date: Thu, 4 Dec 2014 14:52:18 +0800
Message-ID: <1417675942-10502-1-git-send-email-jamesjj.liao@mediatek.com>
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
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, jamesjj.liao@mediatek.com, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, devicetree@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, "Joe.C" <yingjoe.chen@mediatek.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset contains the initial common clock support for Mediatek SoCs.
Mediatek SoC's clock architecture comprises of various PLLs, dividers,
muxes and clock gates.

This patchset also contains a basic clock support for Mediatek MT8135.

This driver is based on 3.18-rc1 + MT8135 basic support.

James Liao (4):
  clk: dts: mediatek: add Mediatek MT8135 clock bindings
  clk: mediatek: Add initial common clock support for Mediatek SoCs.
  clk: mediatek: Add basic clocks for Mediatek MT8135.
  dts: mediatek: Enable clock support for Mediatek MT8135.

 .../bindings/clock/mediatek,mt8135-clock.txt       |   36 +
 arch/arm/boot/dts/mt8135.dtsi                      |   47 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/mediatek/Makefile                      |    2 +
 drivers/clk/mediatek/clk-gate.c                    |  151 +++
 drivers/clk/mediatek/clk-gate.h                    |   48 +
 drivers/clk/mediatek/clk-mt8135-pll.c              |  891 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8135-pll.h              |   28 +
 drivers/clk/mediatek/clk-mt8135.c                  | 1012 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c                     |   93 ++
 drivers/clk/mediatek/clk-mtk.h                     |   47 +
 drivers/clk/mediatek/clk-pll.c                     |   63 ++
 drivers/clk/mediatek/clk-pll.h                     |   50 +
 include/dt-bindings/clock/mt8135-clk.h             |  190 ++++
 14 files changed, 2659 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8135-clock.txt
 create mode 100644 drivers/clk/mediatek/Makefile
 create mode 100644 drivers/clk/mediatek/clk-gate.c
 create mode 100644 drivers/clk/mediatek/clk-gate.h
 create mode 100644 drivers/clk/mediatek/clk-mt8135-pll.c
 create mode 100644 drivers/clk/mediatek/clk-mt8135-pll.h
 create mode 100644 drivers/clk/mediatek/clk-mt8135.c
 create mode 100644 drivers/clk/mediatek/clk-mtk.c
 create mode 100644 drivers/clk/mediatek/clk-mtk.h
 create mode 100644 drivers/clk/mediatek/clk-pll.c
 create mode 100644 drivers/clk/mediatek/clk-pll.h
 create mode 100644 include/dt-bindings/clock/mt8135-clk.h

--
1.8.1.1.dirty
