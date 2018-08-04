From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/2] ARM: dts: add Raspberry Pi Compute Module 3 and IO board
Date: Sat,  4 Aug 2018 13:10:01 +0200
Message-ID: <1533381003-13367-1-git-send-email-stefan.wahren@i2se.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series add support for Rasberry Pi Compute Module 3 and
Compute Module 3 Lite.

Stefan Wahren (2):
  dt-bindings: bcm: Add Raspberry Pi CM3 and CM3L
  ARM: dts: add Raspberry Pi Compute Module 3 and IO board

 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |  8 ++
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts          | 87 ++++++++++++++++++++++
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             | 52 +++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile              |  3 +-
 .../boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts      |  2 +
 6 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts

-- 
2.7.4
