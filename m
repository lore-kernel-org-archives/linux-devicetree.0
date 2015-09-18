From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 0/3] ARM: uniphier: add outer cache support and rework SMP
 operations
Date: Fri, 18 Sep 2015 13:37:31 +0900
Message-ID: <1442551054-2116-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jungseung Lee <js07.lee@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Jiri Slaby <jslaby@suse.com>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Paul Bolle <pebolle@tiscali.nl>, Greg KH <gregkh@linuxfoundation.org>, Nathan Lynch <nathan_lynch@mentor.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@>
List-Id: devicetree@vger.kernel.org


Hi Olof,

Now Linux 4.3-rc1 is out, so I am back to this.

1/3: add outer cache support
2/3: rework SMP operations
3/3: add device tree nodes

Because 2/3 highly depends on 1/3, I hope whole of this series
is applied through ARM-SOC tree.


Changes in v3:
  - Drop bogus includes

Changes in v2:
  - Use pr_fmt() to have pr_<level> are automatically prefixed
  - Re-design to initialize the outer cache earlier in init_IRQ()
  - Require DT properties such as "cacne-unified", "cache-size",
    "cache-sets", "cache-size", "cache-line-size".
  - Follow "next-level-cache" property to search further outer caches

Masahiro Yamada (3):
  ARM: uniphier: add outer cache support
  ARM: uniphier: rework SMP operations to use trampoline code
  ARM: dts: uniphier: add outer cache controller nodes

 .../bindings/arm/uniphier/cache-uniphier.txt       |  48 ++
 MAINTAINERS                                        |   2 +
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi            |  13 +
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi           |  14 +
 arch/arm/boot/dts/uniphier-ph1-pro5.dtsi           |  27 +
 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi           |  14 +
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi           |  13 +
 arch/arm/boot/dts/uniphier-proxstream2.dtsi        |  16 +
 arch/arm/include/asm/hardware/cache-uniphier.h     |  46 ++
 arch/arm/kernel/irq.c                              |   3 +
 arch/arm/mach-uniphier/Makefile                    |   2 +-
 arch/arm/mach-uniphier/headsmp.S                   |  43 ++
 arch/arm/mach-uniphier/platsmp.c                   | 185 +++++--
 arch/arm/mm/Kconfig                                |  10 +
 arch/arm/mm/Makefile                               |   1 +
 arch/arm/mm/cache-uniphier.c                       | 544 +++++++++++++++++++++
 16 files changed, 950 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt
 create mode 100644 arch/arm/include/asm/hardware/cache-uniphier.h
 create mode 100644 arch/arm/mach-uniphier/headsmp.S
 create mode 100644 arch/arm/mm/cache-uniphier.c

-- 
1.9.1
