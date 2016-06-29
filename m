From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, Regulator and ARM for v4.8
Date: Wed, 29 Jun 2016 17:25:16 +0100
Message-ID: <20160629162516.GB1707@dell>
References: <20160629055322.23038-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160629055322.23038-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit af8c34ce6ae32addda3788d54a7e340cad22=
516b:

  Linux 4.7-rc2 (2016-06-05 14:31:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd=
-regulator-arm-v4.8

for you to fetch changes up to a370f60a58ec7bad7045803041524ccdc4d79c75=
:

  mfd: rn5t618: Register restart handler (2016-06-29 10:11:35 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Regulator and ARM, due for v4.8

----------------------------------------------------------------
Stefan Agner (5):
      ARM: dts: meson: minix-neo-x8: define PMIC as power controller
      mfd: rn5t618: Add Ricoh RN5T567 PMIC support
      regulator: rn5t618: Add RN5T567 PMIC support
      mfd: rn5t618: Register power off callback optionally
      mfd: rn5t618: Register restart handler

 Documentation/devicetree/bindings/mfd/rn5t618.txt | 19 +++---
 arch/arm/boot/dts/meson8-minix-neo-x8.dts         |  1 +
 drivers/mfd/Kconfig                               |  7 ++-
 drivers/mfd/rn5t618.c                             | 70 +++++++++++++++=
++++----
 drivers/regulator/Kconfig                         |  5 +-
 drivers/regulator/rn5t618-regulator.c             | 40 +++++++++++--
 include/linux/mfd/rn5t618.h                       | 13 +++++
 7 files changed, 126 insertions(+), 29 deletions(-)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
