From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] MFD: ARM (IMX & R8): Immutable branch for Dialog
 Semiconductor - vendor prefix consolidation
Date: Fri, 29 Aug 2014 10:13:59 +0100
Message-ID: <20140829091359.GF24579@lee--X1>
References: <201408221446.s7MEkNVF001775@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201408221446.s7MEkNVF001775@swsrvapps-01.diasemi.com>
Sender: linux-sh-owner@vger.kernel.org
To: "Opensource [Steve Twiss]" <stwiss.opensource@diasemi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud Ebalard <arno@natisbad.org>, DEVICE TREE <devicetree@vger.kernel.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Guenter Roeck <linux@roeck-us.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonathan Cameron <jic23@kernel.org>, Kumar Gala <galak@codeaurora.org>, LINUX ARM KERNEL <linux-arm-kernel@lists.infradead.org>, LINUX KERNEL <linux-kernel@vger.kernel.org>, LINUX SH <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Brown <broonie@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Martin Fuzzey <mfuzzey@parkeon.com>, Pawel Moll <pawel.moll@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Samu
List-Id: devicetree@vger.kernel.org

IMX and R8 sub-arch Maintainers,

The following changes since commit 52addcf9d6669fa439387610bc65c92fa098=
0cef:

  Linux 3.17-rc2 (2014-08-25 15:36:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd=
-arm-v3.18

for you to fetch changes up to bd597f47ca4bf7a522a0298a95c7f9b2f0a75b9e=
:

  devicetree: Dialog Semiconductor consolidate existing vendor prefixes=
 to standardise on 'dlg' (2014-08-29 09:26:29 +0100)

----------------------------------------------------------------
Immutable branch between MFD and some ARM sub-arch maintainers.
----------------------------------------------------------------
Steve Twiss (1):
      devicetree: Dialog Semiconductor consolidate existing vendor pref=
ixes to standardise on 'dlg'

 .../devicetree/bindings/i2c/trivial-devices.txt    |  2 +-
 .../devicetree/bindings/regulator/da9210.txt       |  4 ++--
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/boot/dts/imx53-smd.dts                    |  2 +-
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi       |  2 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |  2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  2 +-
 drivers/mfd/da9055-core.c                          | 26 +++++++++++---=
--------
 8 files changed, 21 insertions(+), 20 deletions(-)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
