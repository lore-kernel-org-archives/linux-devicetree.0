From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [PATCH V6 0/6] msm8992/msm8994: Google Nexus 5X/6P initial board support
Date: Fri,  4 Nov 2016 13:56:30 -0700
Message-ID: <1478292996-29559-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, mail@kchr.de, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org


This series provides basic support for the Nexus 5X / 6P with the goal of
getting as much of the phone  running a mainline kernel.  (wishful thinking...)

Ideally we will be able to  leverage most / significant portion of the great
work being done by Linaro mainlining effort.  A selection of various
bits 'n pieces will be leveraged and re-used. If nothing else, this provides
yet another platform to break / test / re-verify the MSM code base as it gets
mainlined.

-RFC in the subject was dropped when sending V5 so too was the V5 part as I
 wasn't sure if one needs to drop the V[x] part when dropping the RFC part.  ;-(  

Here is V6 which based on feedback and discussion with folks at LPC it is
now ready to be merged. 


V1:
 [http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/442069.html]

V2:
 [http://www.spinics.net/lists/linux-soc/msg01059.html]

V3:
 [http://www.spinics.net/lists/linux-soc/msg01089.html]

V4:
 [http://www.spinics.net/lists/linux-arm-msm/msg23849.html]

V5:
  [ http://www.spinics.net/lists/devicetree/msg147476.html ]


V5->V6:

- tested on the Nexus 5X and 6P using V4 of Michael Scotts pin ctrl code.
- using V5 of the 8994 pin ctrl driver from here: https://patchwork.kernel.org/patch/9405773/
- clock controller name and compatible string updates, moved under soc
- removed clock-output-names in DTS’s
- v2 references in GCC deleted as V1 hardware never shipped therefor its
   not needed
- model and compatible strings updated for both 5X and 6P
- minor label update / removal for ‘soc’
- removal of the 8994 - v2 DTS file as its the only version that has shipped.
- global clock for 8994 / 8992: format hex to lower case


As explicitly stated in V1 this is just a starting point and the plan is to
continue adding updating support for more peripherals / components.  Ideally
this starting point will allow others to help in the forward porting effort.

Again, thank you everyone for your feedback thus far it is greatly appreciated. 


Bastian Köcher (2):
  msm8994 clocks: global clock support for msm8994 SOC.
  arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support

Jeremy McNicoll (4):
  arm64: dts: msm8992 SoC and LG Bullhead (Nexus 5X) support
  dt-bindings: qcom: clocks: Add msm8994 clock bindings
  dt-bindings: qcom: Add msm899(2/4) bindings
  arm64: configs: enable configs for msm899(2/4) basic support

 Documentation/devicetree/bindings/arm/qcom.txt     |    2 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    7 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |   41 +
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |  184 ++
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |   40 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  216 ++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    7 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-msm8994.c                     | 2301 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++
 14 files changed, 3021 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994.dtsi
 create mode 100644 drivers/clk/qcom/gcc-msm8994.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h

-- 
2.9.2
