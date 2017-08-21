From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, Pinctrl and Regulator due
 for the v4.14 merge window
Date: Mon, 21 Aug 2017 09:25:10 +0100
Message-ID: <20170821082510.qbxdhuffce22uuoe@dell>
References: <20170821012842.17875-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170821012842.17875-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-pinctrl-regulator-v4.14

for you to fetch changes up to f7c22398f5e95c995a34d4f196d53cfc32562aed:

  mfd: rk808: Add RK805 power key support (2017-08-21 08:54:56 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Pinctrl and Regulator due for the v4.14 merge window

----------------------------------------------------------------
Elaine Zhang (5):
      mfd: rk808: Fix up the chip id get failed
      mfd: rk808: Add rk805 regs addr and ID
      regulator: rk808: Add regulator driver for RK805
      mfd: rk808: Add RK805 support
      mfd: dt-bindings: Add RK805 device tree bindings document

Joseph Chen (4):
      pinctrl: dt-bindings: Add bindings for Rockchip RK805 PMIC
      pinctrl: Add pinctrl driver for the RK805 PMIC
      mfd: rk808: Add RK805 pinctrl support
      mfd: rk808: Add RK805 power key support

 Documentation/devicetree/bindings/mfd/rk808.txt    |  22 +-
 .../devicetree/bindings/pinctrl/pinctrl-rk805.txt  |  63 +++
 drivers/mfd/Kconfig                                |   4 +-
 drivers/mfd/rk808.c                                | 147 +++++-
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rk805.c                    | 493 +++++++++++++++++++++
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/rk808-regulator.c                | 130 ++++++
 include/linux/mfd/rk808.h                          | 121 +++++
 10 files changed, 983 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
 create mode 100644 drivers/pinctrl/pinctrl-rk805.c

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
