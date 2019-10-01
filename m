From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Subject: [PATCH v2 0/5] MIPS: CI20: DTS: Add nodes to Creator CI20 board
Date: Tue, 1 Oct 2019 21:08:19 +0200
Message-ID: <cover.1569955865.git.agriveaux@deutnet.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Attemping to make my CI20 more usefull than a paperweight, I add nodes to Devicetree, at this time:

- Add I2C node PMU and RTC. 
- The IW8103 need some work to stay alive because power seem to turn off.
- The leds patch lack of correct option in ci20_defconfig.
- The Cpu patch isn't usefull without SMP support of jz4780.

Alexandre GRIVEAUX (5):
  MIPS: JZ4780: DTS: Add I2C nodes
  MIPS: CI20: DTS: Add I2C nodes
  MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
  MIPS: CI20: DTS: Add Leds
  MIPS: JZ4780: DTS: Add CPU nodes

  v2 adding previous sended patch: JZ4780: DTS: Add I2C nodes

 arch/mips/boot/dts/ingenic/ci20.dts    | 214 +++++++++++++++++++++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 103 ++++++++++++
 2 files changed, 317 insertions(+)


base-commit: 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c
-- 
2.20.1
