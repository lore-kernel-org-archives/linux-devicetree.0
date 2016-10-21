From: Jeremy McNicoll <jeremymc@redhat.com>
Subject: [RFC V4 PATCH 0/6] msm8992/msm8994: Google Nexus 5X/6P initial board support
Date: Fri, 21 Oct 2016 04:11:07 -0700
Message-ID: <1477048273-32451-1-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org, jeremymc@redhat.com
List-Id: devicetree@vger.kernel.org

Original patchset here:

[http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/442069.html]

V2:
[http://www.spinics.net/lists/linux-soc/msg01059.html]

V3:
[http://www.spinics.net/lists/linux-soc/msg01089.html]


Testing:
  -booted on Nexus 5X and 6P (many thanks to Michael Scott for
    testing this).


V3->V4:

  -default serial config folded into patch that introduces support (5X & 6P).
  -dropped BLK_DEV_RAM and updated my buildroot / ramdisk instructions here:
        http://people.redhat.com/~jmcnicol/InitRD.txt

  -commented msm-id,pmic-id and board-id in DT's
  -moved clocks under root node
  -removed peripheral_mem as there are no bindings available.
  -removed memreserve from 8994, as its not needed and has been successfully
	tested by Michael Scott on his 6P. 
  -removed the entry "msm8994v2" from the dt-bindings doc
  -misc comments to DT 
  -squashed patches down as per review feedback
  -split out dt bindings from GCC change into separate commit



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
 arch/arm64/boot/dts/qcom/Makefile                  |    4 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |   42 +
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |  214 ++
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |   42 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi         |   31 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  236 ++
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++
 15 files changed, 3305 insertions(+), 2 deletions(-)
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
