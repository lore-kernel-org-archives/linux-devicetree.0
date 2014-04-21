From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 0/3] clocksource: Add Freescale FlexTimer Module (FTM) timer support
Date: Mon, 21 Apr 2014 15:19:57 +0800
Message-ID: <1398064800-27250-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, shawn.guo@linaro.org, R64188@freescale.com, b40534@freescale.com, b35083@freescale.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org


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
 arch/arm/boot/dts/vf610.dtsi                       |  12 +
 drivers/clocksource/Kconfig                        |   5 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/fsl_ftm_timer.c                | 344 +++++++++++++++++++++
 5 files changed, 393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,ftm-timer.txt
 create mode 100644 drivers/clocksource/fsl_ftm_timer.c

-- 
1.8.4

