From: Adam Baker <linux@baker-net.org.uk>
Subject: [PATCH 0/3] ARM: mvebu: Add driver for the Zyxel NSA3XX hwmon MCU
Date: Wed, 10 Feb 2016 23:33:41 +0000
Message-ID: <1455147224-6742-1-git-send-email-linux@baker-net.org.uk>
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
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, lm-sensors@lm-sensors.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series adds a driver to support the hardware monitoring MCU
that is present in some models of the Zyxel NSA3xx series of NAS units.

A patch is included to add it to the device tree for the NSA320 model,
patches to the other device trees will be included if testers come
forward (I already have a possible tester for NSA325).

There are no dependencies between the patches so I guess the first two
should go via the hardware monitoring maintainers and the third via
the ARM mvebu maintainers.

 [PATCH 1/3] Define a binding for the hardware monitoring chip present
 [PATCH 2/3] Create a driver to support the hardware monitoring chip
 [PATCH 3/3] Add an entry for the hardware monitoring MCU

 Documentation/devicetree/bindings/hwmon/nsa320-mcu.txt |  21 ++++++++
 arch/arm/boot/dts/kirkwood-nsa320.dts                  |  13 ++++-
 drivers/hwmon/Kconfig                                  |  13 +++++
 drivers/hwmon/Makefile                                 |   1 +
 drivers/hwmon/nsa3xx-hwmon.c                           | 223 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 269 insertions(+), 2 deletions(-)
