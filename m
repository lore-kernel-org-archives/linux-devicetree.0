From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/6] ARM: dts: bcm283x: Several DTS improvements
Date: Sat, 12 Jan 2019 13:43:22 +0100
Message-ID: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>
Cc: Gottfried Haider <gottfried.haider@gmail.com>, devicetree@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series consists of fixes for DTC warnings and improvements of
the GPIO labels. So this is nothing critical, but helpful
in case CONFIG_GPIO_SYSFS is disabled.

Stefan Wahren (6):
  ARM: dts: bcm283x: Fix DTC warning for memory node
  ARM: dts: bcm2835-rpi: Drop unnecessary #address-cells/#size-cells
  ARM: dts: bcm2835: Fix labels for GPIO 0,1
  ARM: dts: bcm2837-rpi-3-b: Use consistent label for HDMI hotplug
  ARM: dts: bcm2837-rpi-3-b-plus: Clarify label for STATUS_LED
  ARM: dts: bcm283x: Add missing GPIO line names

 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts   |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts   |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts   |  4 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts     |  4 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi         |  4 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 68 ++++++++++++++++++++++++++-
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts |  2 +-
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 74 +++++++++++++++++++++++++++++-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 74 +++++++++++++++++++++++++++++-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi     |  2 +-
 10 files changed, 222 insertions(+), 18 deletions(-)

-- 
2.7.4
