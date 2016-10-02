From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: [RFC V2 PATCH 00/12] msm8992/msm8994: Google Nexus 5X/6P initial board support
Date: Sat,  1 Oct 2016 19:38:27 -0700
Message-ID: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de
Cc: jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Given that Bastian is _VERY_ busy with his education (which is FAR more
important) he has given me explicit permission to deal with the feedback
on his behalf. 

Everything from the original series overview/lead in still holds.
[http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/442069.html]

Feel free to squish down patches 6 & 10, as they are essentially the same
for both platforms.  Initially it was one patch to update both platforms
but I have a feeling someone will ask for them to be split up. :-)

The maintainers file is already covered via “F:      arch/arm64/boot/dts/qcom/*”
entry as such no updates are provided and sboyd has the clocks covered.
The plan is to continue development (and support) for both platforms via
mailing lists etc....

Unfortunately since I don’t have a Nexus 6P these changes were not tested
(if someone reading this has one they want to donate it would be greatly
appreciated!).

V1->V2
------

Nexus 5X
 * removed reserved mem from 8992
 * as per discussion on IRC all DT bindings needed for LK/bootloader are being
     placed in its own separate file and not in the main device tree file.
 * removed lge directory and moved associated files into the qcom directory
 * removed giant defconfig and just added needed kernel config items to qcom
     common defconfig.
 * removed platform Kconfig entry 

Clock (gcc):
 * created a new patch to address the MUX changes, mainly as a way to capture
     the description 

Nexus 6P
 *  removed MACH_HUAWEI Kconfig, OEM/end user config option
 *  moved Angler DTS to QCOM directory and got rid of huawei dir as they are not
      creating their own SoCs.
 *  like that of Nexus 5X specific DT bindings required for LK have been removed
      from main dts files and placed in their own file.
 *  removed arch/arm64/configs/angler_defconfig  as it uses qcom common defconfig
      (separate patch)
 *  TODO - test without memreserve removed like that of Nexus5X .  Depending on
      the outcome a new patch will be sent to _EXPLICITLY_ deal with those 2
      memreserve entries. 
 *  default serial speed of 115200 selected.



Bastian Köcher (2):
  msm8994 clocks: global clock support Global clock support for the
    msm8994 SOC.
  arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support

Jeremy McNicoll (10):
  arm64: configs: enable 8994/8992 GCC by default
  msm8994 clocks: fix mapping
  dt-bindings: qcom: Add msm8992 bindings
  msm8992: defconfig updates to support initrd
  arm64: dts: msm8992 issolate non standard bootloader/LK entries
  arm64: dts: msm8992 default serial config
  arm64: dts: move Huawei Angler (Nexus 6P) to qcom directory
  arm64: dts: msm8994 issolate non standard bootloader/LK entries
  arm64: msm8994 / Nexus 6P remove defconfig
  arm64: dts: msm8994 default serial config

 Documentation/devicetree/bindings/arm/qcom.txt     |    1 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    4 +-
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts     |    3 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |    2 +-
 .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |   40 +
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi         |   38 +
 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi         |   31 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |  236 ++
 .../boot/dts/qcom/nexus5x_bootloader_bits.dtsi     |   24 +
 .../boot/dts/qcom/nexus6p_bootloader_bits.dtsi     |   24 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-msm8994.c                     | 2501 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |  145 ++
 17 files changed, 3061 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-v2.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nexus5x_bootloader_bits.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nexus6p_bootloader_bits.dtsi
 create mode 100644 drivers/clk/qcom/gcc-msm8994.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h

-- 
2.6.1
