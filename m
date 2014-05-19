From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv4 0/3] clocksource: Add Freescale FlexTimer Module (FTM) timer support
Date: Mon, 19 May 2014 17:36:05 +0800
Message-ID: <1400492168-12813-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, shawn.guo@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

Changes in V4:
- Add struct ftm_clock_device {} support.
- peroidic_cyc --> periodic_cyc.

Changes in V3:
- Fix the ftm_irq_disable.

Changes in V2:
- Add big-endian support.
- Add using pr_err instead of BUG_ON.
- Add more detail comment message of FTM.
- Add DT binding documentation.
- Remove some header files and macros not useful.





Xiubo Li (3):
  clocksource: ftm: Add FlexTimer Module (FTM) Timer devicetree
    Documentation
  ARM: dts: vf610: Add Freescale FlexTimer Module timer node.
  clocksource: Add Freescale FlexTimer Module (FTM) timer support

 .../devicetree/bindings/timer/fsl,ftm-timer.txt    |  31 ++
 arch/arm/boot/dts/vf610.dtsi                       |  13 +
 drivers/clocksource/Kconfig                        |   5 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/fsl_ftm_timer.c                | 367 +++++++++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,ftm-timer.txt
 create mode 100644 drivers/clocksource/fsl_ftm_timer.c

-- 
1.8.4

