Return-Path: <matthias.bgg@gmail.com>
MIME-Version: 1.0
Date: Tue, 22 Jul 2014 18:25:45 +0200
Message-ID: <CABuKBe+_Bosow3VeM5geMKHv9LagOik0BL_T+aarQU4pEbRXUQ@mail.gmail.com>
Subject: [GIT PULL v2] Mediatek basic support for v3.17
From: Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Vaussard <florian.vaussard@epfl.ch>, Jonathan Cameron <jic23@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Silvio F <silvio.fricke@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Olof Johansson <olof@lixom.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robherring2@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "shawn.guo@freescale.com" <shawn.guo@freescale.com>, "anders.berg@lsi.com" <anders.berg@lsi.com>, Linus Walleij <linus.walleij@linaro.org>, ak@linux.intel.com, hpa@linux.intel.com, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg KH <gregkh@linuxfoundation.org>, fabf@skynet.be, rostedt@goodmis.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

Patches 1-4 from v10 of the patch set have been merged by Daniel Lezcano [0].
This




----------------------------------------------------------------
The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:

  Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v3.17-next-mediatek-support

for you to fetch changes up to afaedea451149ab8f08c37ce688c8021ed347811:

  arm: mediatek: add dts for Aquaris5 mobile phone (2014-07-22 17:52:38 +0200)

----------------------------------------------------------------
This patch set adds basic support for the Mediatek Cortex-A7 SoCs.

Support is quite basic, as the only component working up to now are the
timers.

----------------------------------------------------------------
Matthias Brugger (3):
      arm: add basic support for Mediatek MT6589 boards
      dt-bindings: add documentation for Mediatek SoC
      arm: mediatek: add dts for Aquaris5 mobile phone

 Documentation/devicetree/bindings/arm/mediatek.txt |    8 ++
 arch/arm/Kconfig                                   |    2 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/boot/dts/mt6589-aquaris5.dts              |   25 ++++++
 arch/arm/boot/dts/mt6589.dtsi                      |   94 ++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |    6 ++
 arch/arm/mach-mediatek/Makefile                    |    1 +
 arch/arm/mach-mediatek/mediatek.c                  |   27 ++++++
 8 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek.txt
 create mode 100644 arch/arm/boot/dts/mt6589-aquaris5.dts
 create mode 100644 arch/arm/boot/dts/mt6589.dtsi
 create mode 100644 arch/arm/mach-mediatek/Kconfig
 create mode 100644 arch/arm/mach-mediatek/Makefile
 create mode 100644 arch/arm/mach-mediatek/mediatek.c
