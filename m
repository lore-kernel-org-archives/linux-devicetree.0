From: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RFC V3 PATCH 0/7] msm8992/msm8994: Google Nexus 5X/6P initial board support
Date: Wed, 12 Oct 2016 02:37:27 -0700
Message-ID: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here is the complete V3 series including the individual changes
that have already been sent based on feedback from V2.

V1 overview,
  [http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/442069.html]

V2 overview,
  [http://www.spinics.net/lists/devicetree/msg144761.html]

Testing:
  -only on Nexus 5X as I still don't have a Nexus 6P and no one has yet
	to donate one for testing. ;-(

Changes from V2->V3:
   -squashed down changes which originally created Huawei directory, everything
	is now in qcom dir.
   -put msm-id, pmic-id and board-id back in to original DTS files msm899(2/4) [V1].
   -changed gcc mappings, heres a description of what changed:
          "The paren_map is used for looking up which value to write into
	   and the cmd_rcgr is for configuring the parent muxing so a change
	   2 to 5 means that the 3rd parent should be mux #5 rather than #2."
	 [http://www.spinics.net/lists/devicetree/msg144764.html]

   -dt bindings in Documentation dir re-ordered (sorted).
   -squashed patch which was removing defconfig into initial support of 8994 (Nexus 6P)
   -updated defconfig to only include BLK_DEV_RAM  and added pinctrl for basic serial
   -grouped / squashed all defconfig items into 1 change / patch


TODO:
  -As I still dont have a Nexus 6P for testing, the reserved memory "/memreserve/" is still
   present.   The plan is to remove it or create the reserved mem dt.

One outstanding question is "What is the difference between msm8994 and msm8994v2 ?"
hopefully someone from QC can provide an explanation.


Comments and feedback greatly appreciated.


Bastian Köcher (2):
  msm8994 clocks: global clock support Global clock support for the
    msm8994 SOC.
  arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support

Jeremy McNicoll (5):
  arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X) support
  dt-bindings: qcom: Add msm899(2/4) bindings
  arm64: dts: msm8992 default serial config
  arm64: dts: msm8994 default serial config
  arm64: configs: enable configs for msm899(2/4) basic support

 Documentation/devicetree/bindings/arm/qcom.txt     |    3 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    4 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |   41 +
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |  220 ++
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |   41 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi         |   31 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  237 ++
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++
 16 files changed, 3313 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994.dtsi
 create mode 100644 drivers/clk/qcom/gcc-msm8994.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h

-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
