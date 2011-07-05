From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add device tree probe support for tty/serial/imx
Date: Tue, 5 Jul 2011 23:05:36 +0800
Message-ID: <1309878338-25697-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-serial-owner@vger.kernel.org>
Sender: linux-serial-owner@vger.kernel.org
To: linux-serial@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

The first patch removes the use of cpu_is_mx1().  The second patch
adds device tree probe with a dependency on the following patch.

  http://article.gmane.org/gmane.linux.drivers.devicetree/6128

Changes since v1:
 * Address review comments given by Grant and Uwe

Shawn Guo (2):
      serial/imx: get rid of the uses of cpu_is_mx1()
      serial/imx: add device tree probe support

 .../bindings/tty/serial/fsl-imx-uart.txt           |   19 +++
 arch/arm/mach-imx/clock-imx1.c                     |    6 +-
 arch/arm/plat-mxc/devices/platform-imx-uart.c      |    2 +-
 drivers/tty/serial/imx.c                           |  148 +++++++++++++++++---
 4 files changed, 149 insertions(+), 26 deletions(-)

