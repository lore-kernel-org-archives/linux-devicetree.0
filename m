From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.5-rc
Date: Wed, 17 Feb 2016 08:14:32 -0600
Message-ID: <CAL_JsqKujuURgiQfVayYvMO3A9zcL_XNaPyGoDB8wEhRb=6-+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Robin Murphy <Robin.Murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

A few more DT fixes for 4.5. Hopefully, this should be the last of it.

Rob

The following changes since commit 388f7b1d6e8ca06762e2454d28d6c3c55ad0fe95:

  Linux 4.5-rc3 (2016-02-07 15:38:30 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.5-2

for you to fetch changes up to 43f3408261a2fd5054ada359efa15f0b78faf0a7:

  rtc: s3c: Document required clocks in the DT binding (2016-02-12
16:16:31 -0600)

----------------------------------------------------------------
DeviceTree fixes for 4.5-rc5:

- Fix irq msi-map calculation for nonzero rid-base.

- Binding doc updates for GICv3, fsl-imx-uart, and S3C RTC.

----------------------------------------------------------------
Fabio Estevam (1):
      serial: fsl-imx-uart: Fix typo in fsl,dte-mode description

Javier Martinez Canillas (1):
      rtc: s3c: Document required clocks in the DT binding

Robin Murphy (1):
      of/irq: Fix msi-map calculation for nonzero rid-base

Will Deacon (1):
      dt-bindings: arm, gic-v3: require that reserved cells are always 0

 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt      | 5 ++---
 Documentation/devicetree/bindings/rtc/s3c-rtc.txt                | 6 ++++++
 Documentation/devicetree/bindings/serial/fsl-imx-uart.txt        | 2 +-
 drivers/of/irq.c                                                 | 9 ++++++++-
 4 files changed, 17 insertions(+), 5 deletions(-)
