From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] ARM: uniphier: add outer cache support and rework SMP
 operations
Date: Mon, 24 Aug 2015 11:18:09 +0900
Message-ID: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com>
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
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jungseung Lee <js07.lee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Joe Perches <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Paul Bolle <pebolle@tiscali.nl>, Greg KH <gregkh@linuxfoundation.org>, Nathan Lynch <nathan_lynch@mentor.com>, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kumar Gala <galak@codeaurora>
List-Id: devicetree@vger.kernel.org

1/3: add outer cache support
2/3: rework SMP operations
3/3: add device tree nodes

Because 2/3 highly depends on 1/3, I hope whole of this series
is applied to ARM-SOC tree.

Olof,
>From this series, I am using "ARM: uniphier:" rather than "ARM: UniPhier:"
for the subject prefixes because I noticed you often rephased so when you
applied my patches.
Are sub-arch names in lower cases preferable in subject prefixes?



Masahiro Yamada (3):
  ARM: uniphier: add outer cache support
  ARM: uniphier: rework SMP operations to use trampoline code
  ARM: dts: uniphier: add outer cache controller nodes

 .../bindings/arm/uniphier/cache-uniphier.txt       |  30 ++
 MAINTAINERS                                        |   2 +
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi            |   7 +
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi           |   7 +
 arch/arm/boot/dts/uniphier-ph1-pro5.dtsi           |  14 +
 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi           |   7 +
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi           |   7 +
 arch/arm/boot/dts/uniphier-proxstream2.dtsi        |   7 +
 arch/arm/include/asm/hardware/cache-uniphier.h     |  40 ++
 arch/arm/mach-uniphier/Makefile                    |   2 +-
 arch/arm/mach-uniphier/headsmp.S                   |  43 ++
 arch/arm/mach-uniphier/platsmp.c                   | 183 ++++++--
 arch/arm/mach-uniphier/uniphier.c                  |  11 +
 arch/arm/mm/Kconfig                                |  10 +
 arch/arm/mm/Makefile                               |   1 +
 arch/arm/mm/cache-uniphier.c                       | 518 +++++++++++++++++++++
 16 files changed, 857 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/uniphier/cache-uniphier.txt
 create mode 100644 arch/arm/include/asm/hardware/cache-uniphier.h
 create mode 100644 arch/arm/mach-uniphier/headsmp.S
 create mode 100644 arch/arm/mm/cache-uniphier.c

-- 
1.9.1
