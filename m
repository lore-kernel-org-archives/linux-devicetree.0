From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/3] nvmem: Enable OTP access for Raspberry Pi
Date: Fri,  9 Mar 2018 14:32:05 +0100
Message-ID: <1520602328-28972-1-git-send-email-stefan.wahren@i2se.com>
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
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Phil Elwell <phil@raspberrypi.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The VC4 firmware exposes a mailbox interface that allows the ARM core
to access only the customer part of the OTP memory. This version brings
read-only support, but could also be extended to write support.

I think this driver could be helpful for vendors, which integrate the
Raspberry Pi Compute Module in their products.

This series depends on commit "soc: bcm2835: sync firmware properties
with downstream".

Stefan Wahren (3):
  dt-bindings: nvmem: add binding for Raspberry Pi OTP
  nvmem: add driver for Raspberry Pi OTP
  ARM: dts: bcm2835-rpi: Enable OTP access for Raspberry Pi

 .../nvmem/raspberrypi,bcm2835-customer-otp.txt     |  27 ++++
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   6 +
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/raspberrypi-otp.c                    | 138 +++++++++++++++++++++
 5 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/raspberrypi,bcm2835-customer-otp.txt
 create mode 100644 drivers/nvmem/raspberrypi-otp.c

-- 
2.7.4
