From: Quan Nguyen <qnguyen@apm.com>
Subject: [PATCH v4 0/3] Enable X-Gene standby GPIO as interrupt controller
Date: Tue, 26 Jan 2016 14:22:12 +0700
Message-ID: <1453792935-19916-1-git-send-email-qnguyen@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com, Quan Nguyen <qnguyen@apm.com>
List-Id: devicetree@vger.kernel.org

V4 Changes:
        - Convert to hierarchical irq domain.
V3 Changes:
        - Picking up from version 2 of "Y Vo <yvo@apm.com>"
        - Get HW resource information from DT
        - Avoid keeping parent IRQ controller
V2 Changes:
        - Support X-Gene standby GPIO as an interrupt controller.

Quan Nguyen (3):
  gpio: xgene: Enable X-Gene standby GPIO as interrupt controller
  Documentation: gpio: Update description for X-Gene standby GPIO
    controller DTS binding
  arm64: dts: Update X-Gene standby GPIO controller DTS entries

 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     |  39 ++-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   3 +
 drivers/gpio/gpio-xgene-sb.c                       | 331 +++++++++++++++++----
 3 files changed, 312 insertions(+), 61 deletions(-)

-- 
1.7.12.4

