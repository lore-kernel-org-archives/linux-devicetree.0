From: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] msm8992/msm8994: Google Nexus 5X/6P initial board support
Date: Tue, 25 Oct 2016 04:16:55 -0700
Message-ID: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



Dropping RFC, as looks like its in reasonable shape for merging.

V1:
 [http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/442069.html]

V2:
 [http://www.spinics.net/lists/linux-soc/msg01059.html]

V3:
 [http://www.spinics.net/lists/linux-soc/msg01089.html]

V4:
 [http://www.spinics.net/lists/linux-arm-msm/msg23849.html]


V4->V5:

  -gave each board their own respective line in Makefile, rolled into
    this change instead of creating a new commit for just a Makefile
    update.

  -moved qcom,pmic-id to msm8992-bullhead-rev-101.dts , likewise for
	8994.

  -minor cosmetic cleanups of board files:
	-removed extra braces for board
  	-dropped the frequency table
	-replaced hardcoded #'s with symbolic names
	-removed properties not being used	

  -instead of using msm8974 for basic pinctrl, now we are using
   Micheal Scott's from here, [https://patches.linaro.org/patch/78750/]
   All associated dts files updated accordingly.

  -converted all timer,frame interrupt entries to associated symbolic
   / macro values.  ie) GIC_SPI -> 0

  -defconfig changed to enable 8994 pinctrl instead of 8974

  -updated both 8992, 8994 dts so that the timer node is outside soc.



Appreciate all the feedback thus far.

-jeremy



Bastian Köcher (2):
  msm8994 clocks: global clock support for msm8994 SOC.
  arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support

Jeremy McNicoll (4):
  arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X) support
  dt-bindings: qcom: clocks: Add msm8994 clock bindings
  dt-bindings: qcom: Add msm899(2/4) bindings
  arm64: configs: enable configs for msm899(2/4) basic support

 Documentation/devicetree/bindings/arm/qcom.txt     |    2 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    7 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |   41 +
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |  191 ++
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |   40 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi         |   32 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  218 ++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++
 15 files changed, 3265 insertions(+), 2 deletions(-)
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
