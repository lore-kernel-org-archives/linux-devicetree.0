From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH 0/3] GPIO driver to turn power off
Date: Sun, 11 Nov 2012 17:21:28 +0100
Message-ID: <1352650891-18356-1-git-send-email-andrew@lunn.ch>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, jm@lentin.co.uk, linux-arm-kernel@lists.infradead.org, gmbnomis@gmail.com
List-Id: devicetree@vger.kernel.org

A few of the Kirkwood systems use a GPIO line to turn the power off on
shutdown. They request the GPIO line in the board setup code,
optionally setting it as an output and driving it inactive. They then
register a function for pm_power_off. At the end of the shutdown, this
function is called. The GPIO line is configured as an output, if not
already so, and then driven active. In order to cover the use case of
edges rather then levels, triggering power off, the GPIO line is then
toggled active and later inactive. This should allow the driver to be
used by PXA which also has boards using the same scheme.

The driver code was initially developed by Jamie Lentin and extended
to cover the PXA case by Andrew Lunn.

Andrew Lunn (2):
  ARM: Kirkwood: Convert DNSKW to use gpio-poweroff.
  ARM: Kirkwood: Convert IB62x0 to use gpio-poweroff.

Jamie Lentin (1):
  gpio: Add simple poweroff-gpio driver

 .../devicetree/bindings/gpio/gpio-poweroff.txt     |   22 ++++
 arch/arm/boot/dts/kirkwood-dnskw.dtsi              |    5 +
 arch/arm/boot/dts/kirkwood-ib62x0.dts              |    6 +
 arch/arm/mach-kirkwood/Kconfig                     |    1 +
 arch/arm/mach-kirkwood/board-dnskw.c               |   12 --
 arch/arm/mach-kirkwood/board-ib62x0.c              |   13 --
 drivers/gpio/Kconfig                               |   10 ++
 drivers/gpio/Makefile                              |    2 +
 drivers/gpio/gpio-poweroff.c                       |  129 ++++++++++++++++++++
 9 files changed, 175 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-poweroff.txt
 create mode 100644 drivers/gpio/gpio-poweroff.c

-- 
1.7.10.4
