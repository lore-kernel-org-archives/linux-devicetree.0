From: Tim Kryger <tim.kryger@linaro.org>
Subject: [PATCH 0/2] Enable I2C on bcm28155-ap
Date: Fri, 6 Dec 2013 15:45:26 -0800
Message-ID: <1386373528-13045-1-git-send-email-tim.kryger@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Tim Kryger <tim.kryger@linaro.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, Device Tree List <devicetree@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linaro Patches List <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

This series enables all the I2C busses on the bcm28155-ap board.

These patches appeared in another series that was partially accepted.
  https://lkml.org/lkml/2013/11/14/517

It depends on:  https://lkml.org/lkml/2013/12/5/508

Tim Kryger (2):
  ARM: dts: bcm281xx: Add i2c busses
  ARM: dts: bcm28155-ap: Enable all the i2c busses

 arch/arm/boot/dts/bcm11351.dtsi   | 40 +++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/bcm28155-ap.dts | 20 ++++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
1.8.0.1
