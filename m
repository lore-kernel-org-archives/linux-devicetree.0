From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [RESEND PATCH v2 0/4] arm: mediatek: Add support for GIC interrupt
 polarity extension.
Date: Wed, 13 Aug 2014 10:11:20 +0800
Message-ID: <1407895884-18131-1-git-send-email-srv_yingjoe.chen@mediatek.com>
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
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Olof Johansson <olof@lixom.net>, Jonas Jensen <jonas.jensen@gmail.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, hc.yen@mediatek.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, eddie.huang@mediatek.com
List-Id: devicetree@vger.kernel.org

[Sorry, resend to include all maintainers.]

This series add support for mediatek GIC interrupt polarity extension.
Several components in mediatek SoC have low level triggered interrupt and
require this support.

This also correct 6589 timer irq polarity. Previous version works because
6589 boot loader already set correct polarity for timer interrupt.

The patch set is based on Matthias's Mediatek basic support for v3.17 [1].

v2:
- Make mt6589.dtsi changes as a separate commit as Matthias suggest.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/272561.html

Joe.C (4):
  irqchip: gic: Change irq type check when extension is
  arm: mediatek: Add support for GIC interrupt polarity
  arm: mediatek: Add intpol in mt6589.dtsi
  dt-bindings: add bindings for mediatek intpol

 Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt |   16 ++
 arch/arm/boot/dts/mt6589.dtsi                                              |    7 -
 arch/arm/mach-mediatek/Makefile                                            |    2
 arch/arm/mach-mediatek/common.h                                            |   19 +++
 arch/arm/mach-mediatek/intpol.c                                            |   61 ++++++++++
 arch/arm/mach-mediatek/mediatek.c                                          |   10 +
 drivers/irqchip/irq-gic.c                                                  |   27 ++--
 7 files changed, 131 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,intpol.txt
 create mode 100644 arch/arm/mach-mediatek/common.h
 create mode 100644 arch/arm/mach-mediatek/intpol.c
