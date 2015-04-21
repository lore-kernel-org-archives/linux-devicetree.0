From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 0/4] ARM: SoC: add a new platform,
 UniPhier (arch/arm/mach-uniphier)
Date: Tue, 21 Apr 2015 16:21:26 +0900
Message-ID: <1429600890-26713-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: devicetree@vger.kernel.org


This is an initial series for supporting Socionext UniPhier SoCs,
based on ARM Cortex-A9, mainly used for digital TVs, video recorders, etc.



Masahiro Yamada (4):
  ARM: UniPhier: add basic support for UniPhier architecture
  ARM: multi_v7_defconfig: enable UniPhier SoC family
  ARM: dts: UniPhier: add support for UniPhier SoCs and boards
  MAINTAINERS: add myself as ARM/UniPhier maintainer

 MAINTAINERS                                  |   7 ++
 arch/arm/Kconfig                             |   2 +
 arch/arm/Makefile                            |   1 +
 arch/arm/boot/dts/Makefile                   |   5 ++
 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts   |  79 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi      | 111 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts  |  79 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi     | 118 +++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts  |  80 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi     | 118 +++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts  |  79 ++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi     | 111 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-support-card.dtsi |  66 +++++++++++++++
 arch/arm/configs/multi_v7_defconfig          |   1 +
 arch/arm/mach-uniphier/Kconfig               |  11 +++
 arch/arm/mach-uniphier/Makefile              |   2 +
 arch/arm/mach-uniphier/platsmp.c             |  85 +++++++++++++++++++
 arch/arm/mach-uniphier/uniphier.c            |  30 +++++++
 18 files changed, 985 insertions(+)
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
 create mode 100644 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi
 create mode 100644 arch/arm/boot/dts/uniphier-support-card.dtsi
 create mode 100644 arch/arm/mach-uniphier/Kconfig
 create mode 100644 arch/arm/mach-uniphier/Makefile
 create mode 100644 arch/arm/mach-uniphier/platsmp.c
 create mode 100644 arch/arm/mach-uniphier/uniphier.c

-- 
1.9.1
