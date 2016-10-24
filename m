From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [PATCH v1 0/3] Add support for Broadcom OTP controller
Date: Mon, 24 Oct 2016 12:12:01 -0700
Message-ID: <1477336324-10543-1-git-send-email-jonathan.richardson@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Jonathan Richardson <jonathan.richardson@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch set adds support for Broadcom's OTP controller found on chips such
as Cygnus and Stingray. A node has been added to the Cygnus dts.


Jonathan Richardson (3):
  dt-bindings: Document Broadcom OTP controller driver
  nvmem: Add the Broadcom OTP controller driver
  ARM: dts: Add node for Broadcom OTP controller driver

 .../devicetree/bindings/nvmem/brcm,ocotp.txt       |  17 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   7 +
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/bcm-ocotp.c                          | 335 +++++++++++++++++++++
 5 files changed, 373 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
 create mode 100644 drivers/nvmem/bcm-ocotp.c

-- 
1.9.1
