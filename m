From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/5] nvmem: Enable OTP access for Raspberry Pi
Date: Wed, 21 Nov 2018 14:11:39 +0100
Message-ID: <1542805904-6446-1-git-send-email-stefan.wahren@i2se.com>
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
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The VC4 firmware exposes a mailbox interface that allows the ARM core
to access only the customer part (8 cells * 32 bits) of the OTP memory.
This version brings read-only support, but could also be extended to
write support. Beside the kernelspace support this is also a limited userspace
alternative to the vendor specific "vcgencmd otp_dump".

I think this driver could be helpful for vendors, which integrate the
Raspberry Pi Compute Module in their products need to store unique data
like a serial or additional MAC address in the OTP.

Note for testers: This series needs "firmware: raspberrypi: Fix firmware calls
with large buffers" from James Hughes to work properly.

Changes since RFC:
- implement improvements suggested by Rob Herring and Eric Anholt
- extend Kconfig description
- define nvmem type and read only
- make MODULE_LICENSE match license text
- add patches to enable driver in bcm2835 and multi_v7 defconfig
- rebased on current srini/nvmem.git/for-next

Stefan Wahren (5):
  dt-bindings: nvmem: add binding for Raspberry Pi OTP
  nvmem: add driver for Raspberry Pi OTP
  ARM: dts: bcm2835-rpi: Enable OTP access for Raspberry Pi
  ARM: bcm2835_defconfig: Enable Raspberry Pi OTP driver
  ARM: multi_v7_defconfig: Enable Raspberry Pi OTP driver

 .../nvmem/raspberrypi,bcm2835-customer-otp.txt     |  22 ++++
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   4 +
 arch/arm/configs/bcm2835_defconfig                 |   2 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/raspberrypi-otp.c                    | 113 +++++++++++++++++++++
 7 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/raspberrypi,bcm2835-customer-otp.txt
 create mode 100644 drivers/nvmem/raspberrypi-otp.c

-- 
2.7.4
