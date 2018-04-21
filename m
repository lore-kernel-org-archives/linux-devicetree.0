From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/9] ARM: bcm283x: RPi 3 B+ support and other improvements
Date: Sat, 21 Apr 2018 13:28:33 +0200
Message-ID: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The main focus of the patch series is to provide support for the new
Raspberry Pi 3 B+ . The rest are parts which missed the merge window for 4.17.

Since there are still some issues with LAN78XX, also apply 
Dave Stevenson's patches [1] before testing. But they are not
required for the function of this series.    

Relevant to all RPis  : Patch #1, #6
Relevant to RPi 3 B   : Patch #2, #7, #8
Relevant to RPi 3 B+  : Patch #3, #4, #5, #7, #8, #9

[1] - https://github.com/raspberrypi/linux/pull/2502

Changes in V2:
  - add Reviewed-by from Eric and Rob
  - point out that the LAN7515 has a integrated USB HUB
  - fix node names in bcm283x-rpi-lan7515.dtsi

Stefan Wahren (9):
  ARM: dts: bcm283x: Fix PWM pin assignment
  ARM: dts: bcm2837: Add missing GPIOs of Expander
  dt-bindings: bcm: Add Raspberry Pi 3 B+
  ARM: dts: bcm2837: Add Raspberry Pi 3 B+
  ARM: bcm2835_defconfig: Enable LAN78XX driver
  ARM: bcm2835_defconfig: Enable VCHIQ driver
  ARM: multi_v7_defconfig: Enable LAN and BT for RPi 3 B+
  arm64: defconfig: Enable LAN and BT support for RPi 3 B+
  arm64: dts: broadcom: Add reference to Raspberry Pi 3 B+

 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |   4 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |   6 ++
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |   6 ++
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |   6 ++
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |   6 ++
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |   6 ++
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   6 --
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |   6 ++
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts         | 108 +++++++++++++++++++++
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  26 ++++-
 arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi         |  27 ++++++
 arch/arm/configs/bcm2835_defconfig                 |   2 +
 arch/arm/configs/multi_v7_defconfig                |   4 +
 arch/arm64/boot/dts/broadcom/Makefile              |   3 +-
 .../boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts     |   2 +
 arch/arm64/configs/defconfig                       |   2 +
 17 files changed, 213 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts

-- 
2.7.4
