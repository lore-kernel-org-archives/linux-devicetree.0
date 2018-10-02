From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/4] Add UniPhier USB3 controller and USB2 phy nodes
Date: Tue,  2 Oct 2018 20:11:58 +0900
Message-ID: <1538478722-20351-1-git-send-email-hayashi.kunihiko@socionext.com>
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This series adds the DT nodes for USB3 controllers and USB2 phys
implemented on UniPhier SoCs.

Kunihiko Hayashi (4):
  ARM: dts: uniphier: Add USB3 controller nodes
  ARM: dts: uniphier: Add USB2 phy nodes
  arm64: dts: uniphier: Add USB3 controller nodes
  arm64: dts: uniphier: Add USB2 phy nodes

 arch/arm/boot/dts/uniphier-pro4-ace.dts            |   8 +
 arch/arm/boot/dts/uniphier-pro4-ref.dts            |   8 +
 arch/arm/boot/dts/uniphier-pro4.dtsi               | 127 +++++++++++
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts         |   8 +
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts          |   4 +
 arch/arm/boot/dts/uniphier-pxs2.dtsi               | 180 ++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi   |  27 +++
 .../boot/dts/socionext/uniphier-ld20-global.dts    |   4 +
 .../arm64/boot/dts/socionext/uniphier-ld20-ref.dts |   4 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   | 194 +++++++++++++++++
 .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts |   8 +
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   | 240 +++++++++++++++++++++
 12 files changed, 812 insertions(+)

-- 
2.7.4
